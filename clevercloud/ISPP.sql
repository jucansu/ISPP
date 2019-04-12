

--
-- TOC entry 168 (class 1259 OID 49516)
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE actor (
    id integer NOT NULL,
    version integer NOT NULL,
    city character varying(255),
    country character varying(255),
    medium_stars double precision,
    name character varying(255),
    number_of_trips integer,
    phone character varying(255),
    surname character varying(255),
    user_account integer
);




--
-- TOC entry 169 (class 1259 OID 49524)
-- Name: administrator; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE administrator (
    id integer NOT NULL,
    version integer NOT NULL,
    city character varying(255),
    country character varying(255),
    medium_stars double precision,
    name character varying(255),
    number_of_trips integer,
    phone character varying(255),
    surname character varying(255),
    user_account integer
);




--
-- TOC entry 170 (class 1259 OID 49532)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment (
    id integer NOT NULL,
    version integer NOT NULL,
    date timestamp without time zone,
    from_driver boolean,
    star double precision,
    text character varying(255),
    driver integer NOT NULL,
    passenger integer NOT NULL,
    route integer NOT NULL
);




--
-- TOC entry 171 (class 1259 OID 49537)
-- Name: control_point; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE control_point (
    id integer NOT NULL,
    version integer NOT NULL,
    arrival_order integer,
    arrival_time timestamp without time zone,
    distance double precision,
    location character varying(255),
    route integer NOT NULL
);




--
-- TOC entry 172 (class 1259 OID 49542)
-- Name: driver; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE driver (
    id integer NOT NULL,
    version integer NOT NULL,
    city character varying(255),
    country character varying(255),
    medium_stars double precision,
    name character varying(255),
    number_of_trips integer,
    phone character varying(255),
    surname character varying(255),
    user_account integer,
    bank_account_number character varying(255),
    cash double precision,
    childs boolean,
    cvv integer,
    exp_month integer,
    exp_year integer,
    number character varying(255),
    music boolean,
    pets boolean,
    smoke boolean
);




--
-- TOC entry 173 (class 1259 OID 49550)
-- Name: folder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE folder (
    id integer NOT NULL,
    version integer NOT NULL,
    name character varying(255),
    system boolean NOT NULL,
    actor integer NOT NULL
);




--
-- TOC entry 174 (class 1259 OID 49555)
-- Name: folder_messages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE folder_messages (
    folder integer NOT NULL,
    messages integer NOT NULL
);




--
-- TOC entry 182 (class 1259 OID 49696)
-- Name: hibernate_sequences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hibernate_sequences (
    sequence_name character varying(255),
    sequence_next_hi_value integer
);



--
-- TOC entry 175 (class 1259 OID 49558)
-- Name: letter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE letter (
    id integer NOT NULL,
    version integer NOT NULL,
    alert_type integer,
    body character varying(255),
    is_report boolean,
    moment timestamp without time zone,
    priority character varying(255),
    subject character varying(255),
    folder integer NOT NULL,
    recipient integer NOT NULL,
    sender integer NOT NULL
);



--
-- TOC entry 176 (class 1259 OID 49566)
-- Name: passenger; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE passenger (
    id integer NOT NULL,
    version integer NOT NULL,
    city character varying(255),
    country character varying(255),
    medium_stars double precision,
    name character varying(255),
    number_of_trips integer,
    phone character varying(255),
    surname character varying(255),
    user_account integer,
    bank_account_number character varying(255),
    cash double precision,
    cvv integer,
    exp_month integer,
    exp_year integer,
    number character varying(255)
);



--
-- TOC entry 177 (class 1259 OID 49574)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reservation (
    id integer NOT NULL,
    version integer NOT NULL,
    destination character varying(255),
    driver_no_picked_me boolean NOT NULL,
    driver_picked_me boolean NOT NULL,
    luggage_size integer,
    origin character varying(255),
    price double precision,
    seat integer,
    status integer,
    passenger integer NOT NULL,
    route integer NOT NULL
);



--
-- TOC entry 178 (class 1259 OID 49582)
-- Name: route; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE route (
    id integer NOT NULL,
    version integer NOT NULL,
    available_seats integer,
    days_repeat character varying(255),
    departure_date timestamp without time zone,
    destination character varying(255),
    details character varying(255),
    distance double precision,
    estimated_duration integer,
    is_cancelled boolean,
    max_luggage integer,
    origin character varying(255),
    price_per_passenger double precision,
    driver integer NOT NULL,
    vehicle integer NOT NULL
);



--
-- TOC entry 179 (class 1259 OID 49590)
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_account (
    id integer NOT NULL,
    version integer NOT NULL,
    banned boolean,
    password character varying(255),
    username character varying(255)
);



--
-- TOC entry 180 (class 1259 OID 49598)
-- Name: user_account_authorities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_account_authorities (
    user_account integer NOT NULL,
    authority character varying(255)
);


--
-- TOC entry 181 (class 1259 OID 49601)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehicle (
    id integer NOT NULL,
    version integer NOT NULL,
    description character varying(255),
    image character varying(255),
    model character varying(255),
    plate character varying(255),
    seats_capacity integer NOT NULL,
    type integer,
    vehicle_brand character varying(255),
    driver integer NOT NULL
);


--
-- TOC entry 2022 (class 0 OID 49516)
-- Dependencies: 168
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2023 (class 0 OID 49524)
-- Dependencies: 169
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2024 (class 0 OID 49532)
-- Dependencies: 170
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO comment VALUES (1415, 0, '2019-01-27 16:32:00', false, 2, 'Mastica chicle con la boca abierta', 826, 857, 959);
INSERT INTO comment VALUES (1416, 0, '2019-01-27 16:32:00', true, 0, 'Desagradable', 826, 857, 959);
INSERT INTO comment VALUES (1417, 0, '2019-01-27 16:32:00', false, 2, 'Poca flexibilidad en la recogida y destino', 826, 857, 959);
INSERT INTO comment VALUES (1418, 0, '2019-01-27 16:32:00', true, 2, 'Desagradable', 826, 857, 959);
INSERT INTO comment VALUES (1419, 0, '2019-01-09 12:32:00', false, 4, 'Muy agradable', 829, 862, 968);
INSERT INTO comment VALUES (1420, 0, '2019-01-09 12:32:00', true, 3, 'Desagradable', 829, 862, 968);
INSERT INTO comment VALUES (1421, 0, '2019-03-24 20:32:00', false, 0, 'Conduce de forma temeraria', 833, 867, 974);
INSERT INTO comment VALUES (1422, 0, '2019-03-24 20:32:00', true, 0, 'Un poco especial', 833, 867, 974);
INSERT INTO comment VALUES (1423, 0, '2019-02-14 15:32:00', false, 5, 'Una persona mu salá', 837, 874, 985);
INSERT INTO comment VALUES (1424, 0, '2019-02-14 15:32:00', true, 5, 'Una persona mu salá', 837, 874, 985);
INSERT INTO comment VALUES (1425, 0, '2019-04-04 09:32:00', false, 4, 'Muy agradable', 838, 875, 989);
INSERT INTO comment VALUES (1426, 0, '2019-04-04 09:32:00', true, 0, 'Habla demasiado poco', 838, 875, 989);
INSERT INTO comment VALUES (1427, 0, '2019-02-15 14:32:00', false, 0, 'Conduce de forma temeraria', 839, 877, 993);
INSERT INTO comment VALUES (1428, 0, '2019-02-15 14:32:00', true, 3, 'Un peligro como co-piloto', 839, 877, 993);
INSERT INTO comment VALUES (1429, 0, '2019-04-02 19:32:00', false, 4, 'Muy amable', 840, 878, 995);
INSERT INTO comment VALUES (1430, 0, '2019-04-02 19:32:00', true, 1, 'Un peligro como co-piloto', 840, 878, 995);
INSERT INTO comment VALUES (1431, 0, '2019-01-20 20:32:00', false, 1, 'Conduce de forma temeraria', 842, 881, 1000);
INSERT INTO comment VALUES (1432, 0, '2019-01-20 20:32:00', true, 4, 'Una persona muy agradable', 842, 881, 1000);
INSERT INTO comment VALUES (1433, 0, '2019-03-22 21:32:00', false, 0, 'Poca flexibilidad en la recogida y destino', 847, 889, 1016);
INSERT INTO comment VALUES (1434, 0, '2019-03-22 21:32:00', true, 2, 'Habla demasiado poco', 847, 889, 1016);
INSERT INTO comment VALUES (1435, 0, '2019-01-24 16:32:00', false, 4, 'Una persona mu salá', 847, 890, 1017);
INSERT INTO comment VALUES (1436, 0, '2019-01-24 16:32:00', true, 2, 'Desagradable', 847, 890, 1017);
INSERT INTO comment VALUES (1437, 0, '2019-01-18 20:32:00', false, 2, 'Conduce de forma temeraria', 849, 894, 1024);
INSERT INTO comment VALUES (1438, 0, '2019-01-18 20:32:00', true, 0, 'Un peligro como co-piloto', 849, 894, 1024);
INSERT INTO comment VALUES (1439, 0, '2019-02-23 13:32:00', false, 4, 'Muy amable', 850, 895, 1027);
INSERT INTO comment VALUES (1440, 0, '2019-02-23 13:32:00', true, 3, 'Una persona muy agradable', 850, 895, 1027);
INSERT INTO comment VALUES (1441, 0, '2019-01-05 20:32:00', false, 5, 'Muy agradable', 851, 896, 1028);
INSERT INTO comment VALUES (1442, 0, '2019-01-05 20:32:00', true, 4, 'Muy amable', 851, 896, 1028);
INSERT INTO comment VALUES (1443, 0, '2019-01-05 20:32:00', false, 0, 'Mastica chicle con la boca abierta', 851, 896, 1028);
INSERT INTO comment VALUES (1444, 0, '2019-01-05 20:32:00', true, 4, 'Muy amable', 851, 896, 1028);
INSERT INTO comment VALUES (1445, 0, '2019-02-28 14:32:00', false, 2, 'Poca flexibilidad en la recogida y destino', 853, 898, 1034);
INSERT INTO comment VALUES (1446, 0, '2019-02-28 14:32:00', true, 1, 'Habla demasiado poco', 853, 898, 1034);


