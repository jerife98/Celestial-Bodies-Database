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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    size_kpc numeric(10,2),
    age_billionyears numeric(10,2),
    distance_kpc numeric(10,2),
    constellation character varying(50) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric(10,2),
    orbital_period_days numeric(10,2),
    discovery_year integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: observator; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observator (
    observator_id integer NOT NULL,
    name character varying(50) NOT NULL,
    affiliation character varying(100),
    speciality character varying(100),
    experience_years integer,
    last_observation date,
    equipment text NOT NULL
);


ALTER TABLE public.observator OWNER TO freecodecamp;

--
-- Name: observator_observator_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observator_observator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observator_observator_id_seq OWNER TO freecodecamp;

--
-- Name: observator_observator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observator_observator_id_seq OWNED BY public.observator.observator_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass_earth_masses numeric(10,2),
    radius_km numeric(10,2),
    orbital_period_days numeric(10,2),
    star_id integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    spectral_type character varying(10),
    luminosity_solar numeric(10,2),
    temperature_k integer,
    age_billionyears numeric(10,2),
    galaxy_id integer,
    lightly boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observator observator_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observator ALTER COLUMN observator_id SET DEFAULT nextval('public.observator_observator_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxie_0', 'Elliptique', 27.39, 5.92, 18.98, 'Andromède');
