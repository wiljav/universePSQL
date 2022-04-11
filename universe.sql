--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: docker
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO docker;

\connect universe

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
-- Name: extra; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.extra (
    galaxy_id integer NOT NULL,
    extra_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.extra OWNER TO docker;

--
-- Name: extra_extra_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.extra_extra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_extra_id_seq OWNER TO docker;

--
-- Name: extra_extra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.extra_extra_id_seq OWNED BY public.extra.extra_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    planets_in_billions integer,
    stars_in_billions integer,
    mass_in_bill_earth_mass numeric(5,1),
    satellite_galaxy boolean,
    humans_galaxy boolean
);


ALTER TABLE public.galaxy OWNER TO docker;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO docker;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.moon (
    name character varying(40),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    habitable boolean,
    mass_in_earth_mass numeric(4,1),
    milky_way_moon boolean,
    shape text
);


ALTER TABLE public.moon OWNER TO docker;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO docker;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.planet (
    name character varying(40),
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    humans_planet boolean,
    moons integer,
    habitable boolean,
    mass_in_earth_mass numeric(4,1)
);


ALTER TABLE public.planet OWNER TO docker;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO docker;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.star (
    name character varying(40),
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planets integer,
    moons integer,
    humans_star boolean,
    binary_star boolean,
    age_in_bill_years numeric(5,4)
);


