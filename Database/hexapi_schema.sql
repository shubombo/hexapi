--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.0

-- Started on 2018-01-20 15:02:47

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
-- TOC entry 2956 (class 0 OID 0)
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
-- TOC entry 198 (class 1259 OID 16390)
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
-- TOC entry 199 (class 1259 OID 16394)
-- Name: GameData; Type: TABLE; Schema: auction; Owner: postgres
--

CREATE TABLE "GameData" (
  "GameDataId" bigint NOT NULL,
  "Uuid" uuid NOT NULL,
  "Atk" integer,
  "SocketCount" integer NOT NULL,
  "Artist" character varying,
  "Name" character varying NOT NULL,
  "Faction" character varying,
  "Color" character varying,
  "Rarity" character varying,
  "SetNumber" character varying,
  "Cost" integer,
  "Health" integer,
  "Text" character varying,
  "SubType" text,
  "Type" jsonb,
  "EquipmentUuids" jsonb,
  "WildThresholdCount" integer,
  "BloodThresholdCount" integer,
  "RubyThresholdCount" integer,
  "SapphireThresholdCount" integer,
  "DiamondThresholdCount" integer
);


ALTER TABLE "GameData" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16400)
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
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 200
-- Name: GameData_GameDataId_seq; Type: SEQUENCE OWNED BY; Schema: auction; Owner: postgres
--

ALTER SEQUENCE "GameData_GameDataId_seq" OWNED BY "GameData"."GameDataId";


--
-- TOC entry 201 (class 1259 OID 16402)
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
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 201
-- Name: auction_AuctionEventId_seq; Type: SEQUENCE OWNED BY; Schema: auction; Owner: postgres
--

ALTER SEQUENCE "auction_AuctionEventId_seq" OWNED BY "AuctionEvents"."AuctionEventId";


SET search_path = public, pg_catalog;

--
-- TOC entry 204 (class 1259 OID 16420)
-- Name: AuctionEvents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AuctionEvents" (
    "AuctionEventId" bigint NOT NULL,
    "AuctionId" bigint NOT NULL,
    "Item" uuid NOT NULL,
    "GoldBuyout" bigint NOT NULL,
    "Actor" bigint NOT NULL,
    "PlatBuyout" bigint NOT NULL,
    "Action" text NOT NULL,
    "GoldBid" bigint NOT NULL,
    "PlatBid" bigint NOT NULL,
    "CreateDate" date,
    "MessageId" uuid NOT NULL
);


ALTER TABLE "AuctionEvents" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16418)
-- Name: AuctionEvents_AuctionEventId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "AuctionEvents_AuctionEventId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AuctionEvents_AuctionEventId_seq" OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 203
-- Name: AuctionEvents_AuctionEventId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "AuctionEvents_AuctionEventId_seq" OWNED BY "AuctionEvents"."AuctionEventId";


--
-- TOC entry 205 (class 1259 OID 16429)
-- Name: AuctionMessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AuctionMessages" (
    "MessageId" uuid NOT NULL,
    "MessageType" text NOT NULL,
    "MessageTime" date NOT NULL,
    "CreateDate" date
);


ALTER TABLE "AuctionMessages" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16439)
-- Name: DeckMains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "DeckMains" (
    "DeckMainId" bigint NOT NULL,
    "DeckId" bigint NOT NULL,
    "DeckMainJson" json NOT NULL,
    "CreateDate" date
);


ALTER TABLE "DeckMains" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16437)
-- Name: DeckMains_DeckMainId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DeckMains_DeckMainId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DeckMains_DeckMainId_seq" OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 206
-- Name: DeckMains_DeckMainId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "DeckMains_DeckMainId_seq" OWNED BY "DeckMains"."DeckMainId";


--
-- TOC entry 209 (class 1259 OID 16450)
-- Name: DeckSideBoards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "DeckSideBoards" (
    "DeckSideBoardId" bigint NOT NULL,
    "DeckId" bigint NOT NULL,
    "DeckSideBoardJson" json NOT NULL,
    "CreateDate" date
);


ALTER TABLE "DeckSideBoards" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16448)
-- Name: DeckSideBoards_DeckSideBoardId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DeckSideBoards_DeckSideBoardId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DeckSideBoards_DeckSideBoardId_seq" OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 208
-- Name: DeckSideBoards_DeckSideBoardId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "DeckSideBoards_DeckSideBoardId_seq" OWNED BY "DeckSideBoards"."DeckSideBoardId";


