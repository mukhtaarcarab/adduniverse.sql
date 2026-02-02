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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth numeric,
    is_hazardous boolean DEFAULT false,
    composition text
);


ALTER TABLE public.asteroid OWNER TO postgres;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO postgres;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    age_in_millions_of_years integer,
    description text,
    has_life boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    radius numeric,
    is_spherical boolean DEFAULT true,
    has_life boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    mass numeric,
    radius numeric,
    has_life boolean DEFAULT false,
    distance_from_star integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric,
    radius numeric,
    is_supernova boolean DEFAULT false
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 414000000, false, 'Rocky');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 353400000, false, 'Rocky');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 414000000, false, 'Metallic');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 'Nearest large galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 'Small spiral galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 9000, 'Famous for its spiral arms', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 13000, 'Bright central bulge', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13500, 'Supermassive black hole in center', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, false);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 1560, true, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 2634, true, false);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 2410, true, false);
INSERT INTO public.moon VALUES (7, 'Io', 5, 1821, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 763, true, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 734, true, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561, true, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 531, true, false);
INSERT INTO public.moon VALUES (13, 'Kepler-Moon1', 7, 4000, true, false);
INSERT INTO public.moon VALUES (14, 'Kepler-Moon2', 7, 3500, true, false);
INSERT INTO public.moon VALUES (15, 'Kepler-Moon3', 8, 3700, true, false);
INSERT INTO public.moon VALUES (16, 'Proxima-Moon1', 9, 500, true, false);
INSERT INTO public.moon VALUES (17, 'Proxima-Moon2', 9, 450, true, false);
INSERT INTO public.moon VALUES (18, 'Rigel-Moon1', 10, 5000, true, false);
INSERT INTO public.moon VALUES (19, 'Rigel-Moon2', 11, 4500, true, false);
INSERT INTO public.moon VALUES (20, 'Betelgeuse-Moon1', 12, 5200, true, false);
INSERT INTO public.moon VALUES (21, 'Betelgeuse-Moon2', 12, 5100, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5970000000000000000000000, 6371, true, 149598023);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 641700000000000000000000, 3389, false, 227939200);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 4867000000000000000000000, 6051, false, 108208000);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 328500000000000000000000, 2440, false, 57910000);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1898000000000000000000000000, 69911, false, 778500000);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 568300000000000000000000000, 58232, false, 1433500000);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 23800000000000000000000000, 13700, false, 150000000);
INSERT INTO public.planet VALUES (8, 'Kepler-452b', 2, 50000000000000000000000000, 12000, false, 140000000);
INSERT INTO public.planet VALUES (9, 'Proxima b', 6, 12700000000000000000000000, 7150, false, 7000000);
INSERT INTO public.planet VALUES (10, 'Rigel-1', 5, 35000000000000000000000000, 14000, false, 50000000);
INSERT INTO public.planet VALUES (11, 'Rigel-2', 5, 20000000000000000000000000, 12000, false, 60000000);
INSERT INTO public.planet VALUES (12, 'Betelgeuse-1', 4, 50000000000000000000000000, 15000, false, 80000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000000000000000000000000000, 696340, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 2187000000000000000000000000000, 834840, false);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 4018000000000000000000000000000, 1189640, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 12000000000000000000000000000000, 887000000, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 35000000000000000000000000000000, 700000000, false);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 244600000000000000000000000000, 200000, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

