--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15 (Ubuntu 11.15-1.pgdg20.04+1)
-- Dumped by pg_dump version 11.15 (Ubuntu 11.15-1.pgdg20.04+1)

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
-- Name: main; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA main;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dim_calendario; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.dim_calendario (
    data date NOT NULL,
    mes integer,
    ano integer
);


--
-- Name: dim_linha_produto; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.dim_linha_produto (
    id integer NOT NULL,
    nome text,
    perfil text
);


--
-- Name: dim_pdv; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.dim_pdv (
    id integer NOT NULL,
    nome text,
    perfil text
);


--
-- Name: ft_disponibilidade; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.ft_disponibilidade (
    mes integer,
    fk_linha_produto integer,
    id_ponto_extra integer NOT NULL,
    total_ponto_extra integer
);


--
-- Name: COLUMN ft_disponibilidade.id_ponto_extra; Type: COMMENT; Schema: main; Owner: -
--

COMMENT ON COLUMN main.ft_disponibilidade.id_ponto_extra IS 'Chave composta
mes+fk_linha_produto';


--
-- Name: ft_disponibilidade_agregada; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.ft_disponibilidade_agregada (
    mes integer,
    fk_linha_produto integer,
    fk_pdv integer,
    id_disponibilidade_agregada integer NOT NULL,
    quantidade_disponibilidade integer
);


--
-- Name: COLUMN ft_disponibilidade_agregada.id_disponibilidade_agregada; Type: COMMENT; Schema: main; Owner: -
--

COMMENT ON COLUMN main.ft_disponibilidade_agregada.id_disponibilidade_agregada IS 'Chave composta
mes+fk_pdv+fk_linha_produto';


--
-- Name: ft_ponto_extra; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.ft_ponto_extra (
    mes integer,
    fk_linha_produto integer,
    id_ponto_extra integer NOT NULL,
    total_ponto_extra integer
);


--
-- Name: COLUMN ft_ponto_extra.id_ponto_extra; Type: COMMENT; Schema: main; Owner: -
--

COMMENT ON COLUMN main.ft_ponto_extra.id_ponto_extra IS 'Chave composta
mes+fk_linha_produto';


--
-- Name: ft_ponto_extra_agregada; Type: TABLE; Schema: main; Owner: -
--

CREATE TABLE main.ft_ponto_extra_agregada (
    mes integer,
    fk_linha_produto integer,
    fk_pdv integer,
    id_ponto_extra_agregada integer NOT NULL,
    total_ponto_extra integer
);


--
-- Name: COLUMN ft_ponto_extra_agregada.id_ponto_extra_agregada; Type: COMMENT; Schema: main; Owner: -
--

COMMENT ON COLUMN main.ft_ponto_extra_agregada.id_ponto_extra_agregada IS 'Chave composta
mes+fk_pdv+fk_linha_produto';


--
-- Data for Name: dim_calendario; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.dim_calendario (data, mes, ano) FROM stdin;
2020-09-01	9	2020
2020-09-02	9	2020
2020-09-03	9	2020
2020-09-04	9	2020
2020-09-05	9	2020
2020-09-06	9	2020
2020-09-07	9	2020
2020-09-08	9	2020
2020-09-09	9	2020
2020-09-10	9	2020
2020-09-11	9	2020
2020-09-12	9	2020
2020-09-13	9	2020
2020-09-14	9	2020
2020-09-15	9	2020
2020-09-16	9	2020
2020-09-17	9	2020
2020-09-18	9	2020
2020-09-19	9	2020
2020-09-20	9	2020
\.


--
-- Data for Name: dim_linha_produto; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.dim_linha_produto (id, nome, perfil) FROM stdin;
398	INVOLVES ZERO	BISCOITOS SORTIDOS
407	INVOLVES ZERO	MARGARINA
408	INVOLVES ZERO	MANTEIGA
422	INVOLVES ZERO	LEITE EM PO
423	INVOLVES ZERO	MAISENA
\.


--
-- Data for Name: dim_pdv; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.dim_pdv (id, nome, perfil) FROM stdin;
115	INVOLVES	ATACADAO
116	INVOLVES STAGE	VAREJISTA
\.


--
-- Data for Name: ft_disponibilidade; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.ft_disponibilidade (mes, fk_linha_produto, id_ponto_extra, total_ponto_extra) FROM stdin;
9	398	9398	2
9	407	9407	3
9	408	9408	1
9	422	9422	3
9	423	9423	2
\.