ALTER TABLE public.star OWNER TO docker;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO docker;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: extra extra_id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.extra ALTER COLUMN extra_id SET DEFAULT nextval('public.extra_extra_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: extra; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.extra VALUES (2, 2, 'EX 139');
INSERT INTO public.extra VALUES (3, 1, 'EX 136');
INSERT INTO public.extra VALUES (2, 3, 'EX 112');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.galaxy VALUES ('Milky Way', 2, 200, 400, 0.5, false, true);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf Galaaxy', 3, 1, 1, 0.0, false, false);
INSERT INTO public.galaxy VALUES ('Andromeda', 1, 500, 1000, 1500.0, false, false);
INSERT INTO public.galaxy VALUES ('Messier 87', 4, 250, 300, 0.2, false, false);
INSERT INTO public.galaxy VALUES ('Magellanic Clouds', 5, 150, 350, 0.7, false, false);
INSERT INTO public.galaxy VALUES ('NGC 5474', 6, 10, 50, 0.1, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.moon VALUES ('GL 2304 c', 4, 5, 2, 17, false, 0.8, false, NULL);
INSERT INTO public.moon VALUES ('GL 2453 c', 4, 16, 6, 13, false, 0.8, false, NULL);
INSERT INTO public.moon VALUES ('GL 1592 c', 5, 2, 1, 20, false, 0.3, false, NULL);
INSERT INTO public.moon VALUES ('GL 1971 c', 3, 10, 2, 11, false, 0.8, false, NULL);
INSERT INTO public.moon VALUES ('GL 1849 c', 5, 15, 1, 19, false, 0.7, false, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, 1, 4, 1, false, 0.8, true, NULL);
INSERT INTO public.moon VALUES ('Deimos', 2, 1, 4, 2, false, 0.8, true, NULL);
INSERT INTO public.moon VALUES ('The Moon', 2, 1, 8, 3, false, 0.5, true, NULL);
INSERT INTO public.moon VALUES ('GL 2198 c', 5, 18, 11, 14, false, 0.4, false, NULL);
INSERT INTO public.moon VALUES ('GL 2250 c', 6, 10, 11, 9, false, 0.7, false, NULL);
INSERT INTO public.moon VALUES ('GL 2190 c', 2, 14, 1, 12, false, 0.6, false, NULL);
INSERT INTO public.moon VALUES ('GL 1962 c', 6, 14, 5, 6, false, 0.3, false, NULL);
INSERT INTO public.moon VALUES ('GL 2291 c', 2, 4, 7, 4, false, 0.2, false, NULL);
INSERT INTO public.moon VALUES ('GL 1350 c', 3, 4, 10, 7, false, 0.2, false, NULL);
INSERT INTO public.moon VALUES ('GL 2001 c', 5, 20, 6, 10, false, 0.9, false, NULL);
INSERT INTO public.moon VALUES ('GL 2092 c', 1, 9, 10, 16, false, 0.8, false, NULL);
INSERT INTO public.moon VALUES ('GL 2032 c', 2, 16, 11, 15, false, 0.0, false, NULL);
INSERT INTO public.moon VALUES ('GL 1404 c', 1, 6, 10, 18, false, 0.1, false, NULL);
INSERT INTO public.moon VALUES ('GL 2432 c', 4, 4, 11, 5, false, 0.3, false, NULL);
INSERT INTO public.moon VALUES ('GL 1545 c', 2, 4, 9, 8, false, 0.3, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.planet VALUES ('HD 28848 b', 6, 6, 2, false, 265, false, 8.3);
INSERT INTO public.planet VALUES ('HD 21603 b', 11, 2, 5, false, 428, false, 4.5);
INSERT INTO public.planet VALUES ('Earth', 8, 2, 1, true, 1, true, 1.0);
INSERT INTO public.planet VALUES ('HD 26769 b', 3, 6, 13, false, 281, false, 1.5);
INSERT INTO public.planet VALUES ('HD 14745 b', 12, 3, 6, false, 585, false, 1.1);
INSERT INTO public.planet VALUES ('HD 15050 b', 1, 6, 19, false, 538, false, 11.1);
INSERT INTO public.planet VALUES ('HD 15945 b', 5, 6, 15, false, 454, false, 1.4);
INSERT INTO public.planet VALUES ('HD 34368 b', 10, 5, 11, false, 418, false, 5.6);
INSERT INTO public.planet VALUES ('Mars', 4, 2, 1, false, 2, false, 0.1);
INSERT INTO public.planet VALUES ('HD 21647 b', 9, 1, 14, false, 420, false, 18.7);
INSERT INTO public.planet VALUES ('HD 17179 b', 7, 4, 14, false, 249, false, 17.5);
INSERT INTO public.planet VALUES ('HD 12466 b', 2, 5, 12, false, 522, false, 10.2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: docker
--

INSERT INTO public.star VALUES ('SUN', 1, 2, 8, 214, true, false, 4.7510);
INSERT INTO public.star VALUES ('HD 13051', 9, 1, 10, 176, false, false, 1.4752);
INSERT INTO public.star VALUES ('HD 13918', 4, 2, 6, 83, false, false, 1.3855);
INSERT INTO public.star VALUES ('HD 17640', 14, 2, 9, 190, false, false, 1.3098);
INSERT INTO public.star VALUES ('HD 23073', 20, 1, 5, 40, false, false, 1.2845);
INSERT INTO public.star VALUES ('HD 11589', 3, 1, 20, 21, false, false, 1.6799);
INSERT INTO public.star VALUES ('HD 9721', 18, 1, 4, 64, false, false, 1.4312);
INSERT INTO public.star VALUES ('HD 8924', 13, 4, 13, 151, false, false, 1.3341);
INSERT INTO public.star VALUES ('HD 797', 17, 4, 7, 3, false, false, 1.7797);
INSERT INTO public.star VALUES ('HD 22040', 15, 4, 16, 150, false, false, 1.7565);
INSERT INTO public.star VALUES ('HD 16213', 2, 1, 10, 78, false, false, 1.4774);
INSERT INTO public.star VALUES ('HD 2622', 16, 3, 5, 19, false, false, 1.2423);
INSERT INTO public.star VALUES ('HD 19314', 8, 2, 13, 146, false, false, 1.9052);
INSERT INTO public.star VALUES ('HD 25372', 19, 2, 8, 214, true, false, 4.7510);
INSERT INTO public.star VALUES ('HD 186802', 11, 5, 19, 184, false, false, 0.2684);
INSERT INTO public.star VALUES ('HD 157060', 12, 2, 8, 92, false, false, 1.2551);
INSERT INTO public.star VALUES ('HD 69201', 6, 2, 21, 151, false, false, 1.2621);
INSERT INTO public.star VALUES ('HD 7306', 7, 3, 17, 69, false, false, 0.7960);
INSERT INTO public.star VALUES ('HD 3600', 5, 3, 7, 126, false, false, 1.5700);
INSERT INTO public.star VALUES ('HD 18794', 10, 1, 15, 107, false, false, 1.9039);


--
-- Name: extra_extra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.extra_extra_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: extra extra_extra_id_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.extra
    ADD CONSTRAINT extra_extra_id_key UNIQUE (extra_id);


--
-- Name: extra extra_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.extra
    ADD CONSTRAINT extra_pkey PRIMARY KEY (extra_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

