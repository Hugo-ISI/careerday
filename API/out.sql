PGDMP         :    	        
    y            career_day_db    13.4    13.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16459    career_day_db    DATABASE     i   CREATE DATABASE career_day_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE career_day_db;
                postgres    false            �            1259    17048 
   attendance    TABLE     l   CREATE TABLE public.attendance (
    id integer NOT NULL,
    id_user integer,
    id_career_day integer
);
    DROP TABLE public.attendance;
       public         heap    postgres    false            �            1259    17046    attendance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.attendance_id_seq;
       public          postgres    false    231            �           0    0    attendance_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.attendance_id_seq OWNED BY public.attendance.id;
          public          postgres    false    230            �            1259    16938 
   career_day    TABLE     �   CREATE TABLE public.career_day (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    date date NOT NULL,
    is_active boolean NOT NULL
);
    DROP TABLE public.career_day;
       public         heap    postgres    false            �            1259    16936    career_day_id_seq    SEQUENCE     �   CREATE SEQUENCE public.career_day_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.career_day_id_seq;
       public          postgres    false    217            �           0    0    career_day_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.career_day_id_seq OWNED BY public.career_day.id;
          public          postgres    false    216            �            1259    17094    conversations    TABLE     �   CREATE TABLE public.conversations (
    id integer NOT NULL,
    message character varying(200) NOT NULL,
    id_meeting integer,
    date timestamp with time zone DEFAULT now()
);
 !   DROP TABLE public.conversations;
       public         heap    postgres    false            �            1259    17092    conversations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.conversations_id_seq;
       public          postgres    false    235            �           0    0    conversations_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;
          public          postgres    false    234            �            1259    16891    criteria    TABLE     �   CREATE TABLE public.criteria (
    id integer NOT NULL,
    id_province integer,
    work_from_home boolean NOT NULL,
    id_program integer,
    work_start_date date NOT NULL
);
    DROP TABLE public.criteria;
       public         heap    postgres    false            �            1259    16889    criteria_id_seq    SEQUENCE     �   CREATE SEQUENCE public.criteria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.criteria_id_seq;
       public          postgres    false    209            �           0    0    criteria_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.criteria_id_seq OWNED BY public.criteria.id;
          public          postgres    false    208            �            1259    17108    enterprise_criteria_linker    TABLE     �   CREATE TABLE public.enterprise_criteria_linker (
    id integer NOT NULL,
    id_criteria integer,
    id_enterprise integer
);
 .   DROP TABLE public.enterprise_criteria_linker;
       public         heap    postgres    false            �            1259    17106 !   enterprise_criteria_linker_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enterprise_criteria_linker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.enterprise_criteria_linker_id_seq;
       public          postgres    false    237            �           0    0 !   enterprise_criteria_linker_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.enterprise_criteria_linker_id_seq OWNED BY public.enterprise_criteria_linker.id;
          public          postgres    false    236            �            1259    16957    enterprise_user_linker    TABLE     x   CREATE TABLE public.enterprise_user_linker (
    id integer NOT NULL,
    id_user integer,
    id_enterprise integer
);
 *   DROP TABLE public.enterprise_user_linker;
       public         heap    postgres    false            �            1259    16955    enterprise_user_linker_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enterprise_user_linker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.enterprise_user_linker_id_seq;
       public          postgres    false    221            �           0    0    enterprise_user_linker_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.enterprise_user_linker_id_seq OWNED BY public.enterprise_user_linker.id;
          public          postgres    false    220            �            1259    16946    enterprises    TABLE     �   CREATE TABLE public.enterprises (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text NOT NULL,
    mission text,
    employe_target text,
    room integer NOT NULL
);
    DROP TABLE public.enterprises;
       public         heap    postgres    false            �            1259    16944    enterprises_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enterprises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.enterprises_id_seq;
       public          postgres    false    219            �           0    0    enterprises_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.enterprises_id_seq OWNED BY public.enterprises.id;
          public          postgres    false    218            �            1259    16917 	   languages    TABLE     m   CREATE TABLE public.languages (
    id integer NOT NULL,
    language_name character varying(35) NOT NULL
);
    DROP TABLE public.languages;
       public         heap    postgres    false            �            1259    16915    languages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.languages_id_seq;
       public          postgres    false    213            �           0    0    languages_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;
          public          postgres    false    212            �            1259    16909    meeting_types    TABLE     h   CREATE TABLE public.meeting_types (
    id integer NOT NULL,
    type character varying(50) NOT NULL
);
 !   DROP TABLE public.meeting_types;
       public         heap    postgres    false            �            1259    16907    meeting_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.meeting_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.meeting_types_id_seq;
       public          postgres    false    211            �           0    0    meeting_types_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.meeting_types_id_seq OWNED BY public.meeting_types.id;
          public          postgres    false    210            �            1259    17066    meetings    TABLE       CREATE TABLE public.meetings (
    id integer NOT NULL,
    id_employee integer,
    id_student integer,
    virtual_meeting_url character varying(300),
    date_time time without time zone NOT NULL,
    id_meeting_type integer,
    id_career_day integer
);
    DROP TABLE public.meetings;
       public         heap    postgres    false            �            1259    17064    meetings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.meetings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.meetings_id_seq;
       public          postgres    false    233            �           0    0    meetings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.meetings_id_seq OWNED BY public.meetings.id;
          public          postgres    false    232            �            1259    17147    messages    TABLE     �   CREATE TABLE public.messages (
    id integer NOT NULL,
    id_sender integer,
    id_receiver integer,
    message character varying(500) NOT NULL,
    date timestamp with time zone DEFAULT now(),
    is_read boolean NOT NULL
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    17145    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          postgres    false    241            �           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          postgres    false    240            �            1259    16975    notifications    TABLE     �   CREATE TABLE public.notifications (
    id integer NOT NULL,
    content character varying(160) NOT NULL,
    id_user integer,
    is_read boolean NOT NULL,
    date timestamp with time zone DEFAULT now()
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    16973    notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          postgres    false    223            �           0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          postgres    false    222            �            1259    16875    programs    TABLE     g   CREATE TABLE public.programs (
    id integer NOT NULL,
    program character varying(100) NOT NULL
);
    DROP TABLE public.programs;
       public         heap    postgres    false            �            1259    16873    programs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.programs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.programs_id_seq;
       public          postgres    false    205            �           0    0    programs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;
          public          postgres    false    204            �            1259    16883    province    TABLE     Z   CREATE TABLE public.province (
    id integer NOT NULL,
    name character varying(25)
);
    DROP TABLE public.province;
       public         heap    postgres    false            �            1259    16881    province_id_seq    SEQUENCE     �   CREATE SEQUENCE public.province_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.province_id_seq;
       public          postgres    false    207            �           0    0    province_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;
          public          postgres    false    206            �            1259    16859    roles    TABLE     `   CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying(30) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16857    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    201            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    200            �            1259    16867    skills    TABLE     g   CREATE TABLE public.skills (
    id integer NOT NULL,
    skill_name character varying(30) NOT NULL
);
    DROP TABLE public.skills;
       public         heap    postgres    false            �            1259    16865    skills_id_seq    SEQUENCE     �   CREATE SEQUENCE public.skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.skills_id_seq;
       public          postgres    false    203            �           0    0    skills_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;
          public          postgres    false    202            �            1259    17126    student_data    TABLE     �   CREATE TABLE public.student_data (
    id integer NOT NULL,
    id_user integer,
    id_criteria integer,
    cv_url character varying(500),
    biography character varying(500),
    profile_image_url character varying(500)
);
     DROP TABLE public.student_data;
       public         heap    postgres    false            �            1259    17124    student_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.student_data_id_seq;
       public          postgres    false    239            �           0    0    student_data_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.student_data_id_seq OWNED BY public.student_data.id;
          public          postgres    false    238            �            1259    16989 
   time_slots    TABLE        CREATE TABLE public.time_slots (
    id integer NOT NULL,
    id_user integer,
    time_slot character varying(10) NOT NULL
);
    DROP TABLE public.time_slots;
       public         heap    postgres    false            �            1259    16987    time_slots_id_seq    SEQUENCE     �   CREATE SEQUENCE public.time_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.time_slots_id_seq;
       public          postgres    false    225            �           0    0    time_slots_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.time_slots_id_seq OWNED BY public.time_slots.id;
          public          postgres    false    224            �            1259    17025    user_languages    TABLE     �   CREATE TABLE public.user_languages (
    id integer NOT NULL,
    id_user integer,
    id_enterprise integer,
    id_language integer
);
 "   DROP TABLE public.user_languages;
       public         heap    postgres    false            �            1259    17023    user_languages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.user_languages_id_seq;
       public          postgres    false    229            �           0    0    user_languages_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.user_languages_id_seq OWNED BY public.user_languages.id;
          public          postgres    false    228            �            1259    17002    user_skills    TABLE     �   CREATE TABLE public.user_skills (
    id integer NOT NULL,
    id_user integer,
    id_enterprise integer,
    id_skill integer
);
    DROP TABLE public.user_skills;
       public         heap    postgres    false            �            1259    17000    user_skills_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_skills_id_seq;
       public          postgres    false    227            �           0    0    user_skills_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_skills_id_seq OWNED BY public.user_skills.id;
          public          postgres    false    226            �            1259    16925    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(30) NOT NULL,
    id_role integer,
    last_name character varying(30) NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16923    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �           2604    17051    attendance id    DEFAULT     n   ALTER TABLE ONLY public.attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);
 <   ALTER TABLE public.attendance ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    16941    career_day id    DEFAULT     n   ALTER TABLE ONLY public.career_day ALTER COLUMN id SET DEFAULT nextval('public.career_day_id_seq'::regclass);
 <   ALTER TABLE public.career_day ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    17097    conversations id    DEFAULT     t   ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);
 ?   ALTER TABLE public.conversations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    16894    criteria id    DEFAULT     j   ALTER TABLE ONLY public.criteria ALTER COLUMN id SET DEFAULT nextval('public.criteria_id_seq'::regclass);
 :   ALTER TABLE public.criteria ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    17111    enterprise_criteria_linker id    DEFAULT     �   ALTER TABLE ONLY public.enterprise_criteria_linker ALTER COLUMN id SET DEFAULT nextval('public.enterprise_criteria_linker_id_seq'::regclass);
 L   ALTER TABLE public.enterprise_criteria_linker ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    16960    enterprise_user_linker id    DEFAULT     �   ALTER TABLE ONLY public.enterprise_user_linker ALTER COLUMN id SET DEFAULT nextval('public.enterprise_user_linker_id_seq'::regclass);
 H   ALTER TABLE public.enterprise_user_linker ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16949    enterprises id    DEFAULT     p   ALTER TABLE ONLY public.enterprises ALTER COLUMN id SET DEFAULT nextval('public.enterprises_id_seq'::regclass);
 =   ALTER TABLE public.enterprises ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16920    languages id    DEFAULT     l   ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);
 ;   ALTER TABLE public.languages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    16912    meeting_types id    DEFAULT     t   ALTER TABLE ONLY public.meeting_types ALTER COLUMN id SET DEFAULT nextval('public.meeting_types_id_seq'::regclass);
 ?   ALTER TABLE public.meeting_types ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �           2604    17069    meetings id    DEFAULT     j   ALTER TABLE ONLY public.meetings ALTER COLUMN id SET DEFAULT nextval('public.meetings_id_seq'::regclass);
 :   ALTER TABLE public.meetings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    17150    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    16978    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16878    programs id    DEFAULT     j   ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);
 :   ALTER TABLE public.programs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    16886    province id    DEFAULT     j   ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);
 :   ALTER TABLE public.province ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    16862    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            �           2604    16870 	   skills id    DEFAULT     f   ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);
 8   ALTER TABLE public.skills ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    17129    student_data id    DEFAULT     r   ALTER TABLE ONLY public.student_data ALTER COLUMN id SET DEFAULT nextval('public.student_data_id_seq'::regclass);
 >   ALTER TABLE public.student_data ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    16992    time_slots id    DEFAULT     n   ALTER TABLE ONLY public.time_slots ALTER COLUMN id SET DEFAULT nextval('public.time_slots_id_seq'::regclass);
 <   ALTER TABLE public.time_slots ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    17028    user_languages id    DEFAULT     v   ALTER TABLE ONLY public.user_languages ALTER COLUMN id SET DEFAULT nextval('public.user_languages_id_seq'::regclass);
 @   ALTER TABLE public.user_languages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    17005    user_skills id    DEFAULT     p   ALTER TABLE ONLY public.user_skills ALTER COLUMN id SET DEFAULT nextval('public.user_skills_id_seq'::regclass);
 =   ALTER TABLE public.user_skills ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    16928    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �          0    17048 
   attendance 
   TABLE DATA           @   COPY public.attendance (id, id_user, id_career_day) FROM stdin;
    public          postgres    false    231   @�       �          0    16938 
   career_day 
   TABLE DATA           @   COPY public.career_day (id, title, date, is_active) FROM stdin;
    public          postgres    false    217   ]�       �          0    17094    conversations 
   TABLE DATA           F   COPY public.conversations (id, message, id_meeting, date) FROM stdin;
    public          postgres    false    235   z�       �          0    16891    criteria 
   TABLE DATA           `   COPY public.criteria (id, id_province, work_from_home, id_program, work_start_date) FROM stdin;
    public          postgres    false    209   ��       �          0    17108    enterprise_criteria_linker 
   TABLE DATA           T   COPY public.enterprise_criteria_linker (id, id_criteria, id_enterprise) FROM stdin;
    public          postgres    false    237   ��       �          0    16957    enterprise_user_linker 
   TABLE DATA           L   COPY public.enterprise_user_linker (id, id_user, id_enterprise) FROM stdin;
    public          postgres    false    221   ��       �          0    16946    enterprises 
   TABLE DATA           [   COPY public.enterprises (id, name, description, mission, employe_target, room) FROM stdin;
    public          postgres    false    219   ��       �          0    16917 	   languages 
   TABLE DATA           6   COPY public.languages (id, language_name) FROM stdin;
    public          postgres    false    213   �       �          0    16909    meeting_types 
   TABLE DATA           1   COPY public.meeting_types (id, type) FROM stdin;
    public          postgres    false    211   (�       �          0    17066    meetings 
   TABLE DATA              COPY public.meetings (id, id_employee, id_student, virtual_meeting_url, date_time, id_meeting_type, id_career_day) FROM stdin;
    public          postgres    false    233   E�       �          0    17147    messages 
   TABLE DATA           V   COPY public.messages (id, id_sender, id_receiver, message, date, is_read) FROM stdin;
    public          postgres    false    241   b�       �          0    16975    notifications 
   TABLE DATA           L   COPY public.notifications (id, content, id_user, is_read, date) FROM stdin;
    public          postgres    false    223   �       �          0    16875    programs 
   TABLE DATA           /   COPY public.programs (id, program) FROM stdin;
    public          postgres    false    205   ��       �          0    16883    province 
   TABLE DATA           ,   COPY public.province (id, name) FROM stdin;
    public          postgres    false    207   ��       |          0    16859    roles 
   TABLE DATA           )   COPY public.roles (id, role) FROM stdin;
    public          postgres    false    201   ��       ~          0    16867    skills 
   TABLE DATA           0   COPY public.skills (id, skill_name) FROM stdin;
    public          postgres    false    203   ��       �          0    17126    student_data 
   TABLE DATA           f   COPY public.student_data (id, id_user, id_criteria, cv_url, biography, profile_image_url) FROM stdin;
    public          postgres    false    239   �       �          0    16989 
   time_slots 
   TABLE DATA           <   COPY public.time_slots (id, id_user, time_slot) FROM stdin;
    public          postgres    false    225   -�       �          0    17025    user_languages 
   TABLE DATA           Q   COPY public.user_languages (id, id_user, id_enterprise, id_language) FROM stdin;
    public          postgres    false    229   J�       �          0    17002    user_skills 
   TABLE DATA           K   COPY public.user_skills (id, id_user, id_enterprise, id_skill) FROM stdin;
    public          postgres    false    227   g�       �          0    16925    users 
   TABLE DATA           N   COPY public.users (id, email, password, id_role, last_name, name) FROM stdin;
    public          postgres    false    215   ��       �           0    0    attendance_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.attendance_id_seq', 1, false);
          public          postgres    false    230            �           0    0    career_day_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.career_day_id_seq', 1, false);
          public          postgres    false    216            �           0    0    conversations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.conversations_id_seq', 1, false);
          public          postgres    false    234            �           0    0    criteria_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.criteria_id_seq', 1, false);
          public          postgres    false    208            �           0    0 !   enterprise_criteria_linker_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.enterprise_criteria_linker_id_seq', 1, false);
          public          postgres    false    236            �           0    0    enterprise_user_linker_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.enterprise_user_linker_id_seq', 1, false);
          public          postgres    false    220            �           0    0    enterprises_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.enterprises_id_seq', 1, false);
          public          postgres    false    218            �           0    0    languages_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.languages_id_seq', 1, false);
          public          postgres    false    212            �           0    0    meeting_types_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.meeting_types_id_seq', 1, false);
          public          postgres    false    210            �           0    0    meetings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.meetings_id_seq', 1, false);
          public          postgres    false    232            �           0    0    messages_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.messages_id_seq', 1, false);
          public          postgres    false    240            �           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);
          public          postgres    false    222            �           0    0    programs_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.programs_id_seq', 1, false);
          public          postgres    false    204            �           0    0    province_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.province_id_seq', 1, false);
          public          postgres    false    206            �           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    200            �           0    0    skills_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.skills_id_seq', 1, false);
          public          postgres    false    202            �           0    0    student_data_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.student_data_id_seq', 1, false);
          public          postgres    false    238            �           0    0    time_slots_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.time_slots_id_seq', 1, false);
          public          postgres    false    224            �           0    0    user_languages_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.user_languages_id_seq', 1, false);
          public          postgres    false    228            �           0    0    user_skills_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_skills_id_seq', 1, false);
          public          postgres    false    226            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    214            �           2606    17053    attendance attendance_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_pkey;
       public            postgres    false    231            �           2606    16943    career_day career_day_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.career_day
    ADD CONSTRAINT career_day_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.career_day DROP CONSTRAINT career_day_pkey;
       public            postgres    false    217            �           2606    17100     conversations conversations_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.conversations DROP CONSTRAINT conversations_pkey;
       public            postgres    false    235            �           2606    16896    criteria criteria_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.criteria
    ADD CONSTRAINT criteria_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.criteria DROP CONSTRAINT criteria_pkey;
       public            postgres    false    209            �           2606    17113 :   enterprise_criteria_linker enterprise_criteria_linker_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.enterprise_criteria_linker
    ADD CONSTRAINT enterprise_criteria_linker_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.enterprise_criteria_linker DROP CONSTRAINT enterprise_criteria_linker_pkey;
       public            postgres    false    237            �           2606    16962 2   enterprise_user_linker enterprise_user_linker_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.enterprise_user_linker
    ADD CONSTRAINT enterprise_user_linker_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.enterprise_user_linker DROP CONSTRAINT enterprise_user_linker_pkey;
       public            postgres    false    221            �           2606    16954    enterprises enterprises_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.enterprises
    ADD CONSTRAINT enterprises_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.enterprises DROP CONSTRAINT enterprises_pkey;
       public            postgres    false    219            �           2606    16922    languages languages_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.languages DROP CONSTRAINT languages_pkey;
       public            postgres    false    213            �           2606    16914     meeting_types meeting_types_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.meeting_types
    ADD CONSTRAINT meeting_types_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.meeting_types DROP CONSTRAINT meeting_types_pkey;
       public            postgres    false    211            �           2606    17071    meetings meetings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_pkey;
       public            postgres    false    233            �           2606    17156    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            postgres    false    241            �           2606    16981     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    223            �           2606    16880    programs programs_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.programs DROP CONSTRAINT programs_pkey;
       public            postgres    false    205            �           2606    16888    province province_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.province DROP CONSTRAINT province_pkey;
       public            postgres    false    207            �           2606    16864    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    201            �           2606    16872    skills skills_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.skills DROP CONSTRAINT skills_pkey;
       public            postgres    false    203            �           2606    17134    student_data student_data_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.student_data
    ADD CONSTRAINT student_data_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.student_data DROP CONSTRAINT student_data_pkey;
       public            postgres    false    239            �           2606    16994    time_slots time_slots_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.time_slots DROP CONSTRAINT time_slots_pkey;
       public            postgres    false    225            �           2606    17030 "   user_languages user_languages_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.user_languages
    ADD CONSTRAINT user_languages_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.user_languages DROP CONSTRAINT user_languages_pkey;
       public            postgres    false    229            �           2606    17007    user_skills user_skills_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_skills DROP CONSTRAINT user_skills_pkey;
       public            postgres    false    227            �           2606    16930    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    17059 (   attendance attendance_id_career_day_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_id_career_day_fkey FOREIGN KEY (id_career_day) REFERENCES public.career_day(id);
 R   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_id_career_day_fkey;
       public          postgres    false    3014    217    231            �           2606    17054 "   attendance attendance_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.attendance DROP CONSTRAINT attendance_id_user_fkey;
       public          postgres    false    231    215    3012            �           2606    17101 +   conversations conversations_id_meeting_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_id_meeting_fkey FOREIGN KEY (id_meeting) REFERENCES public.meetings(id);
 U   ALTER TABLE ONLY public.conversations DROP CONSTRAINT conversations_id_meeting_fkey;
       public          postgres    false    235    3030    233            �           2606    16902 !   criteria criteria_id_program_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criteria
    ADD CONSTRAINT criteria_id_program_fkey FOREIGN KEY (id_program) REFERENCES public.programs(id);
 K   ALTER TABLE ONLY public.criteria DROP CONSTRAINT criteria_id_program_fkey;
       public          postgres    false    3002    205    209            �           2606    16897 "   criteria criteria_id_province_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.criteria
    ADD CONSTRAINT criteria_id_province_fkey FOREIGN KEY (id_province) REFERENCES public.province(id);
 L   ALTER TABLE ONLY public.criteria DROP CONSTRAINT criteria_id_province_fkey;
       public          postgres    false    3004    207    209            �           2606    17114 F   enterprise_criteria_linker enterprise_criteria_linker_id_criteria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enterprise_criteria_linker
    ADD CONSTRAINT enterprise_criteria_linker_id_criteria_fkey FOREIGN KEY (id_criteria) REFERENCES public.criteria(id);
 p   ALTER TABLE ONLY public.enterprise_criteria_linker DROP CONSTRAINT enterprise_criteria_linker_id_criteria_fkey;
       public          postgres    false    3006    209    237            �           2606    17119 H   enterprise_criteria_linker enterprise_criteria_linker_id_enterprise_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enterprise_criteria_linker
    ADD CONSTRAINT enterprise_criteria_linker_id_enterprise_fkey FOREIGN KEY (id_enterprise) REFERENCES public.enterprises(id);
 r   ALTER TABLE ONLY public.enterprise_criteria_linker DROP CONSTRAINT enterprise_criteria_linker_id_enterprise_fkey;
       public          postgres    false    3016    237    219            �           2606    16968 @   enterprise_user_linker enterprise_user_linker_id_enterprise_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enterprise_user_linker
    ADD CONSTRAINT enterprise_user_linker_id_enterprise_fkey FOREIGN KEY (id_enterprise) REFERENCES public.enterprises(id);
 j   ALTER TABLE ONLY public.enterprise_user_linker DROP CONSTRAINT enterprise_user_linker_id_enterprise_fkey;
       public          postgres    false    219    3016    221            �           2606    16963 :   enterprise_user_linker enterprise_user_linker_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.enterprise_user_linker
    ADD CONSTRAINT enterprise_user_linker_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 d   ALTER TABLE ONLY public.enterprise_user_linker DROP CONSTRAINT enterprise_user_linker_id_user_fkey;
       public          postgres    false    221    3012    215            �           2606    17087 $   meetings meetings_id_career_day_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_id_career_day_fkey FOREIGN KEY (id_career_day) REFERENCES public.career_day(id);
 N   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_id_career_day_fkey;
       public          postgres    false    3014    233    217            �           2606    17072 "   meetings meetings_id_employee_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_id_employee_fkey;
       public          postgres    false    215    233    3012            �           2606    17082 &   meetings meetings_id_meeting_type_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_id_meeting_type_fkey FOREIGN KEY (id_meeting_type) REFERENCES public.meeting_types(id);
 P   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_id_meeting_type_fkey;
       public          postgres    false    3008    211    233            �           2606    17077 !   meetings meetings_id_student_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_id_student_fkey FOREIGN KEY (id_student) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.meetings DROP CONSTRAINT meetings_id_student_fkey;
       public          postgres    false    233    215    3012            �           2606    17162 "   messages messages_id_receiver_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_id_receiver_fkey FOREIGN KEY (id_receiver) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_id_receiver_fkey;
       public          postgres    false    241    3012    215            �           2606    17157     messages messages_id_sender_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_id_sender_fkey FOREIGN KEY (id_sender) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_id_sender_fkey;
       public          postgres    false    215    241    3012            �           2606    16982 (   notifications notifications_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_id_user_fkey;
       public          postgres    false    223    215    3012            �           2606    17140 *   student_data student_data_id_criteria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_data
    ADD CONSTRAINT student_data_id_criteria_fkey FOREIGN KEY (id_criteria) REFERENCES public.criteria(id);
 T   ALTER TABLE ONLY public.student_data DROP CONSTRAINT student_data_id_criteria_fkey;
       public          postgres    false    3006    209    239            �           2606    17135 &   student_data student_data_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_data
    ADD CONSTRAINT student_data_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.student_data DROP CONSTRAINT student_data_id_user_fkey;
       public          postgres    false    215    3012    239            �           2606    16995 "   time_slots time_slots_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 L   ALTER TABLE ONLY public.time_slots DROP CONSTRAINT time_slots_id_user_fkey;
       public          postgres    false    225    215    3012            �           2606    17036 0   user_languages user_languages_id_enterprise_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_languages
    ADD CONSTRAINT user_languages_id_enterprise_fkey FOREIGN KEY (id_enterprise) REFERENCES public.enterprises(id);
 Z   ALTER TABLE ONLY public.user_languages DROP CONSTRAINT user_languages_id_enterprise_fkey;
       public          postgres    false    229    219    3016            �           2606    17041 .   user_languages user_languages_id_language_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_languages
    ADD CONSTRAINT user_languages_id_language_fkey FOREIGN KEY (id_language) REFERENCES public.languages(id);
 X   ALTER TABLE ONLY public.user_languages DROP CONSTRAINT user_languages_id_language_fkey;
       public          postgres    false    229    213    3010            �           2606    17031 *   user_languages user_languages_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_languages
    ADD CONSTRAINT user_languages_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.user_languages DROP CONSTRAINT user_languages_id_user_fkey;
       public          postgres    false    229    215    3012            �           2606    17013 *   user_skills user_skills_id_enterprise_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_id_enterprise_fkey FOREIGN KEY (id_enterprise) REFERENCES public.enterprises(id);
 T   ALTER TABLE ONLY public.user_skills DROP CONSTRAINT user_skills_id_enterprise_fkey;
       public          postgres    false    227    219    3016            �           2606    17018 %   user_skills user_skills_id_skill_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_id_skill_fkey FOREIGN KEY (id_skill) REFERENCES public.skills(id);
 O   ALTER TABLE ONLY public.user_skills DROP CONSTRAINT user_skills_id_skill_fkey;
       public          postgres    false    227    203    3000            �           2606    17008 $   user_skills user_skills_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.user_skills DROP CONSTRAINT user_skills_id_user_fkey;
       public          postgres    false    227    215    3012            �           2606    16931    users users_id_role_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_role_fkey;
       public          postgres    false    215    201    2998            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      |      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     