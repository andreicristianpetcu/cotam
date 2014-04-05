--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: event_data_sources; Type: TABLE; Schema: public; Owner: andrei; Tablespace: 
--

CREATE TABLE event_data_sources (
    id integer NOT NULL,
    name character varying(255),
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.event_data_sources OWNER TO andrei;

--
-- Name: event_data_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: andrei
--

CREATE SEQUENCE event_data_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_data_sources_id_seq OWNER TO andrei;

--
-- Name: event_data_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrei
--

ALTER SEQUENCE event_data_sources_id_seq OWNED BY event_data_sources.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: andrei; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying(255),
    description text,
    url character varying(255),
    event_data_source_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    lat double precision DEFAULT 52.14,
    long double precision DEFAULT 21.1
);


ALTER TABLE public.events OWNER TO andrei;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: andrei
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO andrei;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrei
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: andrei; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO andrei;

--
-- Name: users; Type: TABLE; Schema: public; Owner: andrei; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO andrei;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: andrei
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO andrei;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrei
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrei
--

ALTER TABLE ONLY event_data_sources ALTER COLUMN id SET DEFAULT nextval('event_data_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrei
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrei
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: event_data_sources; Type: TABLE DATA; Schema: public; Owner: andrei
--

COPY event_data_sources (id, name, url, created_at, updated_at) FROM stdin;
730186808	Eastbook.eu - Announcement	http://eastbook.eu/category/material/announcement	2014-04-05 03:17:35.023622	2014-04-05 03:18:58.013401
\.


--
-- Name: event_data_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrei
--

SELECT pg_catalog.setval('event_data_sources_id_seq', 1, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: andrei
--

COPY events (id, name, description, url, event_data_source_id, created_at, updated_at, lat, long) FROM stdin;
121	Poznań, Spotkanie z Hanną Kondratiuk – autorką książki: “Białoruś. Miłość i Marazm”		http://eastbook.eu/2014/03/country/belarus/pozna%c5%84-spotkanie-z-hann%c4%85-kondratiuk-autork%c4%85-ksi%c4%85%c5%bcki-bia%c5%82oru%c5%9b-mi%c5%82o%c5%9b%c4%87-i-marazm/	730186808	2014-03-16 11:37:55.695654	2014-04-05 03:22:17.533965	52.4106129999999979	16.9266070000000006
122	Konferencja: Węzeł Kaukaski – współczesne problemy i wyzwania regionu		http://eastbook.eu/2014/03/country/georgia/konferencja-wezel-kaukaski-wspolczesne-problemy-i-wyzwania-regionu/	730186808	2014-03-16 11:37:55.713764	2014-04-05 03:22:17.541923	52.3775070000000014	16.9074899999999992
123	Białoruś pod lupą – teatr		http://eastbook.eu/2014/03/country/belarus/bialorus-pod-lupa-teatr/	730186808	2014-03-16 11:37:55.728815	2014-04-05 03:22:17.545508	52.2222700000000017	21.0190739999999998
124	Konferencja: Krym – na krawędzi zbrojnego konfliktu?		http://eastbook.eu/2014/03/country/ukraine/konferencja-krym-na-kraw%c4%99dzi-zbrojnego-konfliktu/	730186808	2014-03-16 11:37:55.74214	2014-04-05 03:22:17.548943	52.2407740000000018	21.0166070000000005
125	Pikieta pod Ambasadą Rosji w Warszawie “Za suwerenną Ukrainę”, 2 marca 2014		http://eastbook.eu/2014/03/material/announcement/pikieta-pod-ambasad%c4%85-rosji-w-warszawie-za-suwerenn%c4%85-ukrain%c4%99-2-marca-2014/	730186808	2014-03-16 11:37:55.758586	2014-04-05 03:22:17.551401	52.2104920000000021	21.0264619999999987
126	Spotkanie: Mołdawia w kontekście integracji europejskiej		http://eastbook.eu/2014/02/country/moldova/spotkanie-mo%c5%82dawia-w-kontek%c5%9bcie-integracji-europejskiej/	730186808	2014-03-16 11:37:55.775274	2014-04-05 03:22:17.553827	52.2400319999999994	21.0164970000000011
127	Open Data Hackathon w Warszawie		http://eastbook.eu/2014/02/material/announcement/open-data-hackathon-w-warszawie/	730186808	2014-03-16 11:37:55.791053	2014-04-05 03:22:17.55618	52.2401910000000029	21.0479500000000002
128	Technologia i demokracja w Europie Wschodniej. Dołącz do nas w marcu 2014	\N	http://eastbook.eu/2014/02/material/news/technologia-i-demokracja-w-europie-wschodniej-do%c5%82%c4%85cz-do-nas-w-marcu-2014-2/	730186808	2014-03-16 11:37:55.80496	2014-04-05 03:22:17.55935	52.1400000000000006	21.1000000000000014
129	Pierwsze show komediowe po białorusku	\N	http://eastbook.eu/2014/02/country/belarus/pierwsze-show-komediowe-po-bia%c5%82orusku/	730186808	2014-03-16 11:37:55.822344	2014-04-05 03:22:17.563394	52.1400000000000006	21.1000000000000014
130	„I po kryzysie? Czy Polsce nie grozi już recesja?” – debata w Biurze Informacyjnym PE w Polsce	\N	http://eastbook.eu/2014/02/material/announcement/%e2%80%9ei-po-kryzysie-czy-polsce-nie-grozi-ju%c5%bc-recesja-debata-w-biurze-informacyjnym-pe-w-polsce/	730186808	2014-03-16 11:37:55.839414	2014-04-05 03:22:17.567822	52.1400000000000006	21.1000000000000014
131	Majdan i tradycje polityczne – debata	\N	http://eastbook.eu/2014/02/country/ukraine/majdan-i-tradycje-polityczne-debata/	730186808	2014-03-16 11:37:55.854748	2014-04-05 03:22:17.571952	52.1400000000000006	21.1000000000000014
132	Koncert ukraińskiego Kozak System w Warszawie	\N	http://eastbook.eu/2014/02/country/ukraine/koncert-ukrai%c5%84skiego-kozak-system-w-warszawie/	730186808	2014-03-16 11:37:55.869535	2014-04-05 03:22:17.575781	52.1400000000000006	21.1000000000000014
133	Sorokin w Teatrze Narodowym	\N	http://eastbook.eu/2014/02/material/announcement/sorokin-w-teatrze-narodowym/	730186808	2014-03-16 11:37:55.886806	2014-04-05 03:22:17.578342	52.1400000000000006	21.1000000000000014
134	Białoruś pod lupą: literatura	\N	http://eastbook.eu/2014/02/country/belarus/bia%c5%82oru%c5%9b-pod-lup%c4%85-literatura/	730186808	2014-03-16 11:37:55.903809	2014-04-05 03:22:17.58093	52.1400000000000006	21.1000000000000014
135	Czy nowe technologie wzmacniają czy osłabiają demokracje?		http://eastbook.eu/2014/02/material/announcement/czy-nowe-technologie-wzmacniaja-czy-oslabiaja-demokracje/	730186808	2014-03-16 11:37:55.918464	2014-04-05 03:22:17.583227	52.2401910000000029	21.0479500000000002
136	Apel do wolontariuszy akcji Solidarni z EuroMajdanem	\N	http://eastbook.eu/2014/01/country/ukraine/apel-do-wolontariuszy-akcji-solidarni-z-euromajdanem/	730186808	2014-03-16 11:37:55.93289	2014-04-05 03:22:17.586033	52.1400000000000006	21.1000000000000014
137	Solidarni z EuroMajdanem – wielka manifestacja wsparcia dla Ukrainy!	\N	http://eastbook.eu/2014/01/country/ukraine/solidarni-z-euromajdanem-wielka-manifestacja-wsparcia-dla-ukrainy/	730186808	2014-03-16 11:37:55.951628	2014-04-05 03:22:17.590434	52.1400000000000006	21.1000000000000014
138	Debata: Organizacje pozarządowe i państwo – współpraca czy rywalizacja?	\N	http://eastbook.eu/2014/01/material/announcement/debata-organizacje-pozarz%c4%85dowe-i-pa%c5%84stwo-wsp%c3%b3%c5%82praca-czy-rywalizacja/	730186808	2014-03-16 11:37:55.989061	2014-04-05 03:22:17.594668	52.1400000000000006	21.1000000000000014
139	Chcesz pomóc demonstrującym na Ukrainie – osobom rannym i represjonowanym?	\N	http://eastbook.eu/2014/01/country/ukraine/chcesz-pom%c3%b3c-demonstruj%c4%85cym-na-ukrainie-%e2%80%93-osobom-rannym-i-represjonowanym/	730186808	2014-03-16 11:37:56.011913	2014-04-05 03:22:17.598413	52.1400000000000006	21.1000000000000014
140	Lubelski EuroMajdan Kulturalny „LEK”	\N	http://eastbook.eu/2014/01/country/ukraine/lubelski-euromajdan-kulturalny-%e2%80%9elek%e2%80%9d/	730186808	2014-03-16 11:37:56.032412	2014-04-05 03:22:17.602171	52.1400000000000006	21.1000000000000014
141	Solidarność z Ukrainą	\N	http://eastbook.eu/2014/01/country/ukraine/solidarnosc-z-ukraina/	730186808	2014-03-16 11:37:56.052973	2014-04-05 03:22:17.604999	52.1400000000000006	21.1000000000000014
142	Debata: Ukraińskie Reality Show	\N	http://eastbook.eu/2014/01/country/ukraine/debata-ukrainskie-reality-show/	730186808	2014-03-16 11:37:56.069915	2014-04-05 03:22:17.607635	52.1400000000000006	21.1000000000000014
143	Opowieści z Majdanu	\N	http://eastbook.eu/2014/01/country/ukraine/opowie%c5%9bci-z-majdanu/	730186808	2014-03-16 11:37:56.087599	2014-04-05 03:22:17.610093	52.1400000000000006	21.1000000000000014
144	Zbliża się termin przysyłania tekstów na Belarus in Focus 2013	\N	http://eastbook.eu/2014/01/country/belarus/zbli%c5%bca-si%c4%99-termin-przysy%c5%82ania-tekst%c3%b3w-na-belarus-in-focus-2013/	730186808	2014-03-16 11:37:56.102236	2014-04-05 03:22:17.612674	52.1400000000000006	21.1000000000000014
145	Ogłoszenie o pracę w Forum Społeczeństwa Obywatelskiego UE-Rosja	\N	http://eastbook.eu/2014/01/material/quicklink/og%c5%82oszenie-o-prac%c4%99-w-forum-spo%c5%82ecze%c5%84stwa-obywatelskiego-ue-rosja/	730186808	2014-03-16 11:37:56.119635	2014-04-05 03:22:17.6167	52.1400000000000006	21.1000000000000014
146	Białoruś pod lupą. Architektura		http://eastbook.eu/2014/01/country/belarus/bia%c5%82oru%c5%9b-pod-lup%c4%85-architektura/	730186808	2014-03-16 11:37:56.137297	2014-04-05 03:22:17.620523	52.2222700000000017	21.0190739999999998
147	Wesołych Świąt	\N	http://eastbook.eu/2013/12/material/announcement/weso%c5%82ych-%c5%9bwi%c4%85t/	730186808	2014-03-16 11:37:56.1532	2014-04-05 03:22:17.623768	52.1400000000000006	21.1000000000000014
148	Raport o stanie kultury w Gruzji / Zbliżenie z UE		http://eastbook.eu/2013/12/country/georgia/raport-o-stanie-kultury-w-gruzji-zbli%c5%bcenie-z-ue/	730186808	2014-03-16 11:37:56.168928	2014-04-05 03:22:17.627091	51.2485569999999981	22.5684870000000011
149	Konkurs “Dizajn na ludowo”	\N	http://eastbook.eu/2013/12/country/belarus/konkurs-dizajn-na-ludowo/	730186808	2014-03-16 11:37:56.18733	2014-04-05 03:22:17.629498	52.1400000000000006	21.1000000000000014
150	Belarus Press Photo 2013		http://eastbook.eu/2013/12/country/belarus/belarus-press-photo-2013/	730186808	2014-03-16 11:37:56.207819	2014-04-05 03:22:17.631831	50.0577499999999986	19.9296630000000015
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrei
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: andrei
--

COPY schema_migrations (version) FROM stdin;
20140325192907
20140323140943
20140315115030
20140316104327
20140315131618
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: andrei
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, is_admin) FROM stdin;
1	andrei@ceata.org	$2a$10$.3L0BsDBDJdMtljblfuILuP9HHHRLo1RKHvvKM1b4EqwDywtG31cG	\N	\N	2014-04-05 03:09:00	22	2014-04-05 03:26:51.825452	2014-04-05 03:17:22.005434	127.0.0.1	127.0.0.1	2014-03-23 19:20:23.923419	2014-04-05 03:26:51.827075	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrei
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: event_data_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: andrei; Tablespace: 
--

ALTER TABLE ONLY event_data_sources
    ADD CONSTRAINT event_data_sources_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: andrei; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: andrei; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: andrei; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: andrei; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: andrei; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