INSERT INTO public.galaxy VALUES (2, 'Galaxie_1', 'Irrégulière', 72.37, 10.87, 10.30, 'Grande Ourse');
INSERT INTO public.galaxy VALUES (3, 'Galaxie_2', 'Elliptique', 76.95, 11.87, 6.82, 'Vierge');
INSERT INTO public.galaxy VALUES (4, 'Galaxie_3', 'Elliptique', 94.19, 11.68, 19.08, 'Orion');
INSERT INTO public.galaxy VALUES (5, 'Galaxie_4', 'Spirale', 81.26, 9.69, 10.94, 'Pegasus');
INSERT INTO public.galaxy VALUES (6, 'Galaxie_5', 'Spirale', 96.36, 11.37, 0.17, 'asus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (34, 'Lune_0', 2929.40, 855.69, 2020, 11);
INSERT INTO public.moon VALUES (35, 'Lune_1', 2318.90, 745.28, 2021, 9);
INSERT INTO public.moon VALUES (36, 'Lune_2', 3497.95, 985.22, 2022, 7);
INSERT INTO public.moon VALUES (37, 'Lune_3', 4957.37, 152.04, 2023, 4);
INSERT INTO public.moon VALUES (38, 'Lune_4', 2285.48, 348.46, 2024, 9);
INSERT INTO public.moon VALUES (39, 'Lune_5', 3736.00, 269.32, 1990, 4);
INSERT INTO public.moon VALUES (40, 'Lune_6', 481.51, 728.29, 1991, 2);
INSERT INTO public.moon VALUES (41, 'Lune_7', 2266.07, 752.15, 1992, 11);
INSERT INTO public.moon VALUES (42, 'Lune_8', 3051.17, 528.67, 1993, 7);
INSERT INTO public.moon VALUES (43, 'Lune_9', 209.48, 327.92, 1994, 5);
INSERT INTO public.moon VALUES (44, 'Lune_10', 3855.36, 74.62, 1995, 3);
INSERT INTO public.moon VALUES (45, 'Lune_11', 4220.97, 288.81, 1996, 3);
INSERT INTO public.moon VALUES (46, 'Lune_12', 1730.54, 554.09, 1997, 5);
INSERT INTO public.moon VALUES (47, 'Lune_13', 3286.14, 499.55, 1998, 11);
INSERT INTO public.moon VALUES (48, 'Lune_14', 2145.98, 307.36, 1999, 7);
INSERT INTO public.moon VALUES (49, 'Lune_15', 4871.14, 203.55, 2000, 4);
INSERT INTO public.moon VALUES (50, 'Lune_16', 3133.32, 725.94, 2001, 6);
INSERT INTO public.moon VALUES (51, 'Lune_17', 2670.79, 626.53, 2002, 3);
INSERT INTO public.moon VALUES (52, 'Lune_18', 571.66, 551.23, 2003, 3);
INSERT INTO public.moon VALUES (53, 'Lune_19', 312.03, 975.67, 2004, 2);
INSERT INTO public.moon VALUES (54, 'Lune_20', 1913.48, 930.03, 2005, 6);


--
-- Data for Name: observator; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observator VALUES (1, 'Observator_0', 'ESA', 'Cosmologie', 23, '2023-11-15', 'Keck');
INSERT INTO public.observator VALUES (2, 'Observator_1', 'Observatoire de Paris', 'Cosmologie', 28, '2023-11-15', 'Télescope spatial Hubble');
INSERT INTO public.observator VALUES (3, 'Observator_2', 'CNSA', 'Nébuleuses', 14, '2023-11-15', 'Télescope spatial Hubble');
INSERT INTO public.observator VALUES (4, 'Observator_3', 'NASA', 'Cosmologie', 10, '2023-11-15', 'VLT');
INSERT INTO public.observator VALUES (5, 'Observator_4', 'CNSA', 'Exoplanètes', 23, '2023-11-15', 'Télescope James Webb');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planète_0', 'Gazeux', 299.17, 38246.54, 683.94, 4, false);
INSERT INTO public.planet VALUES (2, 'Planète_1', 'Tellurique', 301.74, 33981.33, 5667.11, 4, false);
INSERT INTO public.planet VALUES (3, 'Planète_2', 'Tellurique', 217.78, 11803.84, 3599.94, 4, false);
INSERT INTO public.planet VALUES (4, 'Planète_3', 'Nain', 292.19, 47927.01, 9982.26, 1, false);
INSERT INTO public.planet VALUES (5, 'Planète_4', 'Tellurique', 12.35, 35175.67, 326.47, 6, true);
INSERT INTO public.planet VALUES (6, 'Planète_5', 'Nain', 64.68, 40423.46, 3428.75, 2, false);
INSERT INTO public.planet VALUES (7, 'Planète_6', 'Nain', 233.73, 50025.30, 157.94, 1, false);
INSERT INTO public.planet VALUES (8, 'Planète_7', 'Tellurique', 176.83, 15098.04, 7429.37, 2, false);
INSERT INTO public.planet VALUES (9, 'Planète_8', 'Nain', 213.25, 20693.03, 4403.69, 1, true);
INSERT INTO public.planet VALUES (10, 'Planète_9', 'Tellurique', 195.08, 44432.30, 6123.81, 4, true);
INSERT INTO public.planet VALUES (11, 'Planète_10', 'Tellurique', 3.70, 56025.75, 6650.22, 4, false);
INSERT INTO public.planet VALUES (12, 'Planète_11', 'Nain', 23.75, 8923.97, 4524.09, 2, false);
INSERT INTO public.planet VALUES (13, 'Planète_12', 'Nain', 54.43, 55545.98, 4087.99, 2, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Étoile_0', 'M', 55.71, 39072, 3.82, 6, false);
INSERT INTO public.star VALUES (2, 'Étoile_1', 'B', 31.46, 28720, 9.63, 5, true);
INSERT INTO public.star VALUES (3, 'Étoile_2', 'A', 26.01, 39229, 11.43, 6, true);
INSERT INTO public.star VALUES (4, 'Étoile_3', 'A', 18.77, 8978, 8.19, 1, true);
INSERT INTO public.star VALUES (5, 'Étoile_4', 'M', 72.08, 22534, 8.05, 5, true);
INSERT INTO public.star VALUES (6, 'Étoile_5', 'O', 15.04, 49792, 10.29, 3, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 54, true);


--
-- Name: observator_observator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observator_observator_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: moon disc_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT disc_unique UNIQUE (discovery_year);


--
-- Name: galaxy dist_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT dist_unique UNIQUE (distance_kpc);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observator name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observator
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: observator observator_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observator
    ADD CONSTRAINT observator_pkey PRIMARY KEY (observator_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet rad_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT rad_unique UNIQUE (radius_km);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star temp_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT temp_unique UNIQUE (temperature_k);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

