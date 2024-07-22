--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    cat_id bigint NOT NULL,
    cat_nombre character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_cat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_cat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_cat_id_seq OWNER TO postgres;

--
-- Name: categoria_cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_cat_id_seq OWNED BY public.categoria.cat_id;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cli_id bigint NOT NULL,
    cli_telefono character varying(10),
    cli_apellido character varying(50) NOT NULL,
    cli_nombre character varying(50) NOT NULL,
    cli_email character varying(255) NOT NULL,
    cli_direccion character varying(100),
    cli_cedula character varying(255) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_cli_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cli_id_seq OWNER TO postgres;

--
-- Name: cliente_cli_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cli_id_seq OWNED BY public.cliente.cli_id;


--
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    pag_id bigint NOT NULL,
    pag_monto numeric(19,2) NOT NULL,
    pag_fecha timestamp without time zone NOT NULL,
    estado character varying(9) NOT NULL,
    vid_id bigint NOT NULL,
    cli_id bigint NOT NULL
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- Name: pago_pag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_pag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pago_pag_id_seq OWNER TO postgres;

--
-- Name: pago_pag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_pag_id_seq OWNED BY public.pago.pag_id;


--
-- Name: prfl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prfl (
    prfl__id bigint NOT NULL,
    prflpdre bigint,
    prflcdgo character varying(255) NOT NULL,
    prfldscr character varying(255) NOT NULL,
    prflobsr character varying(255),
    prflnmbr character varying(255) NOT NULL
);


ALTER TABLE public.prfl OWNER TO postgres;

--
-- Name: prfl_prfl__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prfl_prfl__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prfl_prfl__id_seq OWNER TO postgres;

--
-- Name: prfl_prfl__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prfl_prfl__id_seq OWNED BY public.prfl.prfl__id;


--
-- Name: prsn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prsn (
    prsn__id bigint NOT NULL,
    prsnlogn character varying(255),
    prsnfcin timestamp without time zone,
    prsnactv integer NOT NULL,
    prsntelf character varying(31),
    prsnpass character varying(63),
    prsnfcfn timestamp without time zone,
    prsnapll character varying(31),
    prsnsexo character varying(255),
    prsnmail character varying(255) NOT NULL,
    prsncdla character varying(255),
    prsnnmbr character varying(31) NOT NULL,
    prsndire character varying(255)
);


ALTER TABLE public.prsn OWNER TO postgres;

--
-- Name: prsn_prsn__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prsn_prsn__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prsn_prsn__id_seq OWNER TO postgres;

--
-- Name: prsn_prsn__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prsn_prsn__id_seq OWNED BY public.prsn.prsn__id;


--
-- Name: sesn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sesn (
    sesn__id bigint NOT NULL,
    sesnfcin timestamp without time zone,
    prsn__id bigint NOT NULL,
    sesnfcfn timestamp without time zone,
    prfl__id bigint NOT NULL
);


ALTER TABLE public.sesn OWNER TO postgres;

--
-- Name: sesn_sesn__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sesn_sesn__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sesn_sesn__id_seq OWNER TO postgres;

--
-- Name: sesn_sesn__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sesn_sesn__id_seq OWNED BY public.sesn.sesn__id;


--
-- Name: videojuego; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videojuego (
    vid_id bigint NOT NULL,
    vid_precio numeric(19,2) NOT NULL,
    cat_id bigint NOT NULL,
    vid_nombre character varying(100) NOT NULL,
    vid_imagen character varying(2000) NOT NULL
);


ALTER TABLE public.videojuego OWNER TO postgres;

--
-- Name: videojuego_vid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.videojuego_vid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videojuego_vid_id_seq OWNER TO postgres;

--
-- Name: videojuego_vid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.videojuego_vid_id_seq OWNED BY public.videojuego.vid_id;


--
-- Name: categoria cat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN cat_id SET DEFAULT nextval('public.categoria_cat_id_seq'::regclass);


--
-- Name: cliente cli_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cli_id SET DEFAULT nextval('public.cliente_cli_id_seq'::regclass);


--
-- Name: pago pag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN pag_id SET DEFAULT nextval('public.pago_pag_id_seq'::regclass);


--
-- Name: prfl prfl__id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prfl ALTER COLUMN prfl__id SET DEFAULT nextval('public.prfl_prfl__id_seq'::regclass);


--
-- Name: prsn prsn__id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prsn ALTER COLUMN prsn__id SET DEFAULT nextval('public.prsn_prsn__id_seq'::regclass);


--
-- Name: sesn sesn__id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesn ALTER COLUMN sesn__id SET DEFAULT nextval('public.sesn_sesn__id_seq'::regclass);


--
-- Name: videojuego vid_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videojuego ALTER COLUMN vid_id SET DEFAULT nextval('public.videojuego_vid_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (cat_id, cat_nombre) FROM stdin;
2	Aventura
3	Horror
1	Acción
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cli_id, cli_telefono, cli_apellido, cli_nombre, cli_email, cli_direccion, cli_cedula) FROM stdin;
7	0983077451	Velasco	Francisco	fvelasco@gmail.com	Conocoto	1721933545
8	0983077456	Tayupanta	Andres	at@gmail.com	Oregon USA	1724691421
\.