--
-- TOC entry 211 (class 1259 OID 16461)
-- Name: Decks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Decks" (
    "DeckId" bigint NOT NULL,
    "Champion" uuid NOT NULL,
    "CreateDate" date
);


ALTER TABLE "Decks" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16459)
-- Name: Decks_DeckId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Decks_DeckId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Decks_DeckId_seq" OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 210
-- Name: Decks_DeckId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Decks_DeckId_seq" OWNED BY "Decks"."DeckId";


--
-- TOC entry 213 (class 1259 OID 16469)
-- Name: TournamentDecks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "TournamentDecks" (
    "TournamentDeckId" bigint NOT NULL,
    "TournamentMatchId" bigint NOT NULL,
    "TournamentGameId" bigint NOT NULL,
    "TournamentId" uuid NOT NULL,
    "Player" bigint NOT NULL,
    "CreateDate" date
);


ALTER TABLE "TournamentDecks" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16467)
-- Name: TournamentDecks_TournamentDeckId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "TournamentDecks_TournamentDeckId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "TournamentDecks_TournamentDeckId_seq" OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 212
-- Name: TournamentDecks_TournamentDeckId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "TournamentDecks_TournamentDeckId_seq" OWNED BY "TournamentDecks"."TournamentDeckId";


--
-- TOC entry 215 (class 1259 OID 16477)
-- Name: TournamentGames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "TournamentGames" (
    "TournamentGameId" bigint NOT NULL,
    "TournamentId" uuid NOT NULL,
    "Round" bigint NOT NULL,
    "CreateDate" date
);


ALTER TABLE "TournamentGames" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16475)
-- Name: TournamentGames_TournamentGameId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "TournamentGames_TournamentGameId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "TournamentGames_TournamentGameId_seq" OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 214
-- Name: TournamentGames_TournamentGameId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "TournamentGames_TournamentGameId_seq" OWNED BY "TournamentGames"."TournamentGameId";


--
-- TOC entry 217 (class 1259 OID 16485)
-- Name: TournamentMatches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "TournamentMatches" (
    "TournamentMatchId" bigint NOT NULL,
    "TournamentGameId" bigint NOT NULL,
    "TournamentId" uuid NOT NULL,
    "PlayerOne" bigint NOT NULL,
    "PlayerTwo" bigint NOT NULL,
    "PlayerOneWins" bigint NOT NULL,
    "PlayerTwoWins" bigint NOT NULL,
    "CreateDate" date
);


ALTER TABLE "TournamentMatches" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16483)
-- Name: TournamentMatches_TournamentMatchId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "TournamentMatches_TournamentMatchId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "TournamentMatches_TournamentMatchId_seq" OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 216
-- Name: TournamentMatches_TournamentMatchId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "TournamentMatches_TournamentMatchId_seq" OWNED BY "TournamentMatches"."TournamentMatchId";


--
-- TOC entry 218 (class 1259 OID 16506)
-- Name: TournamentMessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "TournamentMessages" (
    "MessageId" uuid NOT NULL,
    "MessageType" text NOT NULL,
    "TournamentTime" date NOT NULL,
    "TournamentId" bigint NOT NULL,
    "TournamentType" text NOT NULL,
    "CreateDate" date
);


ALTER TABLE "TournamentMessages" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16413)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO postgres;

SET search_path = auction, pg_catalog;

--
-- TOC entry 2797 (class 2604 OID 16404)
-- Name: AuctionEvents AuctionEventId; Type: DEFAULT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "AuctionEvents" ALTER COLUMN "AuctionEventId" SET DEFAULT nextval('"auction_AuctionEventId_seq"'::regclass);


