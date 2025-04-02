--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    group_name character varying(50) NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: ranks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ranks (
    id integer NOT NULL,
    rank_name character varying(100) NOT NULL
);


ALTER TABLE public.ranks OWNER TO postgres;

--
-- Name: ranks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ranks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ranks_id_seq OWNER TO postgres;

--
-- Name: ranks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ranks_id_seq OWNED BY public.ranks.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    birth_date date NOT NULL,
    rank_id integer,
    group_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: ranks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranks ALTER COLUMN id SET DEFAULT nextval('public.ranks_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, group_name) FROM stdin;
1	Група 101
2	Група 102
3	Група 103
\.


--
-- Data for Name: ranks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ranks (id, rank_name) FROM stdin;
1	Солдат
2	Сержант
3	Старший сержант
4	Лейтенант
5	Капітан
6	Майор
7	Підполковник
8	Полковник
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, full_name, birth_date, rank_id, group_id) FROM stdin;
1	Іваненко Петро Олексійович	1990-05-14	4	1
2	Павленко Сергій Іванович	1992-08-21	5	2
3	Коваленко Андрій Володимирович	1988-11-30	6	3
4	Остапенко Олег Васильович	1995-02-14	3	1
5	Мельник Дмитро Сергійович	1993-07-19	2	2
6	Іваненко Петро Олексійович	1990-05-14	4	1
7	Павленко Сергій Іванович	1992-08-21	5	2
8	Коваленко Андрій Володимирович	1988-11-30	6	3
9	Остапенко Олег Васильович	1995-02-14	3	1
10	Мельник Дмитро Сергійович	1993-07-19	2	2
11	Гриценко Олександр Михайлович	1991-03-25	4	1
12	Сидоренко Василь Петрович	1994-06-17	5	2
13	Бондаренко Володимир Ігорович	1996-12-05	3	3
14	Ткаченко Максим Олексійович	1997-09-28	2	1
15	Романенко Андрій Сергійович	1990-04-15	6	2
16	Дмитренко Олег Олександрович	1989-08-11	7	3
17	Захарченко Іван Михайлович	1995-10-30	4	1
18	Мазуренко Петро Дмитрович	1992-05-18	3	2
19	Федоренко Сергій Вікторович	1993-11-24	5	3
20	Кравченко Юрій Олексійович	1991-07-22	2	1
21	Климчук Андрій Олегович	1987-02-06	6	2
22	Котенко Олександр Сергійович	1998-06-19	3	3
23	Щербина Дмитро Іванович	1994-09-12	7	1
24	Білоус Віталій Олександрович	1990-10-10	4	2
25	Куликов Ігор Васильович	1995-12-20	5	3
26	Марченко Павло Володимирович	1993-01-09	2	1
27	Гончаренко Михайло Сергійович	1996-07-29	6	2
28	Кириленко Василь Олегович	1992-11-17	3	3
29	Семенов Іван Олександрович	1997-08-25	7	1
30	Петренко Андрій Юрійович	1989-05-03	4	2
31	Лисенко Олег Миколайович	1994-03-16	5	3
32	Юрченко Сергій Володимирович	1991-12-08	2	1
33	Морозенко Дмитро Іванович	1990-07-05	6	2
34	Овчаренко Олександр Павлович	1993-06-21	3	3
35	Степаненко Ігор Олександрович	1998-04-14	7	1
36	Гладченко Віталій Дмитрович	1996-02-27	4	2
37	Буряк Петро Сергійович	1995-11-30	5	3
38	Савченко Микола Олександрович	1992-01-15	2	1
39	Даниленко Олег Петрович	1997-10-23	6	2
40	Рябченко Іван Юрійович	1993-09-01	3	3
41	Герасименко Павло Олексійович	1991-05-07	7	1
42	Гришко Дмитро Іванович	1990-12-14	4	2
43	Козаченко Олександр Сергійович	1995-06-08	5	3
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 3, true);


--
-- Name: ranks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ranks_id_seq', 8, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 43, true);


--
-- Name: groups groups_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_group_name_key UNIQUE (group_name);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: ranks ranks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranks
    ADD CONSTRAINT ranks_pkey PRIMARY KEY (id);


--
-- Name: ranks ranks_rank_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ranks
    ADD CONSTRAINT ranks_rank_name_key UNIQUE (rank_name);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students students_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE SET NULL;


--
-- Name: students students_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_rank_id_fkey FOREIGN KEY (rank_id) REFERENCES public.ranks(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