--
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago (pag_id, pag_monto, pag_fecha, estado, vid_id, cli_id) FROM stdin;
53	39.99	2024-06-12 08:57:59.304	Pagado	4	7
54	69.99	2024-06-12 08:57:59.304	Pagado	3	7
55	39.98	2024-06-12 08:57:59.304	Pagado	5	7
56	69.99	2024-06-12 12:18:20.927	Pagado	3	7
57	39.99	2024-06-12 12:30:32.846	Pagado	4	8
58	19.99	2024-06-12 12:30:32.846	Pagado	5	8
59	139.98	2024-06-12 12:30:32.846	Pagado	3	8
60	19.99	2024-06-12 12:33:38.034	Pagado	5	8
61	209.97	2024-06-12 17:33:21.508	Pagado	3	7
62	39.99	2024-06-12 17:33:21.508	Pagado	4	7
63	39.98	2024-06-12 17:38:21.645	Pagado	5	7
64	39.99	2024-06-12 17:38:21.645	Pagado	4	7
65	69.99	2024-06-12 17:38:21.645	Pagado	3	7
\.


--
-- Data for Name: prfl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prfl (prfl__id, prflpdre, prflcdgo, prfldscr, prflobsr, prflnmbr) FROM stdin;
1	\N	A	Usuario	\N	Perfil de Usuario
\.


--
-- Data for Name: prsn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prsn (prsn__id, prsnlogn, prsnfcin, prsnactv, prsntelf, prsnpass, prsnfcfn, prsnapll, prsnsexo, prsnmail, prsncdla, prsnnmbr, prsndire) FROM stdin;
1	admin	\N	1	0983077451	202cb962ac59075b964b07152d234b70	\N	Perez	M	jperez@gmail.com	1721933545	Francisco	2 de diciembre
\.


--
-- Data for Name: sesn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sesn (sesn__id, sesnfcin, prsn__id, sesnfcfn, prfl__id) FROM stdin;
1	2024-05-08 00:00:00	1	\N	1
\.


--
-- Data for Name: videojuego; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videojuego (vid_id, vid_precio, cat_id, vid_nombre, vid_imagen) FROM stdin;
3	69.99	2	Persona 3 Reload	https://image.api.playstation.com/vulcan/ap/rnd/202307/2605/7b70e463bf05b20fbf99f8bf81956aa805969da98d9dcde8.jpg
4	39.99	3	Resident Evil 4 Remake	https://image.api.playstation.com/vulcan/ap/rnd/202210/0706/EVWyZD63pahuh95eKloFaJuC.png
5	19.99	1	The Legend Of Zelda: Ocarina Of Time	https://assets1.ignimgs.com/2019/06/04/legend-of-zelda-ocarina-of-time-3d-1559683061479.jpg
\.


--
-- Name: categoria_cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_cat_id_seq', 3, true);


--
-- Name: cliente_cli_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cli_id_seq', 8, true);


--
-- Name: pago_pag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_pag_id_seq', 65, true);


--
-- Name: prfl_prfl__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prfl_prfl__id_seq', 1, false);


--
-- Name: prsn_prsn__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prsn_prsn__id_seq', 1, false);


--
-- Name: sesn_sesn__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sesn_sesn__id_seq', 1, false);


--
-- Name: videojuego_vid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.videojuego_vid_id_seq', 5, true);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (cat_id);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_id);


--
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (pag_id);


--
-- Name: prfl prfl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prfl
    ADD CONSTRAINT prfl_pkey PRIMARY KEY (prfl__id);


--
-- Name: prsn prsn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prsn
    ADD CONSTRAINT prsn_pkey PRIMARY KEY (prsn__id);


--
-- Name: sesn sesn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesn
    ADD CONSTRAINT sesn_pkey PRIMARY KEY (sesn__id);


--
-- Name: cliente uk_6x6s5ibj6ku0g3v5fy1snb88a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uk_6x6s5ibj6ku0g3v5fy1snb88a UNIQUE (cli_cedula);


--
-- Name: prsn uk_jx1yj3rkdawlxgc51ikt2tlwx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prsn
    ADD CONSTRAINT uk_jx1yj3rkdawlxgc51ikt2tlwx UNIQUE (prsnlogn);


--
-- Name: cliente uk_rsh70yesainjlqgkr4ppcs1xq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uk_rsh70yesainjlqgkr4ppcs1xq UNIQUE (cli_email);


--
-- Name: videojuego videojuego_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videojuego
    ADD CONSTRAINT videojuego_pkey PRIMARY KEY (vid_id);


--
-- Name: pago fk3jat35nbhu31j056h8d3n5qs7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk3jat35nbhu31j056h8d3n5qs7 FOREIGN KEY (vid_id) REFERENCES public.videojuego(vid_id);


--
-- Name: prfl fka5u4qmvg8v5dxmywu1hi9hxv1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prfl
    ADD CONSTRAINT fka5u4qmvg8v5dxmywu1hi9hxv1 FOREIGN KEY (prflpdre) REFERENCES public.prfl(prfl__id);


--
-- Name: sesn fkk603twyrgl2rsyyy3woa88rpd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesn
    ADD CONSTRAINT fkk603twyrgl2rsyyy3woa88rpd FOREIGN KEY (prsn__id) REFERENCES public.prsn(prsn__id);


--
-- Name: pago fko5i8j4dw0rk6dt72hxa3vsxxo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fko5i8j4dw0rk6dt72hxa3vsxxo FOREIGN KEY (cli_id) REFERENCES public.cliente(cli_id);


--
-- Name: videojuego fkpplqdpnx7exib4c3f4dmkq6ys; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videojuego
    ADD CONSTRAINT fkpplqdpnx7exib4c3f4dmkq6ys FOREIGN KEY (cat_id) REFERENCES public.categoria(cat_id);


--
-- Name: sesn fktmpbdqc42dilrcw2dr4k2j1o6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesn
    ADD CONSTRAINT fktmpbdqc42dilrcw2dr4k2j1o6 FOREIGN KEY (prfl__id) REFERENCES public.prfl(prfl__id);


--
-- PostgreSQL database dump complete
--

