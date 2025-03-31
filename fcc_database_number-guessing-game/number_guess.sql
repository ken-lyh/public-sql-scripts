--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 20);
INSERT INTO public.games VALUES (2, 1, 7);
INSERT INTO public.games VALUES (3, 2, 9);
INSERT INTO public.games VALUES (4, 3, 144);
INSERT INTO public.games VALUES (5, 3, 357);
INSERT INTO public.games VALUES (6, 4, 922);
INSERT INTO public.games VALUES (7, 4, 928);
INSERT INTO public.games VALUES (8, 3, 382);
INSERT INTO public.games VALUES (9, 3, 772);
INSERT INTO public.games VALUES (10, 3, 506);
INSERT INTO public.games VALUES (11, 5, 303);
INSERT INTO public.games VALUES (12, 5, 976);
INSERT INTO public.games VALUES (13, 6, 77);
INSERT INTO public.games VALUES (14, 6, 713);
INSERT INTO public.games VALUES (15, 5, 544);
INSERT INTO public.games VALUES (16, 5, 648);
INSERT INTO public.games VALUES (17, 5, 540);
INSERT INTO public.games VALUES (18, 7, 142);
INSERT INTO public.games VALUES (19, 7, 830);
INSERT INTO public.games VALUES (20, 8, 609);
INSERT INTO public.games VALUES (21, 8, 981);
INSERT INTO public.games VALUES (22, 7, 593);
INSERT INTO public.games VALUES (23, 7, 549);
INSERT INTO public.games VALUES (24, 7, 927);
INSERT INTO public.games VALUES (25, 9, 370);
INSERT INTO public.games VALUES (26, 9, 648);
INSERT INTO public.games VALUES (27, 10, 463);
INSERT INTO public.games VALUES (28, 10, 812);
INSERT INTO public.games VALUES (29, 9, 592);
INSERT INTO public.games VALUES (30, 9, 657);
INSERT INTO public.games VALUES (31, 9, 385);
INSERT INTO public.games VALUES (32, 11, 742);
INSERT INTO public.games VALUES (33, 11, 172);
INSERT INTO public.games VALUES (34, 12, 164);
INSERT INTO public.games VALUES (35, 12, 614);
INSERT INTO public.games VALUES (36, 11, 723);
INSERT INTO public.games VALUES (37, 11, 923);
INSERT INTO public.games VALUES (38, 11, 864);
INSERT INTO public.games VALUES (39, 13, 1001);
INSERT INTO public.games VALUES (40, 13, 820);
INSERT INTO public.games VALUES (41, 14, 725);
INSERT INTO public.games VALUES (42, 14, 403);
INSERT INTO public.games VALUES (43, 13, 662);
INSERT INTO public.games VALUES (44, 13, 344);
INSERT INTO public.games VALUES (45, 13, 357);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Ken');
INSERT INTO public.users VALUES (2, 'Paul');
INSERT INTO public.users VALUES (3, 'user_1743417146710');
INSERT INTO public.users VALUES (4, 'user_1743417146709');
INSERT INTO public.users VALUES (5, 'user_1743417217041');
INSERT INTO public.users VALUES (6, 'user_1743417217040');
INSERT INTO public.users VALUES (7, 'user_1743417226388');
INSERT INTO public.users VALUES (8, 'user_1743417226387');
INSERT INTO public.users VALUES (9, 'user_1743417241937');
INSERT INTO public.users VALUES (10, 'user_1743417241936');
INSERT INTO public.users VALUES (11, 'user_1743417295377');
INSERT INTO public.users VALUES (12, 'user_1743417295376');
INSERT INTO public.users VALUES (13, 'user_1743417321125');
INSERT INTO public.users VALUES (14, 'user_1743417321124');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 45, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

