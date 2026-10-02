--
-- PostgreSQL database dump
--

\restrict TzfSXYnmqMZ2m4TVV0pCEGeBHOcQaQJCfWruxFhl7AabqkPKh2wYE0dJiJDDbdl

-- Dumped from database version 15.19
-- Dumped by pg_dump version 15.19

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
-- Name: disaster_recovery_test; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.disaster_recovery_test (
    id integer NOT NULL,
    marker_name character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.disaster_recovery_test OWNER TO appuser;

--
-- Name: disaster_recovery_test_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.disaster_recovery_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disaster_recovery_test_id_seq OWNER TO appuser;

--
-- Name: disaster_recovery_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.disaster_recovery_test_id_seq OWNED BY public.disaster_recovery_test.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: appuser
--

CREATE TABLE public.items (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.items OWNER TO appuser;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: appuser
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO appuser;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appuser
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: disaster_recovery_test id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.disaster_recovery_test ALTER COLUMN id SET DEFAULT nextval('public.disaster_recovery_test_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Data for Name: disaster_recovery_test; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.disaster_recovery_test (id, marker_name, created_at) FROM stdin;
1	Phase 13 Backup Validation	2026-09-30 21:21:32.035717
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: appuser
--

COPY public.items (id, title, created_at) FROM stdin;
1	Premier test de persistance	2026-09-28 16:45:16.178118
2	Premier test de persistance	2026-09-28 16:53:23.861643
\.


--
-- Name: disaster_recovery_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.disaster_recovery_test_id_seq', 1, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appuser
--

SELECT pg_catalog.setval('public.items_id_seq', 2, true);


--
-- Name: disaster_recovery_test disaster_recovery_test_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.disaster_recovery_test
    ADD CONSTRAINT disaster_recovery_test_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: appuser
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict TzfSXYnmqMZ2m4TVV0pCEGeBHOcQaQJCfWruxFhl7AabqkPKh2wYE0dJiJDDbdl

