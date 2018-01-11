--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.0

-- Started on 2018-01-10 22:07:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 16408)
-- Name: auction; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auction;


ALTER SCHEMA auction OWNER TO postgres;

SET search_path = auction, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16409)
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
-- TOC entry 203 (class 1259 OID 16413)
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
-- TOC entry 204 (class 1259 OID 16417)
-- Name: GameData; Type: TABLE; Schema: auction; Owner: postgres
--

CREATE TABLE "GameData" (
    "SetNumber" character varying NOT NULL,
    "Name" character varying NOT NULL,
    "Rarity" character varying NOT NULL,
    "Color" character varying NOT NULL,
    "SubType" character varying NOT NULL,
    "Faction" character varying NOT NULL,
    "SocketCount" character varying NOT NULL,
    "Threshold" character varying NOT NULL,
    "ATK" character varying NOT NULL,
    "Health" character varying NOT NULL,
    "Uuid" character varying NOT NULL,
    "Artist" character varying NOT NULL,
    "GameDataId" bigint NOT NULL,
    "Text" character varying NOT NULL,
    "Cost" character varying,
    "Type" jsonb NOT NULL,
    "EquipmentUuids" jsonb NOT NULL,
    "WildThresholdCount" character varying,
    "BloodThresholdCount" character varying,
    "RubyThresholdCount" character varying,
    "SapphireThresholdCount" character varying,
    "DiamondThresholdCount" character varying
);


ALTER TABLE "GameData" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16423)
-- Name: GameData_GameDataId_seq; Type: SEQUENCE; Schema: auction; Owner: postgres
--

CREATE SEQUENCE "GameData_GameDataId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "GameData_GameDataId_seq" OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 205
-- Name: GameData_GameDataId_seq; Type: SEQUENCE OWNED BY; Schema: auction; Owner: postgres
--

ALTER SEQUENCE "GameData_GameDataId_seq" OWNED BY "GameData"."GameDataId";


--
-- TOC entry 206 (class 1259 OID 16425)
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
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 206
-- Name: auction_AuctionEventId_seq; Type: SEQUENCE OWNED BY; Schema: auction; Owner: postgres
--

ALTER SEQUENCE "auction_AuctionEventId_seq" OWNED BY "AuctionEvents"."AuctionEventId";


--
-- TOC entry 2752 (class 2604 OID 16427)
-- Name: AuctionEvents AuctionEventId; Type: DEFAULT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "AuctionEvents" ALTER COLUMN "AuctionEventId" SET DEFAULT nextval('"auction_AuctionEventId_seq"'::regclass);


--
-- TOC entry 2754 (class 2604 OID 16428)
-- Name: GameData GameDataId; Type: DEFAULT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "GameData" ALTER COLUMN "GameDataId" SET DEFAULT nextval('"GameData_GameDataId_seq"'::regclass);


--
-- TOC entry 2756 (class 2606 OID 16430)
-- Name: AuctionMessages AuctionMessages_pkey; Type: CONSTRAINT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "AuctionMessages"
    ADD CONSTRAINT "AuctionMessages_pkey" PRIMARY KEY ("MessageId");


-- Completed on 2018-01-10 22:07:19

--
-- PostgreSQL database dump complete
--

