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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type text,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: glaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.glaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.glaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: glaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.glaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    has_life boolean,
    distance_from_planet numeric
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    planet_type text,
    has_life boolean,
    distance_from_star numeric
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_name character varying(255) NOT NULL,
    star_name character varying(255) NOT NULL,
    planet_name character varying(255) NOT NULL,
    moon_name character varying(255) NOT NULL
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_id_seq OWNED BY public.universe.universe_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.glaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 13500, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'An unbarred spiral galaxy in the constellation Virgo', 8900, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A grand-design spiral galaxy in the constellation Canes Venatici', 500, 'Spiral', false);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'A face-on spiral galaxy in the constellation Ursa Major', 1000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Sunflower', 'A spiral galaxy in the northern constellation of Canes Venatici', 11000, 'Spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 0.00257);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 0.00006);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 0.00023);
INSERT INTO public.moon VALUES (4, 'Io', 5, false, 0.00282);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, 0.00448);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, 0.00715);
INSERT INTO public.moon VALUES (7, 'Callistro', 5, false, 0.01258);
INSERT INTO public.moon VALUES (8, 'Titan', 6, false, 0.00817);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, false, 0.00352);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, false, 0.02342);
INSERT INTO public.moon VALUES (11, 'Dione', 6, false, 0.00235);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, false, 0.00197);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, false, 0.00159);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, false, 0.00124);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, false, 0.00386);
INSERT INTO public.moon VALUES (16, 'Titania', 7, false, 0.00364);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, false, 0.00185);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, false, 0.00128);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, false, 0.00048);
INSERT INTO public.moon VALUES (20, 'Triton', 8, false, 0.00236);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', false, 1.52);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', false, 0.72);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 'Terrestrial', false, 0.39);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', false, 5.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', false, 9.58);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', false, 19.18);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', false, 30.07);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf', false, 96);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 'Dwarf', false, 96);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 'Dwarf', false, 43);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 'Dwarf', false, 45.7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 4600, 0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, true, 200, 8.6);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, true, 5500, 4.37);
INSERT INTO public.star VALUES (4, 'Arcturus', 1, true, 7100, 36.7);
INSERT INTO public.star VALUES (5, 'Vega', 1, true, 455, 25);
INSERT INTO public.star VALUES (6, 'Capella', 1, true, 3700, 42.8);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'Cosmos', 'Milky Way', 'Sun', 'Earth', 'Moon');
INSERT INTO public.universe VALUES (2, 'Cosmos', 'Milky Way', 'Sun', 'Mars', 'Phobos');
INSERT INTO public.universe VALUES (3, 'Cosmos', 'Milky Way', 'Sun', 'Mars', 'Deimos');
INSERT INTO public.universe VALUES (4, 'Cosmos', 'Milky Way', 'Sun', 'Jupiter', 'Io');
INSERT INTO public.universe VALUES (5, 'Cosmos', 'Milky Way', 'Sun', 'Jupiter', 'Europa');
INSERT INTO public.universe VALUES (6, 'Cosmos', 'Milky Way', 'Sun', 'Jupiter', 'Ganymede');
INSERT INTO public.universe VALUES (7, 'Cosmos', 'Milky Way', 'Sun', 'Jupiter', 'Callistro');
INSERT INTO public.universe VALUES (8, 'Cosmos', 'Milky Way', 'Sun', 'Saturn', 'Titan');
INSERT INTO public.universe VALUES (9, 'Cosmos', 'Milky Way', 'Sun', 'Saturn', 'Rhea');
INSERT INTO public.universe VALUES (10, 'Cosmos', 'Milky Way', 'Sun', 'Saturn', 'Iapetus');
INSERT INTO public.universe VALUES (11, 'Cosmos', 'Milky Way', 'Sun', 'Saturn', 'Dione');
INSERT INTO public.universe VALUES (12, 'Cosmos', 'Milky Way', 'Sun', 'Saturn', 'Tethys');
INSERT INTO public.universe VALUES (13, 'Cosmos', 'Milky Way', 'Sun', 'Saturn', 'Enceladus');
INSERT INTO public.universe VALUES (14, 'Cosmos', 'Milky Way', 'Sun', 'Saturn', 'Mimas');
INSERT INTO public.universe VALUES (15, 'Cosmos', 'Milky Way', 'Sun', 'Uranus', 'Oberon');
INSERT INTO public.universe VALUES (16, 'Cosmos', 'Milky Way', 'Sun', 'Uranus', 'Titania');
INSERT INTO public.universe VALUES (17, 'Cosmos', 'Milky Way', 'Sun', 'Uranus', 'Umbriel');
INSERT INTO public.universe VALUES (18, 'Cosmos', 'Milky Way', 'Sun', 'Uranus', 'Ariel');
INSERT INTO public.universe VALUES (19, 'Cosmos', 'Milky Way', 'Sun', 'Uranus', 'Miranda');
INSERT INTO public.universe VALUES (20, 'Cosmos', 'Milky Way', 'Sun', 'Neptune', 'Triton');


--
-- Name: glaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.glaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_id_seq', 20, true);


--
-- Name: galaxy glaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT glaxy_name_key UNIQUE (name);


--
-- Name: galaxy glaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT glaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe universe_galaxy_name_star_name_planet_name_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_galaxy_name_star_name_planet_name_moon_name_key UNIQUE (galaxy_name, star_name, planet_name, moon_name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


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

