#!/bin/bash
PSQL="psql --username=postgres --dbname=number_guessing_game --no-align -t -c"

WELCOME_USER() {

echo "Enter your username:" 
read -e USERNAME_INPUT

USER_SEARCH_RESULT=$($PSQL "
  SELECT * 
  FROM users 
  WHERE username = '$USERNAME_INPUT'
")
IFS=' | ' read -r username games_played best_game <<< $USER_SEARCH_RESULT

if [[ $username == "" ]]; then
  echo 'Welcome, '$USERNAME_INPUT'! It looks like this is your first time here.'
  CREATE_NEW_USER
else 
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

}

CREATE_NEW_USER() {
  username=$USERNAME_INPUT
  CREATE_USER_STATEMENT=$($PSQL "
  INSERT INTO users
  VALUES ('$username', 0, 0)
")
}

RUN_GAME() {

  GUESSED_CORRECTLY=0
  NUMBER_OF_GUESSES=0
  # SECRET_NUMBER=$(shuf -i 1-1000 -n 1)
  SECRET_NUMBER=$((1 + $RANDOM % 1000))

  # echo $SECRET_NUMBER
  echo "Guess the secret number between 1 and 1000:"

  while [[ $GUESSED_CORRECTLY = 0 ]]
    do
      READ_NUMBER
      NUMBER_OF_GUESSES="$(( $NUMBER_OF_GUESSES + 1 ))"

      if [ $USER_NUMBER_INPUT -eq $SECRET_NUMBER ]; then
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        GUESSED_CORRECTLY=1
        SAVE_RESULT_TO_DATABASE
        exit 0
      fi

      if [ $USER_NUMBER_INPUT -gt $SECRET_NUMBER ]; then
        echo "It's lower than that, guess again:"
      else
        echo "It's higher than that, guess again:"
      fi
    done
}

SAVE_RESULT_TO_DATABASE() {

  username=$USERNAME_INPUT

  LAST_BEST_GAME=$($PSQL "
    SELECT best_game
    FROM users 
    WHERE username = '$username'
  ")

  if [ $NUMBER_OF_GUESSES -lt $LAST_BEST_GAME ]; then
    NEW_BEST_GAME=$NUMBER_OF_GUESSES
  else
    NEW_BEST_GAME=$LAST_BEST_GAME
  fi

  


  LAST_GAMES_PLAYED=$($PSQL "
    SELECT games_played
    FROM users 
    WHERE username = '$username'
  ")

  if [ $LAST_GAMES_PLAYED -eq 0 ]; then
    NEW_BEST_GAME=$NUMBER_OF_GUESSES
  fi

  NEW_GAMES_PLAYED="$(( $LAST_GAMES_PLAYED + 1 ))"
  

  DB_WRITE=$($PSQL "
    UPDATE users 
    SET games_played = $NEW_GAMES_PLAYED
    WHERE username = '$username'
  ")

  # echo "Saving result to database: $NEW_BEST_GAME";
  DB_WRITE=$($PSQL "
    UPDATE users 
    SET best_game = $NEW_BEST_GAME
    WHERE username = '$username'
  ")
}




READ_NUMBER() {
  VALID_INPUT=0

  while [[ $VALID_INPUT = 0 ]]
  do 
    read -e USER_NUMBER_INPUT
    if [ "${USER_NUMBER_INPUT//[0-9]}" ]; then
    echo "That is not an integer, guess again:"
    else
      break
    fi
  done
  
}

WELCOME_USER
RUN_GAME

