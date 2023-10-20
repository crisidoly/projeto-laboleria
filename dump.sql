--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.4

-- Started on 2023-10-20 16:30:36

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 41014)
-- Name: cakes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cakes (
    id integer NOT NULL,
    name character varying,
    price numeric,
    image character varying,
    description text
);


ALTER TABLE public.cakes OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 41013)
-- Name: cakes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cakes_id_seq OWNER TO postgres;

--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 209
-- Name: cakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cakes_id_seq OWNED BY public.cakes.id;


--
-- TOC entry 212 (class 1259 OID 41023)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying,
    address character varying,
    phone character varying
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 41022)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 211
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 214 (class 1259 OID 41032)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    clientid integer,
    cakeid integer,
    quantity integer,
    createdat timestamp without time zone,
    totalprice numeric
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 41031)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 3179 (class 2604 OID 41017)
-- Name: cakes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes ALTER COLUMN id SET DEFAULT nextval('public.cakes_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 41026)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 41035)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3328 (class 0 OID 41014)
-- Dependencies: 210
-- Data for Name: cakes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cakes (id, name, price, image, description) FROM stdin;
1	Bolo de pote	13	https://www.example.com/image.jpg	Bolo de chocolate com recheio de leite ninho
2	Fulana	11.00	https://www.notion.so/bootcampra/Projeto-La-Boleria-f83d96dd28d14526aa523a912b6ff733	\N
3	asa	11.00	https://www.notion.so/bootcampra/Projeto-La-Boleria-f83d96dd28d14526aa523a912b6ff733	\N
4	as113a	11.00	https://www.notion.so/bootcampra/Projeto-La-Boleria-f83d96dd28d14526aa523a912b6ff733	\N
5	dsfg	11.00	https://www.notion.so/bootcampra/Projeto-La-Boleria-f83d96dd28d14526aa523a912b6ff733	\N
6	jujuba	11.00	https://www.notion.so/bootcampra/Projeto-La-Boleria-f83d96dd28d14526aa523a912b6ff733	\N
7	mimgollinha	11.00	https://www.notion.so/bootcampra/Projeto-La-Boleria-f83d96dd28d14526aa523a912b6ff733	\N
8	Bolão de pote	13	https://www.example.com/image.jpg	Bolo de chocolate com recheio de leite ninho
\.


--
-- TOC entry 3330 (class 0 OID 41023)
-- Dependencies: 212
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, address, phone) FROM stdin;
1	Fulana	Rua tal	2199999999
2	Fulana	Rua tal	2199999999
3	Fulana	Rua tal	2199999999
4	Fulana	Rua tal	2199999999
5	dsafsadf	Rua tal	2199999999
6	dsafsadf	Rua tal	2199999999
7	dsafsadf	Rua tal	2199999999
8	Crisão	Rua tal	2199999999
9	Crisão	Rua tal	2199999999
\.


--
-- TOC entry 3332 (class 0 OID 41032)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, clientid, cakeid, quantity, createdat, totalprice) FROM stdin;
1	1	1	2	2023-10-19 00:00:00	26
2	2	1	2	2023-10-19 00:00:00	26
3	2	1	2	2023-10-19 00:00:00	26
4	1	1	5	2023-10-19 00:00:00	65
5	1	1	4	2023-10-19 00:00:00	52
6	1	1	4	2023-10-19 22:49:14	52
7	1	1	4	2023-10-19 22:50:08	52
8	1	1	3	2023-10-19 22:50:33	39
9	1	1	3	2023-10-19 23:05:27	39
10	1	1	3	2023-10-19 23:05:28	39
11	1	1	3	2023-10-19 23:05:28	39
12	1	1	3	2023-10-19 23:05:28	39
13	1	1	3	2023-10-19 23:05:28	39
14	1	1	3	2023-10-19 23:05:28	39
15	1	2	3	2023-10-19 23:05:47	33
16	1	5	3	2023-10-19 23:13:17	33
17	1	5	3	2023-10-19 23:13:27	33
18	1	6	3	2023-10-19 23:14:27	33
19	1	6	3	2023-10-20 00:00:24	33
20	1	6	3	2023-10-20 00:01:40	33
21	1	6	3	2023-10-20 16:05:54	33
22	1	7	3	2023-10-20 16:06:40	33
\.


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 209
-- Name: cakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cakes_id_seq', 8, true);


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 211
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 9, true);


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 22, true);


--
-- TOC entry 3183 (class 2606 OID 41021)
-- Name: cakes cakes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 41030)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 41039)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-10-20 16:30:36

--
-- PostgreSQL database dump complete
--

