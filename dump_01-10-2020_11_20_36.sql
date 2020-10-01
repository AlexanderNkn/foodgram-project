--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE foodgram_prod;




--
-- Drop roles
--

DROP ROLE foodgram;


--
-- Roles
--

CREATE ROLE foodgram;
ALTER ROLE foodgram WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md56a166e6f603eec3d51778901709d682d';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: foodgram
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO foodgram;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: foodgram
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: foodgram
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: foodgram
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "foodgram_prod" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: foodgram_prod; Type: DATABASE; Schema: -; Owner: foodgram
--

CREATE DATABASE foodgram_prod WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE foodgram_prod OWNER TO foodgram;

\connect foodgram_prod

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
-- Name: api_favorite; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.api_favorite (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_favorite OWNER TO foodgram;

--
-- Name: api_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.api_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_favorite_id_seq OWNER TO foodgram;

--
-- Name: api_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.api_favorite_id_seq OWNED BY public.api_favorite.id;


--
-- Name: api_purchase; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.api_purchase (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_purchase OWNER TO foodgram;

--
-- Name: api_purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.api_purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_purchase_id_seq OWNER TO foodgram;

--
-- Name: api_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.api_purchase_id_seq OWNED BY public.api_purchase.id;


--
-- Name: api_subscribe; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.api_subscribe (
    id integer NOT NULL,
    author_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_subscribe OWNER TO foodgram;

--
-- Name: api_subscribe_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.api_subscribe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_subscribe_id_seq OWNER TO foodgram;

--
-- Name: api_subscribe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.api_subscribe_id_seq OWNED BY public.api_subscribe.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO foodgram;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO foodgram;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO foodgram;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO foodgram;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO foodgram;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO foodgram;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO foodgram;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO foodgram;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO foodgram;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO foodgram;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO foodgram;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.django_flatpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO foodgram;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.django_flatpage_id_seq OWNED BY public.django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO foodgram;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.django_flatpage_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO foodgram;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.django_flatpage_sites_id_seq OWNED BY public.django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO foodgram;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO foodgram;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO foodgram;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO foodgram;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO foodgram;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: recipes_ingredient; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.recipes_ingredient (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    dimension character varying(16) NOT NULL
);


ALTER TABLE public.recipes_ingredient OWNER TO foodgram;

--
-- Name: recipes_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.recipes_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_ingredient_id_seq OWNER TO foodgram;

--
-- Name: recipes_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.recipes_ingredient_id_seq OWNED BY public.recipes_ingredient.id;


--
-- Name: recipes_ingredientamount; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.recipes_ingredientamount (
    id integer NOT NULL,
    amount numeric(6,1) NOT NULL,
    ingredient_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.recipes_ingredientamount OWNER TO foodgram;

--
-- Name: recipes_ingredientamount_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.recipes_ingredientamount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_ingredientamount_id_seq OWNER TO foodgram;

--
-- Name: recipes_ingredientamount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.recipes_ingredientamount_id_seq OWNED BY public.recipes_ingredientamount.id;


--
-- Name: recipes_recipe; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.recipes_recipe (
    id integer NOT NULL,
    title character varying(256) NOT NULL,
    duration smallint NOT NULL,
    text text NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    image character varying(100) NOT NULL,
    slug character varying(32) NOT NULL,
    author_id integer NOT NULL,
    CONSTRAINT recipes_recipe_duration_check CHECK ((duration >= 0))
);


ALTER TABLE public.recipes_recipe OWNER TO foodgram;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipe_id_seq OWNER TO foodgram;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.recipes_recipe_id_seq OWNED BY public.recipes_recipe.id;


--
-- Name: recipes_tag; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.recipes_tag (
    id integer NOT NULL,
    title character varying(10) NOT NULL,
    slug character varying(3) NOT NULL,
    color character varying(10) NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.recipes_tag OWNER TO foodgram;

--
-- Name: recipes_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.recipes_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_tag_id_seq OWNER TO foodgram;

--
-- Name: recipes_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.recipes_tag_id_seq OWNED BY public.recipes_tag.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO foodgram;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.users_user OWNER TO foodgram;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO foodgram;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO foodgram;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO foodgram;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: foodgram
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO foodgram;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foodgram
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO foodgram;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foodgram
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: api_favorite id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_favorite ALTER COLUMN id SET DEFAULT nextval('public.api_favorite_id_seq'::regclass);


--
-- Name: api_purchase id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_purchase ALTER COLUMN id SET DEFAULT nextval('public.api_purchase_id_seq'::regclass);


--
-- Name: api_subscribe id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_subscribe ALTER COLUMN id SET DEFAULT nextval('public.api_subscribe_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_flatpage id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_flatpage ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_id_seq'::regclass);


--
-- Name: django_flatpage_sites id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_sites_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: recipes_ingredient id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_ingredient ALTER COLUMN id SET DEFAULT nextval('public.recipes_ingredient_id_seq'::regclass);


--
-- Name: recipes_ingredientamount id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_ingredientamount ALTER COLUMN id SET DEFAULT nextval('public.recipes_ingredientamount_id_seq'::regclass);


--
-- Name: recipes_recipe id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_recipe ALTER COLUMN id SET DEFAULT nextval('public.recipes_recipe_id_seq'::regclass);


--
-- Name: recipes_tag id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_tag ALTER COLUMN id SET DEFAULT nextval('public.recipes_tag_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: api_favorite; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.api_favorite (id, recipe_id, user_id) FROM stdin;
27	3	1
31	2	1
33	9	1
36	6	1
38	9	3
39	7	3
40	5	3
\.


--
-- Data for Name: api_purchase; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.api_purchase (id, recipe_id, user_id) FROM stdin;
59	6	1
60	3	1
61	9	3
62	8	3
63	4	3
\.


--
-- Data for Name: api_subscribe; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.api_subscribe (id, author_id, user_id) FROM stdin;
78	2	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add подписку	4	add_subscribe
14	Can change подписку	4	change_subscribe
15	Can delete подписку	4	delete_subscribe
16	Can view подписку	4	view_subscribe
17	Can add рецепт в список покупок	5	add_purchase
18	Can change рецепт в список покупок	5	change_purchase
19	Can delete рецепт в список покупок	5	delete_purchase
20	Can view рецепт в список покупок	5	view_purchase
21	Can add избранный рецепт	6	add_favorite
22	Can change избранный рецепт	6	change_favorite
23	Can delete избранный рецепт	6	delete_favorite
24	Can view избранный рецепт	6	view_favorite
25	Can add ингредиент	7	add_ingredient
26	Can change ингредиент	7	change_ingredient
27	Can delete ингредиент	7	delete_ingredient
28	Can view ингредиент	7	view_ingredient
29	Can add кол-во ингредиента	8	add_ingredientamount
30	Can change кол-во ингредиента	8	change_ingredientamount
31	Can delete кол-во ингредиента	8	delete_ingredientamount
32	Can view кол-во ингредиента	8	view_ingredientamount
33	Can add рецепт	9	add_recipe
37	Can add тег	10	add_tag
34	Can change рецепт	9	change_recipe
35	Can delete рецепт	9	delete_recipe
36	Can view рецепт	9	view_recipe
38	Can change тег	10	change_tag
39	Can delete тег	10	delete_tag
40	Can view тег	10	view_tag
41	Can add log entry	11	add_logentry
42	Can change log entry	11	change_logentry
43	Can delete log entry	11	delete_logentry
44	Can view log entry	11	view_logentry
45	Can add content type	12	add_contenttype
46	Can change content type	12	change_contenttype
47	Can delete content type	12	delete_contenttype
48	Can view content type	12	view_contenttype
49	Can add session	13	add_session
50	Can change session	13	change_session
51	Can delete session	13	delete_session
52	Can view session	13	view_session
53	Can add kv store	14	add_kvstore
54	Can change kv store	14	change_kvstore
55	Can delete kv store	14	delete_kvstore
56	Can view kv store	14	view_kvstore
57	Can add site	15	add_site
58	Can change site	15	change_site
59	Can delete site	15	delete_site
60	Can view site	15	view_site
61	Can add flat page	16	add_flatpage
62	Can change flat page	16	change_flatpage
63	Can delete flat page	16	delete_flatpage
64	Can view flat page	16	view_flatpage
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-09-15 19:43:30.747+00	2	yadmin подписался на KotLeopold	3		4	1
2	2020-09-15 19:43:30.759+00	1	yadmin подписался на DedMoroz	3		4	1
3	2020-09-15 20:20:42.523+00	3	yadmin добавил в избранное Курица в сырном соусе "Птичье молочко"	3		6	1
4	2020-09-15 20:20:42.538+00	2	yadmin добавил в избранное Рыба жареная	3		6	1
5	2020-09-15 20:20:42.549+00	1	yadmin добавил в избранное Мясной хлеб	3		6	1
6	2020-09-15 20:20:51.71+00	5	yadmin подписался на KotLeopold	3		4	1
7	2020-09-15 20:20:51.749+00	4	yadmin подписался на Snegurochka	3		4	1
8	2020-09-15 20:20:51.761+00	3	yadmin подписался на DedMoroz	3		4	1
9	2020-09-15 20:21:01.472+00	2	yadmin добавил в покупки Рыба жареная	3		5	1
10	2020-09-15 20:21:01.573+00	1	yadmin добавил в покупки Мясной хлеб	3		5	1
11	2020-09-15 21:17:52.037+00	5	yadmin добавил в избранное Омлет	3		6	1
12	2020-09-15 21:17:52.132+00	4	yadmin добавил в избранное Мясной хлеб	3		6	1
13	2020-09-15 21:18:12.45+00	5	yadmin добавил в покупки Мясной хлеб	3		5	1
14	2020-09-15 21:18:12.503+00	4	yadmin добавил в покупки Лаваш с начинкой	3		5	1
15	2020-09-15 21:18:12.523+00	3	yadmin добавил в покупки Курица в сырном соусе "Птичье молочко"	3		5	1
16	2020-09-15 23:00:27.137+00	17	yadmin добавил в покупки Шарлотка с яблоками	3		5	1
17	2020-09-15 23:00:27.157+00	16	yadmin добавил в покупки Яичные роллы с ветчиной и авокадо	3		5	1
18	2020-09-15 23:00:27.169+00	15	yadmin добавил в покупки Омлет	3		5	1
19	2020-09-15 23:00:27.184+00	14	yadmin добавил в покупки Рыба жареная	3		5	1
20	2020-09-15 23:00:27.198+00	13	yadmin добавил в покупки Курица в сырном соусе "Птичье молочко"	3		5	1
21	2020-09-15 23:00:27.213+00	12	yadmin добавил в покупки Лаваш с начинкой	3		5	1
22	2020-09-15 23:00:27.23+00	11	yadmin добавил в покупки Итальянский обед	3		5	1
23	2020-09-15 23:00:27.245+00	10	yadmin добавил в покупки Говяжье сердце тушеное в сметане	3		5	1
24	2020-09-16 00:09:15.847+00	10	yadmin добавил в избранное Шарлотка с яблоками	3		6	1
25	2020-09-16 00:09:15.868+00	9	yadmin добавил в избранное Омлет	3		6	1
26	2020-09-16 00:09:15.881+00	7	yadmin добавил в избранное Рыба жареная	3		6	1
27	2020-09-16 00:09:15.894+00	6	yadmin добавил в избранное Мясной хлеб	3		6	1
28	2020-09-16 07:10:55.606+00	6	yadmin подписался на yadmin	3		4	1
29	2020-09-16 07:11:05.643+00	8	DedMoroz подписался на yadmin	1	[{"added": {}}]	4	1
30	2020-09-16 07:12:04.627+00	9	yadmin подписался на DedMoroz	1	[{"added": {}}]	4	1
31	2020-09-16 08:41:37.739+00	12	yadmin добавил в избранное Мясной хлеб	1	[{"added": {}}]	6	1
32	2020-09-16 09:01:21.252+00	14	yadmin добавил в избранное Лаваш с начинкой	3		6	1
33	2020-09-16 09:01:21.33+00	13	yadmin добавил в избранное Курица в сырном соусе "Птичье молочко"	3		6	1
34	2020-09-16 09:29:51.647+00	18	yadmin добавил в избранное Яичные роллы с ветчиной и авокадо	3		6	1
35	2020-09-16 09:29:51.788+00	16	yadmin добавил в избранное Итальянский обед	3		6	1
36	2020-09-16 09:31:33.787+00	21	yadmin добавил в покупки Шарлотка с яблоками	3		5	1
37	2020-09-16 09:31:33.856+00	20	yadmin добавил в покупки Яичные роллы с ветчиной и авокадо	3		5	1
38	2020-09-16 09:31:33.879+00	19	yadmin добавил в покупки Итальянский обед	3		5	1
39	2020-09-16 09:31:33.9+00	18	yadmin добавил в покупки Омлет	3		5	1
40	2020-09-16 09:38:37.26+00	9	yadmin подписался на DedMoroz	3		4	1
41	2020-09-16 09:38:37.347+00	8	DedMoroz подписался на yadmin	3		4	1
42	2020-09-16 09:38:37.396+00	7	yadmin подписался на Snegurochka	3		4	1
43	2020-09-16 10:40:22.37+00	20	yadmin добавил в избранное Рыба жареная	3		6	1
44	2020-09-16 10:40:22.449+00	19	yadmin добавил в избранное Мясной хлеб	3		6	1
45	2020-09-16 10:40:31.976+00	27	yadmin добавил в покупки Лаваш с начинкой	3		5	1
46	2020-09-16 10:40:31.994+00	26	yadmin добавил в покупки Курица в сырном соусе "Птичье молочко"	3		5	1
47	2020-09-16 10:40:32.009+00	25	yadmin добавил в покупки Мясной хлеб	3		5	1
48	2020-09-16 12:52:25.995+00	1	yadmin	2	[{"changed": {"fields": ["First name", "Last name"]}}]	3	1
49	2020-09-16 13:23:01.05+00	23	yadmin добавил в избранное Рыба жареная	3		6	1
50	2020-09-16 14:46:42.308+00	13	yadmin подписался на KotLeopold	1	[{"added": {}}]	4	1
51	2020-09-16 14:46:51.388+00	14	yadmin подписался на DedMoroz	1	[{"added": {}}]	4	1
52	2020-09-16 17:31:33.102+00	26	yadmin подписался на DedMoroz	3		4	1
53	2020-09-16 17:31:33.193+00	24	yadmin подписался на KotLeopold	3		4	1
54	2020-09-17 07:20:43.96+00	9	Мясной хлеб	2	[{"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041c\\u044f\\u0441\\u043d\\u043e\\u0439 \\u0445\\u043b\\u0435\\u0431\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041c\\u044f\\u0441\\u043d\\u043e\\u0439 \\u0445\\u043b\\u0435\\u0431\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041c\\u044f\\u0441\\u043d\\u043e\\u0439 \\u0445\\u043b\\u0435\\u0431\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041c\\u044f\\u0441\\u043d\\u043e\\u0439 \\u0445\\u043b\\u0435\\u0431\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041c\\u044f\\u0441\\u043d\\u043e\\u0439 \\u0445\\u043b\\u0435\\u0431\\""}}]	9	1
55	2020-09-17 07:21:12.255+00	7	Курица в сырном соусе "Птичье молочко"	2	[{"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041a\\u0443\\u0440\\u0438\\u0446\\u0430 \\u0432 \\u0441\\u044b\\u0440\\u043d\\u043e\\u043c \\u0441\\u043e\\u0443\\u0441\\u0435 \\"\\u041f\\u0442\\u0438\\u0447\\u044c\\u0435 \\u043c\\u043e\\u043b\\u043e\\u0447\\u043a\\u043e\\"\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041a\\u0443\\u0440\\u0438\\u0446\\u0430 \\u0432 \\u0441\\u044b\\u0440\\u043d\\u043e\\u043c \\u0441\\u043e\\u0443\\u0441\\u0435 \\"\\u041f\\u0442\\u0438\\u0447\\u044c\\u0435 \\u043c\\u043e\\u043b\\u043e\\u0447\\u043a\\u043e\\"\\""}}]	9	1
56	2020-09-17 07:21:40.638+00	6	Говяжье сердце тушеное в сметане	2	[{"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0413\\u043e\\u0432\\u044f\\u0436\\u044c\\u0435 \\u0441\\u0435\\u0440\\u0434\\u0446\\u0435 \\u0442\\u0443\\u0448\\u0435\\u043d\\u043e\\u0435 \\u0432 \\u0441\\u043c\\u0435\\u0442\\u0430\\u043d\\u0435\\""}}]	9	1
57	2020-09-17 07:22:08.078+00	5	Итальянский обед	2	[{"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0418\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u0438\\u0439 \\u043e\\u0431\\u0435\\u0434\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0418\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u0438\\u0439 \\u043e\\u0431\\u0435\\u0434\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0418\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u0438\\u0439 \\u043e\\u0431\\u0435\\u0434\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0418\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u0438\\u0439 \\u043e\\u0431\\u0435\\u0434\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0418\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u0438\\u0439 \\u043e\\u0431\\u0435\\u0434\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0418\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u0438\\u0439 \\u043e\\u0431\\u0435\\u0434\\""}}]	9	1
58	2020-09-17 07:22:37.264+00	3	Яичные роллы с ветчиной и авокадо	2	[{"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u042f\\u0438\\u0447\\u043d\\u044b\\u0435 \\u0440\\u043e\\u043b\\u043b\\u044b \\u0441 \\u0432\\u0435\\u0442\\u0447\\u0438\\u043d\\u043e\\u0439 \\u0438 \\u0430\\u0432\\u043e\\u043a\\u0430\\u0434\\u043e\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u042f\\u0438\\u0447\\u043d\\u044b\\u0435 \\u0440\\u043e\\u043b\\u043b\\u044b \\u0441 \\u0432\\u0435\\u0442\\u0447\\u0438\\u043d\\u043e\\u0439 \\u0438 \\u0430\\u0432\\u043e\\u043a\\u0430\\u0434\\u043e\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u042f\\u0438\\u0447\\u043d\\u044b\\u0435 \\u0440\\u043e\\u043b\\u043b\\u044b \\u0441 \\u0432\\u0435\\u0442\\u0447\\u0438\\u043d\\u043e\\u0439 \\u0438 \\u0430\\u0432\\u043e\\u043a\\u0430\\u0434\\u043e\\""}}]	9	1
59	2020-09-17 07:22:54.541+00	2	Омлет	2	[{"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041e\\u043c\\u043b\\u0435\\u0442\\""}}, {"deleted": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041e\\u043c\\u043b\\u0435\\u0442\\""}}]	9	1
60	2020-09-17 07:24:04.81+00	8	Рыба жареная	2	[{"added": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u0420\\u044b\\u0431\\u0430 \\u0436\\u0430\\u0440\\u0435\\u043d\\u0430\\u044f\\""}}]	9	1
61	2020-09-17 07:25:33.405+00	9	Мясной хлеб	2	[{"added": {"name": "\\u043a\\u043e\\u043b-\\u0432\\u043e \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u0430", "object": "\\u0418\\u0437 \\u0440\\u0435\\u0446\\u0435\\u043f\\u0442\\u0430 \\"\\u041c\\u044f\\u0441\\u043d\\u043e\\u0439 \\u0445\\u043b\\u0435\\u0431\\""}}]	9	1
62	2020-09-17 21:21:27.052+00	1	127.0.0.1:8000	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	15	1
63	2020-09-17 21:28:56.198+00	1	/author/ -- Об авторе	1	[{"added": {}}]	16	1
64	2020-09-17 21:29:22.348+00	1	/author/ -- Об авторе	2	[{"changed": {"fields": ["Content"]}}]	16	1
65	2020-09-17 21:33:34.469+00	1	/author/ -- Об авторе	2	[{"changed": {"fields": ["Content"]}}]	16	1
66	2020-09-17 21:36:27.692+00	2	/spec/ -- Технологии	1	[{"added": {}}]	16	1
67	2020-09-17 21:39:17.024+00	2	/spec/ -- Технологии	2	[{"changed": {"fields": ["Content"]}}]	16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	flatpages	flatpage
8	users	user
9	api	subscribe
10	api	purchase
11	api	favorite
12	recipes	ingredient
13	recipes	ingredientamount
14	recipes	recipe
15	recipes	tag
16	thumbnail	kvstore
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
1	/author/	Об авторе	<h3 >Привет!</h3>\r\n<p >Меня зовут Александр. Это мой дипломный проект из курса  Python-разработчик на Яндекс.Практикум.</p>\r\n<br>\r\n<p>Мои контакты</p>\r\n<ul>\r\n        <li>почта <a href="mailto:alexander.nkn@yandex.ru"><span >alexander.nkn@yandex.ru</span></a></li>\r\n        <li>GitHub <a href="https://github.com/AlexanderNkn/" target="_blank" rel="noopener"><span>https://github.com/AlexanderNkn/</span></a></li>\r\n    </ul>	f		f
2	/spec/	Технологии	<p>При разработке сайта были использованы:</p>\r\n<ul> \r\n    <li>Python 3.8</li>\r\n    <li>Django 3.1</li>\r\n    <li>SQLite 3</li>\r\n    <li>Visual Studio Code</li>\r\n    <li>Git</li>\r\n    <li>Sorl-thumbnail</li>\r\n    <li>И много кофе)</li>\r\n</ul>\r\n\r\n<p><img src="/static/img/cup.jpg" alt="My image" width=150 height=200></p>	f		f
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-10-01 07:48:03.408601+00
2	contenttypes	0002_remove_content_type_name	2020-10-01 07:48:03.418064+00
3	auth	0001_initial	2020-10-01 07:48:03.451623+00
4	auth	0002_alter_permission_name_max_length	2020-10-01 07:48:03.487615+00
5	auth	0003_alter_user_email_max_length	2020-10-01 07:48:03.49739+00
6	auth	0004_alter_user_username_opts	2020-10-01 07:48:03.508599+00
7	auth	0005_alter_user_last_login_null	2020-10-01 07:48:03.519465+00
8	auth	0006_require_contenttypes_0002	2020-10-01 07:48:03.524845+00
9	auth	0007_alter_validators_add_error_messages	2020-10-01 07:48:03.535368+00
10	auth	0008_alter_user_username_max_length	2020-10-01 07:48:03.548023+00
11	auth	0009_alter_user_last_name_max_length	2020-10-01 07:48:03.559389+00
12	auth	0010_alter_group_name_max_length	2020-10-01 07:48:03.570645+00
13	auth	0011_update_proxy_permissions	2020-10-01 07:48:03.581554+00
14	auth	0012_alter_user_first_name_max_length	2020-10-01 07:48:03.594155+00
15	users	0001_initial	2020-10-01 07:48:03.63203+00
16	admin	0001_initial	2020-10-01 07:48:03.684412+00
17	admin	0002_logentry_remove_auto_add	2020-10-01 07:48:03.70908+00
18	admin	0003_logentry_add_action_flag_choices	2020-10-01 07:48:03.719696+00
19	recipes	0001_initial	2020-10-01 07:48:03.789162+00
20	api	0001_initial	2020-10-01 07:48:03.892051+00
21	sites	0001_initial	2020-10-01 07:48:03.941228+00
22	flatpages	0001_initial	2020-10-01 07:48:03.962437+00
23	recipes	0002_auto_20200917_1050	2020-10-01 07:48:04.141965+00
24	sessions	0001_initial	2020-10-01 07:48:04.159563+00
25	sites	0002_alter_domain_unique	2020-10-01 07:48:04.181443+00
26	thumbnail	0001_initial	2020-10-01 07:48:04.19636+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
j6qnqm77x52cuzvk2tnsnfbzrvx4r1rd	.eJxVjEEOwiAQRe_C2hAo47R16b5nIMPASNVAUtqV8e7apAvd_vfefylP25r91tLi56guyqnT7xaIH6nsIN6p3KrmWtZlDnpX9EGbnmpMz-vh_h1kavlbAw4IYBL2YoKIBaQULTjjOGDCEYxQj85F7uII5ICD4TNbkcEOXS_q_QHXWzfR:1kNipO:aXVGqPfra40sH96ycJ5VCnVhS_tZSt312m0TZJOpqg8	2020-10-14 20:35:54.632+00
tfn2c09zfew6asyixxtsht06un3ytaqv	.eJxVjDsOwyAQRO9CHaEF802Z3mdAy4KDkwgkY1dR7h5bcpE0U8x7M28WcFtL2HpewpzYlSl2-e0i0jPXA6QH1nvj1Oq6zJEfCj9p52NL-XU73b-Dgr3sa6cdgjSkpwhaTN5YkgJ8GgCFTdbkSNka48ArUlroAayMSQI5Q35P9vkCwvg25Q:1kNjOH:vZX2J_BAi-2vnMo8_cprLN3yAS2fs8XJj-OlWA7NARU	2020-10-14 21:11:57.019362+00
18b69vbun0vu2reke08ut3v2j7f3vg7p	.eJxVjEEOwiAQRe_C2hBwBlpcuu8ZyDAMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuyqrT75aIH1J3kO9Ub7Pmua7LlPSu6IM2PcxZntfD_TsYqY3fGiQhFEFrrOEAHjC5wufeIXbckRefhLhAAeyJgtjM2SUIYHLpXUH1_gDnYjhh:1kJ1Za:9U-CBje9Jpsp9DXo1Y4NXD8iORbT_z0hqusp5O9o51Y	2020-10-01 21:36:10.076+00
36wuhu7dmpx3osgocwzmvhuxuc6l8ble	.eJxVjMsOwiAQRf-FtSGAHR4u3fcbCDAzUjU0Ke3K-O_apAvd3nPOfYmYtrXGrdMSJxQXocXpd8upPKjtAO-p3WZZ5rYuU5a7Ig_a5TgjPa-H-3dQU6_fOrAGqx0ChoGDQZXIuoDKlME5cAYysWL0CTEAeEuega02XIozTGfx_gDeSjgs:1kIyS5:thLZ4bYbDE9KXVyxks5ppXdikk7S4lEK9L65OYhkVdY	2020-10-01 18:16:13.564+00
43ls0mc7ctgbh0vba1d7hxbs6qspsszh	.eJxVjEEOwiAQRe_C2hBwBlpcuu8ZyDAMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuyqrT75aIH1J3kO9Ub7Pmua7LlPSu6IM2PcxZntfD_TsYqY3fGiQhFEFrrOEAHjC5wufeIXbckRefhLhAAeyJgtjM2SUIYHLpXUH1_gDnYjhh:1kJ1K1:x28a4-PJW3GyVgh-hDhm9f39Io246Zp7COp7W-B0IeA	2020-10-01 21:20:05.232+00
b91reppucsf9z90o0w3c7953zo6vrlol	.eJxVjEEOwiAQRe_C2hBwBlpcuu8ZyDAMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuyqrT75aIH1J3kO9Ub7Pmua7LlPSu6IM2PcxZntfD_TsYqY3fGiQhFEFrrOEAHjC5wufeIXbckRefhLhAAeyJgtjM2SUIYHLpXUH1_gDnYjhh:1kJCdq:RS1qwGuU4mMCqezElD4zZ3g_j2xuSJA1KLKmlMGAdK0	2020-10-02 09:25:18.458+00
boihecn10thr7ciy6tpe3qjjmq82l1j5	.eJxVjMsOwiAQRf-FtSGAHR4u3fcbCDAzUjU0Ke3K-O_apAvd3nPOfYmYtrXGrdMSJxQXocXpd8upPKjtAO-p3WZZ5rYuU5a7Ig_a5TgjPa-H-3dQU6_fOrAGqx0ChoGDQZXIuoDKlME5cAYysWL0CTEAeEuega02XIozTGfx_gDeSjgs:1kIx5t:0sWn_UAFe2sunFuu5JqhlvoJPxjVxfAWvWPQCRRdmqo	2020-10-01 16:49:13.081+00
vwaqxl0wfkv5u4i2chtujyxj8euiwc68	.eJxVjEEOwiAQRe_C2hBwBlpcuu8ZyDAMtmpoUtqV8e7apAvd_vfef6lI2zrGrckSp6wuyqrT75aIH1J3kO9Ub7Pmua7LlPSu6IM2PcxZntfD_TsYqY3fGiQhFEFrrOEAHjC5wufeIXbckRefhLhAAeyJgtjM2SUIYHLpXUH1_gDnYjhh:1kJ1Rz:cYz5yJ6gq8zadQ4cyH9dRSfi_y16MPWnXoAlXJgkrFU	2020-10-01 21:28:19.263+00
mndtlra4kvt638o5iiizmwww6jvg6l5i	.eJxVjEEOwiAQRe_C2hAo47R16b5nIMPASNVAUtqV8e7apAvd_vfefylP25r91tLi56guyqnT7xaIH6nsIN6p3KrmWtZlDnpX9EGbnmpMz-vh_h1kavlbAw4IYBL2YoKIBaQULTjjOGDCEYxQj85F7uII5ICD4TNbkcEOXS_q_QHXWzfR:1kNtmR:XeBxblF8z2Se4BWj_VyQArOoMy8nqVnoyd-xt4Zg2cI	2020-10-15 08:17:35.454309+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.django_site (id, domain, name) FROM stdin;
1	127.0.0.1:8000	localhost
\.


--
-- Data for Name: recipes_ingredient; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.recipes_ingredient (id, title, dimension) FROM stdin;
136	бобы	г
1435	репа	г
1540	сальник	г
2131	шрот	г
1	абрикосовое варенье	г
2	абрикосовое пюре	г
3	абрикосовый джем	г
4	абрикосовый сок	стакан
5	абрикосы	г
6	абрикосы консервированные	г
7	авокадо	по вкусу
8	агава сироп	г
9	агар-агар	г
10	аграм	г
11	аджика	г
12	аджика зеленая	г
13	айва	по вкусу
14	айвовое пюре	г
15	айран	г
16	айсинг	г
17	акула стейки	г
18	алкоголь	стакан
19	алкоголь крепкий	ст. л.
20	алыча	г
21	альбухара	шт.
22	альмехи	г
23	амарантовая мука	г
24	ананасовый сироп	г
25	ананасовый сок	г
26	ананасы	г
27	ананасы вяленые	г
28	ананасы консервированные	по вкусу
29	анис	по вкусу
30	анис звездочки	г
31	анисовый ликер	мл
32	анис семена	г
33	анчоусы	г
34	апельсиновая вода	г
35	апельсиновая цедра	г
36	апельсиновая эссенция	ч. л.
37	апельсиновое варенье	г
38	апельсиновые цукаты	г
39	апельсиновый джем	г
40	апельсиновый джем с имбирем	г
41	апельсиновый ликер	г
42	апельсиновый сироп	стакан
43	апельсиновый сок	по вкусу
44	апельсиновый сок свежевыжатый	г
45	апельсиновый уксус	ст. л.
46	апельсиновый экстракт	ч. л.
47	апельсины	г
48	апельсины красные	шт.
49	апельсины крупные	шт.
50	арахис	г
51	арахис жареный	г
52	арахисовая паста	г
53	арахисовое масло	г
54	арахис соленый	г
55	арбузная мякоть	г
56	арбузы	г
57	аргановое масло	г
58	аришта	г
59	ароматизатор	г
60	ароматизатор "ананас"	по вкусу
61	ароматизатор "вишня"	капля
62	ароматизатор "малина"	капля
63	ароматизатор "ром"	г
64	артишоки	г
65	артишоки в масле	г
66	артишоки маринованные	г
67	аспирин	шт.
68	ассорти мясное	г
69	ассорти овощное	г
70	ассорти фруктовое	г
71	ассорти ягодное	г
72	аши	г
73	багет	г
74	багет вчерашний	г
75	багет мини	г
76	бадан	звездочка
77	бадьян	щепотка
78	базилик лимонный	г
79	базилик свежий	г
80	базилик сушеный	г
81	базилик тайский	горсть
82	базилик фиолетовый	г
83	баклажаны	по вкусу
84	баклажаны мини	г
85	баклажаны тайские	г
86	балык	г
87	бальзам	г
88	бальзамический крем	стакан
89	бальзамический соус	ст. л.
90	бальзамический уксус	стакан
91	бальзам рижский черный	ст. л.
92	бамия	г
93	банановое пюре	г
94	банановые чипсы	горсть
95	банановый зеленый сироп	мл
96	банановый ликер	мл
97	бананы	г
98	бананы мини	г
99	барабулька	г
100	бараний ливер	г
101	бараний окорок на косточке	кусок
102	бараний фарш	г
103	баранина	г
104	баранки	г
105	бараньи антрекоты	кг
106	бараньи голяшки	шт.
107	бараньи потроха	кг
108	бараньи ребрышки	шт.
109	баранья лопатка	кг
110	баранья нога	г
111	баранья печень	г
112	барбарис	г
113	барбарис вяленый	ст. л.
114	барбарис молотый	г
115	бастурма	г
116	батат	г
117	батон	г
118	батончики шоколадные	г
119	безе	г
120	бекон	по вкусу
121	бекон варено-копченый	г
122	бекон сырокопченый	г
123	белорыбица	г
124	бирнель	мл
125	бисквик смесь готовая	пакет
126	бисквит	г
127	бисквитная крошка	г
128	бисквитный корж	г
129	бисквитный рулет	г
130	бисквит шоколадный	г
131	бифштекс	шт.
132	блинная мука	г
133	блины готовые	г
134	блины овсяные	шт.
135	бобовые ростки	г
137	бобы мунг пророщенные	г
138	бобы тонка	шт.
139	ботарга	г
140	брезаола	г
141	бренди	г
142	брокколи замороженная	г
143	брокколи свежая	г
144	брусника замороженная	г
145	брусника свежая	г
146	брусника сушеная	г
147	брусничное варенье	г
148	брусничный соус	г
149	брынза	по вкусу
150	брынза сербская	г
151	брюква	г
152	буженина	г
153	бузина сироп	ст. л.
154	букет гарни	пучок
155	булгур	г
156	булка	кусок
157	булка белая	г
158	булка сдобная	г
159	булочки	г
160	булочки белые черствые	г
161	булочки бриошь	шт.
162	булочки вчерашние	шт.
163	булочки для гамбургеров	шт.
164	булочки зерновые	шт.
165	булочки ржаные	кусок
166	булочки с кунжутом	шт.
167	бульон	г
168	бульонные кубики	г
169	бурбон	г
170	буррата	г
171	буряк	г
172	бусинки кондитерские	ч. л.
173	бусинки кондитерские серебряные	по вкусу
174	бычий хвост	г
175	ванилин	г
176	ваниль в стручках	г
177	ванильная настойка	ст. л.
178	ванильная эссенция	г
179	ванильный порошок	г
180	ванильный сироп	г
181	ванильный экстракт	по вкусу
182	варенье	г
183	васаби	г
184	вафельная крошка	г
185	вафельные коржи	г
186	вафельные трубочки	г
187	вафли	г
188	вафли шоколадные	г
189	вермишель	г
190	вермишель яичная	г
191	вермут	г
192	вермут белый	г
193	вермут сухой	г
194	ветчина	г
195	ветчина вареная	г
196	ветчина варено-копченая	кусок
197	ветчина копченая	г
198	ветчина пармская	г
199	ветчина сырокопченая	г
200	вешенки	г
201	винегрет	г
202	винный камень	щепотка
203	винный уксус	г
204	винный уксус белый	г
205	винный уксус красный	ч. л.
206	винный уксус на чесноке	ч. л.
207	винный уксус на эстрагоне	ст. л.
208	вино белое	по вкусу
209	вино белое полусладкое	г
210	вино белое полусухое	г
211	вино белое сладкое	г
212	вино белое столовое	стакан
213	вино белое сухое	г
214	виноград	г
215	виноград без косточек	г
216	виноград белый	г
217	виноград изабелла	кг
218	виноградное желе	ст. л.
219	виноградные листья	г
220	виноградные листья маринованные	г
221	виноградные листья молодые	шт.
222	виноградный сок	г
223	виноградный сок осветленный	ч. л.
224	виноград синий	г
225	виноград черный	г
226	вино десертное	г
227	вино игристое сухое	г
228	вино красное	г
229	вино красное полусладкое	г
230	вино красное полусухое	г
231	вино красное сладкое	г
232	вино красное сухое	г
233	вино крепленое	г
234	вино розовое полусладкое	ст. л.
235	вино розовое полусухое	г
236	виски	г
237	витамин C в порошке	г
238	вишневая настойка	мл
239	вишневое варенье	г
240	вишневые листья	г
241	вишневый джем	г
242	вишневый ликер	по вкусу
243	вишневый сироп	стакан
244	вишневый сок	г
245	вишня	г
246	вишня вяленая	г
247	вишня замороженная	г
248	вишня засахаренная кондитерская	шт.
249	вишня коктейльная	г
250	вишня мараскино	шт.
251	вишня, протертая с сахаром	г
252	вода	г
253	вода минеральная без газа	стакан
254	вода минеральная газированная	г
255	водка	г
256	водка анисовая	ч. л.
257	водоросли	г
258	вустерширский соус	г
259	галангал корень	долька
260	галеты	г
261	гамбургер	г
262	ганаш	г
263	гарам масала	г
264	гарнир	г
265	гаспачо	г
266	гастропаб	г
267	гвоздика	г
268	гвоздика молотая	по вкусу
269	герань листья	г
270	геркулес	г
271	глазурь	г
272	глазурь белая	г
273	глазурь готовая	по вкусу
274	глазурь черная	по вкусу
275	глазурь шоколадная белая	г
276	глутамат натрия	г
277	глюкоза	г
278	глюкоза сироп	г
279	говядина	г
280	говядина на кости	г
281	говяжий фарш	по вкусу
282	говяжий язык	г
283	говяжье сердце	по вкусу
284	говяжьи бифштексы	г
285	говяжьи голяшки	г
286	говяжьи легкие	г
287	говяжьи ребра	г
288	говяжьи стейки рибай	г
289	говяжья вырезка	шт.
290	говяжья грудинка	кг
291	говяжья лопатка	г
292	говяжья мозговая кость	шт.
293	говяжья мякоть	кг
294	говяжья печень	шт.
295	говяжья черева	г
296	говяжья шейка	кг
297	годжи	г
298	голец филе	шт.
299	голубика	г
300	голубика замороженная	г
301	голубь	г
302	горбуша	по вкусу
303	горбуша в собственном соку	банка
304	горбуша филе	г
305	горгонзола	г
306	горгонзола пиканте	г
307	горох	г
308	горох колотый	г
309	гороховые ростки	горсть
310	гороховый суп	г
311	горошек зеленый	г
312	горошек зеленый замороженный	г
313	горошек зеленый консервированный	г
314	горошек стручковый свежий	г
315	горчица	г
316	горчица дижонская	г
317	горчица дижонская с медом	г
318	горчица желтая семена	г
319	горчица острая	г
320	горчица русская	ст. л.
321	горчица семена	г
322	горчица с зернами	г
323	горчица сухая	г
324	горчица французская	г
325	горчица цитрусовая	г
326	горчичное масло	г
327	горчичный порошок	г
328	грана падано	ст. л.
329	гранатные зерна	г
330	гранатовая паста	ст. л.
331	гранатовый сироп	г
332	гранатовый сок	г
333	гранатовый сок свежевыжатый	мл
334	гранатовый соус	ч. л.
335	гранаты	г
336	гранита	г
337	гранола с орехами	г
338	граппа	ч. л.
339	гратен	кг
340	грейпфрутовая цедра	г
341	грейпфрутовый сок	г
342	грейпфруты	г
343	грейпфруты розовые	г
344	гренадин	г
345	гренки	г
346	грецкие орехи	г
347	грецкие орехи рубленые	г
348	гречневая крупа	г
349	гречневая крупа зеленая	ст. л.
350	гречневая лапша соба	г
351	гречневая мука	г
352	гречневое молоко	стакан
353	гречневые хлопья	г
354	грибы	г
355	грибы белые	г
356	грибы белые замороженные	г
357	грибы белые маринованные	г
358	грибы белые сухие	г
359	грибы замороженные	г
360	грибы замороженные (опята и маслята)	г
361	грибы лесные	г
362	грибы маринованные	г
363	грибы свежие	г
364	грибы соленые	г
365	грибы соломенные консервированные	шт.
366	грибы сухие	г
367	грибы шиитаке	г
368	грибы шиитаке сухие	г
369	гриль	г
370	гриссини	г
371	грудинка	г
372	грудинка варено-копченая	г
373	грудинка копченая	по вкусу
374	грушевое пюре	г
375	грушевый ликер	мл
376	грушевый сироп	мл
377	грушевый сок	г
378	грушевый уксус	ст. л.
379	груши	по вкусу
380	груши вяленые	г
381	грюйер	г
382	гуава	шт.
383	гуанчиале	г
384	гурьевская каша	г
385	гусиная грудка копченая	г
386	гусиная печень	г
387	гусиный жир	ст. л.
388	гусь	г
389	гусь тушка	кг
390	дайкон	г
391	детское питание	г
392	джем	г
393	джин	г
394	джусай	г
395	диоксид титана	г
396	долма	г
397	дорада	шт.
398	дорада потрошеная с головой	шт.
399	дорада с головой	шт.
400	дорада тушка	шт.
401	драже	г
402	дрожжи домашние	г
403	дрожжи свежие	г
404	дрожжи сухие	по вкусу
405	дубовая кора	г
406	душица	г
407	дыня	г
408	ежевика	г
409	ежевика замороженная	г
410	ерш	г
411	ёрш-носарь	шт.
412	желатин	г
413	желатин листовой	по вкусу
414	желе	г
415	желе для торта	упаковка
416	желирующее вещество	упаковка
417	желирующий сахар	г
418	женьшень	г
419	жидкий дым	г
420	жимолость	г
421	жир	г
422	жир вытопленный	стакан
423	жир кулинарный	г
424	жир растительный	г
425	заатар	щепотка
426	завтрак сухой	г
427	завтрак сухой подушечки	г
428	загуститель для сливок	г
429	зайчатина	г
430	закваска	пакет
431	закваска вечная	г
432	заменитель сахара	по вкусу
433	заменитель сахара стевия	г
434	заправка для салатов готовая	г
435	зверобой	по вкусу
436	зелень	г
437	зелень рубленая	г
438	земляника	по вкусу
439	земляника замороженная	г
440	зефир	г
441	зира	г
442	злаковые хлопья	г
443	зубатка	г
444	зубатка филе	г
445	изолят соевого протеина	г
446	изюм	г
447	изюм без косточек	г
448	изюм белый	г
449	изюм черный	г
450	икра	г
451	икра вяленой рыбы	г
452	икра горбуши зернистая	г
453	икра красная	г
454	икра красной рыбы мелкая	г
455	икра летучей рыбы	г
456	икра лосося	г
457	икра мойвы	г
458	икра палтуса	г
459	икра судака	г
460	икра черная	г
461	имбирное варенье	г
462	имбирное печенье	по вкусу
463	имбирные цукаты	ст. л.
464	имбирь	г
465	имбирь засахаренный	г
466	имбирь корень	г
467	имбирь маринованный	г
468	имбирь молотый	г
469	индейка	г
470	индейка голень	г
471	индейка грудка	г
472	индейка копченая	г
473	индейка тушка	шт.
474	индейка фарш	г
475	индейка филе	г
476	индоутка	шт.
477	индюшачья печень	г
478	инжир	г
479	инжир свежий	г
480	инжир сушеный	г
481	ирга	г
482	ириски	г
483	итальянские травы	г
484	йогурт	г
485	йогурт греческий	г
486	йогурт жирный	г
487	йогурт козий	г
488	йогурт натуральный	г
489	йогурт нежирный	г
490	йогурт обезжиренный	г
491	йогурт фруктовый	г
492	кабачки	г
493	кабачки замороженные	г
494	кабачки молодые	г
495	каджунская смесь специй	ст. л.
496	какао	горсть
497	какао-бобы	г
498	какао-масло	г
499	какао-порошок	по вкусу
500	какао-порошок обезжиренный	г
501	какао сгущенное	банка
502	калина	по вкусу
503	калина протертая	г
504	калинджи семена	ч. л.
505	кальвадос	г
506	кальмары	г
507	кальмары вареные	г
508	кальмары замороженные	г
509	кальмары консервированные	г
510	кальмары филе	шт.
511	камамбер	упаковка
512	камбала	г
513	камбала филе	г
514	кампари	мл
515	кандурин золотой	ч. л.
516	каннеллони	г
517	капеллини	г
518	каперсы	г
519	каперсы в винном уксусе	г
520	каперсы маринованные	г
521	капуста белокочанная	г
522	капуста брюссельская	г
523	капуста брюссельская замороженная	г
524	капуста кале	г
525	капуста квашеная	по вкусу
526	капуста кольраби	г
527	капуста краснокочанная	г
528	капуста морская	по вкусу
529	капуста морская замороженная	г
530	капуста морская сушеная	г
531	капуста пекинская	г
532	капуста савойская	г
533	капуста цветная	г
534	капуста цветная замороженная	г
535	капустный рассол	г
536	капучино	г
537	каракатица	г
538	каракатица очищенная	г
539	карамбола	г
540	карамель	мл
541	карамельный соус	г
542	карамель с начинкой	г
543	карамель соленая	г
544	карась	г
545	карбонад	г
546	кардамон	г
547	кардамон зерна	ч. л.
548	кардамон молотый	г
549	кардамон стручки	шт.
550	каркаде	г
551	карп	г
552	карп зеркальный	кг
553	карп филе	кг
554	карри	г
555	карри листья	г
556	карри паста	пакет
557	картофель	г
558	картофель вареный	г
559	картофель вареный в мундире	г
560	картофель молодой	г
561	картофельное пюре	по вкусу
562	картофельные ньокки	г
563	картофельные хлопья	г
564	картофельные чипсы	г
565	картофельный крахмал	г
566	картофельный отвар	г
567	картофельный хэш замороженный	г
568	картофель печеный	г
569	катык	г
570	каффир-лайм листья	по вкусу
571	каша	г
572	каша для детского питания	г
573	каштановая мука	г
574	каштановый крем	г
575	каштаны	г
576	каштаны вареные	г
577	каштаны консервированные	г
578	каштаны очищенные	г
579	квас	г
580	квасное сусло	г
581	квасной концентрат сухой	упаковка
582	квас хлебный	г
583	кедровая мука	г
584	кедровые орехи	г
585	кедровые орехи жареные	г
586	кета	г
587	кетчуп острый	по вкусу
588	кетчуп томатный	г
589	кетчуп тосканский	ст. л.
590	кетчуп шашлычный	г
591	кефаль	г
592	кефир	по вкусу
593	кефир 1%	г
594	кефир 2,5%	г
595	кефир 3,2%	г
596	кефир обезжиренный	г
597	кешью	г
598	кивано	г
599	киви	кг
600	киви желе	г
601	кижуч	г
602	кижуч горячего копчения филе	г
603	кизил	г
604	килька	г
605	кимчи	г
606	кинза свежая	зубчик
607	кинза сушеная	г
608	киноа	г
609	киноа молотая	г
610	кипяток	г
611	кирш	ст. л.
612	кисель	г
613	кисель сухой	г
614	кисломолочный напиток Тан	мл
615	кишки	г
616	клейковина	г
617	клементины	г
618	кленовый сироп	г
619	клубника	г
620	клубника в сиропе	г
621	клубника замороженная	г
622	клубника, протертая с сахаром	г
623	клубника сушеная	г
624	клубничное варенье	г
625	клубничное желе	упаковка
626	клубничное пюре	г
627	клубничный джем	г
628	клубничный джем густой	мл
629	клубничный компот	стакан
630	клубничный ликер	г
631	клубничный сироп	г
632	клюква	г
633	клюква вяленая	г
634	клюква замороженная	г
635	клюква, протертая с сахаром	г
636	клюквенное варенье	г
637	клюквенный джем	г
638	клюквенный морс	ст. л.
639	клюквенный сироп	г
640	клюквенный соус	г
641	козлиная печень	г
642	козлятина молодая	кг
643	кока-кола	ст. л.
644	кокосовая вода	стакан
645	кокосовая мука	ст. л.
646	кокосовая стружка	г
647	кокосовая стружка цветная	г
648	кокосовое масло	мл
649	кокосовое молоко	г
650	кокосовые сливки	г
651	кокосовый ликер	ст. л.
652	кокосовый экстракт	г
653	кокосы	г
654	кола	г
655	колбаса	г
656	колбаса вареная	г
657	колбаса варено-копченая	г
658	колбаса копченая	г
659	колбаса кровяная	г
660	колбаса полукопченая	г
661	колбаса сырокопченая	г
662	колбаска свиная свежая (salsiccia)	шт.
663	колбаски	г
664	колбаски для жарки	г
665	колбаски домашние	шт.
666	колбаски охотничьи	г
667	колбаски сырокопченые	шт.
668	компот	г
669	конопляное масло	ст. л.
670	конопля семена	г
671	конфеты	по вкусу
672	конфеты M&M’s	г
673	конфеты жевательные лакричные	г
674	конфеты Коровка	г
675	конфеты Трюфель	г
676	конфитюр	по вкусу
677	конфитюрка	упаковка
678	коньяк	г
679	копчености	г
680	коренья	по вкусу
681	кориандр	г
682	кориандр зелень	г
683	кориандр молотый	г
684	кориандр семена	г
685	коринка	ст. л.
686	корица	г
687	корица молотая	г
688	корнишоны	г
689	корнишоны маринованые	г
690	корюшка	г
691	корюшка горячего копчения	г
692	кости	г
693	кости мозговые	г
694	кость сахарная	г
695	кофе в зернах	стакан
696	кофе зеленый	г
697	кофейные зерна в шоколаде	г
698	кофейный ликер	г
699	кофейный ликер Kahlua	мл
700	кофейный напиток	мл
701	кофейный сироп	г
702	кофейный экстракт	мл
703	кофе молотый	ст. л.
704	кофе растворимый	г
705	кофе свежесваренный	г
706	кофе черный	г
707	кофе эспрессо	стакан
708	крабовое мясо	г
709	крабовые палочки	по вкусу
710	краб снежный	по вкусу
711	крабы	г
712	крапива	г
713	краситель-гель пищевой	шт.
714	краситель пищевой	г
715	краситель пищевой вишневый	щепотка
716	краситель пищевой желтый	г
717	краситель пищевой зеленый	ст. л.
718	краситель пищевой красный	г
719	краситель пищевой оранжевый	г
720	краситель пищевой фиолетовый	г
721	краситель пищевой черный	г
722	красная смородина	г
723	красная смородина, протертая с сахаром	ст. л.
724	красноперка	шт.
725	красносмородиновое варенье	г
726	красный винный соус	г
727	крахмал	г
728	креветки	г
729	креветки замороженные	г
730	креветки королевские	г
731	креветки очищенные	г
732	креветки очищенные в рассоле	г
733	креветки салатные	г
734	креветки сушеные	г
735	креветки тигровые	г
736	крекер	г
737	крекер соленый	г
738	крем заварной	г
739	крем заварной порошковый	г
740	крем-фреш	г
741	кресс-салат	г
742	кровь	мл
743	кролик	г
744	кролик тушка	г
745	кролик филе	г
746	кроличья печень	г
747	круассаны	по вкусу
748	крутоны мелкие	г
749	крыжовник	г
750	крыжовниковое варенье	банка
751	кукуруза	г
752	кукуруза замороженная	г
753	кукуруза консервированная	г
754	кукуруза обжаренная кикос	г
755	кукурузная крупа	г
756	кукурузная мука	г
757	кукурузное масло	г
758	кукурузные лепешки	шт.
759	кукурузные палочки	г
760	кукурузные хлопья	г
761	кукурузные хлопья глазированные	г
762	кукурузные чипсы	г
763	кукурузный (золотой) сироп	г
764	кукурузный крахмал	по вкусу
765	кумин	г
766	кумкваты	горсть
767	кунжут	г
768	кунжутная мука	г
769	кунжутная паста	г
770	кунжутное масло	г
771	кунжутные семечки	по вкусу
772	кунжут черный	ч. л.
773	купаты	шт.
774	курага	по вкусу
775	курдючное сало	г
776	курдючный жир	г
777	куриная ветчина	г
778	куриная кожа	г
779	куриная печень	г
780	куриное карпаччо	г
781	куриное филе	г
782	куриные бедра	г
783	куриные голени	г
784	куриные голени копченые	шт.
785	куриные грудки	г
786	куриные грудки вареные	г
787	куриные грудки копченые	г
788	куриные желудочки	шт.
789	куриные кости	г
790	куриные крылья	г
791	куриные окорочка	г
792	куриные окорочка копченые	г
793	куриные потрошки	г
794	куриные сердечки	г
795	куриный бульон	г
796	куриный паштет	г
797	куриный суповой набор	кг
798	куриный фарш	г
799	курица	г
800	курица вареная	г
801	курица для жарки	кг
802	курица копченая	г
803	курица тушка	г
804	куркума	г
805	куропатки	г
806	кускус	г
807	кускус жемчужный	стакан
808	кэроб	г
809	лаванда	г
810	лаванда сушеная	щепотка
811	лавандовый краситель	ч. л.
812	лаваш	по вкусу
813	лаваш армянский	г
814	лаваш персидский круглый	г
815	лаваш тонкий	пласт
816	лавровые листья свежие	шт.
817	лавровый лист	г
818	лайм	г
819	лайм листья	шт.
820	лаймовая цедра	г
821	лаймовый сок	г
822	лангустины	шт.
823	лапша	г
824	лапша для лагмана	упаковка
825	лапша ширатаки	г
826	лапша яичная в гнездах	шт.
827	латук	г
828	легкие	г
829	лед	г
830	леди-фиш тушка	шт.
831	лемонграсс (лимонное сорго)	г
832	лен семена	г
833	лепешки	г
834	лепешки арабские	шт.
835	лесные орехи	г
836	лечо	г
837	ливер	г
838	ликер	г
839	ликер Alchermes	г
840	ликер Amaretto	г
841	ликер Baileys	г
842	ликер Cointreau	г
843	ликер кремовый	г
844	ликер сливочный	г
845	лимонад	г
846	лимонная кислота	г
847	лимонная цедра	г
848	лимонник стебель	г
849	лимонник ягоды	г
850	лимонные корочки засахаренные	г
851	лимонные цукаты	г
852	лимонный сок	г
853	лимонный уксус	г
854	лимонный экстракт	г
855	лимончелло	г
856	лимоны	г
857	лимоны сушеные	г
858	лингвине	шт.
859	лисички	г
860	лисички сушеные	г
861	личи	шт.
862	личи компот	г
863	лобстер	г
864	лонган	г
865	лонгконг	шт.
866	лососевые молоки	г
867	лососевый фарш	г
868	лосось	г
869	лосось горячего копчения	г
870	лосось копченый	г
871	лосось свежесоленый	г
872	лосось свежий	г
873	лосось свежий филе	г
874	лосось слабосоленый	г
875	лосось стейки	г
876	лосось филе	г
877	лосось филе на коже	г
878	лосось холодного копчения	г
879	лосятина	кг
880	лук белый	по вкусу
881	лук зеленый	г
882	лук красный	по вкусу
883	лук маринованный	г
884	луковая шелуха	г
885	луковый порошок	г
886	лук-порей	горсть
887	лук-резанец	по вкусу
888	лук репчатый	г
889	лук репчатый мелкий	г
890	лук салатный	шт.
891	лук сушеный	г
892	лук-шалот	г
893	лук-шалот красный	шт.
894	льняная мука	г
895	льняное масло	ч. л.
896	льняное семя	г
897	льняное семя молотое	г
898	любисток	г
899	маасдам	г
900	мадера	г
901	майонез	г
902	майонез домашний	г
903	майонез легкий	г
904	майонезный соус «Слобода» Постный	г
905	майонез оливковый	г
906	майонез «Слобода» Легкий	г
907	майонез «Слобода» На перепелиных яйцах	г
908	майонез «Слобода» Оливковый	г
909	майонез «Слобода» Провансаль	г
910	майонез «Слобода» С лимонным соком	г
911	майонез «Слобода» Сметанный	г
912	майоран	г
913	майоран свежий	по вкусу
914	майоран сушеный	г
915	мак	г
916	макаронные изделия	г
917	макаронные изделия мелкие	г
918	макароны	г
919	макароны-бабочки (farfalle)	г
920	макароны-бабочки (farfalle) мини	г
921	макароны баветте	г
922	макароны-бантики	г
923	макароны букатини	г
924	макароны джильи	г
925	макароны диталони	г
926	макароны-звездочки	стакан
927	макароны орзо	г
928	макароны-ракушки (conchiglie)	г
929	макароны-ракушки (conchiglie rigate)	г
930	макароны-ракушки крупные	г
931	макароны рисони	г
932	макароны-рожки (pipe rigate)	г
933	макароны-спиральки (fusilli)	г
934	макароны-ушки (orecchiette)	г
935	маккерончини	г
936	мак молотый	г
937	маковая масса	пачка
938	малина	г
939	малина замороженная	г
940	малина, протертая с сахаром	стакан
941	малина сушеная	г
942	малиновое варенье	г
943	малиновое желе	г
944	малиновое пюре	г
945	малиновый джем	г
946	малиновый крем	г
947	малиновый сироп	ч. л.
948	малиновый соус	ч. л.
949	малиновый уксус	мл
950	малиновый чай	г
951	манго	по вкусу
952	манговый сироп	мл
953	манго консервированное	г
954	мангольд	г
955	мангустин	шт.
956	мандариновое пюре	г
957	мандариновые цукаты	г
958	мандариновый сок	г
959	мандарины	по вкусу
960	мандарины в собственном соку	г
961	манная крупа	г
962	маракуйя	г
963	маргарин	г
964	маргарин сливочный	г
965	мармелад	по вкусу
966	мармелад бутербродный	г
967	марсала	стакан
968	мартини	г
969	мартини красный	г
970	марципан	по вкусу
971	марципан зеленый	г
972	марципан розовый	г
973	маршмеллоу	г
974	маршмеллоу крем	г
975	маршмеллоу мини	г
976	маскарпоне	г
977	маслины	г
978	маслины без косточек	г
979	масло авокадо	г
980	масло виноградных косточек	г
981	масло грецкого ореха	ч. л.
982	масло для фритюра	г
983	масло кедрового ореха	г
984	маслята	г
985	мастика	г
986	мастика желатиновая	г
987	мастика шоколадная	г
988	матча	г
989	мафальдине	г
990	маца	г
991	мацони	г
992	маш	г
993	мед	г
994	мед акации	г
995	мед гречишный	г
996	мед жидкий	г
997	мед лавандовый	г
998	мелисса	г
999	меренги	шт.
1000	мидии	г
1001	мидии в раковинах	г
1002	мидии в раковинах крупные черные	г
1003	мидии в раковинах мелкие зеленые	г
1004	мидии замороженные	шт.
1005	мидии копченые в масле	г
1006	микрозелень	горсть
1007	миндаль	г
1008	миндаль жареный	г
1009	миндаль измельченный	г
1010	миндальная масса	г
1011	миндальная мука	г
1012	миндальная паста	г
1013	миндальная эссенция	г
1014	миндальное масло	г
1015	миндальное молоко	г
1016	миндальное печенье	г
1017	миндальное пралине	г
1018	миндальные лепестки	г
1019	миндальный ликер	г
1020	миндальный сироп	г
1021	миндальный экстракт	капля
1022	миндаль очищенный	г
1023	миндаль рубленый	г
1024	мини-кукуруза	шт.
1025	минога	г
1026	минтай	г
1027	минтай печень	г
1028	минтай филе	г
1029	мисо-паста	г
1030	мисо-суп	пакет
1031	можжевельник ягоды	г
1032	мойва	г
1033	моллюски	г
1034	молоко	г
1035	молоко 0,5%	г
1036	молоко 1,5%	г
1037	молоко 2,5%	г
1038	молоко 3,2%	г
1039	молоко 3,6%	г
1040	молоко 4%	г
1041	молоко 6%	г
1042	молоко козье	г
1043	молоко концентрированное	г
1044	молоко рисовое	мл
1045	молоко сгущенное	г
1046	молоко сгущенное вареное	ст. л.
1047	молоко сгущенное с какао	г
1048	молоко сухое	г
1049	молоко сухое обезжиренное	ст. л.
1050	молоко топленое	г
1051	молочная смесь	г
1052	молочные продукты	г
1053	морепродукты	шт.
1054	морковное пюре	г
1055	морковь	г
1056	морковь вареная	г
1057	морковь крупная	г
1058	морковь молодая	г
1059	морковь по-корейски	г
1060	морковь тертая	шт.
1061	мороженое	по вкусу
1062	мороженое ванильное	г
1063	мороженое клубничное	г
1064	мороженое лимонное	по вкусу
1065	мороженое малиновое	г
1066	мороженое пломбир	г
1067	мороженое шоколадное	мл
1068	морошка	г
1069	морские гребешки	кг
1070	морской коктейль	г
1071	морской коктейль в масле	упаковка
1072	морской коктейль замороженный	г
1073	морской черт	г
1074	морской язык	г
1075	морской язык филе	г
1076	мортаделла	г
1077	моцарелла	г
1078	моцарелла для запекания	г
1079	моцарелла для пиццы	г
1080	моцарелла мини	г
1081	моцарелла с травами	г
1082	моцарелла шарик большой	г
1083	мука	г
1084	мука 1 сорт	г
1085	мука 2 сорт	г
1086	мука «Аладушкин»	г
1087	мука грубого помола	г
1088	мука для темпуры	г
1089	мука из пророщенной пшеницы	ст. л.
1090	мука манитоба	г
1091	мука самоподнимающаяся	г
1092	мука с отрубями	ч. л.
1093	мука с семечками	г
1094	мука хлебопекарная	г
1095	мука цельнозерновая	г
1096	мускат белый	мл
1097	мускатное вино	г
1098	мускатный орех	г
1099	мускатный орех молотый	г
1100	мюсли	г
1101	мягкий творог	г
1102	мясной бульон	г
1103	мясной фарш	г
1104	мясо	г
1105	мясо дикого кабана	г
1106	мясо криля	г
1107	мясо на косточке	кг
1108	мята	г
1109	мята сушеная	г
1110	мятный сироп	г
1111	мятный шнапс	г
1112	нардек	г
1113	нектарины	шт.
1114	нога ягненка без кости	г
1115	нори	г
1116	нуга	г
1117	нуга с орехами	г
1118	нут	г
1119	нутелла	г
1120	нут консервированный	г
1121	нутовая мука	г
1122	облепиха	г
1123	облепиха замороженная	г
1124	облепиховый сироп	стакан
1125	овощи	г
1126	овощная смесь	г
1127	овощная смесь замороженная	г
1128	овощная смесь замороженная для wok	г
1129	овощная смесь по-китайски	г
1130	овощной бульон	по вкусу
1131	овсяная мука	г
1132	овсяное молоко	стакан
1133	овсяное печенье	г
1134	овсяное толокно	г
1135	овсяные зерна	г
1136	овсяные отруби	г
1137	овсяные хлопья	г
1138	овсяные хлопья быстрого приготовления	г
1139	огуречный рассол	стакан
1140	огурцы	г
1141	огурцы консервированные	шт.
1142	огурцы малосольные	шт.
1143	огурцы маринованные	банка
1144	огурцы свежие	г
1145	огурцы соленые	г
1146	одуванчики	г
1147	окорок	г
1148	окорок варено-копченый	г
1149	окунь	г
1150	окунь красный филе	г
1151	окунь морской	г
1152	окунь морской филе	г
1153	окунь филе	г
1154	оленина	г
1155	оливки	г
1156	оливки без косточек	г
1157	оливки зеленые	по вкусу
1158	оливки зеленые консервированные	банка
1159	оливки каламата	г
1160	оливки консервированные	г
1161	оливки, фаршированные анчоусами	г
1162	оливки черные	по вкусу
1163	оливковая паста	г
1164	оливковое масло	г
1165	оливковое масло Extra Virgin	г
1166	опунция плоды	г
1167	опята	по вкусу
1168	опята замороженные	г
1169	опята маринованные	г
1170	орегано	г
1171	орегано свежий	г
1172	орегано сушеный	г
1173	орехи	г
1174	орехи бразильские	г
1175	орехи макадамия	г
1176	орехи пекан	г
1177	орехи пекан засахаренные	г
1178	орехи пинии	г
1179	ореховая крошка	стакан
1180	ореховая паста	шт.
1181	ореховое масло	ст. л.
1182	ореховый ликер	мл
1183	ореховый соус	ст. л.
1184	осетр	г
1185	осетрина холодного копчения	г
1186	осьминог	г
1187	осьминоги консервированные	г
1188	осьминоги мини	г
1189	отруби	г
1190	ошеек	г
1191	пагр	г
1192	пажитник	г
1193	пажитник семена	г
1194	палтус	г
1195	пальмовое масло	г
1196	пангасиус	г
1197	панеттоне	шт.
1198	панифарин	г
1199	панчетта	г
1200	папайя	г
1201	папайя консервированная в собственном соку	г
1202	папоротник	г
1203	папоротник соленый	упаковка
1204	паппарделле	г
1205	паприка	г
1206	паприка копченая	ст. л.
1207	паприка красная	ст. л.
1208	паприка красная молотая	г
1209	паприка острая копченая	г
1210	паприка сладкая	г
1211	паприка сладкая копченая	г
1212	паприка сладкая хлопьями	ч. л.
1213	пармезан	г
1214	паста	г
1215	паста веджимайт	г
1216	паста тахини	г
1217	паста хариса	ст. л.
1218	пастернак	г
1219	пастила	г
1220	пастила виноградная	г
1221	патиссоны	г
1222	патока	г
1223	патока крахмальная	г
1224	патока черная (меласса)	г
1225	пахта	г
1226	паштет	г
1227	пекарский порошок	г
1228	пекарский порошок	ч. л.
1229	пекорино	г
1230	пектин	г
1231	пеленгас	г
1232	пельмени	г
1233	пенне	г
1234	пенне ригате	г
1235	пеперончино	ч. л.
1236	пеперончино молотый	щепотка
1237	переводной лист для шоколада	шт.
1238	перепелки	тушка
1239	перец	г
1240	перец белый	г
1241	перец белый горошком	по вкусу
1242	перец белый молотый	г
1243	перец белый свежемолотый	ч. л.
1244	перец болгарский	г
1245	перец болгарский желтый	г
1246	перец болгарский зеленый	г
1247	перец болгарский красный	г
1248	перец горошком	г
1249	перец горошком смесь	г
1250	перец душистый	щепотка
1596	свиной фарш	г
1251	перец душистый горошком	г
1252	перец душистый молотый	г
1253	перец испанский острый	шт.
1254	перец кайенский	г
1255	перец кайенский красный	г
1256	перец кайенский молотый	щепотка
1257	перец красный	г
1258	перец красный горошком	г
1259	перец красный жгучий	г
1260	перец красный молотый	г
1261	перец красный острый	г
1262	перец красный острый молотый	по вкусу
1263	перец красный хлопьями	щепотка
1264	перец лимонный	г
1265	перец маринованный	г
1266	перец острый	г
1267	перец острый зеленый	шт.
1268	перец острый молотый	щепотка
1269	перец падрон	г
1270	перец пеперони	г
1271	перец пеперони красный	шт.
1272	перец розовый горошком	г
1273	перец свежемолотый смесь	г
1274	перец сенегальский	по вкусу
1275	перец сладкий	г
1276	перец сладкий желтый	г
1277	перец сладкий зеленый	г
1278	перец сладкий красный	г
1279	перец сладкий красный маринованный	шт.
1280	перец сладкий красный молотый	г
1281	перец сладкий оранжевый	г
1282	перец сладкий сушеный	г
1283	перец сычуаньский	г
1284	перец халапеньо	г
1285	перец халапеньо маринованный	шт.
1286	перец черный	ст. л.
1287	перец черный горошком	по вкусу
1288	перец черный молотый	г
1289	перец черный свежемолотый	г
1290	перец чили	г
1291	перец чили зеленый	стручок
1292	перец чили красный	стручок
1293	перец чили маринованный	по вкусу
1294	перец чили молотый	г
1295	перец чили сухой	ст. л.
1296	перец чили хлопьями	по вкусу
1297	перец ямайский	г
1298	перловая крупа	г
1299	перловая мука	г
1300	персики	г
1301	персики консервированные	г
1302	персики сушеные	горсть
1303	персиковое пюре	г
1304	персиковый джем	г
1305	персиковый мармелад	ст. л.
1306	персиковый сироп	мл
1307	персиковый сок	г
1308	перцовая паста	ч. л.
1309	петрушка	г
1310	петрушка зелень	г
1311	петрушка итальянская	пучок
1312	петрушка корень	г
1313	петрушка рубленая	г
1314	петрушка сушеная	г
1315	печень	г
1316	печенье	по вкусу
1317	печенье Oreo	г
1318	печенье Амаретти	г
1319	печенье бисквитное	г
1320	печенье галетное	шт.
1321	печенье «Дамские пальчики»	г
1322	печенье песочное	г
1323	печенье рассыпчатое	г
1324	печенье Савоярди	г
1325	печенье сахарное	г
1326	печенье сладкое	г
1327	печенье сухое	г
1328	печенье шоколадное	г
1329	печенье Юбилейное молочное	г
1330	пиво	г
1331	пиво имбирное	мл
1332	пиво нефильтрованное	г
1333	пиво светлое	г
1334	пиво темное	банка
1335	пикша	шт.
1336	питы	по вкусу
1337	повидло	г
1338	подсолнечное масло	г
1339	подсолнечные семечки	г
1340	полба	г
1341	полба недозрелая	г
1342	полента	по вкусу
1343	полента быстрого приготовления	стакан
1344	помело	г
1345	помидоры	г
1346	помидоры бурые	г
1347	помидоры вяленые	по вкусу
1348	помидоры вяленые в масле	г
1349	помидоры желтые	шт.
1350	помидоры зеленые	кг
1351	помидоры консервированные	г
1352	помидоры консервированные в собственном соку	г
1353	помидоры консервированные в собственном соку с базиликом	г
1354	помидоры протертые пассата	г
1355	помидоры соленые	шт.
1356	помидоры сушеные хлопьями	г
1357	помидоры черри	г
1358	помидоры черри желтые	г
1359	попкорн	г
1360	поросенок	кг
1361	портвейн	г
1362	портобелло	г
1363	портулак	г
1364	посыпка кондитерская	по вкусу
1365	почки	г
1366	приправа 4 перца	г
1367	приправа 5 специй (five spice)	ч. л.
1368	приправа для баранины	ст. л.
1369	приправа для картофеля	г
1370	приправа для курицы	г
1371	приправа для макарон	по вкусу
1372	приправа для маринования свинины	по вкусу
1373	приправа для морепродуктов	по вкусу
1374	приправа для мяса	г
1375	приправа для паэльи	по вкусу
1376	приправа для пиццы	ч. л.
1377	приправа для плова	г
1378	приправа для птицы	ст. л.
1379	приправа для рыбы	г
1380	приправа для салатов	по вкусу
1381	приправа заатар	ч. л.
1382	приправа креольская	ст. л.
1383	приправа с сушеными грибами	ч. л.
1384	приправы	г
1385	прованские травы	г
1386	проволоне	г
1387	просекко	мл
1388	простокваша	г
1389	протеин сывороточный	г
1390	прошутто	г
1391	пряники	г
1392	пряничные специи	г
1393	пряности	г
1394	псиллиум	г
1395	птитим	г
1396	пудинг	г
1397	пудинг ванильный	г
1398	пудинг ванильный инстант	упаковка
1399	пудинг карамельный	г
1400	пшеница	г
1401	пшеничная крупа	г
1402	пшеничная мука	г
1403	пшеничная мука цельнозерновая	г
1404	пшеничные зародыши	стакан
1405	пшеничные отруби	г
1406	пшеничные ростки	г
1407	пшеничные хлопья	г
1408	пшенные хлопья	ст. л.
1409	пшено	г
1410	пыльца цветочная	г
1411	пюре	по вкусу
1412	радиккио	шт.
1413	разрыхлитель	г
1414	раки	шт.
1415	раковые шейки	г
1416	раковые шейки в рассоле	г
1417	рамбутан	г
1418	рапаны	г
1419	рапсовое масло	по вкусу
1420	рассол	г
1421	рассол от каперсов	ст. л.
1422	рассол от оливок	ст. л.
1423	растительное масло	г
1424	растительное масло для жарки	г
1425	растительное масло нерафинированное	стакан
1426	растительное масло рафинированное	г
1427	растительное молоко	стакан
1428	ревень	г
1429	реган	веточка
1430	редис	г
1431	редька	г
1432	редька белая	шт.
1433	редька зеленая	шт.
1434	редька черная	шт.
1436	репа белая	шт.
1437	ржаная закваска	г
1438	ржаная закваска густая	г
1439	ржаная мука	г
1440	ржаные отруби	г
1441	ригатони	г
1442	рикотта	г
1443	рикотта твердая	г
1444	рис	г
1445	рис арборио	г
1446	рис басмати	г
1447	рис бурый	г
1448	рис бурый и дикий смесь	г
1449	рис вареный	г
1450	рис виола	г
1451	рис девзира	г
1452	рис дикий	г
1453	рис дикий и золотистый смесь	г
1454	рис длиннозерный	г
1455	рис длиннозерный золотистый	г
1456	рис для плова	г
1457	рис для пудинга	г
1458	рис для ризотто	г
1459	рис для суши	г
1460	рис жасминовый	г
1461	рис золотистый	г
1462	рис индика	г
1463	рис италика	г
1464	рис карнароли	г
1465	рис красный	г
1466	рис круглозерный	г
1467	рис кубанский	г
1468	рисовая бумага	г
1469	рисовая лапша	г
1470	рисовая мука	г
1471	рисовое вино	ч. л.
1472	рисовые хлопья	г
1473	рисовые шарики воздушные	г
1474	рисовый крахмал	ст. л.
1475	рисовый уксус	по вкусу
1476	рис пропаренный	г
1477	рис пропаренный и дикий смесь	г
1478	рис японика	г
1479	рожь	г
1480	розмарин	шт.
1481	розмарин сушеный	по вкусу
1482	розовая вода	г
1483	розовые бутоны сушеные	г
1484	розовые лепестки	г
1485	розы	г
1486	рокфор	г
1487	ром	бутылка
1488	ромашка сушеная	г
1489	ромовый экстракт	ч. л.
1490	ром темный	г
1491	ростбиф	г
1492	рукола	г
1493	рулька	по вкусу
1494	рыба	г
1495	рыба белая	г
1496	рыба белая филе	г
1497	рыба консервированная	банка
1498	рыба копченая	г
1499	рыба копченая филе	г
1500	рыба красная	г
1501	рыба красная соленая	г
1502	рыба красная филе	г
1503	рыба-меч	г
1504	рыба морская	г
1505	рыба солнечник филе	шт.
1506	рыба-соль	тушка
1507	рыбное филе	г
1508	рыбные консервы	г
1509	рыбные кости	г
1510	рыбные обрезки, головы, плавники	по вкусу
1511	рыбный бульон	г
1512	рыбный соус	г
1513	рыбный соус Nam Pla	г
1514	рыбный соус тайский	г
1515	рыбный фарш	г
1516	рябина черноплодная	г
1517	рябчик	г
1518	ряженка	г
1519	ряженка 4%	г
1520	сайда	г
1521	сайда филе	г
1522	сайра	г
1523	сайра консервированная	банка
1524	саке	ст. л.
1525	салака	г
1526	салат	г
1527	салат айсберг	г
1528	салат китайский	г
1529	салат корн	пучок
1530	салат кочанный	г
1531	салат кучерявый	г
1532	салат листовой	г
1533	салатный микс	г
1534	салат романо	г
1535	салат фриссе	г
1536	сало	г
1537	сало копченое в перце	г
1538	сало копченое с мясными прослойками	г
1539	сало с мясными прослойками	г
1541	сальса	г
1542	сальса верде	ч. л.
1543	салями	г
1544	салями итальянская	г
1545	сардельки	г
1546	сардельки копченые	г
1547	сардинки маленькие	шт.
1548	сардины	г
1549	сардины в масле	банка
1550	сахар	г
1551	сахар ванильный	г
1552	сахар демерара	г
1553	сахар жемчужный	г
1554	сахар коричневый	г
1555	сахар коричневый крупнокристаллический	г
1556	сахар мусковадо	горсть
1557	сахарная пудра	г
1558	сахарная пудра апельсиновая	г
1559	сахарная пудра ванильная	г
1560	сахарные жемчужинки	г
1561	сахарные кондитерские украшения	горсть
1562	сахарный песок	г
1563	сахарный песок крупный	г
1564	сахарный песок мелкий	г
1565	сахарный сироп	г
1566	сахар пальмовый	г
1567	сахар-рафинад	г
1568	сахар-рафинад с корицей	г
1569	сахар тростниковый	г
1570	сванская соль	г
1571	свекла	г
1572	свекла вареная	г
1573	свекольная ботва	г
1574	свекольные листья	г
1575	свиная вырезка	г
1576	свиная голова	г
1577	свиная грудинка	г
1578	свиная корейка	г
1579	свиная корейка копченая	г
1580	свиная корейка на кости	г
1581	свиная лопатка варено-копченая	г
1582	свиная мякоть	г
1583	свиная пашина	кг
1584	свиная печень	г
1585	свиная рулька	по вкусу
1586	свиная рулька варено-копченая	г
1587	свиная рулька копченая	г
1588	свиная шейка	кусок
1589	свинина	г
1590	свинина вареная	г
1591	свинина нежирная	г
1592	свинина с жирком	г
1593	свиное сердце	г
1594	свиное филе	г
1595	свиной подчеревок	г
1597	свиной язык	г
1598	свиные котлеты на косточке	шт.
1599	свиные легкие	г
1600	свиные ножки	г
1601	свиные отбивные	г
1602	свиные отбивные на косточке	г
1603	свиные ребра	г
1604	свиные уши	шт.
1605	свиные щечки	шт.
1606	свити	г
1607	сельдерей	г
1608	сельдерей зелень	г
1609	сельдерей корень	г
1610	сельдерей корень сушеный	по вкусу
1611	сельдерейная соль	г
1612	сельдерей семена	ч. л.
1613	сельдерей стебли	г
1614	сельдь	г
1615	сельдь слабосоленая	г
1616	сельдь соленая	шт.
1617	сельдь филе	г
1618	семга	г
1619	семга копченая	г
1620	семга свежая	г
1621	семга соленая	г
1622	семга филе на коже	г
1623	семечки	г
1624	семечки смесь	ст. л.
1625	семолина	г
1626	сервелат варено-копченый	г
1627	сибас	г
1628	сидр	г
1629	сироп	г
1630	сироп от консервированных груш	г
1631	сироп от консервированных персиков	ст. л.
1632	сироп топинамбура	стакан
1633	скумбрия	по вкусу
1634	скумбрия свежая	г
1635	скумбрия филе	г
1636	скумбрия холодного копчения	г
1637	сливки	упаковка
1638	сливки 10-20%	г
1639	сливки 15%	г
1640	сливки 20%	г
1641	сливки 33-35%	г
1642	сливки жирные	г
1643	сливки кондитерские	г
1644	сливовая паста	г
1645	сливовое варенье	г
1646	сливовое вино	г
1647	сливовый джем	г
1648	сливовый ликер	ст. л.
1649	сливовый соус	г
1650	сливочное масло	г
1651	сливы	кг
1652	сливы замороженные	г
1653	смалец	г
1654	смесь для кекса	шт.
1655	смесь для оладий	г
1656	смесь для хлеба 8 злаков	г
1657	сметана	г
1658	сметана 10%	г
1659	сметана 15%	ч. л.
1660	сметана 18%	г
1661	сметана 20%	г
1662	сметана 25%	г
1663	сметана 30%	г
1664	сметана 35%	г
1665	сметана жирная	г
1666	сметана нежирная	г
1667	сметана некислая	г
1668	смородина сушеная	г
1669	смородиновые листья	г
1670	сморчки сухие	г
1671	снежок	л
1672	сныть	г
1673	сода	г
1674	соевая мука	г
1675	соевое масло	г
1676	соевое молоко	г
1677	соевые ростки	г
1678	соевый соус	г
1679	сок	г
1680	сок из красных апельсинов	мл
1681	сок мультивитаминный	мл
1682	сок юзу	мл
1683	солод	ч. л.
1684	солод жидкий	г
1685	солодовый экстракт	г
1686	солод темный	г
1687	соломка	г
1688	соль	г
1689	соль гималайская	г
1690	соль крупного помола	г
1691	соль морская	г
1692	сом филе	г
1693	сосиски	г
1694	сосиски из куриного фарша	шт.
1695	сосиски копченые	г
1696	соус	г
1697	соус black bean	ст. л.
1698	соус sambal oelek	ч. л.
1699	соус барбекю	г
1700	соус краснодарский	г
1701	соус красный острый	г
1702	соус мирин	по вкусу
1703	соус наршараб	г
1704	соус острый	г
1705	соус песто	по вкусу
1706	соус сацебели	г
1707	соус табаско	капля
1708	соус терияки	г
1709	соус ткемали	стакан
1710	соус ткемали благородный	г
1711	соус ткемали ранний	ст. л.
1712	соус устричный	ч. л.
1713	соус чили	г
1714	соус чили сладкий	ч. л.
1715	соус экзотический	г
1716	соя	г
1717	спагетти	г
1718	спагетти № 3	г
1719	спагетти № 5	г
1720	спагетти лунги	г
1721	спаржа	кг
1722	спаржа белая	г
1723	спаржа зеленая	г
1724	спаржа молодая	г
1725	спек	г
1726	спельта	стакан
1727	спельтовая (полбяная) мука	г
1728	специи	г
1729	спирт	г
1730	спирулина порошок	г
1731	спред	г
1732	ставрида	г
1733	стейк семги	шт.
1734	стейк семги	г
1735	стеклянная лапша	г
1736	страчателла	г
1737	судак	г
1738	судак филе	г
1739	судак филе на коже	г
1740	сулугуни	г
1741	сулугуни копченый	г
1742	сумах	г
1743	суповой набор	г
1744	сухари	по вкусу
1745	сухари белые	г
1746	сухари молотые	г
1747	сухари панировочные	г
1748	сухари ржаные	г
1749	сухарная крошка	г
1750	сухофрукты	г
1751	сухофрукты тропические	по вкусу
1752	сушки	г
1753	сыворотка	г
1754	сыр	г
1755	сыр tete de moine	г
1756	сыр Австрия блю	г
1757	сыр адыгейский	г
1758	сыр бри	г
1759	сыр буко	г
1760	сыр гауда	г
1761	сыр гойя	г
1762	сыр голландский	г
1763	сыр голубой	г
1764	сыр гравьера	г
1765	сыр джугас	г
1766	сыр домашний	г
1767	сыр дорблю	г
1768	сыр имеретинский	г
1769	сыр кефалотири	г
1770	сырки творожные	г
1771	сыр козий мягкий	г
1772	сыр козий твердый	г
1773	сыр колбасный	г
1774	сыр копченый	г
1775	сыр коттедж	г
1776	сыр Маскарпоне	г
1777	сыр мраморный	г
1778	сыр мягкий	по вкусу
1779	сыр овечий	г
1780	сыр панир	г
1781	сыр пеше миньон	г
1782	сыр плавленый	г
1783	сыр плавленый шоколадный	г
1784	сыр пластинками	г
1785	сыр полутвердый	г
1786	сыр провола	г
1787	сыр российский	г
1788	сыр скаморца	г
1789	сыр скаморца копченый	г
1790	сыр сливочный	г
1791	сыр с плесенью	г
1792	сыр с плесенью мягкий	г
1793	сыр твердый	г
1794	сыр филадельфия	г
1795	сыр фонтина	г
1796	сыр хаварти	г
1797	сыр швейцарский	г
1798	сычужный фермент	ч. л.
1799	таледжо	г
1800	тальолини	г
1801	тальятелле	г
1802	тальятелле-гнезда	шт.
1803	тамаринд	шт.
1804	тамариндовая паста	ч. л.
1805	тапиока	г
1806	тарталетки	по вкусу
1807	тартар	ст. л.
1808	тархун	г
1809	творог	г
1810	творог 18%	г
1811	творог 2%	г
1812	творог 5%	г
1813	творог 9%	г
1814	творог жирный	г
1815	творог зерненый	г
1816	творог обезжиренный	г
1817	творожная масса	г
1818	творожная паста	г
1819	творожный сыр	г
1820	творожный сыр соленый	г
1821	творожок клубничный	г
1822	текила	стакан
1823	телятина	по вкусу
1824	телятина вареная	г
1825	телячий фарш	г
1826	телячьи отбивные на косточке	шт.
1827	телячьи шницели	шт.
1828	телячьи эскалопы	г
1829	телячья вырезка	г
1830	телячья печень	г
1831	телячья щека	шт.
1832	тесто бездрожжевое	г
1833	тесто готовое	г
1834	тесто для вонтонов	г
1835	тесто для пиццы	шт.
1836	тесто дрожжевое	по вкусу
1837	тесто катаифи	г
1838	тесто макаронное	г
1839	тесто макаронное для лазаньи	г
1840	тесто пельменное	г
1841	тесто песочное	по вкусу
1842	тесто пресное	г
1843	тесто пряничное	г
1844	тесто слоеное	г
1845	тесто слоеное бездрожжевое	по вкусу
1846	тесто слоеное дрожжевое	кг
1847	тесто фило	г
1848	тилапия	г
1849	тилапия филе	г
1850	тильзитер	г
1851	тимьян	горсть
1852	тимьян лимонный	веточка
1853	тимьян свежий	по вкусу
1854	тимьян сушеный	г
1855	ткемали	г
1856	тмин	г
1857	тмин молотый	г
1858	томатная паста	г
1859	томатное пюре	г
1860	томатный концентрат	г
1861	томатный порошок	г
1862	томатный сок	г
1863	томатный соус	г
1864	томатный соус итальянский	г
1865	томатный соус острый	г
1866	томатный соус с базиликом	г
1867	тоник	бутылка
1868	топинамбур	г
1869	топленое масло	г
1870	тортильи	по вкусу
1871	тортильони	г
1872	тофу	г
1873	травы ароматные	г
1874	травы пряные с перцем	ч. л.
1875	травы сухие	г
1876	треска	г
1877	треска печень	г
1878	треска филе	г
1879	трюфель	г
1880	трюфельная крошка	г
1881	трюфельное масло	ст. л.
1882	трюфель черный	шт.
1883	тунец	по вкусу
1884	тунец консервированный	г
1885	тунец филе	г
1886	тушенка	г
1887	тыква	г
1888	тыквенное масло	шт.
1889	тыквенное пюре	г
1890	тыквенные семечки	г
1891	тюлька свежая	г
1892	угорь	г
1893	угорь копченый	г
1894	угурт	г
1895	укроп	г
1896	укропное семя	ч. л.
1897	укроп свежий	г
1898	укроп сушеный	г
1899	уксус	г
1900	уксус 9%	г
1901	уксус из сидра	ст. л.
1902	уксусная эссенция	г
1903	уксус столовый	г
1904	улитки	г
1905	улитки виноградные	шт.
1906	урюк	г
1907	устрицы	г
1908	утиная грудка	г
1909	утиная печень	г
1910	утиное филе	г
1911	утиные бедрышки	г
1912	утиные ножки	по вкусу
1913	утка	по вкусу
1914	утка печеная	г
1915	утка тушка	тушка
1916	уцхо-сунели	г
1917	фазан	г
1918	фарш (баранина и говядина)	г
1919	фарш (свинина и курица)	г
1920	фасоль	г
1921	фасоль белая	г
1922	фасоль белая консервированная	г
1923	фасоль белая лима	г
1924	фасоль зеленая стручковая	г
1925	фасоль кенийская	горсть
1926	фасоль кидни красная	г
1927	фасоль консервированная	г
1928	фасоль красная	г
1929	фасоль красная вареная	стакан
1930	фасоль красная консервированная	г
1931	фасоль молодая замороженная	г
1932	фасоль пинто	г
1933	фасоль спаржевая вареная	г
1934	фасоль стручковая	г
1935	фасоль стручковая замороженная	г
1936	фасоль стручковая консервированная	г
1937	фасоль черный глаз	г
1938	фейхоа	г
1939	фенхель	г
1940	фенхель семена	г
1941	фенхель семена молотые	г
1942	фестонате	г
1943	фета	г
1944	фетаки	г
1945	фетакса	г
1946	феттучине	г
1947	фиалки засахаренные	шт.
1948	фиалковый сироп	г
1949	физалис	по вкусу
1950	филе красного окуня	шт.
1951	филе лосося	г
1952	филе палтуса	шт.
1953	финики	г
1954	финики без косточек	стакан
1955	финики иранские	г
1956	финики иранские без косточек	шт.
1957	фисташки	г
1958	фисташки очищенные	г
1959	фисташки очищенные несоленые	горсть
1960	фисташки рубленые	г
1961	фисташковая мука	г
1962	фисташковая паста	г
1963	фисташковое масло	г
1964	фокачча	по вкусу
1965	форель	г
1966	форель вареная	г
1967	форель горячего копчения	г
1968	форель озерная свежая	шт.
1969	форель слабосоленая	г
1970	форель слабосоленая	шт
1971	форель стейки	шт.
1972	форель филе	г
1973	форель холодного копчения	г
1974	фрикадельки	г
1975	фрукт дракона	шт.
1976	фруктовый сироп	г
1977	фруктовый сок	г
1978	фруктовый сок без сахара	стакан
1979	фруктоза	г
1980	фрукты	г
1981	фрукты консервированные	г
1982	фундук	г
1983	фундучная мука	г
1984	фунчоза	г
1985	халва	г
1986	халва ванильная	г
1987	халва подсолнечная	г
1988	халуми	г
1989	хамон	г
1990	хек	г
1991	хек филе	г
1992	херес	стакан
1993	хересный уксус	ч. л.
1994	хлеб	г
1995	хлеб 7 злаков	батон
1996	хлеб белый	г
1997	хлеб белый сухой	г
1998	хлеб бородинский	кусок
1999	хлеб датский ржаной	г
2000	хлеб для сэндвичей	г
2001	хлебная крошка	г
2002	хлеб ржаной	г
2003	хлеб серый	г
2004	хлеб с кунжутом	кусок
2005	хлеб цельнозерновой	г
2006	хлебцы пшенично-ржаные цельнозерновые	г
2007	хлопья 4 злака	г
2008	хлопья 5 злаков	г
2009	хлопья 7 злаков	ст. л.
2010	хлопья быстрого приготовления	стакан
2011	хлорид кальция	г
2012	хмели-сунели	г
2013	хмель	ст. л.
2014	хрен	г
2015	хрен протертый	г
2016	хрен со сливками	г
2017	хурма	г
2018	хурма спелая	г
2019	цесарка тушка	г
2020	цикорий	ч. л.
2021	цитроновые цукаты	горсть
2022	цитрусовые цукаты	шт.
2023	цитрусовый свежевыжатый сок	мл
2024	цукаты	г
2025	цукини	г
2026	цукини цветы	шт.
2027	цыплята	г
2028	цыплята-корнишоны	шт.
2029	чабер	г
2030	чабрец	г
2031	чабрец сушеный	г
2032	чай дарджилинг	пакетик
2033	чай жасминовый	ст. л.
2034	чай зеленый	пакетик
2035	чай копченый лапсанг сушонг	г
2036	чай красный	г
2037	чай ройбуш	ст. л.
2038	чай черный	г
2039	чай черный крупнолистовой	ч. л.
2040	чай черный со специями	пакет
2041	чай эрл грей	стакан
2042	чатни манго	г
2043	чеддер	г
2044	черемуха	г
2045	черемуховая мука	г
2046	черемша	г
2047	черешневый джем	г
2048	черешня	г
2049	черешня консервированная без косточек	ст. л.
2050	черная смородина	г
2051	черника	г
2052	черника замороженная	г
2053	чернила каракатицы	г
2054	черничный джем	стакан
2055	чернослив	г
2056	чернослив без косточек	г
2057	чернослив вяленый	г
2058	чернослив копченый без косточек	г
2059	черносмородиновое варенье	г
2060	черносмородиновый джем	г
2061	чеснок	г
2062	чеснок молодой	г
2063	чеснок сушеный	г
2064	чесночная соль	щепотка
2065	чесночное масло	по вкусу
2066	чесночный порошок	г
2067	чечевица	г
2068	чечевица вареная	ст. л.
2069	чечевица зеленая	г
2070	чечевица красная	г
2071	чечил спагетти	г
2072	чиабатта	кусок
2073	чиа семена	г
2074	чипотле молотый	щепотка
2075	чипсы	г
2076	чоризо	г
2077	шалфей	г
2078	шалфей свежий	пучок
2079	шалфей сушеный	лист
2080	шампанское	г
2081	шампанское советское	стакан
2082	шампанское сухое	ст. л.
2083	шампиньоны	по вкусу
2084	шампиньоны замороженные	г
2085	шампиньоны консервированные	г
2086	шампиньоны маринованные	г
2087	шампиньоны свежие	г
2088	шафран	г
2089	шафран имеретинский	г
2090	шафран молотый	ч. л.
2091	шафран нити	шт.
2092	шелковица	г
2093	шелковица сушеная	г
2094	шиповник	г
2095	шиповниковый сироп	г
2096	шнапс	г
2097	шнитт-лук	стебель
2098	шоколад	г
2099	шоколад белый	г
2100	шоколад горький с апельсиновой цедрой	г
2101	шоколад молочный	г
2102	шоколад мятный	г
2103	шоколадная паста	г
2104	шоколадная стружка	г
2105	шоколадное масло	г
2106	шоколадно-ореховая паста	г
2107	шоколадные горошины	г
2108	шоколадные капли	г
2109	шоколадные капли белые	г
2110	шоколадные конфеты	г
2111	шоколадные хлопья	г
2112	шоколадные шарики из готовых завтраков	горсть
2113	шоколадный ликер	г
2114	шоколадный сироп	г
2115	шоколадный соус	г
2116	шоколад полусладкий	г
2117	шоколад с орехами	г
2118	шоколад черный горький	г
2119	шоколад черный горький 70%	г
2120	шоколад черный горький 75%	ч. л.
2121	шоколад черный горький 85%	г
2122	шортенинг	стакан
2123	шпик	шт.
2124	шпик копченый	г
2125	шпинат	г
2126	шпинат замороженный	г
2127	шпинат молодой	г
2128	шпинат свежий	г
2129	шпроты	г
2130	шпроты в масле	г
2132	щавель замороженный	г
2133	щавель свежий	веточка
2134	щука	г
2135	щука филе	г
2136	эгг-ног	стакан
2137	эдам	г
2138	эль	мл
2139	эмменталь	г
2140	эскалоп	г
2141	эстрагон	г
2142	эстрагон сушеный	веточка
2143	яблоки	г
2144	яблоки антоновка	кг
2145	яблоки гала	г
2146	яблоки голден	г
2147	яблоки гренни смит	кг
2148	яблоки зеленые	г
2149	яблоки красные	шт.
2150	яблоки моченые	шт.
2151	яблоки нетвердых сортов	г
2152	яблоки сладкие	г
2153	яблоки сушеные	г
2154	яблочная эссенция	ч. л.
2155	яблочное варенье	г
2156	яблочное повидло	г
2157	яблочное пюре	г
2158	яблочные чипсы	стакан
2159	яблочный джем	г
2160	яблочный сироп	ст. л.
2161	яблочный сок	г
2162	яблочный соус	ст. л.
2163	яблочный уксус	г
2164	ягнятина	г
2165	ягнятина кострец	г
2166	ягнятина фарш	г
2167	ягнячьи отбивные на косточке	шт.
2168	ягнячья голень нарубленная	г
2169	ягнячья корейка	г
2170	ягодное варенье	ст. л.
2171	ягодное желе	г
2172	ягодный сироп	г
2173	ягодный сок	г
2174	ягодный соус кислый	г
2175	ягоды	г
2176	ягоды вяленые	по вкусу
2177	ягоды замороженные	г
2178	ягоды лесные	г
2179	ягоды лесные замороженные	г
2180	яичные белки	г
2181	яичные желтки	г
2182	яичные желтки вареные	шт.
2183	яичные желтки крупные	г
2184	яичный меланж	г
2185	яичный порошок	ст. л.
2186	яйца куриные	г
2187	яйца куриные крупные	г
2188	яйца перепелиные	г
2189	японская крошка панко	г
2190	ячменные хлопья	г
2191	ячмень	г
2192	ячневая крупа	г
\.


--
-- Data for Name: recipes_ingredientamount; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.recipes_ingredientamount (id, amount, ingredient_id, recipe_id) FROM stdin;
156	200.0	1747	9
157	10.0	1314	9
158	10.0	80	9
159	3.0	1170	9
160	3.0	2077	9
161	2.0	2186	9
162	60.0	232	9
163	600.0	281	9
164	400.0	1596	9
165	150.0	194	9
166	250.0	1077	9
167	50.0	1	9
232	0.0	7	3
233	20.0	13	3
170	800.0	782	7
171	200.0	1782	7
234	30.0	194	3
235	0.0	1917	3
176	2.0	812	4
177	120.0	149	4
178	2.0	2186	4
179	60.0	1423	4
187	450.0	281	5
188	4.0	1055	5
189	1.5	252	5
190	300.0	1102	5
191	400.0	1351	5
192	400.0	1927	5
193	250.0	521	5
199	3.0	2186	2
200	70.0	1037	2
201	2.0	1345	2
202	120.0	1754	2
203	50.0	436	2
209	6.0	2149	1
210	4.0	2186	1
211	1.0	1083	1
212	2.5	1413	1
213	30.0	1650	1
220	2.0	531	8
221	1.0	767	8
222	200.0	1055	8
223	50.0	1492	8
224	20.0	1688	8
225	50.0	1	8
227	5.0	1084	6
\.


--
-- Data for Name: recipes_recipe; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.recipes_recipe (id, title, duration, text, pub_date, image, slug, author_id) FROM stdin;
1	Шарлотка с яблоками	60	В глубокой миске взбейте яйца с сахаром. В массу просейте муку с разрыхлителем через сито. Хорошо перемешайте тесто. Очищенное яблоко без сердцевины нарежьте произвольно, а потом добавьте в тесто. Форму для выпечки смажьте маслом. Влейте в неё тесто. Запекайте шарлотку при 180 градусах в течение 40-50 минут. Приятного чаепития!	2020-09-04 17:03:11.106+00	recipe_images/ded_br_DqsmoGo.jpg	шарлотка-с-яблоками	2
3	Яичные роллы с ветчиной и авокадо	15	В мисочку разбейте 4 яйца и добавьте 2 белка, слегка взбейте массу вилкой или венчиком. Добавьте соль и перец. \r\nНа сковороде разогрейте немного растительного масла и вылейте туда яичную массу. Жарьте минуты полторы на одной стороне, потом переверните и обжарьте еще минутку. \r\nПока жарится омлет, вымойте авокадо, разрежьте напополам, достаньте косточку. Мякоть отделите от шкурки. Нарежьте мякоть мелким кубиком. \r\nГотовый омлет выложите на плоскую тарелку, сверху положите 2 кусочка ветчины или бекона. \r\nАвокадо выложите на омлет ближе к одному краю, сверните омлет с ветчиной и авокадо в плотный рулет.\r\nПолучившийся рулет разрежьте на 2 небольших ролла и подавайте к столу.	2020-09-04 17:23:22.839+00	recipe_images/snow_br_Uo2eF5f.jpg	яичные-роллы-с-ветчиной-и-авокад	3
7	Курица в сырном соусе "Птичье молочко"	70	Бедра промойте под прохладной водой. \r\nРазрежьте бедра на две части, залейте водой. Накройте сковороду крышкой, тушите на медленном огне до тех пор, пока мясо не будет легко сниматься с кости, в течение 40-60 минут.\r\nДобавьте плавленный сырок, молотый перец и сушеный чеснок. Перемешайте и тушите еще 10 минут.\r\nПриятного аппетита!	2020-09-04 18:10:01.699+00	recipe_images/leo_din_MGIeVIk.jfif	курица-в-сырном-соусе-птичье-мол	4
5	Итальянский обед	120	1. Очистите лук и нарежьте его мелко, обжарьте фарш с луком в кастрюле до готовности. Тем временем очистите и нарежьте кружочками морковь, сельдерей. Добавьте овощи к обжаренному мясу. \r\n2. Отправьте кастрюлю на огонь, добавьте фасоль (слейте воду), консервированные томаты (свежие), томатный соус. Влейте воду и бульон, а также посолите и поперчите, добавьте все специи по вкусу (примерно по 1 чайной ложке каждой). Варите суп после закипания 15 минут. \r\n3. Спустя необходимое время добавьте в кастрюлю свежую кукурузу, измельченную капусту, перемешайте и варите до готовности. \r\n4. Суп подавайте сразу после приготовления, он густой и очень сытный.	2020-09-04 17:51:11.483+00	recipe_images/ded_din_TEYdnIZ.jpg	итальянский-обед	2
6	Говяжье сердце тушеное в сметане	180	Залейте сердце холодной водой на 2 часа, чтобы из него вышла кровь. \r\nПорежьте сердце на тонкие брусочки и выложите в сковороду. Влейте к нему 200 миллилитров воды. \r\nПоставьте на средний огонь и доведите до кипения, снимая пену. Закройте крышкой, убавьте огонь и тушите до мягкости. На это уйдет от 1 до 1,5 часов. Все зависит от толщины нарезки. \r\nВсе посолите и поперчите. Добавьте в сковороду к сердцу сметану и перемешайте. \r\nВлейте оставшуюся воду и перемешайте. Выключите огонь и оставьте на 10 минут.\r\nРепчатый лук почистите и порежьте. В сковороду налейте растительное масло, разогрейте его на среднем огне и выложите лук. Обжаривайте лук в течение 5 минут. \r\nВыложите обжаренный лук в сковороду с сердцем и перемешайте.\r\nНа сухую сковороду насыпьте муку и обжарьте ее на медленном огне до орехового запаха. \r\nВлейте немного воды и перемешайте, чтобы не было комочков. Варите 1-2 минуты на слабом огне до загустения. \r\nПроцедите через сито мучную массу в сковороду и перемешайте. Готовьте на медленном огне еще 7 минут, до загустения. \r\nПетрушку мелко порежьте, чеснок почистите и натрите на мелкой терке, добавьте в сковороду с тушеным сердцем. Перемешайте, прогрейте еще 2 минуты и снимите с огня. \r\nПриятного аппетита!	2020-09-04 17:58:49.576+00	recipe_images/snow_din_07Avaiz.jfif	говяжье-сердце-тушеное-в-сметане	3
9	Мясной хлеб	100	1. Духовку разогрейте до 180 градусов. В большой миске соедините сухари, пармезан, петрушку, базилик, орегано, шалфей, соль и перец, а также измельченный чеснок и лук. \r\n2. Теперь в эту миску отправьте оба вида фарша, слегка взбитые яйца и вино. Все хорошо вымешайте до однородности.\r\n3. В форму для выпечки выложите пергаментную бумагу, большую часть мясной смеси влейте в форму. \r\n4. Сверху выложите кусочки ветчины и большую часть порезанной моцареллы. Теперь при помощи бумаги, поднимая ее за края, утрамбуйте мясной рулет, чтобы он стал плотным и начинка оказалась внутри. \r\n5. С помощью оставшейся мясной массы замажьте все неровности и трещины в рулете. Теперь аккуратно перенесите рулет на противень (можно прямо с бумагой) и выпекайте в духовке 70 минут. \r\n6. После выпекания смажьте рулет томатным соусом и украсьте оставшейся моцареллой, натерев ее. Отправьте в духовку еще на 5 минут.	2020-09-04 18:35:32.787+00	recipe_images/leo_sup_qZ5GiMV.jpg	мясной-хлеб	4
4	Лаваш с начинкой	20	Брынзу натрите на терке в пиалу или глубокую тарелку. Если сыр не соленый, то чуть присолите его. Куриные яйца вбейте в миску, посолите и взбейте в течение 1-2 минут. \r\nЛисты лаваша нарежьте лентами с помощью ножниц. Один лист разрежьте на три ленты. На край ленты выложите часть начинки. \r\nЗаверните треугольником, затем еще раз заверните, чтобы открытые края лаваша, через которые видно начинку, оказались закрытыми. Отрежьте ленту и снова выложите на нее начинку, приготовьте еще одну заготовку. \r\nТаким образом приготовьте все заготовки. \r\nПрогрейте сковороду с растительным маслом на минимальном нагреве, обмакните заготовку в яичную смесь со всех сторон. \r\nВыложите на сковороду. Также поступите и с остальными заготовками. Обжарьте около 1-2 минут с одной стороны. \r\nПереверните на другую сторону и обжарьте до румяности. Нагрев не повышайте, иначе они подгорят, а внутри не пропекутся. \r\nВыложите лаваш с начинкой на тарелку и подайте к столу с чаем или кофе. Блюдо идеально для завтрака или полдника.	2020-09-04 17:37:42.255+00	recipe_images/leo_br_UtwS3TC.jfif	лаваш-с-начинкой	4
2	Омлет	10	Для того чтобы приготовить вкусный, быстрый и полезный завтрак, необходимо промыть помидоры и нарезать их кружочками. После этого промываем и просушиваем зелень, а затем мелко рубим ее. Сыр необходимо натереть на терке.\r\nЯйца разбиваем в отдельную емкость и смешиваем с молоком и специями. Тщательно взбиваем. На раскаленную сковороду наливаем растительное масло, начинаем тушить помидоры. После добавляем зелень и соль, тщательно перемешивая. Затем добавляем томатный соус и заливаем смесь яичной смесью. Накрываем крышкой и готовим в течение нескольких минут, после чего посыпаем яичницу тертым сыром и зеленью. Готовим в течение 5 минут — и вуаля! Вкусный и полезный завтрак готов, приятного аппетита!	2020-09-04 17:14:12.384+00	recipe_images/ded_su_h1RYaPL.jpg	омлет	2
8	Рыба жареная	50	Приготовить таким образом можно не только кету, но и форель, лосось - любую красную рыбу. Промоем рыбные стейки, очистим их, если необходимо. \r\nПриготовим маринад. В небольшой мисочке смешиваем соевый соус, сок из целого апельсина, сахар и масло. \r\nЗаливаем рыбные стейки половиной приготовленного маринада и оставляем минут на 15. \r\nРыбу будем запекать в духовке. Форму для запекания можно застелить фольгой. Слегка смажем фольгу маслом и выложим на неё стейки. Ставим их запекаться в разогретую до 200 градусов духовку на 15 минут. Следите за рыбкой, не нужно ее пересушивать! \r\nА теперь займемся салатом. Пока рыба мариновалась, мы уже почистили морковку, да? Натираем морковку на терке или с помощью овощечистки. Пекинскую капусту тонко шинкуем. \r\nЗелень рукколы промоем и подсушим на полотенце, пусть уйдет лишняя влага. Добавим листики рукколы к капусте и морковке. Перемешаем. \r\nРаскладываем салат по тарелкам.\r\nРыбка уже готова, достаем ее из духовки. Выкладываем на салат, солим и перчим. Поливаем оставшимся маринадом, посыпаем кунжутными семечками и подаем к столу.	2020-09-04 18:26:30.725+00	recipe_images/snow_din_pj8nIjI.jpg	рыба-жареная	3
\.


--
-- Data for Name: recipes_tag; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.recipes_tag (id, title, slug, color, recipe_id) FROM stdin;
49	Ужин	s	purple	9
51	Обед	d	green	7
53	Завтрак	b	orange	4
55	Обед	d	green	5
58	Завтрак	b	orange	2
59	Обед	d	green	2
63	Завтрак	b	orange	1
64	Обед	d	green	1
65	Ужин	s	purple	1
68	Обед	d	green	8
69	Ужин	s	purple	8
72	Обед	d	green	6
73	Ужин	s	purple	6
75	Завтрак	b	orange	3
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||142df61f5db646a32e70666c3e452340	{"name": "recipe_images/ded_su_NDsl8AO.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 341]}
sorl-thumbnail||image||1dc746ec373cd09c9ccfb84027e0a608	{"name": "recipe_images/snow_br_VB2sy56.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 394]}
sorl-thumbnail||image||2b9b3ae7c338672a701703ac06b314c3	{"name": "cache/2c/6b/2c6b01d44d731eb3d11897a8bff0e9d1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [647, 500]}
sorl-thumbnail||image||4118db626c347082c4bff1bcedaf4ed4	{"name": "cache/6a/55/6a559fd086d2857ca3e2a535ebad630c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||4a2bdf3491615a23c70af25a24254340	{"name": "cache/29/1c/291c1f1a976774fe25e7d0efdb5175b3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [751, 500]}
sorl-thumbnail||image||52308900384144edfde3b233d91252f3	{"name": "recipe_images/snow_din.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 469]}
sorl-thumbnail||image||582a818b0bad9afdbaf4dc028cbe037d	{"name": "cache/19/6b/196b9e1ba4fb6fd02280f176ad5a8e02.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||59823d133a06f896a6bb3b9d151742e2	{"name": "cache/19/f0/19f0ceffa50f4411a7a4f4bb8929a178.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||5c9995c5a9ac05d51a20f3f4d7c70ad9	{"name": "cache/67/f2/67f215ac69030cd74f37a236ca795549.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [770, 500]}
sorl-thumbnail||image||5ea322f683f468807aba9a91205fee31	{"name": "recipe_images/snow_din_fn2s93t.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 469]}
sorl-thumbnail||image||65273537647a19745dc536f1fa95d47d	{"name": "recipe_images/leo_sup_bcMyyR1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 457]}
sorl-thumbnail||image||811dca3194337b0236d3e10ec0ba173b	{"name": "recipe_images/ded_din_UptxyQ6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 538]}
sorl-thumbnail||image||83b3d55573438da788e7c8b695d79a96	{"name": "cache/fb/12/fb1241b08422190e3b64a7f4995b55c8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [749, 500]}
sorl-thumbnail||image||89285663254180f95dd039d0f5a309e9	{"name": "cache/25/69/2569591e30237da36be85915e4089bf1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||93f469d019273c0f23151e142cb03d9f	{"name": "cache/2b/04/2b04fba38075cce720bb008ff996cef4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||9896572d9df44a82090fc641e39c7c5d	{"name": "cache/94/6f/946fba60e75cc4ea5b41bde8eb5a7bbe.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||a57f4586d3990dc68351d3421f32604f	{"name": "cache/bb/f3/bbf36e4802e7094221cdb947137989db.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [647, 500]}
sorl-thumbnail||image||ab97dd8dabe66cd906cf3f5ab4cb5fb7	{"name": "recipe_images/leo_din_INjK3go.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 405]}
sorl-thumbnail||image||c13c701fdb4d581b7ee8de8d79de6a5e	{"name": "cache/9d/d7/9dd72fba196050fa6514bc611d298a18.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||c36271b3d81e02af720b385f93c54981	{"name": "recipe_images/leo_br_EXLqWjZ.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 404]}
sorl-thumbnail||image||c3871795e11760c5988408e09d901d9f	{"name": "cache/3e/95/3e959409e293b0a8d4165ab377c4fdc7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||c5ff62a89e3d7185e0360a89c187fae4	{"name": "cache/70/2c/702cb856b7241ff0940ae3ac5b455dc5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [820, 500]}
sorl-thumbnail||image||c93dc545fc4e4d5d7f3a353bb5eae649	{"name": "cache/3f/89/3f89d058eaa8e3ff1c957c11cec019f4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [712, 500]}
sorl-thumbnail||image||d36ea08bdc8ca4127433c2376d13143c	{"name": "recipe_images/snow_din_BqJokkp.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 426]}
sorl-thumbnail||image||d72f36f8b6d37187b5456b9e0010e23e	{"name": "cache/fb/71/fb71562565b852c4bff0a63f41bf2089.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [664, 500]}
sorl-thumbnail||image||dddb07c1a06071838c155204af027dc2	{"name": "cache/a8/3f/a83faf9df9c4a54a671e78f65940cfd3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||deb8f1fa5cc7f07f6ed12213d1c2ebf5	{"name": "cache/16/6a/166a2967e452cafd2a1aab5edab0bbd1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [890, 500]}
sorl-thumbnail||image||e1cd9c1daf215bcce9fd15a8982d18ab	{"name": "cache/aa/6e/aa6e12fee4a5c54c597aafb2210f8d92.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [564, 500]}
sorl-thumbnail||image||f515c884421d64a87476675d5d95e869	{"name": "cache/72/ea/72eaa055d3776932b5ee26f8936a27ab.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [890, 500]}
sorl-thumbnail||image||fea802a95cdd93c564a43e6958708f11	{"name": "recipe_images/ded_br_QTsmGQw.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 370]}
sorl-thumbnail||thumbnails||142df61f5db646a32e70666c3e452340	["4118db626c347082c4bff1bcedaf4ed4", "f515c884421d64a87476675d5d95e869"]
sorl-thumbnail||thumbnails||1dc746ec373cd09c9ccfb84027e0a608	["582a818b0bad9afdbaf4dc028cbe037d", "5c9995c5a9ac05d51a20f3f4d7c70ad9"]
sorl-thumbnail||thumbnails||52308900384144edfde3b233d91252f3	["2b9b3ae7c338672a701703ac06b314c3"]
sorl-thumbnail||thumbnails||5ea322f683f468807aba9a91205fee31	["c3871795e11760c5988408e09d901d9f", "a57f4586d3990dc68351d3421f32604f"]
sorl-thumbnail||thumbnails||65273537647a19745dc536f1fa95d47d	["59823d133a06f896a6bb3b9d151742e2", "d72f36f8b6d37187b5456b9e0010e23e"]
sorl-thumbnail||thumbnails||811dca3194337b0236d3e10ec0ba173b	["dddb07c1a06071838c155204af027dc2", "e1cd9c1daf215bcce9fd15a8982d18ab"]
sorl-thumbnail||thumbnails||ab97dd8dabe66cd906cf3f5ab4cb5fb7	["89285663254180f95dd039d0f5a309e9", "83b3d55573438da788e7c8b695d79a96"]
sorl-thumbnail||thumbnails||c36271b3d81e02af720b385f93c54981	["c13c701fdb4d581b7ee8de8d79de6a5e", "4a2bdf3491615a23c70af25a24254340"]
sorl-thumbnail||thumbnails||d36ea08bdc8ca4127433c2376d13143c	["c93dc545fc4e4d5d7f3a353bb5eae649", "9896572d9df44a82090fc641e39c7c5d"]
sorl-thumbnail||thumbnails||fea802a95cdd93c564a43e6958708f11	["93f469d019273c0f23151e142cb03d9f", "c5ff62a89e3d7185e0360a89c187fae4"]
sorl-thumbnail||image||0391ade44f3a0cf6a84a324be31a48b3	{"name": "recipe_images/ded_din_uaBSuJS.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 538]}
sorl-thumbnail||image||fafe78de51263f70666fbd77e8ab7250	{"name": "cache/b7/32/b732eab308233cf40a572b8da0551b2e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [564, 500]}
sorl-thumbnail||image||cd7912a6da78ac8f2799f1f0cfe89ff4	{"name": "cache/19/df/19df131cb7912b13923dd6ffdac68bb7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||0391ade44f3a0cf6a84a324be31a48b3	["fafe78de51263f70666fbd77e8ab7250", "cd7912a6da78ac8f2799f1f0cfe89ff4"]
sorl-thumbnail||image||800056a5b1031edf660168c4fe4cae89	{"name": "recipe_images/ded_su_WVqlsGW.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 341]}
sorl-thumbnail||image||374d255e5dead14393f7cc6148d903b0	{"name": "cache/4c/b2/4cb2e46c6ad135ab726c17e83b52d1bd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [890, 500]}
sorl-thumbnail||image||8b7ff2d9554ef90801765b62b8e5f506	{"name": "cache/6f/b4/6fb417d38f2fc33d0d0d3ae0592f288f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||800056a5b1031edf660168c4fe4cae89	["374d255e5dead14393f7cc6148d903b0", "8b7ff2d9554ef90801765b62b8e5f506"]
sorl-thumbnail||image||0723f5da4084f4c87dd9f6d1c4652ac9	{"name": "recipe_images/ded_br_IK4kqDl.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 370]}
sorl-thumbnail||image||397c60de6fb570dec1326f1d77999b74	{"name": "cache/f8/ee/f8ee2da2dbae1fc59c931bbc381e6639.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [820, 500]}
sorl-thumbnail||image||087d4eb6cf9c1c1437c1cab4df705e58	{"name": "cache/ec/fd/ecfd8dbcc47ddcf9f6f2f86375512eb8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||0723f5da4084f4c87dd9f6d1c4652ac9	["087d4eb6cf9c1c1437c1cab4df705e58", "397c60de6fb570dec1326f1d77999b74"]
sorl-thumbnail||image||8200f4c35deffdb0cadd119812370dc0	{"name": "recipe_images/snow_din_iG263a2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 469]}
sorl-thumbnail||image||b2a0799953f9f6f3b0dfa5fab0c60ee8	{"name": "cache/c9/77/c97740e1f235b6aa630eb8e7a936fae1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [647, 500]}
sorl-thumbnail||image||dc94b8ea546e4155f73a9ed869caf3db	{"name": "cache/2a/64/2a64ca81cd02b64213a4c95ea6d8a515.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||8200f4c35deffdb0cadd119812370dc0	["b2a0799953f9f6f3b0dfa5fab0c60ee8", "dc94b8ea546e4155f73a9ed869caf3db"]
sorl-thumbnail||image||9cf3035ecbe519758384d29f144a2339	{"name": "recipe_images/snow_din_lB8elmO.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 426]}
sorl-thumbnail||image||9ee8c8c1981a40256b041febfda0f3e5	{"name": "cache/fb/a0/fba0df82c8154d6bdbf1bbaef85a8592.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [712, 500]}
sorl-thumbnail||image||2ba83d653118c65c9ee9fb492e0ad9a2	{"name": "cache/b3/b8/b3b88c4d79e6196561460862f3d6639d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||9cf3035ecbe519758384d29f144a2339	["9ee8c8c1981a40256b041febfda0f3e5", "2ba83d653118c65c9ee9fb492e0ad9a2"]
sorl-thumbnail||image||c36644456c0f053a326265e868429a46	{"name": "recipe_images/snow_br_X8gAPq5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 394]}
sorl-thumbnail||image||8771b0118fa29ec4beab4169d150dc65	{"name": "cache/bd/88/bd88d067d58a723c6e01b9b39de451bb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [770, 500]}
sorl-thumbnail||image||47ee2a2cf93c66a670578b4cc66aafda	{"name": "recipe_images/leo_sup_8IpgLzM.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 457]}
sorl-thumbnail||image||cbe012f3b8daaa1c08e468ea7459a92e	{"name": "cache/34/4b/344b2eaa637167b1fe7675a49fc1cfac.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [664, 500]}
sorl-thumbnail||image||7c861bd2fa8b0989dfbabb6aba791523	{"name": "cache/67/81/678106a867acc6d4af69cb958bf7b330.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||47ee2a2cf93c66a670578b4cc66aafda	["7c861bd2fa8b0989dfbabb6aba791523", "cbe012f3b8daaa1c08e468ea7459a92e"]
sorl-thumbnail||image||3d2fbddb60106b5a8f063c6178897698	{"name": "recipe_images/leo_din_rpp40G3.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 405]}
sorl-thumbnail||image||56d5f7b2dec57f80d303efe0987f3b1c	{"name": "cache/86/70/8670ed4de857f00833b25e7cc8b8eec7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [749, 500]}
sorl-thumbnail||image||431596449ba3df2511d388bb473dd714	{"name": "cache/be/31/be311cefcef689d5997eb407d573d4c8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||3d2fbddb60106b5a8f063c6178897698	["56d5f7b2dec57f80d303efe0987f3b1c", "431596449ba3df2511d388bb473dd714"]
sorl-thumbnail||image||5dbb36a56ce1accc114820ffc7d01cac	{"name": "cache/98/19/9819061d0dbe6115423374948581dae6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||c36644456c0f053a326265e868429a46	["8771b0118fa29ec4beab4169d150dc65", "5dbb36a56ce1accc114820ffc7d01cac"]
sorl-thumbnail||image||05e9f025c3595e82606564cc3e22fe55	{"name": "recipe_images/leo_br_dKSSVWz.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 404]}
sorl-thumbnail||image||1174b12b466c36aaa25b27602f63b383	{"name": "cache/73/55/7355738abb93d63c9a59cc7794f55a2c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [751, 500]}
sorl-thumbnail||image||201fd0e9733ca111e949cda78ae49af5	{"name": "cache/11/dc/11dc84431a8e0dd433166d076f060f3a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||05e9f025c3595e82606564cc3e22fe55	["201fd0e9733ca111e949cda78ae49af5", "1174b12b466c36aaa25b27602f63b383"]
sorl-thumbnail||image||002ae63a9157a8a2c04b8c39c7713bf4	{"name": "cache/41/c6/41c6b628a831287e55b12b31b85a1079.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||0076b54d5f63153e3d0de20b90e59ee9	{"name": "recipe_images/snow_br.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 394]}
sorl-thumbnail||image||1929e543bfe92c943d837d79ab3f2ed8	{"name": "cache/d2/69/d269303379122c7bbfa8f58f43b05c0c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||214b07a168d61ce393423e575bee5211	{"name": "cache/c9/5f/c95f4a370feb5d2f37b4a41b8fa81f0c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [770, 500]}
sorl-thumbnail||image||2e10c1521922a27844418f32e353fa14	{"name": "cache/9c/07/9c079f6fe9cb422e5600fd40367ea6de.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [712, 500]}
sorl-thumbnail||image||48115317d337472a807a0180f52d8791	{"name": "recipe_images/snow_din_xF8544v.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 469]}
sorl-thumbnail||image||4c2843928b5d681fc6492df4177af4ef	{"name": "cache/b4/95/b495904ddb9b0de6ba1e1afb1ee1ad9d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [749, 500]}
sorl-thumbnail||image||4eda9b1f787a25fb86c7be6d326e0871	{"name": "recipe_images/leo_br.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 404]}
sorl-thumbnail||image||57b9dcb38aade2eaa2c9619b52a2f144	{"name": "recipe_images/ded_su.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 341]}
sorl-thumbnail||image||751dcc71476ad09ab83dff4b546745b1	{"name": "cache/50/01/5001f11714aa6897f445bc2139f95e7b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [877, 500]}
sorl-thumbnail||image||795ae05331eaa230f8dbbc5be88fecda	{"name": "cache/8f/05/8f05c2ecd503892454ec005465736596.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [751, 500]}
sorl-thumbnail||image||7ef77482e387d23a8c38ce165f07589e	{"name": "recipe_images/leo_sup.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 457]}
sorl-thumbnail||image||95c479a4e1fbd030dc6afb7f3d46a707	{"name": "cache/aa/ad/aaada23b09998b53ea6745b446f51892.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||b2245e44b03b2f4ba5fa32cc3da06ba8	{"name": "cache/6b/98/6b98f72c1cab4119798e777d2382b183.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||c154f4f7ff620374e62ca17ac95e0939	{"name": "recipe_images/ded_br.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 370]}
sorl-thumbnail||image||d03096265e7a24fc759dc1dca14024fa	{"name": "cache/1f/2a/1f2a6463d6d86e254e05286337c3fb3a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [820, 500]}
sorl-thumbnail||image||d169cab74e7421fe0aedbc6e5a4ad8ce	{"name": "cache/77/b6/77b601cd60cb209fce097d3734d9c83e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||dc701a51aaad2b896446f7e7620b15b6	{"name": "cache/77/76/7776c38b4cb34c86e835954d4c6e9f3e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [664, 500]}
sorl-thumbnail||image||dd77f19bbfeb9a3e27a7c9176b76f863	{"name": "cache/99/8e/998eb7048e350dfc427129b43208096d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||dff0565cc92986a9be2f9c57050ffdc1	{"name": "recipe_images/leo_din.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 405]}
sorl-thumbnail||image||e0c13c0740b74686c15cb5d266b5c165	{"name": "cache/8d/9c/8d9c1e06c00cbacf0730be2b5e627a29.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [564, 500]}
sorl-thumbnail||image||e44f0e61def85ee43edfa0a89fdcc39c	{"name": "recipe_images/snow_din.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 426]}
sorl-thumbnail||image||e50d87173df8a536d56c0ca62d1f04e1	{"name": "recipe_images/war_Pxphoki.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1102, 628]}
sorl-thumbnail||image||e94572e31a00663761dbead0c3e77e7e	{"name": "cache/bf/9b/bf9b9f4a4f33278b0cf35eb1655d2b20.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||eca26f92a7b4ae45455c37b2001eff6a	{"name": "cache/d6/34/d634683df712e0d36dbe200a2f1314ad.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||ef827b9dadff39e2c48e4423eb81d652	{"name": "recipe_images/ded_din.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 538]}
sorl-thumbnail||image||efd90ec5efd6304b89d98fe9401ecb05	{"name": "cache/d9/9b/d99b49e85e03e7c6528a418355f07d56.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||image||f2865fde63c88639fe5dcc675696b5fc	{"name": "cache/a8/cf/a8cf6ec9eb7da22a32d8ac0a8804866e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [647, 500]}
sorl-thumbnail||image||fe82f1f3c14b4ea7f16af1b438077d32	{"name": "cache/4c/a5/4ca5ea8a73c0fd29ea64fa97bf0f6854.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||0076b54d5f63153e3d0de20b90e59ee9	["214b07a168d61ce393423e575bee5211", "e94572e31a00663761dbead0c3e77e7e"]
sorl-thumbnail||thumbnails||48115317d337472a807a0180f52d8791	["d169cab74e7421fe0aedbc6e5a4ad8ce", "f2865fde63c88639fe5dcc675696b5fc"]
sorl-thumbnail||thumbnails||4eda9b1f787a25fb86c7be6d326e0871	["95c479a4e1fbd030dc6afb7f3d46a707", "795ae05331eaa230f8dbbc5be88fecda"]
sorl-thumbnail||thumbnails||57b9dcb38aade2eaa2c9619b52a2f144	["efd90ec5efd6304b89d98fe9401ecb05"]
sorl-thumbnail||thumbnails||7ef77482e387d23a8c38ce165f07589e	["1929e543bfe92c943d837d79ab3f2ed8", "dc701a51aaad2b896446f7e7620b15b6"]
sorl-thumbnail||thumbnails||c154f4f7ff620374e62ca17ac95e0939	["002ae63a9157a8a2c04b8c39c7713bf4", "d03096265e7a24fc759dc1dca14024fa"]
sorl-thumbnail||thumbnails||dff0565cc92986a9be2f9c57050ffdc1	["4c2843928b5d681fc6492df4177af4ef", "eca26f92a7b4ae45455c37b2001eff6a"]
sorl-thumbnail||thumbnails||e44f0e61def85ee43edfa0a89fdcc39c	["2e10c1521922a27844418f32e353fa14", "fe82f1f3c14b4ea7f16af1b438077d32"]
sorl-thumbnail||thumbnails||e50d87173df8a536d56c0ca62d1f04e1	["751dcc71476ad09ab83dff4b546745b1", "dd77f19bbfeb9a3e27a7c9176b76f863"]
sorl-thumbnail||thumbnails||ef827b9dadff39e2c48e4423eb81d652	["b2245e44b03b2f4ba5fa32cc3da06ba8", "e0c13c0740b74686c15cb5d266b5c165"]
sorl-thumbnail||image||98c1a20bc47670dc178eca18eea8cc8c	{"name": "recipe_images/leo_sup_qZ5GiMV.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 457]}
sorl-thumbnail||image||7e579312f4c0e8052a7b787dd72f4bc1	{"name": "cache/a3/be/a3be5aca9a4a6960cd92114ff74ea720.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [664, 500]}
sorl-thumbnail||image||576108dda2e35ad0c8917f35124beda8	{"name": "cache/44/6e/446e96e51d9f1fa0287c7434f59c7136.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||98c1a20bc47670dc178eca18eea8cc8c	["7e579312f4c0e8052a7b787dd72f4bc1", "576108dda2e35ad0c8917f35124beda8"]
sorl-thumbnail||image||c042ab5e7f393ffdd7a34dadf130ef0a	{"name": "recipe_images/leo_din_MGIeVIk.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 405]}
sorl-thumbnail||image||d60f0f23d8d658454e1b3898861bde89	{"name": "cache/27/8f/278f0785a08f236c3c44fa0b04efe515.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [749, 500]}
sorl-thumbnail||image||a7a8de3ac84f3c0807d223a85ac3b346	{"name": "cache/ce/b6/ceb60e11cc33a73397bd40fd37462086.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||c042ab5e7f393ffdd7a34dadf130ef0a	["a7a8de3ac84f3c0807d223a85ac3b346", "d60f0f23d8d658454e1b3898861bde89"]
sorl-thumbnail||image||7605caca2d500257c76e6cbce0d733c4	{"name": "recipe_images/leo_br_UtwS3TC.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 404]}
sorl-thumbnail||image||ec837989e8c69fcd84013f38b997ed9d	{"name": "cache/7c/00/7c003b738914811cf0a808a6fccbfb5a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [751, 500]}
sorl-thumbnail||image||5544c3512104384e9f8f3ebee4411167	{"name": "cache/11/b2/11b2c6b68d10f0fc05d72279031e2707.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||7605caca2d500257c76e6cbce0d733c4	["ec837989e8c69fcd84013f38b997ed9d", "5544c3512104384e9f8f3ebee4411167"]
sorl-thumbnail||image||a8f023ca6a7b4b082df571dd7b55d35b	{"name": "recipe_images/ded_din_TEYdnIZ.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 538]}
sorl-thumbnail||image||d215749f4a7be2e0963669b061805107	{"name": "cache/07/b3/07b327839abc90eda4d5a2a2403f2786.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [564, 500]}
sorl-thumbnail||image||706757cca7e5e63c91d42dff7940788b	{"name": "cache/8a/13/8a13d2a530e234da51bc0d00fa57f71d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||a8f023ca6a7b4b082df571dd7b55d35b	["706757cca7e5e63c91d42dff7940788b", "d215749f4a7be2e0963669b061805107"]
sorl-thumbnail||image||857f50eceafd226e5a5188db701e1945	{"name": "recipe_images/ded_su_h1RYaPL.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 341]}
sorl-thumbnail||image||e4bf90c964c6fb38c874e4e20ed7c586	{"name": "cache/83/28/8328a4ec2bd48f48299c2c03cc69d799.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [890, 500]}
sorl-thumbnail||image||2f9ba058182b55c70f88d05e3c959092	{"name": "cache/84/c3/84c3556b6f55df2277b6100ac7643053.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||857f50eceafd226e5a5188db701e1945	["e4bf90c964c6fb38c874e4e20ed7c586", "2f9ba058182b55c70f88d05e3c959092"]
sorl-thumbnail||image||1793b2bf7317306b1a99654aa1d95f78	{"name": "recipe_images/ded_br_DqsmoGo.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 370]}
sorl-thumbnail||image||902d79db602070d14d55d6d4406defa4	{"name": "cache/e0/66/e066459acaafabd21895e6bbdf557428.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [820, 500]}
sorl-thumbnail||image||1e4265a957eae1e0a7cbc02f8d24baee	{"name": "recipe_images/snow_din_pj8nIjI.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 469]}
sorl-thumbnail||image||441821ed246eeacc7ad4534ae568b701	{"name": "cache/47/e9/47e9de701cdd9dbaf8cf7ecf05b7b8c4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [647, 500]}
sorl-thumbnail||image||0c061e9eb4eee90a7adc90a63d6f7f8c	{"name": "cache/93/a8/93a8e70a2f21b7e5cdadd3eb3c23ec4b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||1e4265a957eae1e0a7cbc02f8d24baee	["441821ed246eeacc7ad4534ae568b701", "0c061e9eb4eee90a7adc90a63d6f7f8c"]
sorl-thumbnail||image||969c9dd01c6365f4b3a3e48e656bb9db	{"name": "recipe_images/snow_din_07Avaiz.jfif", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 426]}
sorl-thumbnail||image||0c74a01758c8ae920ea9c0c8287ec041	{"name": "cache/ef/f8/eff80467b386bae5db89d1155f7f52e6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [712, 500]}
sorl-thumbnail||image||48b6089c15e0aa84648d384dc8e87172	{"name": "cache/5b/06/5b0659165a0bfa0f407b2e442a9ab6f2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||969c9dd01c6365f4b3a3e48e656bb9db	["0c74a01758c8ae920ea9c0c8287ec041", "48b6089c15e0aa84648d384dc8e87172"]
sorl-thumbnail||image||0a9e0b98251ce19613a412ef59464638	{"name": "cache/dc/36/dc367a5c4e74657b249f3596987d3b13.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||1793b2bf7317306b1a99654aa1d95f78	["0a9e0b98251ce19613a412ef59464638", "902d79db602070d14d55d6d4406defa4"]
sorl-thumbnail||image||a79088c87846f5cd249634b2bc93dcd1	{"name": "recipe_images/snow_br_Uo2eF5f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [607, 394]}
sorl-thumbnail||image||4ff2acf5666942cff310b4c401a2d261	{"name": "cache/3a/07/3a07746a62d32d577c851cdd75d6ecda.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [770, 500]}
sorl-thumbnail||image||0f0d6712eeeed33b3bce78ad97b3e8d3	{"name": "cache/0b/ae/0bae257d108b5509d047e12d394b1b41.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [960, 500]}
sorl-thumbnail||thumbnails||a79088c87846f5cd249634b2bc93dcd1	["4ff2acf5666942cff310b4c401a2d261", "0f0d6712eeeed33b3bce78ad97b3e8d3"]
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
1	pbkdf2_sha256$216000$zWlQsefWBsYT$p7t8YZCN/Y9P/SilJrVPrF3kqhYp/xE5AXse1y6xwIk=	2020-09-18 09:25:18.442+00	t	yadmin	Админ	Добрый	t	t	2020-09-04 15:17:10+00	ya@mail.ru
4	pbkdf2_sha256$216000$PTRRbpa06igB$XTgPYlbt/mo982xYmmoGBaRw5gtNGzkkK/AMxGv5kmo=	2020-10-01 08:14:24.261202+00	f	KotLeopold	Кот	Леопольд	f	t	2020-09-04 15:26:31+00	usatyy@mail.ru
2	pbkdf2_sha256$216000$BHmh4ViJQwlT$PSvV7gJqEMdJFsRi7yDJQjlA7lZpKbxjZ1KYwYxA3AI=	2020-10-01 08:16:10.047667+00	f	DedMoroz	Дед	Мороз	t	t	2020-09-04 15:23:51+00	moroz@mail.ru
3	pbkdf2_sha256$216000$Vu3C8JRwzFcL$6olYZdsdj3Ikb6566oLWOT9sHDnB+DDfDWEqzfwvGpo=	2020-10-01 08:17:35.449925+00	f	Snegurochka	Марья	Снежная	f	t	2020-09-04 15:25:32+00	snow@mail.ru
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: foodgram
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: api_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.api_favorite_id_seq', 40, true);


--
-- Name: api_purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.api_purchase_id_seq', 63, true);


--
-- Name: api_subscribe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.api_subscribe_id_seq', 78, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 67, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.django_flatpage_id_seq', 2, true);


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.django_flatpage_sites_id_seq', 2, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: recipes_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.recipes_ingredient_id_seq', 2192, true);


--
-- Name: recipes_ingredientamount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.recipes_ingredientamount_id_seq', 235, true);


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.recipes_recipe_id_seq', 9, true);


--
-- Name: recipes_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.recipes_tag_id_seq', 75, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foodgram
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: api_favorite api_favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_favorite
    ADD CONSTRAINT api_favorite_pkey PRIMARY KEY (id);


--
-- Name: api_favorite api_favorite_user_id_recipe_id_79a306eb_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_favorite
    ADD CONSTRAINT api_favorite_user_id_recipe_id_79a306eb_uniq UNIQUE (user_id, recipe_id);


--
-- Name: api_purchase api_purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_purchase
    ADD CONSTRAINT api_purchase_pkey PRIMARY KEY (id);


--
-- Name: api_purchase api_purchase_user_id_recipe_id_295da86f_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_purchase
    ADD CONSTRAINT api_purchase_user_id_recipe_id_295da86f_uniq UNIQUE (user_id, recipe_id);


--
-- Name: api_subscribe api_subscribe_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_subscribe
    ADD CONSTRAINT api_subscribe_pkey PRIMARY KEY (id);


--
-- Name: api_subscribe api_subscribe_user_id_author_id_b46b5d87_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_subscribe
    ADD CONSTRAINT api_subscribe_user_id_author_id_b46b5d87_uniq UNIQUE (user_id, author_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: recipes_ingredient recipes_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_ingredient
    ADD CONSTRAINT recipes_ingredient_pkey PRIMARY KEY (id);


--
-- Name: recipes_ingredient recipes_ingredient_title_dimension_2f526e9d_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_ingredient
    ADD CONSTRAINT recipes_ingredient_title_dimension_2f526e9d_uniq UNIQUE (title, dimension);


--
-- Name: recipes_ingredientamount recipes_ingredientamount_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_ingredientamount
    ADD CONSTRAINT recipes_ingredientamount_pkey PRIMARY KEY (id);


--
-- Name: recipes_recipe recipes_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_recipe
    ADD CONSTRAINT recipes_recipe_pkey PRIMARY KEY (id);


--
-- Name: recipes_tag recipes_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_tag
    ADD CONSTRAINT recipes_tag_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: api_favorite_recipe_id_70e48425; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX api_favorite_recipe_id_70e48425 ON public.api_favorite USING btree (recipe_id);


--
-- Name: api_favorite_user_id_87b96550; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX api_favorite_user_id_87b96550 ON public.api_favorite USING btree (user_id);


--
-- Name: api_purchase_recipe_id_402b9619; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX api_purchase_recipe_id_402b9619 ON public.api_purchase USING btree (recipe_id);


--
-- Name: api_purchase_user_id_acc28e3e; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX api_purchase_user_id_acc28e3e ON public.api_purchase USING btree (user_id);


--
-- Name: api_subscribe_author_id_7f4a8c77; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX api_subscribe_author_id_7f4a8c77 ON public.api_subscribe USING btree (author_id);


--
-- Name: api_subscribe_user_id_5a3f572f; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX api_subscribe_user_id_5a3f572f ON public.api_subscribe USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_sites_flatpage_id_078bbc8b; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_flatpage_sites_flatpage_id_078bbc8b ON public.django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id_bfd8ea84; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_flatpage_sites_site_id_bfd8ea84 ON public.django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url_41612362; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_flatpage_url_41612362 ON public.django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_flatpage_url_41612362_like ON public.django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: recipes_ingredient_title_b3b1ba64; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_ingredient_title_b3b1ba64 ON public.recipes_ingredient USING btree (title);


--
-- Name: recipes_ingredient_title_b3b1ba64_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_ingredient_title_b3b1ba64_like ON public.recipes_ingredient USING btree (title varchar_pattern_ops);


--
-- Name: recipes_ingredientamount_ingredient_id_9da06ae0; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_ingredientamount_ingredient_id_9da06ae0 ON public.recipes_ingredientamount USING btree (ingredient_id);


--
-- Name: recipes_ingredientamount_recipe_id_1d9da795; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_ingredientamount_recipe_id_1d9da795 ON public.recipes_ingredientamount USING btree (recipe_id);


--
-- Name: recipes_recipe_author_id_7274f74b; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_recipe_author_id_7274f74b ON public.recipes_recipe USING btree (author_id);


--
-- Name: recipes_recipe_pub_date_1d2f9870; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_recipe_pub_date_1d2f9870 ON public.recipes_recipe USING btree (pub_date);


--
-- Name: recipes_recipe_slug_b40bdd3d; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_recipe_slug_b40bdd3d ON public.recipes_recipe USING btree (slug);


--
-- Name: recipes_recipe_slug_b40bdd3d_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_recipe_slug_b40bdd3d_like ON public.recipes_recipe USING btree (slug varchar_pattern_ops);


--
-- Name: recipes_tag_recipe_id_02407042; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_tag_recipe_id_02407042 ON public.recipes_tag USING btree (recipe_id);


--
-- Name: recipes_tag_slug_baa21000; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_tag_slug_baa21000 ON public.recipes_tag USING btree (slug);


--
-- Name: recipes_tag_slug_baa21000_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX recipes_tag_slug_baa21000_like ON public.recipes_tag USING btree (slug varchar_pattern_ops);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: foodgram
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: api_favorite api_favorite_recipe_id_70e48425_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_favorite
    ADD CONSTRAINT api_favorite_recipe_id_70e48425_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_favorite api_favorite_user_id_87b96550_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_favorite
    ADD CONSTRAINT api_favorite_user_id_87b96550_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_purchase api_purchase_recipe_id_402b9619_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_purchase
    ADD CONSTRAINT api_purchase_recipe_id_402b9619_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_purchase api_purchase_user_id_acc28e3e_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_purchase
    ADD CONSTRAINT api_purchase_user_id_acc28e3e_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_subscribe api_subscribe_author_id_7f4a8c77_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_subscribe
    ADD CONSTRAINT api_subscribe_author_id_7f4a8c77_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_subscribe api_subscribe_user_id_5a3f572f_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.api_subscribe
    ADD CONSTRAINT api_subscribe_user_id_5a3f572f_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl FOREIGN KEY (flatpage_id) REFERENCES public.django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_ingredientamount recipes_ingredientam_ingredient_id_9da06ae0_fk_recipes_i; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_ingredientamount
    ADD CONSTRAINT recipes_ingredientam_ingredient_id_9da06ae0_fk_recipes_i FOREIGN KEY (ingredient_id) REFERENCES public.recipes_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_ingredientamount recipes_ingredientam_recipe_id_1d9da795_fk_recipes_r; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_ingredientamount
    ADD CONSTRAINT recipes_ingredientam_recipe_id_1d9da795_fk_recipes_r FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_recipe recipes_recipe_author_id_7274f74b_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_recipe
    ADD CONSTRAINT recipes_recipe_author_id_7274f74b_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_tag recipes_tag_recipe_id_02407042_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.recipes_tag
    ADD CONSTRAINT recipes_tag_recipe_id_02407042_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: foodgram
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: foodgram
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO foodgram;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: foodgram
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

