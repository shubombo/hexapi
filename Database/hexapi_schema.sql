--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.0

-- Started on 2018-01-04 21:54:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16385)
-- Name: auction; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auction;


ALTER SCHEMA auction OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12980)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = auction, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16386)
-- Name: AuctionEvents; Type: TABLE; Schema: auction; Owner: postgres
--

CREATE TABLE "AuctionEvents" (
    "AuctionId" bigint NOT NULL,
    "Item" uuid NOT NULL,
    "GoldBuyout" bigint NOT NULL,
    "Actor" bigint NOT NULL,
    "PlatBuyout" bigint NOT NULL,
    "Action" character varying(20) NOT NULL,
    "GoldBid" bigint NOT NULL,
    "PlatBid" bigint NOT NULL,
    "CreateDate" date DEFAULT CURRENT_DATE NOT NULL,
    "MessageId" uuid NOT NULL,
    "AuctionEventId" bigint NOT NULL
);


ALTER TABLE "AuctionEvents" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16398)
-- Name: AuctionMessages; Type: TABLE; Schema: auction; Owner: postgres
--

CREATE TABLE "AuctionMessages" (
    "MessageId" uuid NOT NULL,
    "MessageType" character varying(20) NOT NULL,
    "MessageTime" date NOT NULL,
    "CreateDate" date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE "AuctionMessages" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16392)
-- Name: auction_AuctionEventId_seq; Type: SEQUENCE; Schema: auction; Owner: postgres
--

CREATE SEQUENCE "auction_AuctionEventId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "auction_AuctionEventId_seq" OWNER TO postgres;

--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 198
-- Name: auction_AuctionEventId_seq; Type: SEQUENCE OWNED BY; Schema: auction; Owner: postgres
--

ALTER SEQUENCE "auction_AuctionEventId_seq" OWNED BY "AuctionEvents"."AuctionEventId";


--
-- TOC entry 2731 (class 2604 OID 16394)
-- Name: AuctionEvents AuctionEventId; Type: DEFAULT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "AuctionEvents" ALTER COLUMN "AuctionEventId" SET DEFAULT nextval('"auction_AuctionEventId_seq"'::regclass);


--
-- TOC entry 2734 (class 2606 OID 16402)
-- Name: AuctionMessages AuctionMessages_pkey; Type: CONSTRAINT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "AuctionMessages"
    ADD CONSTRAINT "AuctionMessages_pkey" PRIMARY KEY ("MessageId");


-- Completed on 2018-01-04 21:54:23

--
-- PostgreSQL database dump complete
--