--
-- TOC entry 2799 (class 2604 OID 16405)
-- Name: GameData GameDataId; Type: DEFAULT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "GameData" ALTER COLUMN "GameDataId" SET DEFAULT nextval('"GameData_GameDataId_seq"'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2800 (class 2604 OID 16423)
-- Name: AuctionEvents AuctionEventId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AuctionEvents" ALTER COLUMN "AuctionEventId" SET DEFAULT nextval('"AuctionEvents_AuctionEventId_seq"'::regclass);


--
-- TOC entry 2801 (class 2604 OID 16442)
-- Name: DeckMains DeckMainId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DeckMains" ALTER COLUMN "DeckMainId" SET DEFAULT nextval('"DeckMains_DeckMainId_seq"'::regclass);


--
-- TOC entry 2802 (class 2604 OID 16453)
-- Name: DeckSideBoards DeckSideBoardId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DeckSideBoards" ALTER COLUMN "DeckSideBoardId" SET DEFAULT nextval('"DeckSideBoards_DeckSideBoardId_seq"'::regclass);


--
-- TOC entry 2803 (class 2604 OID 16464)
-- Name: Decks DeckId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Decks" ALTER COLUMN "DeckId" SET DEFAULT nextval('"Decks_DeckId_seq"'::regclass);


--
-- TOC entry 2804 (class 2604 OID 16472)
-- Name: TournamentDecks TournamentDeckId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "TournamentDecks" ALTER COLUMN "TournamentDeckId" SET DEFAULT nextval('"TournamentDecks_TournamentDeckId_seq"'::regclass);


--
-- TOC entry 2805 (class 2604 OID 16480)
-- Name: TournamentGames TournamentGameId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "TournamentGames" ALTER COLUMN "TournamentGameId" SET DEFAULT nextval('"TournamentGames_TournamentGameId_seq"'::regclass);


--
-- TOC entry 2806 (class 2604 OID 16488)
-- Name: TournamentMatches TournamentMatchId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "TournamentMatches" ALTER COLUMN "TournamentMatchId" SET DEFAULT nextval('"TournamentMatches_TournamentMatchId_seq"'::regclass);


SET search_path = auction, pg_catalog;

--
-- TOC entry 2808 (class 2606 OID 16407)
-- Name: AuctionMessages AuctionMessages_pkey; Type: CONSTRAINT; Schema: auction; Owner: postgres
--

ALTER TABLE ONLY "AuctionMessages"
    ADD CONSTRAINT "AuctionMessages_pkey" PRIMARY KEY ("MessageId");


SET search_path = public, pg_catalog;

--
-- TOC entry 2812 (class 2606 OID 16428)
-- Name: AuctionEvents AuctionEvents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AuctionEvents"
    ADD CONSTRAINT "AuctionEvents_pkey" PRIMARY KEY ("AuctionEventId");


--
-- TOC entry 2814 (class 2606 OID 16436)
-- Name: AuctionMessages AuctionMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--


ALTER TABLE ONLY "AuctionMessages"
    ADD CONSTRAINT "AuctionMessages_pkey" PRIMARY KEY ("MessageId");


--
-- TOC entry 2816 (class 2606 OID 16447)
-- Name: DeckMains DeckMains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DeckMains"
    ADD CONSTRAINT "DeckMains_pkey" PRIMARY KEY ("DeckMainId");


--
-- TOC entry 2818 (class 2606 OID 16458)
-- Name: DeckSideBoards DeckSideBoards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DeckSideBoards"
    ADD CONSTRAINT "DeckSideBoards_pkey" PRIMARY KEY ("DeckSideBoardId");


--
-- TOC entry 2820 (class 2606 OID 16466)
-- Name: Decks Decks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Decks"
    ADD CONSTRAINT "Decks_pkey" PRIMARY KEY ("DeckId");


--
-- TOC entry 2822 (class 2606 OID 16474)
-- Name: TournamentDecks TournamentDecks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "TournamentDecks"
    ADD CONSTRAINT "TournamentDecks_pkey" PRIMARY KEY ("TournamentDeckId");


--
-- TOC entry 2824 (class 2606 OID 16482)
-- Name: TournamentGames TournamentGames_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "TournamentGames"
    ADD CONSTRAINT "TournamentGames_pkey" PRIMARY KEY ("TournamentGameId");


--
-- TOC entry 2826 (class 2606 OID 16490)
-- Name: TournamentMatches TournamentMatches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "TournamentMatches"
    ADD CONSTRAINT "TournamentMatches_pkey" PRIMARY KEY ("TournamentMatchId");


--
-- TOC entry 2828 (class 2606 OID 16513)
-- Name: TournamentMessages TournamentMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "TournamentMessages"
    ADD CONSTRAINT "TournamentMessages_pkey" PRIMARY KEY ("MessageId");


--
-- TOC entry 2810 (class 2606 OID 16417)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


-- Completed on 2018-01-20 15:02:47

--
-- PostgreSQL database dump complete
--