--
-- Data for Name: ft_disponibilidade_agregada; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.ft_disponibilidade_agregada (mes, fk_linha_produto, fk_pdv, id_disponibilidade_agregada, quantidade_disponibilidade) FROM stdin;
9	422	115	9115422	1
9	422	116	9116422	2
9	423	115	9115423	2
9	398	115	9115398	2
9	407	115	9115407	1
9	407	116	9116407	2
9	408	115	9115408	1
\.


--
-- Data for Name: ft_ponto_extra; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.ft_ponto_extra (mes, fk_linha_produto, id_ponto_extra, total_ponto_extra) FROM stdin;
9	398	9398	11
9	407	9407	10
9	408	9408	11
9	422	9422	12
9	423	9423	3
\.


--
-- Data for Name: ft_ponto_extra_agregada; Type: TABLE DATA; Schema: main; Owner: -
--

COPY main.ft_ponto_extra_agregada (mes, fk_linha_produto, fk_pdv, id_ponto_extra_agregada, total_ponto_extra) FROM stdin;
9	423	116	9116423	3
9	422	115	9115422	5
9	422	116	9116422	7
9	398	116	9116398	7
9	423	115	9115423	0
9	408	116	9116408	4
9	398	115	9115398	4
9	407	115	9115407	6
9	407	116	9116407	4
9	408	115	9115408	7
\.


--
-- Name: dim_calendario dim_calendario_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.dim_calendario
    ADD CONSTRAINT dim_calendario_pkey PRIMARY KEY (data);


--
-- Name: dim_linha_produto dim_linha_produto_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.dim_linha_produto
    ADD CONSTRAINT dim_linha_produto_pkey PRIMARY KEY (id);


--
-- Name: dim_pdv dim_pdv_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.dim_pdv
    ADD CONSTRAINT dim_pdv_pkey PRIMARY KEY (id);


--
-- Name: ft_ponto_extra_agregada ft_disponibilidade_agregada_copy1_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_ponto_extra_agregada
    ADD CONSTRAINT ft_disponibilidade_agregada_copy1_pkey PRIMARY KEY (id_ponto_extra_agregada);


--
-- Name: ft_disponibilidade_agregada ft_disponibilidade_agregada_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_disponibilidade_agregada
    ADD CONSTRAINT ft_disponibilidade_agregada_pkey PRIMARY KEY (id_disponibilidade_agregada);


--
-- Name: ft_ponto_extra ft_disponibilidade_copy1_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_ponto_extra
    ADD CONSTRAINT ft_disponibilidade_copy1_pkey PRIMARY KEY (id_ponto_extra);


--
-- Name: ft_disponibilidade ft_disponibilidade_pkey; Type: CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_disponibilidade
    ADD CONSTRAINT ft_disponibilidade_pkey PRIMARY KEY (id_ponto_extra);


--
-- Name: ft_disponibilidade_agregada fk_linha_produto; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_disponibilidade_agregada
    ADD CONSTRAINT fk_linha_produto FOREIGN KEY (fk_linha_produto) REFERENCES main.dim_linha_produto(id);


--
-- Name: ft_disponibilidade fk_linha_produto; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_disponibilidade
    ADD CONSTRAINT fk_linha_produto FOREIGN KEY (fk_linha_produto) REFERENCES main.dim_linha_produto(id);


--
-- Name: ft_disponibilidade_agregada fk_ponto_venda; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_disponibilidade_agregada
    ADD CONSTRAINT fk_ponto_venda FOREIGN KEY (fk_pdv) REFERENCES main.dim_pdv(id);


--
-- Name: ft_ponto_extra_agregada ft_disponibilidade_agregada_copy1_fk_linha_produto_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_ponto_extra_agregada
    ADD CONSTRAINT ft_disponibilidade_agregada_copy1_fk_linha_produto_fkey FOREIGN KEY (fk_linha_produto) REFERENCES main.dim_linha_produto(id);


--
-- Name: ft_ponto_extra_agregada ft_disponibilidade_agregada_copy1_fk_pdv_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_ponto_extra_agregada
    ADD CONSTRAINT ft_disponibilidade_agregada_copy1_fk_pdv_fkey FOREIGN KEY (fk_pdv) REFERENCES main.dim_pdv(id);


--
-- Name: ft_ponto_extra ft_disponibilidade_copy1_fk_linha_produto_fkey; Type: FK CONSTRAINT; Schema: main; Owner: -
--

ALTER TABLE ONLY main.ft_ponto_extra
    ADD CONSTRAINT ft_disponibilidade_copy1_fk_linha_produto_fkey FOREIGN KEY (fk_linha_produto) REFERENCES main.dim_linha_produto(id);


--
-- PostgreSQL database dump complete
--