--
-- TOC entry 2025 (class 0 OID 49537)
-- Dependencies: 171
-- Data for Name: control_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO control_point VALUES (1038, 0, 0, '2019-06-28 19:12:00', 0, 'Montequinto, Sevilla', 955);
INSERT INTO control_point VALUES (1039, 0, 1, '2019-06-28 19:17:00', 5, 'Sevilla Este, Sevilla', 955);
INSERT INTO control_point VALUES (1040, 0, 2, '2019-06-28 19:22:00', 10, 'El Porvenir, Sevilla', 955);
INSERT INTO control_point VALUES (1041, 0, 0, '2019-06-05 16:25:00', 0, 'El Porvenir, Sevilla', 956);
INSERT INTO control_point VALUES (1042, 0, 1, '2019-06-05 16:30:00', 5, 'Sevilla Este, Sevilla', 956);
INSERT INTO control_point VALUES (1043, 0, 0, '2019-02-01 16:02:00', 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 957);
INSERT INTO control_point VALUES (1044, 0, 1, '2019-02-01 16:07:00', 5, 'Plaza del Duque de la Victoria, Sevilla', 957);
INSERT INTO control_point VALUES (1045, 0, 2, '2019-02-01 16:12:00', 10, 'Avenida de El Greco, Sevilla', 957);
INSERT INTO control_point VALUES (1046, 0, 0, '2019-04-26 08:22:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 958);
INSERT INTO control_point VALUES (1047, 0, 1, '2019-04-26 08:27:00', 5, 'Macarena, Sevilla', 958);
INSERT INTO control_point VALUES (1048, 0, 2, '2019-04-26 08:32:00', 10, 'Avenida del Cid, Sevilla', 958);
INSERT INTO control_point VALUES (1049, 0, 3, '2019-04-26 08:37:00', 15, 'El Porvenir, Sevilla', 958);
INSERT INTO control_point VALUES (1050, 0, 0, '2019-01-27 14:21:00', 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 959);
INSERT INTO control_point VALUES (1051, 0, 1, '2019-01-27 14:26:00', 5, 'Macarena, Sevilla', 959);
INSERT INTO control_point VALUES (1052, 0, 2, '2019-01-27 14:31:00', 10, 'Torre Sevilla, Sevilla', 959);
INSERT INTO control_point VALUES (1053, 0, 0, '2019-06-18 20:40:00', 0, 'Avenida del Cid, Sevilla', 960);
INSERT INTO control_point VALUES (1054, 0, 1, '2019-06-18 20:45:00', 5, 'San Bernardo, Sevilla', 960);
INSERT INTO control_point VALUES (1055, 0, 2, '2019-06-18 20:50:00', 10, 'Felipe II, Sevilla', 960);
INSERT INTO control_point VALUES (1056, 0, 3, '2019-06-18 20:55:00', 15, 'Avenida de El Greco, Sevilla', 960);
INSERT INTO control_point VALUES (1057, 0, 0, '2019-04-05 09:12:00', 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 961);
INSERT INTO control_point VALUES (1058, 0, 1, '2019-04-05 09:17:00', 5, 'Camas, Sevilla', 961);
INSERT INTO control_point VALUES (1059, 0, 2, '2019-04-05 09:22:00', 10, 'Sevilla Este, Sevilla', 961);
INSERT INTO control_point VALUES (1060, 0, 3, '2019-04-05 09:27:00', 15, 'Felipe II, Sevilla', 961);
INSERT INTO control_point VALUES (1061, 0, 0, '2019-03-28 06:16:00', 0, 'Montequinto, Sevilla', 962);
INSERT INTO control_point VALUES (1062, 0, 1, '2019-03-28 06:21:00', 5, 'Avenida del Cid, Sevilla', 962);
INSERT INTO control_point VALUES (1063, 0, 2, '2019-03-28 06:26:00', 10, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 962);
INSERT INTO control_point VALUES (1064, 0, 3, '2019-03-28 06:31:00', 15, 'Macarena, Sevilla', 962);
INSERT INTO control_point VALUES (1065, 0, 0, '2019-02-17 20:38:00', 0, 'Felipe II, Sevilla', 963);
INSERT INTO control_point VALUES (1066, 0, 1, '2019-02-17 20:43:00', 5, 'Avenida de El Greco, Sevilla', 963);
INSERT INTO control_point VALUES (1067, 0, 0, '2019-03-09 09:27:00', 0, 'Avenida del Cid, Sevilla', 964);
INSERT INTO control_point VALUES (1068, 0, 1, '2019-03-09 09:32:00', 5, 'Calle Jilguero, Sevilla', 964);
INSERT INTO control_point VALUES (1069, 0, 2, '2019-03-09 09:37:00', 10, 'San Bernardo, Sevilla', 964);
INSERT INTO control_point VALUES (1070, 0, 3, '2019-03-09 09:42:00', 15, 'Montequinto, Sevilla', 964);
INSERT INTO control_point VALUES (1071, 0, 0, '2019-05-28 10:02:00', 0, 'Camas, Sevilla', 965);
INSERT INTO control_point VALUES (1072, 0, 1, '2019-05-28 10:07:00', 5, 'Gran Plaza, Sevilla', 965);
INSERT INTO control_point VALUES (1073, 0, 2, '2019-05-28 10:12:00', 10, 'Felipe II, Sevilla', 965);
INSERT INTO control_point VALUES (1074, 0, 0, '2019-03-26 18:31:00', 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 966);
INSERT INTO control_point VALUES (1075, 0, 1, '2019-03-26 18:36:00', 5, 'Felipe II, Sevilla', 966);
INSERT INTO control_point VALUES (1076, 0, 0, '2019-01-04 20:16:00', 0, 'Plaza del Duque de la Victoria, Sevilla', 967);
INSERT INTO control_point VALUES (1077, 0, 1, '2019-01-04 20:21:00', 5, 'El Porvenir, Sevilla', 967);
INSERT INTO control_point VALUES (1078, 0, 2, '2019-01-04 20:26:00', 10, 'Macarena, Sevilla', 967);
INSERT INTO control_point VALUES (1079, 0, 0, '2019-01-09 10:35:00', 0, 'Avenida del Cid, Sevilla', 968);
INSERT INTO control_point VALUES (1080, 0, 1, '2019-01-09 10:40:00', 5, 'Avenida de El Greco, Sevilla', 968);
INSERT INTO control_point VALUES (1081, 0, 2, '2019-01-09 10:45:00', 10, 'Felipe II, Sevilla', 968);
INSERT INTO control_point VALUES (1082, 0, 3, '2019-01-09 10:50:00', 15, 'Los Arcos, Avenida de Andalucía, Sevilla', 968);
INSERT INTO control_point VALUES (1083, 0, 0, '2019-03-23 08:11:00', 0, 'Plaza del Duque de la Victoria, Sevilla', 969);
INSERT INTO control_point VALUES (1084, 0, 1, '2019-03-23 08:16:00', 5, 'Calle Jilguero, Sevilla', 969);
INSERT INTO control_point VALUES (1085, 0, 2, '2019-03-23 08:21:00', 10, 'Avenida de El Greco, Sevilla', 969);
INSERT INTO control_point VALUES (1086, 0, 3, '2019-03-23 08:26:00', 15, 'Avenida del Cid, Sevilla', 969);
INSERT INTO control_point VALUES (1087, 0, 0, '2019-02-26 19:33:00', 0, 'El Porvenir, Sevilla', 970);
INSERT INTO control_point VALUES (1088, 0, 1, '2019-02-26 19:38:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 970);
INSERT INTO control_point VALUES (1089, 0, 2, '2019-02-26 19:43:00', 10, 'Los Arcos, Avenida de Andalucía, Sevilla', 970);
INSERT INTO control_point VALUES (1090, 0, 0, '2019-03-09 15:09:00', 0, 'Felipe II, Sevilla', 971);
INSERT INTO control_point VALUES (1091, 0, 1, '2019-03-09 15:14:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 971);
INSERT INTO control_point VALUES (1092, 0, 2, '2019-03-09 15:19:00', 10, 'Plaza del Duque de la Victoria, Sevilla', 971);
INSERT INTO control_point VALUES (1093, 0, 0, '2019-05-26 20:15:00', 0, 'Avenida de El Greco, Sevilla', 972);
INSERT INTO control_point VALUES (1094, 0, 1, '2019-05-26 20:20:00', 5, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 972);
INSERT INTO control_point VALUES (1095, 0, 2, '2019-05-26 20:25:00', 10, 'Torre Sevilla, Sevilla', 972);
INSERT INTO control_point VALUES (1096, 0, 0, '2019-04-13 14:36:00', 0, 'Calle Jilguero, Sevilla', 973);
INSERT INTO control_point VALUES (1097, 0, 1, '2019-04-13 14:41:00', 5, 'Camas, Sevilla', 973);
INSERT INTO control_point VALUES (1098, 0, 2, '2019-04-13 14:46:00', 10, 'Felipe II, Sevilla', 973);
INSERT INTO control_point VALUES (1099, 0, 0, '2019-03-24 18:26:00', 0, 'Plaza del Duque de la Victoria, Sevilla', 974);
INSERT INTO control_point VALUES (1100, 0, 1, '2019-03-24 18:31:00', 5, 'Calle Jilguero, Sevilla', 974);
INSERT INTO control_point VALUES (1101, 0, 0, '2019-06-01 15:37:00', 0, 'Camas, Sevilla', 975);
INSERT INTO control_point VALUES (1102, 0, 1, '2019-06-01 15:42:00', 5, 'Felipe II, Sevilla', 975);
INSERT INTO control_point VALUES (1103, 0, 2, '2019-06-01 15:47:00', 10, 'Montequinto, Sevilla', 975);
INSERT INTO control_point VALUES (1104, 0, 0, '2019-06-13 10:40:00', 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 976);
INSERT INTO control_point VALUES (1105, 0, 1, '2019-06-13 10:45:00', 5, 'Torre Sevilla, Sevilla', 976);
INSERT INTO control_point VALUES (1106, 0, 2, '2019-06-13 10:50:00', 10, 'Montequinto, Sevilla', 976);
INSERT INTO control_point VALUES (1107, 0, 0, '2019-05-05 09:40:00', 0, 'Macarena, Sevilla', 977);
INSERT INTO control_point VALUES (1108, 0, 1, '2019-05-05 09:45:00', 5, 'Montequinto, Sevilla', 977);
INSERT INTO control_point VALUES (1109, 0, 2, '2019-05-05 09:50:00', 10, 'Avenida de El Greco, Sevilla', 977);
INSERT INTO control_point VALUES (1110, 0, 0, '2019-04-08 09:36:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 978);
INSERT INTO control_point VALUES (1111, 0, 1, '2019-04-08 09:41:00', 5, 'Gran Plaza, Sevilla', 978);
INSERT INTO control_point VALUES (1112, 0, 0, '2019-04-24 08:31:00', 0, 'San Bernardo, Sevilla', 979);
INSERT INTO control_point VALUES (1113, 0, 1, '2019-04-24 08:36:00', 5, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 979);
INSERT INTO control_point VALUES (1114, 0, 2, '2019-04-24 08:41:00', 10, 'Los Arcos, Avenida de Andalucía, Sevilla', 979);
INSERT INTO control_point VALUES (1115, 0, 3, '2019-04-24 08:46:00', 15, 'Felipe II, Sevilla', 979);
INSERT INTO control_point VALUES (1116, 0, 0, '2019-04-14 13:37:00', 0, 'Montequinto, Sevilla', 980);
INSERT INTO control_point VALUES (1117, 0, 1, '2019-04-14 13:42:00', 5, 'Avenida del Cid, Sevilla', 980);
INSERT INTO control_point VALUES (1118, 0, 2, '2019-04-14 13:47:00', 10, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 980);
INSERT INTO control_point VALUES (1119, 0, 0, '2019-01-04 19:27:00', 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 981);
INSERT INTO control_point VALUES (1120, 0, 1, '2019-01-04 19:32:00', 5, 'San Bernardo, Sevilla', 981);
INSERT INTO control_point VALUES (1121, 0, 2, '2019-01-04 19:37:00', 10, 'Los Arcos, Avenida de Andalucía, Sevilla', 981);
INSERT INTO control_point VALUES (1122, 0, 3, '2019-01-04 19:42:00', 15, 'Torre Sevilla, Sevilla', 981);
INSERT INTO control_point VALUES (1123, 0, 0, '2019-02-16 09:16:00', 0, 'San Bernardo, Sevilla', 982);
INSERT INTO control_point VALUES (1124, 0, 1, '2019-02-16 09:21:00', 5, 'Macarena, Sevilla', 982);
INSERT INTO control_point VALUES (1125, 0, 0, '2019-05-27 18:18:00', 0, 'Camas, Sevilla', 983);
INSERT INTO control_point VALUES (1126, 0, 1, '2019-05-27 18:23:00', 5, 'Felipe II, Sevilla', 983);
INSERT INTO control_point VALUES (1127, 0, 2, '2019-05-27 18:28:00', 10, 'Avenida del Cid, Sevilla', 983);
INSERT INTO control_point VALUES (1128, 0, 3, '2019-05-27 18:33:00', 15, 'Sevilla Este, Sevilla', 983);
INSERT INTO control_point VALUES (1129, 0, 0, '2019-03-20 15:23:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 984);
INSERT INTO control_point VALUES (1130, 0, 1, '2019-03-20 15:28:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 984);
INSERT INTO control_point VALUES (1131, 0, 2, '2019-03-20 15:33:00', 10, 'Avenida de El Greco, Sevilla', 984);
INSERT INTO control_point VALUES (1132, 0, 0, '2019-02-14 13:15:00', 0, 'Avenida de El Greco, Sevilla', 985);
INSERT INTO control_point VALUES (1133, 0, 1, '2019-02-14 13:20:00', 5, 'Camas, Sevilla', 985);
INSERT INTO control_point VALUES (1134, 0, 2, '2019-02-14 13:25:00', 10, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 985);
INSERT INTO control_point VALUES (1135, 0, 3, '2019-02-14 13:30:00', 15, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 985);
INSERT INTO control_point VALUES (1136, 0, 0, '2019-02-17 08:29:00', 0, 'Sevilla Este, Sevilla', 986);
INSERT INTO control_point VALUES (1137, 0, 1, '2019-02-17 08:34:00', 5, 'El Porvenir, Sevilla', 986);
INSERT INTO control_point VALUES (1138, 0, 2, '2019-02-17 08:39:00', 10, 'San Bernardo, Sevilla', 986);
INSERT INTO control_point VALUES (1139, 0, 0, '2019-06-09 17:13:00', 0, 'Torre Sevilla, Sevilla', 987);
INSERT INTO control_point VALUES (1140, 0, 1, '2019-06-09 17:18:00', 5, 'Macarena, Sevilla', 987);
INSERT INTO control_point VALUES (1141, 0, 2, '2019-06-09 17:23:00', 10, 'Plaza del Duque de la Victoria, Sevilla', 987);
INSERT INTO control_point VALUES (1142, 0, 3, '2019-06-09 17:28:00', 15, 'Camas, Sevilla', 987);
INSERT INTO control_point VALUES (1143, 0, 0, '2019-06-18 19:27:00', 0, 'Montequinto, Sevilla', 988);
INSERT INTO control_point VALUES (1144, 0, 1, '2019-06-18 19:32:00', 5, 'San Bernardo, Sevilla', 988);
INSERT INTO control_point VALUES (1145, 0, 2, '2019-06-18 19:37:00', 10, 'Avenida de El Greco, Sevilla', 988);
INSERT INTO control_point VALUES (1146, 0, 3, '2019-06-18 19:42:00', 15, 'Calle Jilguero, Sevilla', 988);
INSERT INTO control_point VALUES (1147, 0, 0, '2019-04-04 07:26:00', 0, 'Sevilla Este, Sevilla', 989);
INSERT INTO control_point VALUES (1148, 0, 1, '2019-04-04 07:31:00', 5, 'San Bernardo, Sevilla', 989);
INSERT INTO control_point VALUES (1149, 0, 0, '2019-06-17 12:00:00', 0, 'Avenida del Cid, Sevilla', 990);
INSERT INTO control_point VALUES (1150, 0, 1, '2019-06-17 12:05:00', 5, 'Gran Plaza, Sevilla', 990);
INSERT INTO control_point VALUES (1151, 0, 2, '2019-06-17 12:10:00', 10, 'Montequinto, Sevilla', 990);
INSERT INTO control_point VALUES (1152, 0, 3, '2019-06-17 12:15:00', 15, 'Camas, Sevilla', 990);
INSERT INTO control_point VALUES (1153, 0, 0, '2019-02-28 07:31:00', 0, 'San Bernardo, Sevilla', 991);
INSERT INTO control_point VALUES (1154, 0, 1, '2019-02-28 07:36:00', 5, 'Montequinto, Sevilla', 991);
INSERT INTO control_point VALUES (1155, 0, 2, '2019-02-28 07:41:00', 10, 'Gran Plaza, Sevilla', 991);
INSERT INTO control_point VALUES (1156, 0, 0, '2019-06-18 14:03:00', 0, 'Torre Sevilla, Sevilla', 992);
INSERT INTO control_point VALUES (1157, 0, 1, '2019-06-18 14:08:00', 5, 'El Porvenir, Sevilla', 992);
INSERT INTO control_point VALUES (1158, 0, 0, '2019-02-15 12:27:00', 0, 'Camas, Sevilla', 993);
INSERT INTO control_point VALUES (1159, 0, 1, '2019-02-15 12:32:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 993);
INSERT INTO control_point VALUES (1160, 0, 0, '2019-06-05 13:07:00', 0, 'Gran Plaza, Sevilla', 994);
INSERT INTO control_point VALUES (1161, 0, 1, '2019-06-05 13:12:00', 5, 'Montequinto, Sevilla', 994);
INSERT INTO control_point VALUES (1162, 0, 0, '2019-04-02 17:17:00', 0, 'Montequinto, Sevilla', 995);
INSERT INTO control_point VALUES (1163, 0, 1, '2019-04-02 17:22:00', 5, 'Sevilla Este, Sevilla', 995);
INSERT INTO control_point VALUES (1164, 0, 0, '2019-04-17 18:28:00', 0, 'Calle Jilguero, Sevilla', 996);
INSERT INTO control_point VALUES (1165, 0, 1, '2019-04-17 18:33:00', 5, 'Torre Sevilla, Sevilla', 996);
INSERT INTO control_point VALUES (1166, 0, 2, '2019-04-17 18:38:00', 10, 'Felipe II, Sevilla', 996);
INSERT INTO control_point VALUES (1167, 0, 3, '2019-04-17 18:43:00', 15, 'Avenida del Cid, Sevilla', 996);
INSERT INTO control_point VALUES (1168, 0, 0, '2019-03-11 11:07:00', 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 997);
INSERT INTO control_point VALUES (1169, 0, 1, '2019-03-11 11:12:00', 5, 'Avenida de El Greco, Sevilla', 997);
INSERT INTO control_point VALUES (1170, 0, 2, '2019-03-11 11:17:00', 10, 'Montequinto, Sevilla', 997);
INSERT INTO control_point VALUES (1171, 0, 3, '2019-03-11 11:22:00', 15, 'Gran Plaza, Sevilla', 997);
INSERT INTO control_point VALUES (1172, 0, 0, '2019-05-04 19:10:00', 0, 'Torre Sevilla, Sevilla', 998);
INSERT INTO control_point VALUES (1173, 0, 1, '2019-05-04 19:15:00', 5, 'Los Arcos, Avenida de Andalucía, Sevilla', 998);
INSERT INTO control_point VALUES (1174, 0, 2, '2019-05-04 19:20:00', 10, 'Montequinto, Sevilla', 998);
INSERT INTO control_point VALUES (1175, 0, 0, '2019-03-18 08:16:00', 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 999);
INSERT INTO control_point VALUES (1176, 0, 1, '2019-03-18 08:21:00', 5, 'Camas, Sevilla', 999);
INSERT INTO control_point VALUES (1177, 0, 2, '2019-03-18 08:26:00', 10, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 999);
INSERT INTO control_point VALUES (1178, 0, 0, '2019-01-20 18:17:00', 0, 'Felipe II, Sevilla', 1000);
INSERT INTO control_point VALUES (1179, 0, 1, '2019-01-20 18:22:00', 5, 'Macarena, Sevilla', 1000);
INSERT INTO control_point VALUES (1180, 0, 2, '2019-01-20 18:27:00', 10, 'Avenida de El Greco, Sevilla', 1000);
INSERT INTO control_point VALUES (1181, 0, 3, '2019-01-20 18:32:00', 15, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1000);
INSERT INTO control_point VALUES (1182, 0, 0, '2019-04-28 08:06:00', 0, 'Sevilla Este, Sevilla', 1001);
INSERT INTO control_point VALUES (1183, 0, 1, '2019-04-28 08:11:00', 5, 'Gran Plaza, Sevilla', 1001);
INSERT INTO control_point VALUES (1184, 0, 2, '2019-04-28 08:16:00', 10, 'Calle Jilguero, Sevilla', 1001);
INSERT INTO control_point VALUES (1185, 0, 0, '2019-02-06 15:29:00', 0, 'Torre Sevilla, Sevilla', 1002);
INSERT INTO control_point VALUES (1186, 0, 1, '2019-02-06 15:34:00', 5, 'Plaza del Duque de la Victoria, Sevilla', 1002);
INSERT INTO control_point VALUES (1187, 0, 0, '2019-03-02 19:26:00', 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1003);
INSERT INTO control_point VALUES (1188, 0, 1, '2019-03-02 19:31:00', 5, 'Macarena, Sevilla', 1003);
INSERT INTO control_point VALUES (1189, 0, 2, '2019-03-02 19:36:00', 10, 'Felipe II, Sevilla', 1003);
INSERT INTO control_point VALUES (1190, 0, 0, '2019-02-25 19:07:00', 0, 'Avenida del Cid, Sevilla', 1004);
INSERT INTO control_point VALUES (1191, 0, 1, '2019-02-25 19:12:00', 5, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1004);
INSERT INTO control_point VALUES (1192, 0, 0, '2019-01-02 17:05:00', 0, 'Montequinto, Sevilla', 1005);
INSERT INTO control_point VALUES (1193, 0, 1, '2019-01-02 17:10:00', 5, 'Sevilla Este, Sevilla', 1005);
INSERT INTO control_point VALUES (1194, 0, 2, '2019-01-02 17:15:00', 10, 'Plaza del Duque de la Victoria, Sevilla', 1005);
INSERT INTO control_point VALUES (1195, 0, 0, '2019-01-21 07:08:00', 0, 'Sevilla Este, Sevilla', 1006);
INSERT INTO control_point VALUES (1196, 0, 1, '2019-01-21 07:13:00', 5, 'Gran Plaza, Sevilla', 1006);
INSERT INTO control_point VALUES (1197, 0, 2, '2019-01-21 07:18:00', 10, 'Macarena, Sevilla', 1006);
INSERT INTO control_point VALUES (1198, 0, 3, '2019-01-21 07:23:00', 15, 'Plaza del Duque de la Victoria, Sevilla', 1006);
INSERT INTO control_point VALUES (1199, 0, 0, '2019-03-12 11:39:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 1007);
INSERT INTO control_point VALUES (1200, 0, 1, '2019-03-12 11:44:00', 5, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1007);
INSERT INTO control_point VALUES (1201, 0, 2, '2019-03-12 11:49:00', 10, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1007);
INSERT INTO control_point VALUES (1202, 0, 0, '2019-05-10 20:39:00', 0, 'Camas, Sevilla', 1008);
INSERT INTO control_point VALUES (1203, 0, 1, '2019-05-10 20:44:00', 5, 'Los Arcos, Avenida de Andalucía, Sevilla', 1008);
INSERT INTO control_point VALUES (1204, 0, 2, '2019-05-10 20:49:00', 10, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1008);
INSERT INTO control_point VALUES (1205, 0, 3, '2019-05-10 20:54:00', 15, 'Montequinto, Sevilla', 1008);
INSERT INTO control_point VALUES (1206, 0, 0, '2019-04-04 15:29:00', 0, 'Macarena, Sevilla', 1009);
INSERT INTO control_point VALUES (1207, 0, 1, '2019-04-04 15:34:00', 5, 'Avenida de El Greco, Sevilla', 1009);
INSERT INTO control_point VALUES (1208, 0, 2, '2019-04-04 15:39:00', 10, 'San Bernardo, Sevilla', 1009);
INSERT INTO control_point VALUES (1209, 0, 0, '2019-05-25 09:25:00', 0, 'Felipe II, Sevilla', 1010);
INSERT INTO control_point VALUES (1210, 0, 1, '2019-05-25 09:30:00', 5, 'El Porvenir, Sevilla', 1010);
INSERT INTO control_point VALUES (1211, 0, 0, '2019-05-06 19:02:00', 0, 'San Bernardo, Sevilla', 1011);
INSERT INTO control_point VALUES (1212, 0, 1, '2019-05-06 19:07:00', 5, 'El Porvenir, Sevilla', 1011);
INSERT INTO control_point VALUES (1213, 0, 0, '2019-02-02 18:27:00', 0, 'Camas, Sevilla', 1012);
INSERT INTO control_point VALUES (1214, 0, 1, '2019-02-02 18:32:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1012);
INSERT INTO control_point VALUES (1215, 0, 0, '2019-06-27 12:28:00', 0, 'Calle Jilguero, Sevilla', 1013);
INSERT INTO control_point VALUES (1216, 0, 1, '2019-06-27 12:33:00', 5, 'Avenida de El Greco, Sevilla', 1013);
INSERT INTO control_point VALUES (1217, 0, 0, '2019-02-11 14:20:00', 0, 'Gran Plaza, Sevilla', 1014);
INSERT INTO control_point VALUES (1218, 0, 1, '2019-02-11 14:25:00', 5, 'Montequinto, Sevilla', 1014);
INSERT INTO control_point VALUES (1219, 0, 2, '2019-02-11 14:30:00', 10, 'Felipe II, Sevilla', 1014);
INSERT INTO control_point VALUES (1220, 0, 0, '2019-06-24 06:06:00', 0, 'Camas, Sevilla', 1015);
INSERT INTO control_point VALUES (1221, 0, 1, '2019-06-24 06:11:00', 5, 'Sevilla Este, Sevilla', 1015);
INSERT INTO control_point VALUES (1222, 0, 2, '2019-06-24 06:16:00', 10, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1015);
INSERT INTO control_point VALUES (1223, 0, 3, '2019-06-24 06:21:00', 15, 'Calle Jilguero, Sevilla', 1015);
INSERT INTO control_point VALUES (1224, 0, 0, '2019-03-22 19:11:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 1016);
INSERT INTO control_point VALUES (1225, 0, 1, '2019-03-22 19:16:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1016);
INSERT INTO control_point VALUES (1226, 0, 0, '2019-01-24 14:00:00', 0, 'Montequinto, Sevilla', 1017);
INSERT INTO control_point VALUES (1227, 0, 1, '2019-01-24 14:05:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1017);
INSERT INTO control_point VALUES (1228, 0, 2, '2019-01-24 14:10:00', 10, 'Macarena, Sevilla', 1017);
INSERT INTO control_point VALUES (1229, 0, 0, '2019-01-19 11:04:00', 0, 'Torre Sevilla, Sevilla', 1018);
INSERT INTO control_point VALUES (1230, 0, 1, '2019-01-19 11:09:00', 5, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1018);
INSERT INTO control_point VALUES (1231, 0, 0, '2019-04-18 15:40:00', 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1019);
INSERT INTO control_point VALUES (1232, 0, 1, '2019-04-18 15:45:00', 5, 'San Bernardo, Sevilla', 1019);
INSERT INTO control_point VALUES (1233, 0, 2, '2019-04-18 15:50:00', 10, 'Gran Plaza, Sevilla', 1019);
INSERT INTO control_point VALUES (1234, 0, 0, '2019-05-22 18:29:00', 0, 'El Porvenir, Sevilla', 1020);
INSERT INTO control_point VALUES (1235, 0, 1, '2019-05-22 18:34:00', 5, 'Avenida del Cid, Sevilla', 1020);
INSERT INTO control_point VALUES (1236, 0, 0, '2019-06-10 20:02:00', 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1021);
INSERT INTO control_point VALUES (1237, 0, 1, '2019-06-10 20:07:00', 5, 'Los Arcos, Avenida de Andalucía, Sevilla', 1021);
INSERT INTO control_point VALUES (1238, 0, 2, '2019-06-10 20:12:00', 10, 'El Porvenir, Sevilla', 1021);
INSERT INTO control_point VALUES (1239, 0, 3, '2019-06-10 20:17:00', 15, 'Calle Jilguero, Sevilla', 1021);
INSERT INTO control_point VALUES (1240, 0, 0, '2019-06-27 15:29:00', 0, 'Calle Jilguero, Sevilla', 1022);
INSERT INTO control_point VALUES (1241, 0, 1, '2019-06-27 15:34:00', 5, 'Avenida del Cid, Sevilla', 1022);
INSERT INTO control_point VALUES (1242, 0, 2, '2019-06-27 15:39:00', 10, 'Plaza del Duque de la Victoria, Sevilla', 1022);
INSERT INTO control_point VALUES (1243, 0, 0, '2019-03-15 19:00:00', 0, 'Montequinto, Sevilla', 1023);
INSERT INTO control_point VALUES (1244, 0, 1, '2019-03-15 19:05:00', 5, 'Calle Jilguero, Sevilla', 1023);
INSERT INTO control_point VALUES (1245, 0, 2, '2019-03-15 19:10:00', 10, 'Felipe II, Sevilla', 1023);
INSERT INTO control_point VALUES (1246, 0, 3, '2019-03-15 19:15:00', 15, 'Macarena, Sevilla', 1023);
INSERT INTO control_point VALUES (1247, 0, 0, '2019-01-18 18:21:00', 0, 'Torre Sevilla, Sevilla', 1024);
INSERT INTO control_point VALUES (1248, 0, 1, '2019-01-18 18:26:00', 5, 'Camas, Sevilla', 1024);
INSERT INTO control_point VALUES (1249, 0, 2, '2019-01-18 18:31:00', 10, 'Montequinto, Sevilla', 1024);
INSERT INTO control_point VALUES (1250, 0, 0, '2019-03-22 12:38:00', 0, 'Plaza del Duque de la Victoria, Sevilla', 1025);
INSERT INTO control_point VALUES (1251, 0, 1, '2019-03-22 12:43:00', 5, 'Sevilla Este, Sevilla', 1025);
INSERT INTO control_point VALUES (1252, 0, 2, '2019-03-22 12:48:00', 10, 'Avenida de El Greco, Sevilla', 1025);
INSERT INTO control_point VALUES (1253, 0, 0, '2019-01-03 20:24:00', 0, 'Avenida del Cid, Sevilla', 1026);
INSERT INTO control_point VALUES (1254, 0, 1, '2019-01-03 20:29:00', 5, 'El Porvenir, Sevilla', 1026);
INSERT INTO control_point VALUES (1255, 0, 2, '2019-01-03 20:34:00', 10, 'Torre Sevilla, Sevilla', 1026);
INSERT INTO control_point VALUES (1256, 0, 0, '2019-02-23 11:29:00', 0, 'Plaza del Duque de la Victoria, Sevilla', 1027);
INSERT INTO control_point VALUES (1257, 0, 1, '2019-02-23 11:34:00', 5, 'Calle Jilguero, Sevilla', 1027);
INSERT INTO control_point VALUES (1258, 0, 2, '2019-02-23 11:39:00', 10, 'El Porvenir, Sevilla', 1027);
INSERT INTO control_point VALUES (1259, 0, 3, '2019-02-23 11:44:00', 15, 'Gran Plaza, Sevilla', 1027);
INSERT INTO control_point VALUES (1260, 0, 0, '2019-01-05 18:22:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 1028);
INSERT INTO control_point VALUES (1261, 0, 1, '2019-01-05 18:27:00', 5, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1028);
INSERT INTO control_point VALUES (1262, 0, 2, '2019-01-05 18:32:00', 10, 'Avenida de El Greco, Sevilla', 1028);
INSERT INTO control_point VALUES (1263, 0, 0, '2019-06-01 12:27:00', 0, 'Sevilla Este, Sevilla', 1029);
INSERT INTO control_point VALUES (1264, 0, 1, '2019-06-01 12:32:00', 5, 'San Bernardo, Sevilla', 1029);
INSERT INTO control_point VALUES (1265, 0, 0, '2019-01-27 10:28:00', 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1030);
INSERT INTO control_point VALUES (1266, 0, 1, '2019-01-27 10:33:00', 5, 'Avenida de El Greco, Sevilla', 1030);
INSERT INTO control_point VALUES (1267, 0, 0, '2019-01-05 15:01:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 1031);
INSERT INTO control_point VALUES (1268, 0, 1, '2019-01-05 15:06:00', 5, 'Calle Jilguero, Sevilla', 1031);
INSERT INTO control_point VALUES (1269, 0, 2, '2019-01-05 15:11:00', 10, 'Avenida del Cid, Sevilla', 1031);
INSERT INTO control_point VALUES (1270, 0, 3, '2019-01-05 15:16:00', 15, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1031);
INSERT INTO control_point VALUES (1271, 0, 0, '2019-03-24 15:37:00', 0, 'Gran Plaza, Sevilla', 1032);
INSERT INTO control_point VALUES (1272, 0, 1, '2019-03-24 15:42:00', 5, 'Montequinto, Sevilla', 1032);
INSERT INTO control_point VALUES (1273, 0, 2, '2019-03-24 15:47:00', 10, 'Camas, Sevilla', 1032);
INSERT INTO control_point VALUES (1274, 0, 0, '2019-05-23 10:26:00', 0, 'Los Arcos, Avenida de Andalucía, Sevilla', 1033);
INSERT INTO control_point VALUES (1275, 0, 1, '2019-05-23 10:31:00', 5, 'San Bernardo, Sevilla', 1033);
INSERT INTO control_point VALUES (1276, 0, 2, '2019-05-23 10:36:00', 10, 'Torre Sevilla, Sevilla', 1033);
INSERT INTO control_point VALUES (1277, 0, 0, '2019-02-28 12:32:00', 0, 'El Porvenir, Sevilla', 1034);
INSERT INTO control_point VALUES (1278, 0, 1, '2019-02-28 12:37:00', 5, 'Los Arcos, Avenida de Andalucía, Sevilla', 1034);
INSERT INTO control_point VALUES (1279, 0, 0, '2019-05-06 12:31:00', 0, 'Montequinto, Sevilla', 1035);
INSERT INTO control_point VALUES (1280, 0, 1, '2019-05-06 12:36:00', 5, 'Avenida del Cid, Sevilla', 1035);
INSERT INTO control_point VALUES (1281, 0, 2, '2019-05-06 12:41:00', 10, 'Gran Plaza, Sevilla', 1035);
INSERT INTO control_point VALUES (1282, 0, 0, '2019-02-23 12:12:00', 0, 'San Bernardo, Sevilla', 1036);
INSERT INTO control_point VALUES (1283, 0, 1, '2019-02-23 12:17:00', 5, 'El Porvenir, Sevilla', 1036);
INSERT INTO control_point VALUES (1284, 0, 0, '2019-05-07 10:33:00', 0, 'Montequinto, Sevilla', 1037);
INSERT INTO control_point VALUES (1285, 0, 1, '2019-05-07 10:38:00', 5, 'Los Arcos, Avenida de Andalucía, Sevilla', 1037);
INSERT INTO control_point VALUES (1286, 0, 2, '2019-05-07 10:43:00', 10, 'Avenida del Cid, Sevilla', 1037);
INSERT INTO control_point VALUES (1287, 0, 3, '2019-05-07 10:48:00', 15, 'Camas, Sevilla', 1037);


--
-- TOC entry 2026 (class 0 OID 49542)
-- Dependencies: 172
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO driver VALUES (825, 0, 'Seville', 'Spain', 0, 'Alma', NULL, '640405537', 'Jiménez', 725, 'ES3095323518908743580639', 100, true, 294, 6, 2019, '4622016636569655', false, false, true);
INSERT INTO driver VALUES (826, 0, 'Seville', 'Spain', 0, 'Alberto', NULL, '654144610', 'Rodríguez', 726, 'ES2238046449658513911483', 100, false, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (827, 0, 'Seville', 'Spain', 0, 'Maia', NULL, '620277274', 'Carmona', 727, 'ES2862341402789352661409', 100, false, 294, 6, 2019, '4622016636569655', true, true, true);
INSERT INTO driver VALUES (828, 0, 'Seville', 'Spain', 0, 'Triana', NULL, '632493243', 'Ferrer', 728, 'ES4246085616439102150472', 100, true, 294, 6, 2019, '4622016636569655', false, false, true);
INSERT INTO driver VALUES (829, 0, 'Seville', 'Spain', 0, 'Ángel', NULL, '615856230', 'Campos', 729, 'ES5644708054368607765159', 100, true, 294, 6, 2019, '4622016636569655', true, true, true);
INSERT INTO driver VALUES (830, 0, 'Seville', 'Spain', 0, 'Jimena', NULL, '682245974', 'Molina', 730, 'ES8127093448377615421228', 100, false, 294, 6, 2019, '4622016636569655', false, true, true);
INSERT INTO driver VALUES (831, 0, 'Seville', 'Spain', 0, 'Gael', NULL, '617405915', 'Lorenzo', 731, 'ES1193184272139599841029', 100, false, 294, 6, 2019, '4622016636569655', true, true, true);
INSERT INTO driver VALUES (832, 0, 'Seville', 'Spain', 0, 'Saúl', NULL, '628417876', 'Carmona', 732, 'ES2786160292029640015137', 100, false, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (833, 0, 'Seville', 'Spain', 0, 'Candela', NULL, '649712053', 'Ferrer', 733, 'ES8572433980384208600769', 100, true, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (834, 0, 'Seville', 'Spain', 0, 'Alexia', NULL, '663074604', 'Pérez', 734, 'ES1367560513161742701021', 100, false, 294, 6, 2019, '4622016636569655', true, false, false);
INSERT INTO driver VALUES (835, 0, 'Seville', 'Spain', 0, 'Saúl', NULL, '621948021', 'Benítez', 735, 'ES6941738794341152111226', 100, true, 294, 6, 2019, '4622016636569655', false, false, true);
INSERT INTO driver VALUES (836, 0, 'Seville', 'Spain', 0, 'Aurora', NULL, '672243159', 'Ramos', 736, 'ES9105631265869488783950', 100, false, 294, 6, 2019, '4622016636569655', false, true, true);
INSERT INTO driver VALUES (837, 0, 'Seville', 'Spain', 0, 'Clara', NULL, '639206497', 'Pérez', 737, 'ES1039140056872471680236', 100, false, 294, 6, 2019, '4622016636569655', true, false, true);
INSERT INTO driver VALUES (838, 0, 'Seville', 'Spain', 0, 'Ángela', NULL, '693691988', 'Soler', 738, 'ES1949758627126775274669', 100, false, 294, 6, 2019, '4622016636569655', false, false, true);
INSERT INTO driver VALUES (839, 0, 'Seville', 'Spain', 0, 'Ángel', NULL, '668692456', 'Jiménez', 739, 'ES3975201429538546532203', 100, true, 294, 6, 2019, '4622016636569655', false, false, true);
INSERT INTO driver VALUES (840, 0, 'Seville', 'Spain', 0, 'Mar', NULL, '643205621', 'Vargas', 740, 'ES8885163799705155611846', 100, false, 294, 6, 2019, '4622016636569655', true, true, true);
INSERT INTO driver VALUES (841, 0, 'Seville', 'Spain', 0, 'Luna', NULL, '679106462', 'Duran', 741, 'ES3517285968963317247596', 100, true, 294, 6, 2019, '4622016636569655', true, false, true);
INSERT INTO driver VALUES (842, 0, 'Seville', 'Spain', 0, 'Candela', NULL, '614959833', 'Ortega', 742, 'ES2123145534293376200582', 100, false, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (843, 0, 'Seville', 'Spain', 0, 'Jaime', NULL, '617739870', 'Molina', 743, 'ES8948368148478622943493', 100, true, 294, 6, 2019, '4622016636569655', true, false, true);
INSERT INTO driver VALUES (844, 0, 'Seville', 'Spain', 0, 'Andrés', NULL, '624515712', 'Mora', 744, 'ES6118729579282737609306', 100, true, 294, 6, 2019, '4622016636569655', true, false, true);
INSERT INTO driver VALUES (845, 0, 'Seville', 'Spain', 0, 'Manuel', NULL, '665266728', 'Cortes', 745, 'ES5566254783292735403338', 100, true, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (846, 0, 'Seville', 'Spain', 0, 'Laia', NULL, '625762777', 'Castillo', 746, 'ES3415590447380463555890', 100, true, 294, 6, 2019, '4622016636569655', false, false, true);
INSERT INTO driver VALUES (847, 0, 'Seville', 'Spain', 0, 'Chloe', NULL, '610191303', 'Santiago', 747, 'ES3966006178463806289841', 100, true, 294, 6, 2019, '4622016636569655', true, true, true);
INSERT INTO driver VALUES (848, 0, 'Seville', 'Spain', 0, 'Antonio', NULL, '661232658', 'García', 748, 'ES6843803865028953109309', 100, true, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (849, 0, 'Seville', 'Spain', 0, 'Cayetana', NULL, '646132882', 'Jiménez', 749, 'ES5563089114520855144651', 100, false, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (850, 0, 'Seville', 'Spain', 0, 'Luca', NULL, '689099192', 'Álvarez', 750, 'ES8147502254498851506319', 100, false, 294, 6, 2019, '4622016636569655', true, false, false);
INSERT INTO driver VALUES (851, 0, 'Seville', 'Spain', 0, 'Isabella', NULL, '670924771', 'Sanz', 751, 'ES9999886938132827166281', 100, false, 294, 6, 2019, '4622016636569655', false, true, true);
INSERT INTO driver VALUES (852, 0, 'Seville', 'Spain', 0, 'Ian', NULL, '682692773', 'Caballero', 752, 'ES3739329214052657067428', 100, true, 294, 6, 2019, '4622016636569655', true, true, true);
INSERT INTO driver VALUES (853, 0, 'Seville', 'Spain', 0, 'Nadia', NULL, '690154637', 'Ibáñez', 753, 'ES4820611356914699359938', 100, false, 294, 6, 2019, '4622016636569655', true, true, false);
INSERT INTO driver VALUES (854, 0, 'Seville', 'Spain', 0, 'Ariadna', NULL, '625610737', 'Flores', 754, 'ES1759724345784718852778', 100, true, 294, 6, 2019, '4622016636569655', false, false, false);


--
-- TOC entry 2027 (class 0 OID 49550)
-- Dependencies: 173
-- Data for Name: folder; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2028 (class 0 OID 49555)
-- Dependencies: 174
-- Data for Name: folder_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2036 (class 0 OID 49696)
-- Dependencies: 182
-- Data for Name: hibernate_sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO hibernate_sequences VALUES ('domain_entity', 1);


--
-- TOC entry 2029 (class 0 OID 49558)
-- Dependencies: 175
-- Data for Name: letter; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2030 (class 0 OID 49566)
-- Dependencies: 176
-- Data for Name: passenger; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO passenger VALUES (855, 0, 'Seville', 'Spain', 0, 'Abraham', NULL, '654434637', 'Álvarez', 755, 'ES8408055697406784917419', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (856, 0, 'Seville', 'Spain', 0, 'Thiago', NULL, '634306984', 'Vázquez', 756, 'ES5229187690566001317133', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (857, 0, 'Seville', 'Spain', 0, 'Lucas', NULL, '667871572', 'Sanz', 757, 'ES5157936338738300694651', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (858, 0, 'Seville', 'Spain', 0, 'Enzo', NULL, '664045088', 'Serrano', 758, 'ES5053740938509372853851', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (859, 0, 'Seville', 'Spain', 0, 'Chloe', NULL, '642362535', 'Sánchez', 759, 'ES5359159482982257544284', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (860, 0, 'Seville', 'Spain', 0, 'Vega', NULL, '619983943', 'López', 760, 'ES8031237238497234716456', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (861, 0, 'Seville', 'Spain', 0, 'Triana', NULL, '690271953', 'Méndez', 761, 'ES7679489816979647764811', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (862, 0, 'Seville', 'Spain', 0, 'India', NULL, '672870813', 'Hidalgo', 762, 'ES1039192786104453942944', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (863, 0, 'Seville', 'Spain', 0, 'Alicia', NULL, '692694781', 'Ramos', 763, 'ES2886479049663571524874', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (864, 0, 'Seville', 'Spain', 0, 'Mireia', NULL, '690026300', 'Soto', 764, 'ES1140855348904763691732', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (865, 0, 'Seville', 'Spain', 0, 'Ismael', NULL, '625232542', 'Vargas', 765, 'ES1524843636665199153404', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (866, 0, 'Seville', 'Spain', 0, 'María', NULL, '699548467', 'Blanco', 766, 'ES5412231591667313653660', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (867, 0, 'Seville', 'Spain', 0, 'Daniela', NULL, '640335617', 'Campos', 767, 'ES8751565940037634933044', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (868, 0, 'Seville', 'Spain', 0, 'Jimena', NULL, '678722497', 'Castro', 768, 'ES1349159907772641535844', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (869, 0, 'Seville', 'Spain', 0, 'Sofía', NULL, '626042836', 'Márquez', 769, 'ES2257185910988459399214', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (870, 0, 'Seville', 'Spain', 0, 'Alejandra', NULL, '652787527', 'Herrero', 770, 'ES7718515175075324863660', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (871, 0, 'Seville', 'Spain', 0, 'Carla', NULL, '695840413', 'López', 771, 'ES6778982499699376721894', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (872, 0, 'Seville', 'Spain', 0, 'Luis', NULL, '683876488', 'Diaz', 772, 'ES1558388485805436644022', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (873, 0, 'Seville', 'Spain', 0, 'Carlota', NULL, '662988212', 'Gutiérrez', 773, 'ES1690320983705211902414', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (874, 0, 'Seville', 'Spain', 0, 'Luis', NULL, '684944996', 'López', 774, 'ES4502534533246279610317', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (875, 0, 'Seville', 'Spain', 0, 'Celia', NULL, '696590113', 'Reyes', 775, 'ES6801061014458725279102', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (876, 0, 'Seville', 'Spain', 0, 'Iris', NULL, '684376243', 'Hernández', 776, 'ES1219617169523224656250', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (877, 0, 'Seville', 'Spain', 0, 'Camila', NULL, '658570893', 'Vargas', 777, 'ES4252462239150679433548', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (878, 0, 'Seville', 'Spain', 0, 'Carolina', NULL, '625288441', 'Santana', 778, 'ES3341768261320370375524', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (879, 0, 'Seville', 'Spain', 0, 'Marina', NULL, '628684106', 'Castro', 779, 'ES1808312427902110461377', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (880, 0, 'Seville', 'Spain', 0, 'Ainara', NULL, '629259381', 'Lozano', 780, 'ES6262764909796544247528', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (881, 0, 'Seville', 'Spain', 0, 'Arya', NULL, '640978000', 'Fuentes', 781, 'ES8475522215544704191222', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (882, 0, 'Seville', 'Spain', 0, 'Bruno', NULL, '663403167', 'Molina', 782, 'ES1624221389913851584430', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (883, 0, 'Seville', 'Spain', 0, 'Noel', NULL, '612052852', 'Sánchez', 783, 'ES4617283855881299240722', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (884, 0, 'Seville', 'Spain', 0, 'Francisco', NULL, '626174096', 'Cruz', 784, 'ES5519548583595898589764', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (885, 0, 'Seville', 'Spain', 0, 'Juan', NULL, '690820811', 'Gil', 785, 'ES5926245004383835578776', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (886, 0, 'Seville', 'Spain', 0, 'Santiago', NULL, '655249161', 'Herrero', 786, 'ES3365059864948235725017', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (887, 0, 'Seville', 'Spain', 0, 'Alexia', NULL, '650734308', 'Cruz', 787, 'ES9663089992996028827200', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (888, 0, 'Seville', 'Spain', 0, 'Arlet', NULL, '615462839', 'Parra', 788, 'ES1324766698799941731027', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (889, 0, 'Seville', 'Spain', 0, 'Mía', NULL, '646876909', 'Romero', 789, 'ES4196692511567813597934', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (890, 0, 'Seville', 'Spain', 0, 'Aina', NULL, '684295076', 'León', 790, 'ES2208938344064352088455', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (891, 0, 'Seville', 'Spain', 0, 'Berta', NULL, '672102852', 'Núñez', 791, 'ES7402461388232894081430', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (892, 0, 'Seville', 'Spain', 0, 'Leyre', NULL, '657239549', 'Bravo', 792, 'ES2766130436480607230552', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (893, 0, 'Seville', 'Spain', 0, 'Paula', NULL, '695174278', 'Benítez', 793, 'ES3253185698840546912747', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (894, 0, 'Seville', 'Spain', 0, 'Alicia', NULL, '674549786', 'Román', 794, 'ES9877751274453464793789', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (895, 0, 'Seville', 'Spain', 0, 'Mía', NULL, '644865515', 'León', 795, 'ES8325084515071703040103', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (896, 0, 'Seville', 'Spain', 0, 'Nicolás', NULL, '652669653', 'Álvarez', 796, 'ES8392645097799009595121', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (897, 0, 'Seville', 'Spain', 0, 'India', NULL, '620284004', 'Hidalgo', 797, 'ES1212777392138645630106', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (898, 0, 'Seville', 'Spain', 0, 'Marco', NULL, '696470509', 'Alonso', 798, 'ES6444315931510018204383', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (899, 0, 'Seville', 'Spain', 0, 'Alberto', NULL, '694420748', 'Prieto', 799, 'ES3908106567616180528757', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (900, 0, 'Seville', 'Spain', 0, 'Nadia', NULL, '689755210', 'Pastor', 800, 'ES2564039950428658225571', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (901, 0, 'Seville', 'Spain', 0, 'Vega', NULL, '697643836', 'Prieto', 801, 'ES3373896132946574629079', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (902, 0, 'Seville', 'Spain', 0, 'Vera', NULL, '658738140', 'Castro', 802, 'ES1143215576703869202279', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (903, 0, 'Seville', 'Spain', 0, 'Vera', NULL, '626591154', 'Martínez', 803, 'ES1389259438309038818679', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (904, 0, 'Seville', 'Spain', 0, 'Isaac', NULL, '682959383', 'Nieto', 804, 'ES9853212627200077210002', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (905, 0, 'Seville', 'Spain', 0, 'Nora', NULL, '693714676', 'Cano', 805, 'ES7172928255396426116799', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (906, 0, 'Seville', 'Spain', 0, 'Celia', NULL, '656048475', 'Gallego', 806, 'ES5802998331444471940343', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (907, 0, 'Seville', 'Spain', 0, 'Lola', NULL, '655591553', 'Ortiz', 807, 'ES8380035215543649794959', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (908, 0, 'Seville', 'Spain', 0, 'Lara', NULL, '662182839', 'Nieto', 808, 'ES2676349176768662289920', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (909, 0, 'Seville', 'Spain', 0, 'Gabriel', NULL, '671637799', 'Núñez', 809, 'ES5001368744613263452529', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (910, 0, 'Seville', 'Spain', 0, 'Daniela', NULL, '645707805', 'León', 810, 'ES3044758848707950815140', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (911, 0, 'Seville', 'Spain', 0, 'Jordi', NULL, '626898911', 'Vega', 811, 'ES4954971677259966318003', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (912, 0, 'Seville', 'Spain', 0, 'Aina', NULL, '631080688', 'Lorenzo', 812, 'ES8469832801229573675301', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (913, 0, 'Seville', 'Spain', 0, 'Carlos', NULL, '645447772', 'Muñoz', 813, 'ES9506599477981730026226', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (914, 0, 'Seville', 'Spain', 0, 'Manuel', NULL, '698408883', 'Torres', 814, 'ES1438770891954632695684', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (915, 0, 'Seville', 'Spain', 0, 'Derek', NULL, '644917108', 'Lorenzo', 815, 'ES4693957730502635163002', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (916, 0, 'Seville', 'Spain', 0, 'Aitor', NULL, '622339205', 'Álvarez', 816, 'ES2822882765541037572685', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (917, 0, 'Seville', 'Spain', 0, 'Diana', NULL, '633397382', 'Navarro', 817, 'ES2907060733821880919660', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (918, 0, 'Seville', 'Spain', 0, 'Antonio', NULL, '666402329', 'Diaz', 818, 'ES7888777517795993943382', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (919, 0, 'Seville', 'Spain', 0, 'Irene', NULL, '669590010', 'Muñoz', 819, 'ES8484509267470530945255', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (920, 0, 'Seville', 'Spain', 0, 'Abril', NULL, '696114783', 'Sanz', 820, 'ES2476540107604975039882', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (921, 0, 'Seville', 'Spain', 0, 'Lucía', NULL, '620235850', 'Bravo', 821, 'ES5115918832219442362940', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (922, 0, 'Seville', 'Spain', 0, 'Aarón', NULL, '624966665', 'Montero', 822, 'ES4066394644995686744575', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (923, 0, 'Seville', 'Spain', 0, 'Iván', NULL, '640782008', 'Pascual', 823, 'ES2014302690692452584269', 100, 294, 6, 2019, '4622016636569655');
INSERT INTO passenger VALUES (924, 0, 'Seville', 'Spain', 0, 'Lucía', NULL, '692872483', 'Moya', 824, 'ES4658556624044855391375', 100, 294, 6, 2019, '4622016636569655');


--
-- TOC entry 2031 (class 0 OID 49574)
-- Dependencies: 177
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO reservation VALUES (1288, 0, 'Sevilla Este, Sevilla', false, false, 2, 'El Porvenir, Sevilla', 1.1000000000000001, 1, 3, 855, 956);
INSERT INTO reservation VALUES (1289, 0, 'El Porvenir, Sevilla', false, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 2, 856, 958);
INSERT INTO reservation VALUES (1290, 0, 'Macarena, Sevilla', false, false, 3, 'San Bernardo, Sevilla', 1.1000000000000001, 1, 3, 857, 982);
INSERT INTO reservation VALUES (1291, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 3, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 857, 1031);
INSERT INTO reservation VALUES (1292, 0, 'Macarena, Sevilla', false, false, 3, 'San Bernardo, Sevilla', 1.1000000000000001, 1, 1, 857, 982);
INSERT INTO reservation VALUES (1293, 0, 'Gran Plaza, Sevilla', false, false, 3, 'San Bernardo, Sevilla', 1.1000000000000001, 1, 3, 858, 991);
INSERT INTO reservation VALUES (1294, 0, 'Montequinto, Sevilla', false, false, 3, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 0, 859, 1024);
INSERT INTO reservation VALUES (1295, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', false, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 859, 1016);
INSERT INTO reservation VALUES (1296, 0, 'El Porvenir, Sevilla', false, false, 2, 'Felipe II, Sevilla', 1.1000000000000001, 1, 0, 859, 1010);
INSERT INTO reservation VALUES (1297, 0, 'Avenida de El Greco, Sevilla', false, false, 1, 'Calle Jilguero, Sevilla', 1.1000000000000001, 1, 0, 860, 1013);
INSERT INTO reservation VALUES (1298, 0, 'Calle Jilguero, Sevilla', false, false, 3, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 861, 1015);
INSERT INTO reservation VALUES (1299, 0, 'Gran Plaza, Sevilla', false, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 862, 1019);
INSERT INTO reservation VALUES (1300, 0, 'Felipe II, Sevilla', false, false, 3, 'Gran Plaza, Sevilla', 1.1000000000000001, 1, 3, 862, 1014);
INSERT INTO reservation VALUES (1301, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 3, 862, 999);
INSERT INTO reservation VALUES (1302, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 0, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 0, 863, 1018);
INSERT INTO reservation VALUES (1303, 0, 'Montequinto, Sevilla', false, false, 3, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 2, 863, 1024);
INSERT INTO reservation VALUES (1304, 0, 'Montequinto, Sevilla', false, false, 0, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 864, 975);
INSERT INTO reservation VALUES (1305, 0, 'Camas, Sevilla', false, false, 2, 'Gran Plaza, Sevilla', 1.1000000000000001, 1, 2, 865, 1032);
INSERT INTO reservation VALUES (1306, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', false, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 866, 1016);
INSERT INTO reservation VALUES (1307, 0, 'Plaza del Duque de la Victoria, Sevilla', false, false, 1, 'Sevilla Este, Sevilla', 1.1000000000000001, 1, 2, 867, 1006);
INSERT INTO reservation VALUES (1308, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 1, 'Avenida de El Greco, Sevilla', 1.1000000000000001, 1, 0, 868, 985);
INSERT INTO reservation VALUES (1309, 0, 'Avenida de El Greco, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 2, 868, 1028);
INSERT INTO reservation VALUES (1310, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 869, 955);
INSERT INTO reservation VALUES (1311, 0, 'Felipe II, Sevilla', false, false, 1, 'Calle Jilguero, Sevilla', 1.1000000000000001, 1, 0, 869, 973);
INSERT INTO reservation VALUES (1312, 0, 'Montequinto, Sevilla', false, false, 2, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 869, 1008);
INSERT INTO reservation VALUES (1313, 0, 'Torre Sevilla, Sevilla', false, false, 2, 'Avenida de El Greco, Sevilla', 1.1000000000000001, 1, 0, 870, 972);
INSERT INTO reservation VALUES (1314, 0, 'Camas, Sevilla', false, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 2, 871, 990);
INSERT INTO reservation VALUES (1315, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', false, false, 2, 'Felipe II, Sevilla', 1.1000000000000001, 1, 0, 872, 1000);
INSERT INTO reservation VALUES (1316, 0, 'Gran Plaza, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 3, 873, 1035);
INSERT INTO reservation VALUES (1317, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 874, 955);
INSERT INTO reservation VALUES (1318, 0, 'Sevilla Este, Sevilla', false, false, 1, 'Montequinto, Sevilla', 1.1000000000000001, 1, 3, 874, 995);
INSERT INTO reservation VALUES (1319, 0, 'Macarena, Sevilla', false, false, 3, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 1, 0, 874, 967);
INSERT INTO reservation VALUES (1320, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 875, 955);
INSERT INTO reservation VALUES (1321, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 1, 875, 955);
INSERT INTO reservation VALUES (1322, 0, 'Plaza del Duque de la Victoria, Sevilla', false, false, 3, 'Calle Jilguero, Sevilla', 1.1000000000000001, 1, 1, 875, 1022);
INSERT INTO reservation VALUES (1323, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 1, 876, 984);
INSERT INTO reservation VALUES (1324, 0, 'Torre Sevilla, Sevilla', false, false, 3, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 876, 981);
INSERT INTO reservation VALUES (1325, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 877, 955);
INSERT INTO reservation VALUES (1326, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 1, 877, 1007);
INSERT INTO reservation VALUES (1327, 0, 'Los Arcos, Avenida de Andalucía, Sevilla', false, false, 3, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 878, 968);
INSERT INTO reservation VALUES (1328, 0, 'El Porvenir, Sevilla', false, false, 2, 'Felipe II, Sevilla', 1.1000000000000001, 1, 1, 878, 1010);
INSERT INTO reservation VALUES (1329, 0, 'Camas, Sevilla', false, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 878, 990);
INSERT INTO reservation VALUES (1330, 0, 'Sevilla Este, Sevilla', false, false, 2, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 879, 983);
INSERT INTO reservation VALUES (1331, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 879, 960);
INSERT INTO reservation VALUES (1332, 0, 'Macarena, Sevilla', false, false, 3, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 1, 2, 880, 967);
INSERT INTO reservation VALUES (1333, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 1, 'Avenida de El Greco, Sevilla', 1.1000000000000001, 1, 1, 881, 985);
INSERT INTO reservation VALUES (1334, 0, 'Calle Jilguero, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 882, 988);
INSERT INTO reservation VALUES (1335, 0, 'El Porvenir, Sevilla', false, false, 0, 'San Bernardo, Sevilla', 1.1000000000000001, 1, 0, 882, 1036);
INSERT INTO reservation VALUES (1336, 0, 'Los Arcos, Avenida de Andalucía, Sevilla', false, false, 3, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 3, 883, 968);
INSERT INTO reservation VALUES (1337, 0, 'Avenida de El Greco, Sevilla', false, false, 3, 'Macarena, Sevilla', 1.1000000000000001, 1, 0, 883, 977);
INSERT INTO reservation VALUES (1338, 0, 'Montequinto, Sevilla', false, false, 3, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 0, 884, 1024);
INSERT INTO reservation VALUES (1339, 0, 'Torre Sevilla, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 2, 884, 1033);
INSERT INTO reservation VALUES (1340, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 1, 2, 884, 1030);
INSERT INTO reservation VALUES (1341, 0, 'Los Arcos, Avenida de Andalucía, Sevilla', false, false, 0, 'El Porvenir, Sevilla', 1.1000000000000001, 1, 0, 885, 970);
INSERT INTO reservation VALUES (1342, 0, 'Felipe II, Sevilla', false, false, 1, 'Calle Jilguero, Sevilla', 1.1000000000000001, 1, 0, 885, 973);
INSERT INTO reservation VALUES (1343, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', false, false, 2, 'Felipe II, Sevilla', 1.1000000000000001, 1, 2, 886, 1000);
INSERT INTO reservation VALUES (1344, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 2, 886, 960);
INSERT INTO reservation VALUES (1345, 0, 'El Porvenir, Sevilla', false, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 887, 958);
INSERT INTO reservation VALUES (1346, 0, 'Sevilla Este, Sevilla', false, false, 1, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 888, 995);
INSERT INTO reservation VALUES (1347, 0, 'Sevilla Este, Sevilla', false, false, 2, 'El Porvenir, Sevilla', 1.1000000000000001, 1, 0, 888, 956);
INSERT INTO reservation VALUES (1348, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 2, 889, 955);
INSERT INTO reservation VALUES (1349, 0, 'Avenida de El Greco, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 1, 889, 1028);
INSERT INTO reservation VALUES (1350, 0, 'Camas, Sevilla', false, false, 3, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 1, 890, 987);
INSERT INTO reservation VALUES (1351, 0, 'Macarena, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 2, 891, 1017);
INSERT INTO reservation VALUES (1352, 0, 'Gran Plaza, Sevilla', false, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 3, 891, 1019);
INSERT INTO reservation VALUES (1353, 0, 'Macarena, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 891, 1017);
INSERT INTO reservation VALUES (1354, 0, 'Felipe II, Sevilla', false, false, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 1, 0, 892, 1003);
INSERT INTO reservation VALUES (1355, 0, 'Torre Sevilla, Sevilla', false, false, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 1, 1, 892, 959);
INSERT INTO reservation VALUES (1356, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 893, 955);
INSERT INTO reservation VALUES (1357, 0, 'Gran Plaza, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 1, 894, 1035);
INSERT INTO reservation VALUES (1358, 0, 'Plaza del Duque de la Victoria, Sevilla', false, false, 3, 'Calle Jilguero, Sevilla', 1.1000000000000001, 1, 0, 894, 1022);
INSERT INTO reservation VALUES (1359, 0, 'Los Arcos, Avenida de Andalucía, Sevilla', false, false, 1, 'El Porvenir, Sevilla', 1.1000000000000001, 1, 0, 895, 1034);
INSERT INTO reservation VALUES (1360, 0, 'Sevilla Este, Sevilla', false, false, 2, 'Camas, Sevilla', 1.1000000000000001, 1, 1, 895, 983);
INSERT INTO reservation VALUES (1361, 0, 'Montequinto, Sevilla', false, false, 0, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 1, 896, 998);
INSERT INTO reservation VALUES (1362, 0, 'Avenida de El Greco, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 896, 1028);
INSERT INTO reservation VALUES (1363, 0, 'Sevilla Este, Sevilla', false, false, 2, 'El Porvenir, Sevilla', 1.1000000000000001, 1, 0, 897, 956);
INSERT INTO reservation VALUES (1364, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 897, 960);
INSERT INTO reservation VALUES (1365, 0, 'Torre Sevilla, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 2, 897, 1033);
INSERT INTO reservation VALUES (1366, 0, 'Calle Jilguero, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 2, 898, 988);
INSERT INTO reservation VALUES (1367, 0, 'Los Arcos, Avenida de Andalucía, Sevilla', false, false, 3, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 1, 898, 968);
INSERT INTO reservation VALUES (1368, 0, 'Calle Jilguero, Sevilla', false, false, 2, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 1, 1, 899, 974);
INSERT INTO reservation VALUES (1369, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 0, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 3, 899, 1018);
INSERT INTO reservation VALUES (1370, 0, 'San Bernardo, Sevilla', false, false, 0, 'Sevilla Este, Sevilla', 1.1000000000000001, 1, 1, 899, 989);
INSERT INTO reservation VALUES (1371, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 900, 984);
INSERT INTO reservation VALUES (1372, 0, 'Los Arcos, Avenida de Andalucía, Sevilla', false, false, 3, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 900, 968);
INSERT INTO reservation VALUES (1373, 0, 'Plaza del Duque de la Victoria, Sevilla', false, false, 1, 'Sevilla Este, Sevilla', 1.1000000000000001, 1, 0, 901, 1006);
INSERT INTO reservation VALUES (1374, 0, 'Torre Sevilla, Sevilla', false, false, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 1, 0, 902, 959);
INSERT INTO reservation VALUES (1375, 0, 'Gran Plaza, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 903, 1035);
INSERT INTO reservation VALUES (1376, 0, 'Macarena, Sevilla', false, false, 0, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 904, 962);
INSERT INTO reservation VALUES (1377, 0, 'Calle Jilguero, Sevilla', false, false, 3, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 905, 1015);
INSERT INTO reservation VALUES (1378, 0, 'El Porvenir, Sevilla', false, false, 0, 'San Bernardo, Sevilla', 1.1000000000000001, 1, 0, 906, 1036);
INSERT INTO reservation VALUES (1379, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 0, 'Torre Sevilla, Sevilla', 1.1000000000000001, 1, 0, 906, 1018);
INSERT INTO reservation VALUES (1380, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 907, 1004);
INSERT INTO reservation VALUES (1381, 0, 'Montequinto, Sevilla', false, false, 0, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 908, 975);
INSERT INTO reservation VALUES (1382, 0, 'El Porvenir, Sevilla', false, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 908, 955);
INSERT INTO reservation VALUES (1383, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 909, 999);
INSERT INTO reservation VALUES (1384, 0, 'Torre Sevilla, Sevilla', false, false, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 1, 0, 909, 959);
INSERT INTO reservation VALUES (1385, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', false, false, 2, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 910, 993);
INSERT INTO reservation VALUES (1386, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 910, 1007);
INSERT INTO reservation VALUES (1387, 0, 'Montequinto, Sevilla', false, false, 1, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 910, 964);
INSERT INTO reservation VALUES (1388, 0, 'Calle Jilguero, Sevilla', false, false, 2, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 1, 0, 911, 974);
INSERT INTO reservation VALUES (1389, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 912, 957);
INSERT INTO reservation VALUES (1390, 0, 'El Porvenir, Sevilla', false, false, 0, 'San Bernardo, Sevilla', 1.1000000000000001, 1, 0, 912, 1036);
INSERT INTO reservation VALUES (1391, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 3, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 912, 1031);
INSERT INTO reservation VALUES (1392, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 913, 957);
INSERT INTO reservation VALUES (1393, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 913, 957);
INSERT INTO reservation VALUES (1394, 0, 'Sevilla Este, Sevilla', false, false, 2, 'Camas, Sevilla', 1.1000000000000001, 1, 0, 914, 983);
INSERT INTO reservation VALUES (1395, 0, 'Gran Plaza, Sevilla', false, false, 0, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 1, 0, 914, 1027);
INSERT INTO reservation VALUES (1396, 0, 'El Porvenir, Sevilla', false, false, 0, 'San Bernardo, Sevilla', 1.1000000000000001, 1, 0, 915, 1011);
INSERT INTO reservation VALUES (1397, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 915, 957);
INSERT INTO reservation VALUES (1398, 0, 'Avenida de El Greco, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 916, 1028);
INSERT INTO reservation VALUES (1399, 0, 'Calle Jilguero, Sevilla', false, false, 2, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 1, 0, 916, 974);
INSERT INTO reservation VALUES (1400, 0, 'Avenida del Cid, Sevilla', false, false, 1, 'El Porvenir, Sevilla', 1.1000000000000001, 1, 0, 917, 1020);
INSERT INTO reservation VALUES (1401, 0, 'San Bernardo, Sevilla', false, false, 3, 'Macarena, Sevilla', 1.1000000000000001, 1, 0, 918, 1009);
INSERT INTO reservation VALUES (1402, 0, 'Calle Jilguero, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 918, 988);
INSERT INTO reservation VALUES (1403, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', false, false, 1, 'Avenida de El Greco, Sevilla', 1.1000000000000001, 1, 0, 919, 985);
INSERT INTO reservation VALUES (1404, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 919, 984);
INSERT INTO reservation VALUES (1405, 0, 'Avenida de El Greco, Sevilla', false, false, 3, 'Macarena, Sevilla', 1.1000000000000001, 1, 0, 920, 977);
INSERT INTO reservation VALUES (1406, 0, 'Montequinto, Sevilla', false, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 1, 0, 921, 976);
INSERT INTO reservation VALUES (1407, 0, 'Camas, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 922, 1037);
INSERT INTO reservation VALUES (1408, 0, 'Camas, Sevilla', false, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 1, 0, 922, 990);
INSERT INTO reservation VALUES (1409, 0, 'Camas, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 922, 1037);
INSERT INTO reservation VALUES (1410, 0, 'Torre Sevilla, Sevilla', false, false, 2, 'Avenida de El Greco, Sevilla', 1.1000000000000001, 1, 0, 923, 972);
INSERT INTO reservation VALUES (1411, 0, 'Avenida de El Greco, Sevilla', false, false, 2, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 1, 0, 923, 1025);
INSERT INTO reservation VALUES (1412, 0, 'Gran Plaza, Sevilla', false, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 1, 0, 923, 978);
INSERT INTO reservation VALUES (1413, 0, 'Macarena, Sevilla', false, false, 0, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 924, 962);
INSERT INTO reservation VALUES (1414, 0, 'Calle Jilguero, Sevilla', false, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 1, 0, 924, 988);


--
-- TOC entry 2032 (class 0 OID 49582)
-- Dependencies: 178
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO route VALUES (955, 0, 1, 'SATURDAY', '2019-06-28 19:12:00', 'El Porvenir, Sevilla', '', 5, 10, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 825, 925);
INSERT INTO route VALUES (956, 0, 4, 'WEDNESDAY', '2019-06-05 16:25:00', 'Sevilla Este, Sevilla', '', 11, 5, false, 2, 'El Porvenir, Sevilla', 1.1000000000000001, 826, 926);
INSERT INTO route VALUES (957, 0, 4, 'FRIDAY', '2019-02-01 16:02:00', 'Avenida de El Greco, Sevilla', '', 11, 10, false, 2, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 826, 926);
INSERT INTO route VALUES (958, 0, 4, 'WEDNESDAY', '2019-04-26 08:22:00', 'El Porvenir, Sevilla', '', 4, 15, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 826, 926);
INSERT INTO route VALUES (959, 0, 4, 'FRIDAY', '2019-01-27 14:21:00', 'Torre Sevilla, Sevilla', '', 7, 10, false, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 826, 926);
INSERT INTO route VALUES (960, 0, 4, 'FRIDAY', '2019-06-18 20:40:00', 'Avenida de El Greco, Sevilla', '', 10, 15, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 827, 927);
INSERT INTO route VALUES (961, 0, 4, 'MONDAY', '2019-04-05 09:12:00', 'Felipe II, Sevilla', '', 5, 15, false, 3, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 827, 927);
INSERT INTO route VALUES (962, 0, 4, 'MONDAY', '2019-03-28 06:16:00', 'Macarena, Sevilla', '', 6, 15, false, 0, 'Montequinto, Sevilla', 1.1000000000000001, 827, 927);
INSERT INTO route VALUES (963, 0, 4, 'SUNDAY', '2019-02-17 20:38:00', 'Avenida de El Greco, Sevilla', '', 5, 5, false, 2, 'Felipe II, Sevilla', 1.1000000000000001, 827, 927);
INSERT INTO route VALUES (964, 0, 1, 'SUNDAY', '2019-03-09 09:27:00', 'Montequinto, Sevilla', '', 11, 15, false, 1, 'Avenida del Cid, Sevilla', 1.1000000000000001, 828, 928);
INSERT INTO route VALUES (965, 0, 1, 'MONDAY', '2019-05-28 10:02:00', 'Felipe II, Sevilla', '', 5, 10, false, 2, 'Camas, Sevilla', 1.1000000000000001, 828, 928);
INSERT INTO route VALUES (966, 0, 4, 'TUESDAY', '2019-03-26 18:31:00', 'Felipe II, Sevilla', '', 10, 5, false, 1, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 829, 929);
INSERT INTO route VALUES (967, 0, 4, 'WEDNESDAY', '2019-01-04 20:16:00', 'Macarena, Sevilla', '', 11, 10, false, 3, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 829, 929);
INSERT INTO route VALUES (968, 0, 4, 'MONDAY', '2019-01-09 10:35:00', 'Los Arcos, Avenida de Andalucía, Sevilla', '', 10, 15, false, 3, 'Avenida del Cid, Sevilla', 1.1000000000000001, 829, 929);
INSERT INTO route VALUES (969, 0, 4, 'THURSDAY', '2019-03-23 08:11:00', 'Avenida del Cid, Sevilla', '', 10, 15, false, 3, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 829, 929);
INSERT INTO route VALUES (970, 0, 4, 'SATURDAY', '2019-02-26 19:33:00', 'Los Arcos, Avenida de Andalucía, Sevilla', '', 5, 10, false, 0, 'El Porvenir, Sevilla', 1.1000000000000001, 830, 930);
INSERT INTO route VALUES (971, 0, 1, 'WEDNESDAY', '2019-03-09 15:09:00', 'Plaza del Duque de la Victoria, Sevilla', '', 7, 10, false, 3, 'Felipe II, Sevilla', 1.1000000000000001, 831, 931);
INSERT INTO route VALUES (972, 0, 1, 'THURSDAY', '2019-05-26 20:15:00', 'Torre Sevilla, Sevilla', '', 11, 10, false, 2, 'Avenida de El Greco, Sevilla', 1.1000000000000001, 832, 932);
INSERT INTO route VALUES (973, 0, 4, 'THURSDAY', '2019-04-13 14:36:00', 'Felipe II, Sevilla', '', 7, 10, false, 1, 'Calle Jilguero, Sevilla', 1.1000000000000001, 833, 933);
INSERT INTO route VALUES (974, 0, 4, 'TUESDAY', '2019-03-24 18:26:00', 'Calle Jilguero, Sevilla', '', 8, 5, false, 2, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 833, 933);
INSERT INTO route VALUES (975, 0, 4, 'WEDNESDAY', '2019-06-01 15:37:00', 'Montequinto, Sevilla', '', 3, 10, false, 0, 'Camas, Sevilla', 1.1000000000000001, 833, 933);
INSERT INTO route VALUES (976, 0, 4, 'TUESDAY', '2019-06-13 10:40:00', 'Montequinto, Sevilla', '', 11, 10, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 834, 934);
INSERT INTO route VALUES (977, 0, 4, 'SUNDAY', '2019-05-05 09:40:00', 'Avenida de El Greco, Sevilla', '', 4, 10, false, 3, 'Macarena, Sevilla', 1.1000000000000001, 835, 935);
INSERT INTO route VALUES (978, 0, 4, 'FRIDAY', '2019-04-08 09:36:00', 'Gran Plaza, Sevilla', '', 9, 5, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 835, 935);
INSERT INTO route VALUES (979, 0, 4, 'FRIDAY', '2019-04-24 08:31:00', 'Felipe II, Sevilla', '', 4, 15, false, 0, 'San Bernardo, Sevilla', 1.1000000000000001, 835, 935);
INSERT INTO route VALUES (980, 0, 1, 'MONDAY', '2019-04-14 13:37:00', 'Nervión Plaza, Calle Luis de Morales, Sevilla', '', 9, 10, false, 0, 'Montequinto, Sevilla', 1.1000000000000001, 836, 936);
INSERT INTO route VALUES (981, 0, 1, 'SUNDAY', '2019-01-04 19:27:00', 'Torre Sevilla, Sevilla', '', 11, 15, false, 3, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 836, 936);
INSERT INTO route VALUES (982, 0, 1, 'WEDNESDAY', '2019-02-16 09:16:00', 'Macarena, Sevilla', '', 11, 5, false, 3, 'San Bernardo, Sevilla', 1.1000000000000001, 836, 936);
INSERT INTO route VALUES (983, 0, 1, 'MONDAY', '2019-05-27 18:18:00', 'Sevilla Este, Sevilla', '', 4, 15, false, 2, 'Camas, Sevilla', 1.1000000000000001, 836, 936);
INSERT INTO route VALUES (984, 0, 4, 'MONDAY', '2019-03-20 15:23:00', 'Avenida de El Greco, Sevilla', '', 5, 10, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 837, 937);
INSERT INTO route VALUES (985, 0, 4, 'WEDNESDAY', '2019-02-14 13:15:00', 'Reina Mercedes (Escuela de Arquitectura), Sevilla', '', 6, 15, false, 1, 'Avenida de El Greco, Sevilla', 1.1000000000000001, 837, 937);
INSERT INTO route VALUES (986, 0, 4, 'FRIDAY', '2019-02-17 08:29:00', 'San Bernardo, Sevilla', '', 6, 10, false, 3, 'Sevilla Este, Sevilla', 1.1000000000000001, 837, 937);
INSERT INTO route VALUES (987, 0, 4, 'SUNDAY', '2019-06-09 17:13:00', 'Camas, Sevilla', '', 11, 15, false, 3, 'Torre Sevilla, Sevilla', 1.1000000000000001, 838, 938);
INSERT INTO route VALUES (988, 0, 4, 'THURSDAY', '2019-06-18 19:27:00', 'Calle Jilguero, Sevilla', '', 7, 15, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 838, 938);
INSERT INTO route VALUES (989, 0, 4, 'WEDNESDAY', '2019-04-04 07:26:00', 'San Bernardo, Sevilla', '', 7, 5, false, 0, 'Sevilla Este, Sevilla', 1.1000000000000001, 838, 938);
INSERT INTO route VALUES (990, 0, 4, 'TUESDAY', '2019-06-17 12:00:00', 'Camas, Sevilla', '', 4, 15, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 838, 938);
INSERT INTO route VALUES (991, 0, 4, 'TUESDAY', '2019-02-28 07:31:00', 'Gran Plaza, Sevilla', '', 7, 10, false, 3, 'San Bernardo, Sevilla', 1.1000000000000001, 839, 939);
INSERT INTO route VALUES (992, 0, 4, 'MONDAY', '2019-06-18 14:03:00', 'El Porvenir, Sevilla', '', 3, 5, false, 3, 'Torre Sevilla, Sevilla', 1.1000000000000001, 839, 939);
INSERT INTO route VALUES (993, 0, 4, 'MONDAY', '2019-02-15 12:27:00', 'Nervión Plaza, Calle Luis de Morales, Sevilla', '', 5, 5, false, 2, 'Camas, Sevilla', 1.1000000000000001, 839, 939);
INSERT INTO route VALUES (994, 0, 4, 'SUNDAY', '2019-06-05 13:07:00', 'Montequinto, Sevilla', '', 11, 5, false, 3, 'Gran Plaza, Sevilla', 1.1000000000000001, 840, 940);
INSERT INTO route VALUES (995, 0, 4, 'WEDNESDAY', '2019-04-02 17:17:00', 'Sevilla Este, Sevilla', '', 3, 5, false, 1, 'Montequinto, Sevilla', 1.1000000000000001, 840, 940);
INSERT INTO route VALUES (996, 0, 4, 'WEDNESDAY', '2019-04-17 18:28:00', 'Avenida del Cid, Sevilla', '', 7, 15, false, 1, 'Calle Jilguero, Sevilla', 1.1000000000000001, 840, 940);
INSERT INTO route VALUES (997, 0, 1, 'MONDAY', '2019-03-11 11:07:00', 'Gran Plaza, Sevilla', '', 4, 15, false, 2, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 841, 941);
INSERT INTO route VALUES (998, 0, 1, 'SUNDAY', '2019-05-04 19:10:00', 'Montequinto, Sevilla', '', 9, 10, false, 0, 'Torre Sevilla, Sevilla', 1.1000000000000001, 841, 941);
INSERT INTO route VALUES (999, 0, 4, 'TUESDAY', '2019-03-18 08:16:00', 'Reina Mercedes (Escuela de Arquitectura), Sevilla', '', 5, 10, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 842, 942);
INSERT INTO route VALUES (1000, 0, 4, 'SUNDAY', '2019-01-20 18:17:00', 'Nervión Plaza, Calle Luis de Morales, Sevilla', '', 11, 15, false, 2, 'Felipe II, Sevilla', 1.1000000000000001, 842, 942);
INSERT INTO route VALUES (1001, 0, 4, 'MONDAY', '2019-04-28 08:06:00', 'Calle Jilguero, Sevilla', '', 7, 10, false, 0, 'Sevilla Este, Sevilla', 1.1000000000000001, 842, 942);
INSERT INTO route VALUES (1002, 0, 4, 'THURSDAY', '2019-02-06 15:29:00', 'Plaza del Duque de la Victoria, Sevilla', '', 8, 5, false, 1, 'Torre Sevilla, Sevilla', 1.1000000000000001, 843, 943);
INSERT INTO route VALUES (1003, 0, 4, 'WEDNESDAY', '2019-03-02 19:26:00', 'Felipe II, Sevilla', '', 7, 10, false, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 843, 943);
INSERT INTO route VALUES (1004, 0, 4, 'MONDAY', '2019-02-25 19:07:00', 'Reina Mercedes (Escuela de Arquitectura), Sevilla', '', 7, 5, false, 2, 'Avenida del Cid, Sevilla', 1.1000000000000001, 843, 943);
INSERT INTO route VALUES (1005, 0, 4, 'SATURDAY', '2019-01-02 17:05:00', 'Plaza del Duque de la Victoria, Sevilla', '', 4, 10, false, 1, 'Montequinto, Sevilla', 1.1000000000000001, 844, 944);
INSERT INTO route VALUES (1006, 0, 4, 'SATURDAY', '2019-01-21 07:08:00', 'Plaza del Duque de la Victoria, Sevilla', '', 5, 15, false, 1, 'Sevilla Este, Sevilla', 1.1000000000000001, 844, 944);
INSERT INTO route VALUES (1007, 0, 4, 'SUNDAY', '2019-03-12 11:39:00', 'Nervión Plaza, Calle Luis de Morales, Sevilla', '', 6, 10, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 844, 944);
INSERT INTO route VALUES (1008, 0, 4, 'TUESDAY', '2019-05-10 20:39:00', 'Montequinto, Sevilla', '', 6, 15, false, 2, 'Camas, Sevilla', 1.1000000000000001, 844, 944);
INSERT INTO route VALUES (1009, 0, 1, 'WEDNESDAY', '2019-04-04 15:29:00', 'San Bernardo, Sevilla', '', 6, 10, false, 3, 'Macarena, Sevilla', 1.1000000000000001, 845, 945);
INSERT INTO route VALUES (1010, 0, 1, 'THURSDAY', '2019-05-25 09:25:00', 'El Porvenir, Sevilla', '', 7, 5, false, 2, 'Felipe II, Sevilla', 1.1000000000000001, 845, 945);
INSERT INTO route VALUES (1011, 0, 4, 'SATURDAY', '2019-05-06 19:02:00', 'El Porvenir, Sevilla', '', 11, 5, false, 0, 'San Bernardo, Sevilla', 1.1000000000000001, 846, 946);
INSERT INTO route VALUES (1012, 0, 4, 'MONDAY', '2019-02-02 18:27:00', 'Nervión Plaza, Calle Luis de Morales, Sevilla', '', 11, 5, false, 1, 'Camas, Sevilla', 1.1000000000000001, 846, 946);
INSERT INTO route VALUES (1013, 0, 4, 'WEDNESDAY', '2019-06-27 12:28:00', 'Avenida de El Greco, Sevilla', '', 6, 5, false, 1, 'Calle Jilguero, Sevilla', 1.1000000000000001, 846, 946);
INSERT INTO route VALUES (1014, 0, 4, 'WEDNESDAY', '2019-02-11 14:20:00', 'Felipe II, Sevilla', '', 11, 10, false, 3, 'Gran Plaza, Sevilla', 1.1000000000000001, 846, 946);
INSERT INTO route VALUES (1015, 0, 4, 'TUESDAY', '2019-06-24 06:06:00', 'Calle Jilguero, Sevilla', '', 4, 15, false, 3, 'Camas, Sevilla', 1.1000000000000001, 847, 947);
INSERT INTO route VALUES (1016, 0, 4, 'SUNDAY', '2019-03-22 19:11:00', 'Nervión Plaza, Calle Luis de Morales, Sevilla', '', 6, 5, false, 2, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 847, 947);
INSERT INTO route VALUES (1017, 0, 4, 'FRIDAY', '2019-01-24 14:00:00', 'Macarena, Sevilla', '', 10, 10, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 847, 947);
INSERT INTO route VALUES (1018, 0, 4, 'WEDNESDAY', '2019-01-19 11:04:00', 'Reina Mercedes (Escuela de Arquitectura), Sevilla', '', 10, 5, false, 0, 'Torre Sevilla, Sevilla', 1.1000000000000001, 847, 947);
INSERT INTO route VALUES (1019, 0, 4, 'FRIDAY', '2019-04-18 15:40:00', 'Gran Plaza, Sevilla', '', 6, 10, false, 0, 'Nervión Plaza, Calle Luis de Morales, Sevilla', 1.1000000000000001, 848, 948);
INSERT INTO route VALUES (1020, 0, 4, 'FRIDAY', '2019-05-22 18:29:00', 'Avenida del Cid, Sevilla', '', 11, 5, false, 1, 'El Porvenir, Sevilla', 1.1000000000000001, 848, 948);
INSERT INTO route VALUES (1021, 0, 4, 'FRIDAY', '2019-06-10 20:02:00', 'Calle Jilguero, Sevilla', '', 7, 15, false, 0, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 848, 948);
INSERT INTO route VALUES (1022, 0, 4, 'SATURDAY', '2019-06-27 15:29:00', 'Plaza del Duque de la Victoria, Sevilla', '', 11, 10, false, 3, 'Calle Jilguero, Sevilla', 1.1000000000000001, 848, 948);
INSERT INTO route VALUES (1023, 0, 1, 'THURSDAY', '2019-03-15 19:00:00', 'Macarena, Sevilla', '', 4, 15, false, 3, 'Montequinto, Sevilla', 1.1000000000000001, 849, 949);
INSERT INTO route VALUES (1024, 0, 1, 'SUNDAY', '2019-01-18 18:21:00', 'Montequinto, Sevilla', '', 10, 10, false, 3, 'Torre Sevilla, Sevilla', 1.1000000000000001, 849, 949);
INSERT INTO route VALUES (1025, 0, 1, 'WEDNESDAY', '2019-03-22 12:38:00', 'Avenida de El Greco, Sevilla', '', 5, 10, false, 2, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 850, 950);
INSERT INTO route VALUES (1026, 0, 1, 'FRIDAY', '2019-01-03 20:24:00', 'Torre Sevilla, Sevilla', '', 8, 10, false, 0, 'Avenida del Cid, Sevilla', 1.1000000000000001, 850, 950);
INSERT INTO route VALUES (1027, 0, 1, 'FRIDAY', '2019-02-23 11:29:00', 'Gran Plaza, Sevilla', '', 11, 15, false, 0, 'Plaza del Duque de la Victoria, Sevilla', 1.1000000000000001, 850, 950);
INSERT INTO route VALUES (1028, 0, 4, 'MONDAY', '2019-01-05 18:22:00', 'Avenida de El Greco, Sevilla', '', 11, 10, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 851, 951);
INSERT INTO route VALUES (1029, 0, 4, 'THURSDAY', '2019-06-01 12:27:00', 'San Bernardo, Sevilla', '', 11, 5, false, 0, 'Sevilla Este, Sevilla', 1.1000000000000001, 851, 951);
INSERT INTO route VALUES (1030, 0, 4, 'MONDAY', '2019-01-27 10:28:00', 'Avenida de El Greco, Sevilla', '', 3, 5, false, 2, 'Reina Mercedes (Escuela de Arquitectura), Sevilla', 1.1000000000000001, 852, 952);
INSERT INTO route VALUES (1031, 0, 4, 'SUNDAY', '2019-01-05 15:01:00', 'Reina Mercedes (Escuela de Arquitectura), Sevilla', '', 7, 15, false, 3, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 852, 952);
INSERT INTO route VALUES (1032, 0, 4, 'FRIDAY', '2019-03-24 15:37:00', 'Camas, Sevilla', '', 7, 10, false, 2, 'Gran Plaza, Sevilla', 1.1000000000000001, 852, 952);
INSERT INTO route VALUES (1033, 0, 4, 'WEDNESDAY', '2019-05-23 10:26:00', 'Torre Sevilla, Sevilla', '', 11, 10, false, 1, 'Los Arcos, Avenida de Andalucía, Sevilla', 1.1000000000000001, 853, 953);
INSERT INTO route VALUES (1034, 0, 4, 'MONDAY', '2019-02-28 12:32:00', 'Los Arcos, Avenida de Andalucía, Sevilla', '', 11, 5, false, 1, 'El Porvenir, Sevilla', 1.1000000000000001, 853, 953);
INSERT INTO route VALUES (1035, 0, 4, 'SATURDAY', '2019-05-06 12:31:00', 'Gran Plaza, Sevilla', '', 11, 10, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 853, 953);
INSERT INTO route VALUES (1036, 0, 1, 'TUESDAY', '2019-02-23 12:12:00', 'El Porvenir, Sevilla', '', 8, 5, false, 0, 'San Bernardo, Sevilla', 1.1000000000000001, 854, 954);
INSERT INTO route VALUES (1037, 0, 1, 'FRIDAY', '2019-05-07 10:33:00', 'Camas, Sevilla', '', 10, 15, false, 2, 'Montequinto, Sevilla', 1.1000000000000001, 854, 954);


--
-- TOC entry 2033 (class 0 OID 49590)
-- Dependencies: 179
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_account VALUES (724, 0, NULL, '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com');
INSERT INTO user_account VALUES (725, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver1@gmail.com');
INSERT INTO user_account VALUES (726, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver2@gmail.com');
INSERT INTO user_account VALUES (727, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver3@gmail.com');
INSERT INTO user_account VALUES (728, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver4@gmail.com');
INSERT INTO user_account VALUES (729, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver5@gmail.com');
INSERT INTO user_account VALUES (730, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver6@gmail.com');
INSERT INTO user_account VALUES (731, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver7@gmail.com');
INSERT INTO user_account VALUES (732, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver8@gmail.com');
INSERT INTO user_account VALUES (733, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver9@gmail.com');
INSERT INTO user_account VALUES (734, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver10@gmail.com');
INSERT INTO user_account VALUES (735, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver11@gmail.com');
INSERT INTO user_account VALUES (736, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver12@gmail.com');
INSERT INTO user_account VALUES (737, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver13@gmail.com');
INSERT INTO user_account VALUES (738, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver14@gmail.com');
INSERT INTO user_account VALUES (739, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver15@gmail.com');
INSERT INTO user_account VALUES (740, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver16@gmail.com');
INSERT INTO user_account VALUES (741, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver17@gmail.com');
INSERT INTO user_account VALUES (742, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver18@gmail.com');
INSERT INTO user_account VALUES (743, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver19@gmail.com');
INSERT INTO user_account VALUES (744, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver20@gmail.com');
INSERT INTO user_account VALUES (745, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver21@gmail.com');
INSERT INTO user_account VALUES (746, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver22@gmail.com');
INSERT INTO user_account VALUES (747, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver23@gmail.com');
INSERT INTO user_account VALUES (748, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver24@gmail.com');
INSERT INTO user_account VALUES (749, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver25@gmail.com');
INSERT INTO user_account VALUES (750, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver26@gmail.com');
INSERT INTO user_account VALUES (751, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver27@gmail.com');
INSERT INTO user_account VALUES (752, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver28@gmail.com');
INSERT INTO user_account VALUES (753, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver29@gmail.com');
INSERT INTO user_account VALUES (754, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'driver30@gmail.com');
INSERT INTO user_account VALUES (755, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger31@gmail.com');
INSERT INTO user_account VALUES (756, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger32@gmail.com');
INSERT INTO user_account VALUES (757, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger33@gmail.com');
INSERT INTO user_account VALUES (758, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger34@gmail.com');
INSERT INTO user_account VALUES (759, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger35@gmail.com');
INSERT INTO user_account VALUES (760, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger36@gmail.com');
INSERT INTO user_account VALUES (761, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger37@gmail.com');
INSERT INTO user_account VALUES (762, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger38@gmail.com');
INSERT INTO user_account VALUES (763, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger39@gmail.com');
INSERT INTO user_account VALUES (764, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger40@gmail.com');
INSERT INTO user_account VALUES (765, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger41@gmail.com');
INSERT INTO user_account VALUES (766, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger42@gmail.com');
INSERT INTO user_account VALUES (767, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger43@gmail.com');
INSERT INTO user_account VALUES (768, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger44@gmail.com');
INSERT INTO user_account VALUES (769, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger45@gmail.com');
INSERT INTO user_account VALUES (770, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger46@gmail.com');
INSERT INTO user_account VALUES (771, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger47@gmail.com');
INSERT INTO user_account VALUES (772, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger48@gmail.com');
INSERT INTO user_account VALUES (773, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger49@gmail.com');
INSERT INTO user_account VALUES (774, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger50@gmail.com');
INSERT INTO user_account VALUES (775, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger51@gmail.com');
INSERT INTO user_account VALUES (776, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger52@gmail.com');
INSERT INTO user_account VALUES (777, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger53@gmail.com');
INSERT INTO user_account VALUES (778, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger54@gmail.com');
INSERT INTO user_account VALUES (779, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger55@gmail.com');
INSERT INTO user_account VALUES (780, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger56@gmail.com');
INSERT INTO user_account VALUES (781, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger57@gmail.com');
INSERT INTO user_account VALUES (782, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger58@gmail.com');
INSERT INTO user_account VALUES (783, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger59@gmail.com');
INSERT INTO user_account VALUES (784, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger60@gmail.com');
INSERT INTO user_account VALUES (785, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger61@gmail.com');
INSERT INTO user_account VALUES (786, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger62@gmail.com');
INSERT INTO user_account VALUES (787, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger63@gmail.com');
INSERT INTO user_account VALUES (788, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger64@gmail.com');
INSERT INTO user_account VALUES (789, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger65@gmail.com');
INSERT INTO user_account VALUES (790, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger66@gmail.com');
INSERT INTO user_account VALUES (791, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger67@gmail.com');
INSERT INTO user_account VALUES (792, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger68@gmail.com');
INSERT INTO user_account VALUES (793, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger69@gmail.com');
INSERT INTO user_account VALUES (794, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger70@gmail.com');
INSERT INTO user_account VALUES (795, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger71@gmail.com');
INSERT INTO user_account VALUES (796, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger72@gmail.com');
INSERT INTO user_account VALUES (797, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger73@gmail.com');
INSERT INTO user_account VALUES (798, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger74@gmail.com');
INSERT INTO user_account VALUES (799, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger75@gmail.com');
INSERT INTO user_account VALUES (800, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger76@gmail.com');
INSERT INTO user_account VALUES (801, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger77@gmail.com');
INSERT INTO user_account VALUES (802, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger78@gmail.com');
INSERT INTO user_account VALUES (803, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger79@gmail.com');
INSERT INTO user_account VALUES (804, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger80@gmail.com');
INSERT INTO user_account VALUES (805, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger81@gmail.com');
INSERT INTO user_account VALUES (806, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger82@gmail.com');
INSERT INTO user_account VALUES (807, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger83@gmail.com');
INSERT INTO user_account VALUES (808, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger84@gmail.com');
INSERT INTO user_account VALUES (809, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger85@gmail.com');
INSERT INTO user_account VALUES (810, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger86@gmail.com');
INSERT INTO user_account VALUES (811, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger87@gmail.com');
INSERT INTO user_account VALUES (812, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger88@gmail.com');
INSERT INTO user_account VALUES (813, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger89@gmail.com');
INSERT INTO user_account VALUES (814, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger90@gmail.com');
INSERT INTO user_account VALUES (815, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger91@gmail.com');
INSERT INTO user_account VALUES (816, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger92@gmail.com');
INSERT INTO user_account VALUES (817, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger93@gmail.com');
INSERT INTO user_account VALUES (818, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger94@gmail.com');
INSERT INTO user_account VALUES (819, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger95@gmail.com');
INSERT INTO user_account VALUES (820, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger96@gmail.com');
INSERT INTO user_account VALUES (821, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger97@gmail.com');
INSERT INTO user_account VALUES (822, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger98@gmail.com');
INSERT INTO user_account VALUES (823, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger99@gmail.com');
INSERT INTO user_account VALUES (824, 0, NULL, '7815696ecbf1c96e6894b779456d330e', 'passenger100@gmail.com');


--
-- TOC entry 2034 (class 0 OID 49598)
-- Dependencies: 180
-- Data for Name: user_account_authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_account_authorities VALUES (724, 'ADMIN');
INSERT INTO user_account_authorities VALUES (725, 'DRIVER');
INSERT INTO user_account_authorities VALUES (726, 'DRIVER');
INSERT INTO user_account_authorities VALUES (727, 'DRIVER');
INSERT INTO user_account_authorities VALUES (728, 'DRIVER');
INSERT INTO user_account_authorities VALUES (729, 'DRIVER');
INSERT INTO user_account_authorities VALUES (730, 'DRIVER');
INSERT INTO user_account_authorities VALUES (731, 'DRIVER');
INSERT INTO user_account_authorities VALUES (732, 'DRIVER');
INSERT INTO user_account_authorities VALUES (733, 'DRIVER');
INSERT INTO user_account_authorities VALUES (734, 'DRIVER');
INSERT INTO user_account_authorities VALUES (735, 'DRIVER');
INSERT INTO user_account_authorities VALUES (736, 'DRIVER');
INSERT INTO user_account_authorities VALUES (737, 'DRIVER');
INSERT INTO user_account_authorities VALUES (738, 'DRIVER');
INSERT INTO user_account_authorities VALUES (739, 'DRIVER');
INSERT INTO user_account_authorities VALUES (740, 'DRIVER');
INSERT INTO user_account_authorities VALUES (741, 'DRIVER');
INSERT INTO user_account_authorities VALUES (742, 'DRIVER');
INSERT INTO user_account_authorities VALUES (743, 'DRIVER');
INSERT INTO user_account_authorities VALUES (744, 'DRIVER');
INSERT INTO user_account_authorities VALUES (745, 'DRIVER');
INSERT INTO user_account_authorities VALUES (746, 'DRIVER');
INSERT INTO user_account_authorities VALUES (747, 'DRIVER');
INSERT INTO user_account_authorities VALUES (748, 'DRIVER');
INSERT INTO user_account_authorities VALUES (749, 'DRIVER');
INSERT INTO user_account_authorities VALUES (750, 'DRIVER');
INSERT INTO user_account_authorities VALUES (751, 'DRIVER');
INSERT INTO user_account_authorities VALUES (752, 'DRIVER');
INSERT INTO user_account_authorities VALUES (753, 'DRIVER');
INSERT INTO user_account_authorities VALUES (754, 'DRIVER');
INSERT INTO user_account_authorities VALUES (755, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (756, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (757, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (758, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (759, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (760, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (761, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (762, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (763, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (764, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (765, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (766, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (767, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (768, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (769, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (770, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (771, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (772, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (773, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (774, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (775, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (776, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (777, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (778, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (779, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (780, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (781, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (782, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (783, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (784, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (785, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (786, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (787, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (788, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (789, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (790, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (791, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (792, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (793, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (794, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (795, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (796, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (797, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (798, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (799, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (800, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (801, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (802, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (803, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (804, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (805, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (806, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (807, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (808, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (809, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (810, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (811, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (812, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (813, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (814, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (815, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (816, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (817, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (818, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (819, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (820, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (821, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (822, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (823, 'PASSENGER');
INSERT INTO user_account_authorities VALUES (824, 'PASSENGER');


--
-- TOC entry 2035 (class 0 OID 49601)
-- Dependencies: 181
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO vehicle VALUES (925, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 825);
INSERT INTO vehicle VALUES (926, 0, ' ', 'https://www.grupocompostela.com/Archivos/Fotos/Coches_fotos/tumb/7444cliodci70cvblanco10-1280x720.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 826);
INSERT INTO vehicle VALUES (927, 0, ' ', 'https://www.coches123.es/projects/coches123/Coches123/resources/images/vehicles/39972/renault-clio-en-caceres1.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 827);
INSERT INTO vehicle VALUES (928, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 828);
INSERT INTO vehicle VALUES (929, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 829);
INSERT INTO vehicle VALUES (930, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 830);
INSERT INTO vehicle VALUES (931, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 831);
INSERT INTO vehicle VALUES (932, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 832);
INSERT INTO vehicle VALUES (933, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 833);
INSERT INTO vehicle VALUES (934, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 834);
INSERT INTO vehicle VALUES (935, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 835);
INSERT INTO vehicle VALUES (936, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 836);
INSERT INTO vehicle VALUES (937, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 837);
INSERT INTO vehicle VALUES (938, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 838);
INSERT INTO vehicle VALUES (939, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 839);
INSERT INTO vehicle VALUES (940, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 840);
INSERT INTO vehicle VALUES (941, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 841);
INSERT INTO vehicle VALUES (942, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 842);
INSERT INTO vehicle VALUES (943, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 843);
INSERT INTO vehicle VALUES (944, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 844);
INSERT INTO vehicle VALUES (945, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 845);
INSERT INTO vehicle VALUES (946, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 846);
INSERT INTO vehicle VALUES (947, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 847);
INSERT INTO vehicle VALUES (948, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 848);
INSERT INTO vehicle VALUES (949, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 849);
INSERT INTO vehicle VALUES (950, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 850);
INSERT INTO vehicle VALUES (951, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 851);
INSERT INTO vehicle VALUES (952, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 852);
INSERT INTO vehicle VALUES (953, 0, ' ', 'https://d1eip2zddc2vdv.cloudfront.net/dphotos/750x400/15322-1528195107.jpg', 'Clio', 'AB1234XY', 5, 0, 'Renault', 853);
INSERT INTO vehicle VALUES (954, 0, ' ', 'https://www.motofichas.com//images/phocagallery/Kwang_Yang_Motor_Co/Agility_City_125_2016/01-kymco-agility-city-125-2016-estatica.jpg', 'Agility', 'AB1234XY', 2, 1, 'Kymco', 854);


--
-- TOC entry 1980 (class 2606 OID 49523)
-- Name: actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- TOC entry 1982 (class 2606 OID 49531)
-- Name: administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (id);


--
-- TOC entry 1984 (class 2606 OID 49536)
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 1986 (class 2606 OID 49541)
-- Name: control_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY control_point
    ADD CONSTRAINT control_point_pkey PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 49549)
-- Name: driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 49554)
-- Name: folder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY folder
    ADD CONSTRAINT folder_pkey PRIMARY KEY (id);


--
-- TOC entry 1992 (class 2606 OID 49565)
-- Name: letter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY letter
    ADD CONSTRAINT letter_pkey PRIMARY KEY (id);


--
-- TOC entry 1994 (class 2606 OID 49573)
-- Name: passenger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id);


--
-- TOC entry 1996 (class 2606 OID 49581)
-- Name: reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- TOC entry 1998 (class 2606 OID 49589)
-- Name: route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- TOC entry 2000 (class 2606 OID 49610)
-- Name: uk_castjbvpeeus0r8lbpehiu0e4; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT uk_castjbvpeeus0r8lbpehiu0e4 UNIQUE (username);


--
-- TOC entry 2002 (class 2606 OID 49597)
-- Name: user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- TOC entry 2004 (class 2606 OID 49608)
-- Name: vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- TOC entry 2006 (class 2606 OID 49616)
-- Name: fk_7ohwsa2usmvu0yxb44je2lge; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrator
    ADD CONSTRAINT fk_7ohwsa2usmvu0yxb44je2lge FOREIGN KEY (user_account) REFERENCES user_account(id);


--
-- TOC entry 2015 (class 2606 OID 49661)
-- Name: fk_89ybpmvuu58cqappc2xh352n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY passenger
    ADD CONSTRAINT fk_89ybpmvuu58cqappc2xh352n FOREIGN KEY (user_account) REFERENCES user_account(id);


--
-- TOC entry 2007 (class 2606 OID 49621)
-- Name: fk_98rnmdie3oie8dg1yqol90hdr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_98rnmdie3oie8dg1yqol90hdr FOREIGN KEY (driver) REFERENCES driver(id);


--
-- TOC entry 2016 (class 2606 OID 49666)
-- Name: fk_aky1e3gwolgvmuvvnx4jufrc0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT fk_aky1e3gwolgvmuvvnx4jufrc0 FOREIGN KEY (passenger) REFERENCES passenger(id);


--
-- TOC entry 2018 (class 2606 OID 49676)
-- Name: fk_dffo7urokcw2cn9r0r6lt55qr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_dffo7urokcw2cn9r0r6lt55qr FOREIGN KEY (driver) REFERENCES driver(id);


--
-- TOC entry 2009 (class 2606 OID 49631)
-- Name: fk_ektg0a1h57bv6nhuyjygxon0u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_ektg0a1h57bv6nhuyjygxon0u FOREIGN KEY (route) REFERENCES route(id);


--
-- TOC entry 2005 (class 2606 OID 49611)
-- Name: fk_i7xei45auwq1f6vu25985riuh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT fk_i7xei45auwq1f6vu25985riuh FOREIGN KEY (user_account) REFERENCES user_account(id);


--
-- TOC entry 2011 (class 2606 OID 49641)
-- Name: fk_io5y53xvplfwhg963q7gkqfrf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY driver
    ADD CONSTRAINT fk_io5y53xvplfwhg963q7gkqfrf FOREIGN KEY (user_account) REFERENCES user_account(id);


--
-- TOC entry 2021 (class 2606 OID 49691)
-- Name: fk_nag238mutkrwt14u74eaeolr8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehicle
    ADD CONSTRAINT fk_nag238mutkrwt14u74eaeolr8 FOREIGN KEY (driver) REFERENCES driver(id);


--
-- TOC entry 2013 (class 2606 OID 49651)
-- Name: fk_p4c0hkadh5uwpdsjbyqfkauak; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY folder_messages
    ADD CONSTRAINT fk_p4c0hkadh5uwpdsjbyqfkauak FOREIGN KEY (folder) REFERENCES folder(id);


--
-- TOC entry 2020 (class 2606 OID 49686)
-- Name: fk_pao8cwh93fpccb0bx6ilq6gsl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_account_authorities
    ADD CONSTRAINT fk_pao8cwh93fpccb0bx6ilq6gsl FOREIGN KEY (user_account) REFERENCES user_account(id);


--
-- TOC entry 2012 (class 2606 OID 49646)
-- Name: fk_pd7js9rp0nie7ft4b2ltq7jx0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY folder_messages
    ADD CONSTRAINT fk_pd7js9rp0nie7ft4b2ltq7jx0 FOREIGN KEY (messages) REFERENCES letter(id);


--
-- TOC entry 2019 (class 2606 OID 49681)
-- Name: fk_quglivso3l8v25vtwv9x3592; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY route
    ADD CONSTRAINT fk_quglivso3l8v25vtwv9x3592 FOREIGN KEY (vehicle) REFERENCES vehicle(id);


--
-- TOC entry 2014 (class 2606 OID 49656)
-- Name: fk_rf9130814jneq8lvkefpr7ux3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY letter
    ADD CONSTRAINT fk_rf9130814jneq8lvkefpr7ux3 FOREIGN KEY (folder) REFERENCES folder(id);


--
-- TOC entry 2008 (class 2606 OID 49626)
-- Name: fk_s5e5esct5k89my48q1bwwtgeq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk_s5e5esct5k89my48q1bwwtgeq FOREIGN KEY (passenger) REFERENCES passenger(id);


--
-- TOC entry 2017 (class 2606 OID 49671)
-- Name: fk_sxm5ki53gmtiydmgspnpemu4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT fk_sxm5ki53gmtiydmgspnpemu4e FOREIGN KEY (route) REFERENCES route(id);


--
-- TOC entry 2010 (class 2606 OID 49636)
-- Name: fk_taegm7kl65r8306gof05rwly5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY control_point
    ADD CONSTRAINT fk_taegm7kl65r8306gof05rwly5 FOREIGN KEY (route) REFERENCES route(id);


--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--



