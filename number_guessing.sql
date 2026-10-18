--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1792333344845', 2, 12);
INSERT INTO public.users VALUES ('user_1792332946415', 2, 0);
INSERT INTO public.users VALUES ('user_1792333618680', 2, 624);
INSERT INTO public.users VALUES ('user_1792333344846', 5, 250);
INSERT INTO public.users VALUES ('user_1792332946416', 5, 0);
INSERT INTO public.users VALUES ('user_1792333618681', 5, 80);
INSERT INTO public.users VALUES ('Chris', 1, 0);
INSERT INTO public.users VALUES ('user_1792333442664', 2, 176);
INSERT INTO public.users VALUES ('user_1792333214097', 2, 0);
INSERT INTO public.users VALUES ('user_1792333442665', 5, 124);
INSERT INTO public.users VALUES ('user_1792333214098', 5, 0);
INSERT INTO public.users VALUES ('Heinrich', 1, 0);
INSERT INTO public.users VALUES ('Anabell', 0, 0);
INSERT INTO public.users VALUES ('user_1792333483118', 2, 335);
INSERT INTO public.users VALUES ('Anna', 1, 4);
INSERT INTO public.users VALUES ('user_1792333483119', 5, 16);
INSERT INTO public.users VALUES ('user_1792333301816', 2, 155);
INSERT INTO public.users VALUES ('user_1792333301817', 5, 139);
INSERT INTO public.users VALUES ('user_1792333512677', 2, 576);
INSERT INTO public.users VALUES ('user_1792333512678', 5, 181);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

