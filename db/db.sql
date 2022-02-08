PGDMP                      
    y         
   DB_project #   12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)    14.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    34551 
   DB_project    DATABASE     ]   CREATE DATABASE "DB_project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';
    DROP DATABASE "DB_project";
                postgres    false                        2615    34552 
   DB_project    SCHEMA        CREATE SCHEMA "DB_project";
    DROP SCHEMA "DB_project";
                postgres    false            �            1259    34678    AllCompulsory    TABLE     o   CREATE TABLE "DB_project"."AllCompulsory" (
    compulsory_id integer NOT NULL,
    course_id text NOT NULL
);
 )   DROP TABLE "DB_project"."AllCompulsory";
    
   DB_project         heap    postgres    false    8            �            1259    34690    Article    TABLE     �   CREATE TABLE "DB_project"."Article" (
    post_id integer NOT NULL,
    content text,
    date text,
    title text,
    status boolean NOT NULL,
    likes_num integer NOT NULL,
    dep_id text NOT NULL,
    user_mail integer NOT NULL
);
 #   DROP TABLE "DB_project"."Article";
    
   DB_project         heap    postgres    false    8            �            1259    34688    Article_post_id_seq    SEQUENCE     �   CREATE SEQUENCE "DB_project"."Article_post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "DB_project"."Article_post_id_seq";
    
   DB_project          postgres    false    221    8            �           0    0    Article_post_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE "DB_project"."Article_post_id_seq" OWNED BY "DB_project"."Article".post_id;
       
   DB_project          postgres    false    220            �            1259    34820 
   Compulsory    TABLE     �   CREATE TABLE "DB_project"."Compulsory" (
    default_id integer NOT NULL,
    course_name text,
    course_id text NOT NULL,
    dep_id text
);
 &   DROP TABLE "DB_project"."Compulsory";
    
   DB_project         heap    postgres    false    8            �            1259    34818    Compulsory_default_id_seq    SEQUENCE     �   CREATE SEQUENCE "DB_project"."Compulsory_default_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE "DB_project"."Compulsory_default_id_seq";
    
   DB_project          postgres    false    240    8            �           0    0    Compulsory_default_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE "DB_project"."Compulsory_default_id_seq" OWNED BY "DB_project"."Compulsory".default_id;
       
   DB_project          postgres    false    239            �            1259    34699    DepID    TABLE     m   CREATE TABLE "DB_project"."DepID" (
    dep_id text NOT NULL,
    dep_name character varying(50) NOT NULL
);
 !   DROP TABLE "DB_project"."DepID";
    
   DB_project         heap    postgres    false    8            �            1259    34729    DoubleMajorRequirement    TABLE     �   CREATE TABLE "DB_project"."DoubleMajorRequirement" (
    dep_id text NOT NULL,
    accept_number character varying(10),
    qualification text,
    admission_requirement text,
    other text,
    notes text
);
 2   DROP TABLE "DB_project"."DoubleMajorRequirement";
    
   DB_project         heap    postgres    false    8            �            1259    34810    DoubleMajorStats    TABLE     �   CREATE TABLE "DB_project"."DoubleMajorStats" (
    year text,
    number_of_applicants integer NOT NULL,
    approved_number integer NOT NULL,
    approval_rate text,
    "id_for_doubleMajorStats" integer NOT NULL,
    dep_id text NOT NULL
);
 ,   DROP TABLE "DB_project"."DoubleMajorStats";
    
   DB_project         heap    postgres    false    8            �            1259    34737    MinorRequirement    TABLE       CREATE TABLE "DB_project"."MinorRequirement" (
    dep_id text NOT NULL,
    accept_number character varying(10),
    qualification text,
    admission_requirement text,
    other text,
    compulsory text,
    elective text,
    min_received_credit text,
    notes text
);
 ,   DROP TABLE "DB_project"."MinorRequirement";
    
   DB_project         heap    postgres    false    8            �            1259    34802 
   MinorStats    TABLE     �   CREATE TABLE "DB_project"."MinorStats" (
    year text,
    number_of_applicants integer NOT NULL,
    approved_number integer NOT NULL,
    approval_rate text,
    "id_for_minorStats" integer NOT NULL,
    dep_id text NOT NULL
);
 &   DROP TABLE "DB_project"."MinorStats";
    
   DB_project         heap    postgres    false    8            �            1259    34775    Reply    TABLE     �   CREATE TABLE "DB_project"."Reply" (
    reply_id integer NOT NULL,
    post_reply_id integer NOT NULL,
    content text NOT NULL,
    date text NOT NULL,
    status boolean NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);
 !   DROP TABLE "DB_project"."Reply";
    
   DB_project         heap    postgres    false    8            �            1259    34773    Reply_reply_id_seq    SEQUENCE     �   CREATE SEQUENCE "DB_project"."Reply_reply_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE "DB_project"."Reply_reply_id_seq";
    
   DB_project          postgres    false    8    235            �           0    0    Reply_reply_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE "DB_project"."Reply_reply_id_seq" OWNED BY "DB_project"."Reply".reply_id;
       
   DB_project          postgres    false    234            �            1259    34709 	   ShareData    TABLE       CREATE TABLE "DB_project"."ShareData" (
    data_id integer NOT NULL,
    year text NOT NULL,
    gpa_first_semester text NOT NULL,
    gpa_second_semester text NOT NULL,
    option text NOT NULL,
    prioity text NOT NULL,
    dep_id text NOT NULL,
    user_mail integer NOT NULL
);
 %   DROP TABLE "DB_project"."ShareData";
    
   DB_project         heap    postgres    false    8            �            1259    34707    ShareData_data_id_seq    SEQUENCE     �   CREATE SEQUENCE "DB_project"."ShareData_data_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "DB_project"."ShareData_data_id_seq";
    
   DB_project          postgres    false    224    8            �           0    0    ShareData_data_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "DB_project"."ShareData_data_id_seq" OWNED BY "DB_project"."ShareData".data_id;
       
   DB_project          postgres    false    223            �            1259    34764    TakenCompulsory    TABLE     �   CREATE TABLE "DB_project"."TakenCompulsory" (
    taken_id integer NOT NULL,
    grade text NOT NULL,
    course_id text NOT NULL,
    data_id integer NOT NULL
);
 +   DROP TABLE "DB_project"."TakenCompulsory";
    
   DB_project         heap    postgres    false    8            �            1259    34762    TakenCompulsory_taken_id_seq    SEQUENCE     �   CREATE SEQUENCE "DB_project"."TakenCompulsory_taken_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "DB_project"."TakenCompulsory_taken_id_seq";
    
   DB_project          postgres    false    8    233            �           0    0    TakenCompulsory_taken_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE "DB_project"."TakenCompulsory_taken_id_seq" OWNED BY "DB_project"."TakenCompulsory".taken_id;
       
   DB_project          postgres    false    232            �            1259    34745    TransferRequirement    TABLE     C  CREATE TABLE "DB_project"."TransferRequirement" (
    dep_id text NOT NULL,
    accept_number smallint NOT NULL,
    qualification text,
    admission_requirement text,
    other text,
    accept_second_priority text,
    notes text,
    CONSTRAINT "TransferRequirement_accept_number_check" CHECK ((accept_number >= 0))
);
 /   DROP TABLE "DB_project"."TransferRequirement";
    
   DB_project         heap    postgres    false    8            �            1259    34794    TransferStats    TABLE     �  CREATE TABLE "DB_project"."TransferStats" (
    year text,
    transfer_in_applicants integer NOT NULL,
    "transfer_in_Approved_number" integer NOT NULL,
    "transfer_in_Approval_rate" text,
    transfer_out_applicants integer NOT NULL,
    transfer_out_winners integer NOT NULL,
    transfer_out_successed_rate text,
    "id_for_transferStats" integer NOT NULL,
    dep_id text NOT NULL
);
 )   DROP TABLE "DB_project"."TransferStats";
    
   DB_project         heap    postgres    false    8            �            1259    34756    User_likes_article    TABLE     �   CREATE TABLE "DB_project"."User_likes_article" (
    likes_id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);
 .   DROP TABLE "DB_project"."User_likes_article";
    
   DB_project         heap    postgres    false    8            �            1259    34754    User_likes_article_likes_id_seq    SEQUENCE     �   CREATE SEQUENCE "DB_project"."User_likes_article_likes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "DB_project"."User_likes_article_likes_id_seq";
    
   DB_project          postgres    false    231    8            �           0    0    User_likes_article_likes_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "DB_project"."User_likes_article_likes_id_seq" OWNED BY "DB_project"."User_likes_article".likes_id;
       
   DB_project          postgres    false    230            �            1259    34720 
   VerifyCode    TABLE     z   CREATE TABLE "DB_project"."VerifyCode" (
    code_id integer NOT NULL,
    mail text NOT NULL,
    vcode text NOT NULL
);
 &   DROP TABLE "DB_project"."VerifyCode";
    
   DB_project         heap    postgres    false    8            �            1259    34718    VerifyCode_code_id_seq    SEQUENCE     �   CREATE SEQUENCE "DB_project"."VerifyCode_code_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "DB_project"."VerifyCode_code_id_seq";
    
   DB_project          postgres    false    8    226            �           0    0    VerifyCode_code_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "DB_project"."VerifyCode_code_id_seq" OWNED BY "DB_project"."VerifyCode".code_id;
       
   DB_project          postgres    false    225            �            1259    34584 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    34582    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    210            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    209            �            1259    34594    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    34592    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    212            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    211            �            1259    34576    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    34574    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    208            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    207            �            1259    34602 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    34612    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    34610    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    216            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    215            �            1259    34600    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    214            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    213            �            1259    34620    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    34618 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    218            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    217            �            1259    34947    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    34945    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    242            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    241            �            1259    34566    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    34564    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    206            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    205            �            1259    34555    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    34553    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    203            �            1259    34978    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �           2604    34693    Article post_id    DEFAULT     �   ALTER TABLE ONLY "DB_project"."Article" ALTER COLUMN post_id SET DEFAULT nextval('"DB_project"."Article_post_id_seq"'::regclass);
 F   ALTER TABLE "DB_project"."Article" ALTER COLUMN post_id DROP DEFAULT;
    
   DB_project          postgres    false    220    221    221            �           2604    34823    Compulsory default_id    DEFAULT     �   ALTER TABLE ONLY "DB_project"."Compulsory" ALTER COLUMN default_id SET DEFAULT nextval('"DB_project"."Compulsory_default_id_seq"'::regclass);
 L   ALTER TABLE "DB_project"."Compulsory" ALTER COLUMN default_id DROP DEFAULT;
    
   DB_project          postgres    false    240    239    240            �           2604    34778    Reply reply_id    DEFAULT     �   ALTER TABLE ONLY "DB_project"."Reply" ALTER COLUMN reply_id SET DEFAULT nextval('"DB_project"."Reply_reply_id_seq"'::regclass);
 E   ALTER TABLE "DB_project"."Reply" ALTER COLUMN reply_id DROP DEFAULT;
    
   DB_project          postgres    false    235    234    235            �           2604    34712    ShareData data_id    DEFAULT     �   ALTER TABLE ONLY "DB_project"."ShareData" ALTER COLUMN data_id SET DEFAULT nextval('"DB_project"."ShareData_data_id_seq"'::regclass);
 H   ALTER TABLE "DB_project"."ShareData" ALTER COLUMN data_id DROP DEFAULT;
    
   DB_project          postgres    false    223    224    224            �           2604    34767    TakenCompulsory taken_id    DEFAULT     �   ALTER TABLE ONLY "DB_project"."TakenCompulsory" ALTER COLUMN taken_id SET DEFAULT nextval('"DB_project"."TakenCompulsory_taken_id_seq"'::regclass);
 O   ALTER TABLE "DB_project"."TakenCompulsory" ALTER COLUMN taken_id DROP DEFAULT;
    
   DB_project          postgres    false    233    232    233            �           2604    34759    User_likes_article likes_id    DEFAULT     �   ALTER TABLE ONLY "DB_project"."User_likes_article" ALTER COLUMN likes_id SET DEFAULT nextval('"DB_project"."User_likes_article_likes_id_seq"'::regclass);
 R   ALTER TABLE "DB_project"."User_likes_article" ALTER COLUMN likes_id DROP DEFAULT;
    
   DB_project          postgres    false    230    231    231            �           2604    34723    VerifyCode code_id    DEFAULT     �   ALTER TABLE ONLY "DB_project"."VerifyCode" ALTER COLUMN code_id SET DEFAULT nextval('"DB_project"."VerifyCode_code_id_seq"'::regclass);
 I   ALTER TABLE "DB_project"."VerifyCode" ALTER COLUMN code_id DROP DEFAULT;
    
   DB_project          postgres    false    225    226    226            �           2604    34587    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    34597    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212                       2604    34579    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207    208            �           2604    34605    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    34615    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    34623    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    34950    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            ~           2604    34569    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205    206            }           2604    34558    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203    204            �          0    34678    AllCompulsory 
   TABLE DATA           I   COPY "DB_project"."AllCompulsory" (compulsory_id, course_id) FROM stdin;
 
   DB_project          postgres    false    219   �3      �          0    34690    Article 
   TABLE DATA           n   COPY "DB_project"."Article" (post_id, content, date, title, status, likes_num, dep_id, user_mail) FROM stdin;
 
   DB_project          postgres    false    221   �X      �          0    34820 
   Compulsory 
   TABLE DATA           X   COPY "DB_project"."Compulsory" (default_id, course_name, course_id, dep_id) FROM stdin;
 
   DB_project          postgres    false    240   gb      �          0    34699    DepID 
   TABLE DATA           9   COPY "DB_project"."DepID" (dep_id, dep_name) FROM stdin;
 
   DB_project          postgres    false    222   ��      �          0    34729    DoubleMajorRequirement 
   TABLE DATA           �   COPY "DB_project"."DoubleMajorRequirement" (dep_id, accept_number, qualification, admission_requirement, other, notes) FROM stdin;
 
   DB_project          postgres    false    227   <�      �          0    34810    DoubleMajorStats 
   TABLE DATA           �   COPY "DB_project"."DoubleMajorStats" (year, number_of_applicants, approved_number, approval_rate, "id_for_doubleMajorStats", dep_id) FROM stdin;
 
   DB_project          postgres    false    238   ��      �          0    34737    MinorRequirement 
   TABLE DATA           �   COPY "DB_project"."MinorRequirement" (dep_id, accept_number, qualification, admission_requirement, other, compulsory, elective, min_received_credit, notes) FROM stdin;
 
   DB_project          postgres    false    228   i�      �          0    34802 
   MinorStats 
   TABLE DATA           �   COPY "DB_project"."MinorStats" (year, number_of_applicants, approved_number, approval_rate, "id_for_minorStats", dep_id) FROM stdin;
 
   DB_project          postgres    false    237   ;0      �          0    34775    Reply 
   TABLE DATA           i   COPY "DB_project"."Reply" (reply_id, post_reply_id, content, date, status, post_id, user_id) FROM stdin;
 
   DB_project          postgres    false    235   8      �          0    34709 	   ShareData 
   TABLE DATA           �   COPY "DB_project"."ShareData" (data_id, year, gpa_first_semester, gpa_second_semester, option, prioity, dep_id, user_mail) FROM stdin;
 
   DB_project          postgres    false    224   �8      �          0    34764    TakenCompulsory 
   TABLE DATA           V   COPY "DB_project"."TakenCompulsory" (taken_id, grade, course_id, data_id) FROM stdin;
 
   DB_project          postgres    false    233   �9      �          0    34745    TransferRequirement 
   TABLE DATA           �   COPY "DB_project"."TransferRequirement" (dep_id, accept_number, qualification, admission_requirement, other, accept_second_priority, notes) FROM stdin;
 
   DB_project          postgres    false    229   �:      �          0    34794    TransferStats 
   TABLE DATA           �   COPY "DB_project"."TransferStats" (year, transfer_in_applicants, "transfer_in_Approved_number", "transfer_in_Approval_rate", transfer_out_applicants, transfer_out_winners, transfer_out_successed_rate, "id_for_transferStats", dep_id) FROM stdin;
 
   DB_project          postgres    false    236   �u      �          0    34756    User_likes_article 
   TABLE DATA           P   COPY "DB_project"."User_likes_article" (likes_id, post_id, user_id) FROM stdin;
 
   DB_project          postgres    false    231   W�      �          0    34720 
   VerifyCode 
   TABLE DATA           B   COPY "DB_project"."VerifyCode" (code_id, mail, vcode) FROM stdin;
 
   DB_project          postgres    false    226   ��      �          0    34584 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    210   X�      �          0    34594    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    212   u�      �          0    34576    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    208   ��      �          0    34602 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    214   ��      �          0    34612    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    216   �      �          0    34620    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    218   1�      �          0    34947    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    242   N�      �          0    34566    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    206   k�      �          0    34555    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    204   a�      �          0    34978    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    243   &�      �           0    0    Article_post_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"DB_project"."Article_post_id_seq"', 12, true);
       
   DB_project          postgres    false    220            �           0    0    Compulsory_default_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('"DB_project"."Compulsory_default_id_seq"', 1, false);
       
   DB_project          postgres    false    239            �           0    0    Reply_reply_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('"DB_project"."Reply_reply_id_seq"', 7, true);
       
   DB_project          postgres    false    234            �           0    0    ShareData_data_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"DB_project"."ShareData_data_id_seq"', 52, true);
       
   DB_project          postgres    false    223            �           0    0    TakenCompulsory_taken_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"DB_project"."TakenCompulsory_taken_id_seq"', 69, true);
       
   DB_project          postgres    false    232            �           0    0    User_likes_article_likes_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"DB_project"."User_likes_article_likes_id_seq"', 4, true);
       
   DB_project          postgres    false    230            �           0    0    VerifyCode_code_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"DB_project"."VerifyCode_code_id_seq"', 23, true);
       
   DB_project          postgres    false    225            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    209            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    211            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);
          public          postgres    false    207            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    215            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 14, true);
          public          postgres    false    213            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    217            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    241            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);
          public          postgres    false    205            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);
          public          postgres    false    203            �           2606    34687 )   AllCompulsory AllCompulsory_course_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY "DB_project"."AllCompulsory"
    ADD CONSTRAINT "AllCompulsory_course_id_key" UNIQUE (course_id);
 ]   ALTER TABLE ONLY "DB_project"."AllCompulsory" DROP CONSTRAINT "AllCompulsory_course_id_key";
    
   DB_project            postgres    false    219            �           2606    34685     AllCompulsory AllCompulsory_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "DB_project"."AllCompulsory"
    ADD CONSTRAINT "AllCompulsory_pkey" PRIMARY KEY (compulsory_id);
 T   ALTER TABLE ONLY "DB_project"."AllCompulsory" DROP CONSTRAINT "AllCompulsory_pkey";
    
   DB_project            postgres    false    219            �           2606    34698    Article Article_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "DB_project"."Article"
    ADD CONSTRAINT "Article_pkey" PRIMARY KEY (post_id);
 H   ALTER TABLE ONLY "DB_project"."Article" DROP CONSTRAINT "Article_pkey";
    
   DB_project            postgres    false    221            �           2606    34828    Compulsory Compulsory_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY "DB_project"."Compulsory"
    ADD CONSTRAINT "Compulsory_pkey" PRIMARY KEY (default_id);
 N   ALTER TABLE ONLY "DB_project"."Compulsory" DROP CONSTRAINT "Compulsory_pkey";
    
   DB_project            postgres    false    240            �           2606    34706    DepID DepID_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY "DB_project"."DepID"
    ADD CONSTRAINT "DepID_pkey" PRIMARY KEY (dep_id);
 D   ALTER TABLE ONLY "DB_project"."DepID" DROP CONSTRAINT "DepID_pkey";
    
   DB_project            postgres    false    222            �           2606    34736 2   DoubleMajorRequirement DoubleMajorRequirement_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY "DB_project"."DoubleMajorRequirement"
    ADD CONSTRAINT "DoubleMajorRequirement_pkey" PRIMARY KEY (dep_id);
 f   ALTER TABLE ONLY "DB_project"."DoubleMajorRequirement" DROP CONSTRAINT "DoubleMajorRequirement_pkey";
    
   DB_project            postgres    false    227            �           2606    34817 &   DoubleMajorStats DoubleMajorStats_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."DoubleMajorStats"
    ADD CONSTRAINT "DoubleMajorStats_pkey" PRIMARY KEY ("id_for_doubleMajorStats");
 Z   ALTER TABLE ONLY "DB_project"."DoubleMajorStats" DROP CONSTRAINT "DoubleMajorStats_pkey";
    
   DB_project            postgres    false    238            �           2606    34921 ;   DoubleMajorStats DoubleMajorStats_year_dep_id_c4df3d56_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."DoubleMajorStats"
    ADD CONSTRAINT "DoubleMajorStats_year_dep_id_c4df3d56_uniq" UNIQUE (year, dep_id);
 o   ALTER TABLE ONLY "DB_project"."DoubleMajorStats" DROP CONSTRAINT "DoubleMajorStats_year_dep_id_c4df3d56_uniq";
    
   DB_project            postgres    false    238    238            �           2606    34744 &   MinorRequirement MinorRequirement_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY "DB_project"."MinorRequirement"
    ADD CONSTRAINT "MinorRequirement_pkey" PRIMARY KEY (dep_id);
 Z   ALTER TABLE ONLY "DB_project"."MinorRequirement" DROP CONSTRAINT "MinorRequirement_pkey";
    
   DB_project            postgres    false    228            �           2606    34809    MinorStats MinorStats_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "DB_project"."MinorStats"
    ADD CONSTRAINT "MinorStats_pkey" PRIMARY KEY ("id_for_minorStats");
 N   ALTER TABLE ONLY "DB_project"."MinorStats" DROP CONSTRAINT "MinorStats_pkey";
    
   DB_project            postgres    false    237            �           2606    34912 /   MinorStats MinorStats_year_dep_id_128c2b9f_uniq 
   CONSTRAINT     |   ALTER TABLE ONLY "DB_project"."MinorStats"
    ADD CONSTRAINT "MinorStats_year_dep_id_128c2b9f_uniq" UNIQUE (year, dep_id);
 c   ALTER TABLE ONLY "DB_project"."MinorStats" DROP CONSTRAINT "MinorStats_year_dep_id_128c2b9f_uniq";
    
   DB_project            postgres    false    237    237            �           2606    34783    Reply Reply_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "DB_project"."Reply"
    ADD CONSTRAINT "Reply_pkey" PRIMARY KEY (reply_id);
 D   ALTER TABLE ONLY "DB_project"."Reply" DROP CONSTRAINT "Reply_pkey";
    
   DB_project            postgres    false    235            �           2606    34717    ShareData ShareData_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY "DB_project"."ShareData"
    ADD CONSTRAINT "ShareData_pkey" PRIMARY KEY (data_id);
 L   ALTER TABLE ONLY "DB_project"."ShareData" DROP CONSTRAINT "ShareData_pkey";
    
   DB_project            postgres    false    224            �           2606    34772 $   TakenCompulsory TakenCompulsory_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY "DB_project"."TakenCompulsory"
    ADD CONSTRAINT "TakenCompulsory_pkey" PRIMARY KEY (taken_id);
 X   ALTER TABLE ONLY "DB_project"."TakenCompulsory" DROP CONSTRAINT "TakenCompulsory_pkey";
    
   DB_project            postgres    false    233            �           2606    34753 ,   TransferRequirement TransferRequirement_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "DB_project"."TransferRequirement"
    ADD CONSTRAINT "TransferRequirement_pkey" PRIMARY KEY (dep_id);
 `   ALTER TABLE ONLY "DB_project"."TransferRequirement" DROP CONSTRAINT "TransferRequirement_pkey";
    
   DB_project            postgres    false    229            �           2606    34801     TransferStats TransferStats_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY "DB_project"."TransferStats"
    ADD CONSTRAINT "TransferStats_pkey" PRIMARY KEY ("id_for_transferStats");
 T   ALTER TABLE ONLY "DB_project"."TransferStats" DROP CONSTRAINT "TransferStats_pkey";
    
   DB_project            postgres    false    236            �           2606    34903 5   TransferStats TransferStats_year_dep_id_5682caed_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."TransferStats"
    ADD CONSTRAINT "TransferStats_year_dep_id_5682caed_uniq" UNIQUE (year, dep_id);
 i   ALTER TABLE ONLY "DB_project"."TransferStats" DROP CONSTRAINT "TransferStats_year_dep_id_5682caed_uniq";
    
   DB_project            postgres    false    236    236            �           2606    34761 *   User_likes_article User_likes_article_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "DB_project"."User_likes_article"
    ADD CONSTRAINT "User_likes_article_pkey" PRIMARY KEY (likes_id);
 ^   ALTER TABLE ONLY "DB_project"."User_likes_article" DROP CONSTRAINT "User_likes_article_pkey";
    
   DB_project            postgres    false    231            �           2606    34728    VerifyCode VerifyCode_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY "DB_project"."VerifyCode"
    ADD CONSTRAINT "VerifyCode_pkey" PRIMARY KEY (code_id);
 N   ALTER TABLE ONLY "DB_project"."VerifyCode" DROP CONSTRAINT "VerifyCode_pkey";
    
   DB_project            postgres    false    226            �           2606    34976    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    210            �           2606    34636 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    212    212            �           2606    34599 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    212            �           2606    34589    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    210            �           2606    34627 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    208    208            �           2606    34581 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    208            �           2606    34617 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    216            �           2606    34651 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    216    216            �           2606    34607    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    214            �           2606    34625 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    218            �           2606    34665 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    218    218            �           2606    34970     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    214            �           2606    34956 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    242            �           2606    34573 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    206    206            �           2606    34571 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    206            �           2606    34563 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    204            �           2606    34985 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    243            �           1259    34829 %   AllCompulsory_course_id_fee47191_like    INDEX        CREATE INDEX "AllCompulsory_course_id_fee47191_like" ON "DB_project"."AllCompulsory" USING btree (course_id text_pattern_ops);
 A   DROP INDEX "DB_project"."AllCompulsory_course_id_fee47191_like";
    
   DB_project            postgres    false    219            �           1259    34899    Article_dep_id_942d7b02    INDEX     W   CREATE INDEX "Article_dep_id_942d7b02" ON "DB_project"."Article" USING btree (dep_id);
 3   DROP INDEX "DB_project"."Article_dep_id_942d7b02";
    
   DB_project            postgres    false    221            �           1259    34900    Article_dep_id_942d7b02_like    INDEX     m   CREATE INDEX "Article_dep_id_942d7b02_like" ON "DB_project"."Article" USING btree (dep_id text_pattern_ops);
 8   DROP INDEX "DB_project"."Article_dep_id_942d7b02_like";
    
   DB_project            postgres    false    221            �           1259    34901    Article_user_mail_9240aebf    INDEX     ]   CREATE INDEX "Article_user_mail_9240aebf" ON "DB_project"."Article" USING btree (user_mail);
 6   DROP INDEX "DB_project"."Article_user_mail_9240aebf";
    
   DB_project            postgres    false    221            �           1259    34941    Compulsory_course_id_51d64f98    INDEX     c   CREATE INDEX "Compulsory_course_id_51d64f98" ON "DB_project"."Compulsory" USING btree (course_id);
 9   DROP INDEX "DB_project"."Compulsory_course_id_51d64f98";
    
   DB_project            postgres    false    240            �           1259    34942 "   Compulsory_course_id_51d64f98_like    INDEX     y   CREATE INDEX "Compulsory_course_id_51d64f98_like" ON "DB_project"."Compulsory" USING btree (course_id text_pattern_ops);
 >   DROP INDEX "DB_project"."Compulsory_course_id_51d64f98_like";
    
   DB_project            postgres    false    240            �           1259    34943    Compulsory_dep_id_9373b19d    INDEX     ]   CREATE INDEX "Compulsory_dep_id_9373b19d" ON "DB_project"."Compulsory" USING btree (dep_id);
 6   DROP INDEX "DB_project"."Compulsory_dep_id_9373b19d";
    
   DB_project            postgres    false    240            �           1259    34944    Compulsory_dep_id_9373b19d_like    INDEX     s   CREATE INDEX "Compulsory_dep_id_9373b19d_like" ON "DB_project"."Compulsory" USING btree (dep_id text_pattern_ops);
 ;   DROP INDEX "DB_project"."Compulsory_dep_id_9373b19d_like";
    
   DB_project            postgres    false    240            �           1259    34830    DepID_dep_id_cd887b69_like    INDEX     i   CREATE INDEX "DepID_dep_id_cd887b69_like" ON "DB_project"."DepID" USING btree (dep_id text_pattern_ops);
 6   DROP INDEX "DB_project"."DepID_dep_id_cd887b69_like";
    
   DB_project            postgres    false    222            �           1259    34849 +   DoubleMajorRequirement_dep_id_2c9b04e1_like    INDEX     �   CREATE INDEX "DoubleMajorRequirement_dep_id_2c9b04e1_like" ON "DB_project"."DoubleMajorRequirement" USING btree (dep_id text_pattern_ops);
 G   DROP INDEX "DB_project"."DoubleMajorRequirement_dep_id_2c9b04e1_like";
    
   DB_project            postgres    false    227            �           1259    34927     DoubleMajorStats_dep_id_2b277f78    INDEX     i   CREATE INDEX "DoubleMajorStats_dep_id_2b277f78" ON "DB_project"."DoubleMajorStats" USING btree (dep_id);
 <   DROP INDEX "DB_project"."DoubleMajorStats_dep_id_2b277f78";
    
   DB_project            postgres    false    238            �           1259    34928 %   DoubleMajorStats_dep_id_2b277f78_like    INDEX        CREATE INDEX "DoubleMajorStats_dep_id_2b277f78_like" ON "DB_project"."DoubleMajorStats" USING btree (dep_id text_pattern_ops);
 A   DROP INDEX "DB_project"."DoubleMajorStats_dep_id_2b277f78_like";
    
   DB_project            postgres    false    238            �           1259    34855 %   MinorRequirement_dep_id_526dde87_like    INDEX        CREATE INDEX "MinorRequirement_dep_id_526dde87_like" ON "DB_project"."MinorRequirement" USING btree (dep_id text_pattern_ops);
 A   DROP INDEX "DB_project"."MinorRequirement_dep_id_526dde87_like";
    
   DB_project            postgres    false    228            �           1259    34918    MinorStats_dep_id_59c05946    INDEX     ]   CREATE INDEX "MinorStats_dep_id_59c05946" ON "DB_project"."MinorStats" USING btree (dep_id);
 6   DROP INDEX "DB_project"."MinorStats_dep_id_59c05946";
    
   DB_project            postgres    false    237            �           1259    34919    MinorStats_dep_id_59c05946_like    INDEX     s   CREATE INDEX "MinorStats_dep_id_59c05946_like" ON "DB_project"."MinorStats" USING btree (dep_id text_pattern_ops);
 ;   DROP INDEX "DB_project"."MinorStats_dep_id_59c05946_like";
    
   DB_project            postgres    false    237            �           1259    34897    Reply_post_id_d3c2cd31    INDEX     U   CREATE INDEX "Reply_post_id_d3c2cd31" ON "DB_project"."Reply" USING btree (post_id);
 2   DROP INDEX "DB_project"."Reply_post_id_d3c2cd31";
    
   DB_project            postgres    false    235            �           1259    34898    Reply_user_id_f43e80b1    INDEX     U   CREATE INDEX "Reply_user_id_f43e80b1" ON "DB_project"."Reply" USING btree (user_id);
 2   DROP INDEX "DB_project"."Reply_user_id_f43e80b1";
    
   DB_project            postgres    false    235            �           1259    34841    ShareData_dep_id_c795c692    INDEX     [   CREATE INDEX "ShareData_dep_id_c795c692" ON "DB_project"."ShareData" USING btree (dep_id);
 5   DROP INDEX "DB_project"."ShareData_dep_id_c795c692";
    
   DB_project            postgres    false    224            �           1259    34842    ShareData_dep_id_c795c692_like    INDEX     q   CREATE INDEX "ShareData_dep_id_c795c692_like" ON "DB_project"."ShareData" USING btree (dep_id text_pattern_ops);
 :   DROP INDEX "DB_project"."ShareData_dep_id_c795c692_like";
    
   DB_project            postgres    false    224            �           1259    34843    ShareData_user_mail_c0c25219    INDEX     a   CREATE INDEX "ShareData_user_mail_c0c25219" ON "DB_project"."ShareData" USING btree (user_mail);
 8   DROP INDEX "DB_project"."ShareData_user_mail_c0c25219";
    
   DB_project            postgres    false    224            �           1259    34884 "   TakenCompulsory_course_id_dad20d8e    INDEX     m   CREATE INDEX "TakenCompulsory_course_id_dad20d8e" ON "DB_project"."TakenCompulsory" USING btree (course_id);
 >   DROP INDEX "DB_project"."TakenCompulsory_course_id_dad20d8e";
    
   DB_project            postgres    false    233            �           1259    34885 '   TakenCompulsory_course_id_dad20d8e_like    INDEX     �   CREATE INDEX "TakenCompulsory_course_id_dad20d8e_like" ON "DB_project"."TakenCompulsory" USING btree (course_id text_pattern_ops);
 C   DROP INDEX "DB_project"."TakenCompulsory_course_id_dad20d8e_like";
    
   DB_project            postgres    false    233            �           1259    34886     TakenCompulsory_data_id_d94eeeee    INDEX     i   CREATE INDEX "TakenCompulsory_data_id_d94eeeee" ON "DB_project"."TakenCompulsory" USING btree (data_id);
 <   DROP INDEX "DB_project"."TakenCompulsory_data_id_d94eeeee";
    
   DB_project            postgres    false    233            �           1259    34861 (   TransferRequirement_dep_id_efd121ee_like    INDEX     �   CREATE INDEX "TransferRequirement_dep_id_efd121ee_like" ON "DB_project"."TransferRequirement" USING btree (dep_id text_pattern_ops);
 D   DROP INDEX "DB_project"."TransferRequirement_dep_id_efd121ee_like";
    
   DB_project            postgres    false    229            �           1259    34909    TransferStats_dep_id_85f85aa8    INDEX     c   CREATE INDEX "TransferStats_dep_id_85f85aa8" ON "DB_project"."TransferStats" USING btree (dep_id);
 9   DROP INDEX "DB_project"."TransferStats_dep_id_85f85aa8";
    
   DB_project            postgres    false    236            �           1259    34910 "   TransferStats_dep_id_85f85aa8_like    INDEX     y   CREATE INDEX "TransferStats_dep_id_85f85aa8_like" ON "DB_project"."TransferStats" USING btree (dep_id text_pattern_ops);
 >   DROP INDEX "DB_project"."TransferStats_dep_id_85f85aa8_like";
    
   DB_project            postgres    false    236            �           1259    34872 #   User_likes_article_post_id_ccc9ca12    INDEX     o   CREATE INDEX "User_likes_article_post_id_ccc9ca12" ON "DB_project"."User_likes_article" USING btree (post_id);
 ?   DROP INDEX "DB_project"."User_likes_article_post_id_ccc9ca12";
    
   DB_project            postgres    false    231            �           1259    34873 #   User_likes_article_user_id_f8d0aab2    INDEX     o   CREATE INDEX "User_likes_article_user_id_f8d0aab2" ON "DB_project"."User_likes_article" USING btree (user_id);
 ?   DROP INDEX "DB_project"."User_likes_article_user_id_f8d0aab2";
    
   DB_project            postgres    false    231            �           1259    34977    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    210            �           1259    34647 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    212            �           1259    34648 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    212            �           1259    34633 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    208            �           1259    34663 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    216            �           1259    34662 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    216            �           1259    34677 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    218            �           1259    34676 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    218            �           1259    34971     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    214            �           1259    34967 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    242            �           1259    34968 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    242            �           1259    34987 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    243            �           1259    34986 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    243                       2606    34784 /   Article Article_dep_id_942d7b02_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."Article"
    ADD CONSTRAINT "Article_dep_id_942d7b02_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY "DB_project"."Article" DROP CONSTRAINT "Article_dep_id_942d7b02_fk_DepID_dep_id";
    
   DB_project          postgres    false    3010    222    221                       2606    34789 2   Article Article_user_mail_9240aebf_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."Article"
    ADD CONSTRAINT "Article_user_mail_9240aebf_fk_auth_user_id" FOREIGN KEY (user_mail) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY "DB_project"."Article" DROP CONSTRAINT "Article_user_mail_9240aebf_fk_auth_user_id";
    
   DB_project          postgres    false    2982    221    214                       2606    34931 C   Compulsory Compulsory_course_id_51d64f98_fk_AllCompulsory_course_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."Compulsory"
    ADD CONSTRAINT "Compulsory_course_id_51d64f98_fk_AllCompulsory_course_id" FOREIGN KEY (course_id) REFERENCES "DB_project"."AllCompulsory"(course_id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY "DB_project"."Compulsory" DROP CONSTRAINT "Compulsory_course_id_51d64f98_fk_AllCompulsory_course_id";
    
   DB_project          postgres    false    240    219    3000                       2606    34936 5   Compulsory Compulsory_dep_id_9373b19d_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."Compulsory"
    ADD CONSTRAINT "Compulsory_dep_id_9373b19d_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY "DB_project"."Compulsory" DROP CONSTRAINT "Compulsory_dep_id_9373b19d_fk_DepID_dep_id";
    
   DB_project          postgres    false    240    222    3010                       2606    34844 M   DoubleMajorRequirement DoubleMajorRequirement_dep_id_2c9b04e1_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."DoubleMajorRequirement"
    ADD CONSTRAINT "DoubleMajorRequirement_dep_id_2c9b04e1_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "DB_project"."DoubleMajorRequirement" DROP CONSTRAINT "DoubleMajorRequirement_dep_id_2c9b04e1_fk_DepID_dep_id";
    
   DB_project          postgres    false    227    222    3010                       2606    34922 A   DoubleMajorStats DoubleMajorStats_dep_id_2b277f78_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."DoubleMajorStats"
    ADD CONSTRAINT "DoubleMajorStats_dep_id_2b277f78_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY "DB_project"."DoubleMajorStats" DROP CONSTRAINT "DoubleMajorStats_dep_id_2b277f78_fk_DepID_dep_id";
    
   DB_project          postgres    false    238    3010    222                       2606    34850 A   MinorRequirement MinorRequirement_dep_id_526dde87_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."MinorRequirement"
    ADD CONSTRAINT "MinorRequirement_dep_id_526dde87_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY "DB_project"."MinorRequirement" DROP CONSTRAINT "MinorRequirement_dep_id_526dde87_fk_DepID_dep_id";
    
   DB_project          postgres    false    228    222    3010                       2606    34913 5   MinorStats MinorStats_dep_id_59c05946_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."MinorStats"
    ADD CONSTRAINT "MinorStats_dep_id_59c05946_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY "DB_project"."MinorStats" DROP CONSTRAINT "MinorStats_dep_id_59c05946_fk_DepID_dep_id";
    
   DB_project          postgres    false    3010    222    237                       2606    34887 /   Reply Reply_post_id_d3c2cd31_fk_Article_post_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."Reply"
    ADD CONSTRAINT "Reply_post_id_d3c2cd31_fk_Article_post_id" FOREIGN KEY (post_id) REFERENCES "DB_project"."Article"(post_id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY "DB_project"."Reply" DROP CONSTRAINT "Reply_post_id_d3c2cd31_fk_Article_post_id";
    
   DB_project          postgres    false    235    221    3006                       2606    34892 ,   Reply Reply_user_id_f43e80b1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."Reply"
    ADD CONSTRAINT "Reply_user_id_f43e80b1_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY "DB_project"."Reply" DROP CONSTRAINT "Reply_user_id_f43e80b1_fk_auth_user_id";
    
   DB_project          postgres    false    2982    214    235            	           2606    34831 3   ShareData ShareData_dep_id_c795c692_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."ShareData"
    ADD CONSTRAINT "ShareData_dep_id_c795c692_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY "DB_project"."ShareData" DROP CONSTRAINT "ShareData_dep_id_c795c692_fk_DepID_dep_id";
    
   DB_project          postgres    false    222    224    3010            
           2606    34836 6   ShareData ShareData_user_mail_c0c25219_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."ShareData"
    ADD CONSTRAINT "ShareData_user_mail_c0c25219_fk_auth_user_id" FOREIGN KEY (user_mail) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY "DB_project"."ShareData" DROP CONSTRAINT "ShareData_user_mail_c0c25219_fk_auth_user_id";
    
   DB_project          postgres    false    2982    224    214                       2606    34874 M   TakenCompulsory TakenCompulsory_course_id_dad20d8e_fk_AllCompulsory_course_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."TakenCompulsory"
    ADD CONSTRAINT "TakenCompulsory_course_id_dad20d8e_fk_AllCompulsory_course_id" FOREIGN KEY (course_id) REFERENCES "DB_project"."AllCompulsory"(course_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY "DB_project"."TakenCompulsory" DROP CONSTRAINT "TakenCompulsory_course_id_dad20d8e_fk_AllCompulsory_course_id";
    
   DB_project          postgres    false    233    219    3000                       2606    34879 E   TakenCompulsory TakenCompulsory_data_id_d94eeeee_fk_ShareData_data_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."TakenCompulsory"
    ADD CONSTRAINT "TakenCompulsory_data_id_d94eeeee_fk_ShareData_data_id" FOREIGN KEY (data_id) REFERENCES "DB_project"."ShareData"(data_id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY "DB_project"."TakenCompulsory" DROP CONSTRAINT "TakenCompulsory_data_id_d94eeeee_fk_ShareData_data_id";
    
   DB_project          postgres    false    3014    224    233                       2606    34856 G   TransferRequirement TransferRequirement_dep_id_efd121ee_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."TransferRequirement"
    ADD CONSTRAINT "TransferRequirement_dep_id_efd121ee_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY "DB_project"."TransferRequirement" DROP CONSTRAINT "TransferRequirement_dep_id_efd121ee_fk_DepID_dep_id";
    
   DB_project          postgres    false    3010    229    222                       2606    34904 ;   TransferStats TransferStats_dep_id_85f85aa8_fk_DepID_dep_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."TransferStats"
    ADD CONSTRAINT "TransferStats_dep_id_85f85aa8_fk_DepID_dep_id" FOREIGN KEY (dep_id) REFERENCES "DB_project"."DepID"(dep_id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY "DB_project"."TransferStats" DROP CONSTRAINT "TransferStats_dep_id_85f85aa8_fk_DepID_dep_id";
    
   DB_project          postgres    false    222    3010    236                       2606    34862 I   User_likes_article User_likes_article_post_id_ccc9ca12_fk_Article_post_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."User_likes_article"
    ADD CONSTRAINT "User_likes_article_post_id_ccc9ca12_fk_Article_post_id" FOREIGN KEY (post_id) REFERENCES "DB_project"."Article"(post_id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY "DB_project"."User_likes_article" DROP CONSTRAINT "User_likes_article_post_id_ccc9ca12_fk_Article_post_id";
    
   DB_project          postgres    false    3006    221    231                       2606    34867 F   User_likes_article User_likes_article_user_id_f8d0aab2_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY "DB_project"."User_likes_article"
    ADD CONSTRAINT "User_likes_article_user_id_f8d0aab2_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY "DB_project"."User_likes_article" DROP CONSTRAINT "User_likes_article_user_id_f8d0aab2_fk_auth_user_id";
    
   DB_project          postgres    false    2982    231    214                       2606    34642 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    208    212    2969                       2606    34637 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    212    2974    210                        2606    34628 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2964    206    208                       2606    34657 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    216    2974    210                       2606    34652 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    2982    214    216                       2606    34671 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    218    2969    208                       2606    34666 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    218    2982    214                       2606    34957 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    206    2964    242                       2606    34962 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    214    2982    242            �      x�M\K�^�q]��2����ۖ�Fp+3� �3,3�13	��sNU����,���|�����������ھ�����jM��no�|�5�����������}�>�}��sMy������*)����y����o����=�ۛ��>�4�=���ԩ�\n?>���h�#��'%|�ۛ_�����4����__~��SA�y{�	U��_>4Q�j�˽$�&�z/��ѥt/����J���^����k*�귏/�����4@b�>��__�4��nϟ��n��}���o�T��ݼ�5�z�ž��Z}*f�W5�Y��ι��y��:��y�����0�^K���Fq�2T,N���	+��oo*�ҊO�Lc�[�=��	9h���lݖ���dW�sZ���0�U?7~>a�X��W�g�Ķ{G�������=Rm�P��3�(޵��_��OoK!�y{~yҰ��a-٨�}40�/�j�a-�tES_���*�K7M��{��3�"�=b�T�3&'���ekL������^�Iĵ�ff�ʞ�[c������}���w/v�/;fb�`�a��y{��U�c�M�?�72�������c߽�S�w�^����N��p�KZ���?=jL��l��~_��#{�/߳�՚�'N뺯uQ���6����ε���(_��}�����=�#����_�ڼ��Ä�n�и�6���S�y��D�¦�6k�$��3�E �y�*���᳧�c��m�.�f�%:�x���\6�%���Qfi`����{ ���5�  a�����d�����쳋6 D���F�^�� !���|+%~o���Dv��ؠl����E���Ġ�����J�)�� �d�Hv>&KM�:�Hz|�2~X7~H���5ZgV�M�ӓ�I\�J�� %�	� �d���1�6`����.[.Hݱ;رf�_�+2�ɠ�ߘ�`��� �P_�+ŭf7@���1%7�TX�'��I;��n��d�"ɾ�q�2��O�>�۞�@e��=P�jp�����k��H�CU����� ���ڵ���m[ �{�h�����e��ha��}ߑ�`@-��X#Xr&��j���y�/BY�`�����6Ox�ڵ`�zF��bq�Tp��N
��}�GO����S	$�2� ������5��yЅ�@�� ���1�9$�zL#��N,��9�3`�ftŚw����z\u@ڹ�P���`M��Pw��.m[u[߭1��� �ؠ���[���o��&�#9��"emR�����G]����C�i��Ě�`�:)[���ɣ:Ҙ�^ڦ�~0%i{7x�8��d��`� 9����t�p�e�~�S����0�ˠSnM'��~�YG7�`�
�־.%���X)v��z+�84ῇN'Y2 ����2�md��^Ȯ�ԧ� ��	�<!��7��'�����J�����a���3P�X��� ��}V8L����T�,��9,��Ǐ��[����7$x�M	0�ݳ�L�>̤1�:����J�t���F�i/?�� �!�8���Ls��9v�L
P��x�ҵ�2w-P��-p͸1LV��5P{Ĉz2��L 5�ʋ��x��51+���仇�Y���e��4q���2v�:Ț�Gv�L[gN��ɹ�g�h�xf,!�w�0@X&��$'vpפȴMYH
���{z�ab�=��Ɩe7�0R	7��[mu= �K�.ɸ\�`R������lS�p����;.N4q�g  s��f'�8,�7abO���8$�O ���X�Wd��XۆϬ��&Ǟ�x��݊�b���qj�W�!���s�J� ڄ�&�s#b�>4�F���Sя\��h�K��V3�HR�c�������>�2m`\ @�bsV@)l������_�7�>c� �Z��횃V��a>?����d`v
���|�f� �#���2� G(��t���Ů�)�m�'�v�E��l�q�+ M�-_�g؟�j�G(���d�.��Y��V\B����^m�i���3�X��^د�E[ �6?�s�E��O
��8&@t���~�����gc��CT��IE�}+�Y���D�m@7b<�s��_�uƅ�� ���)������I�$u1�6]F�o���N�+����r�)�ù¹��v�p����#���°;����UteT2k��2�)����7�qV�݌�+Z�U��0�aY��������0g�h���m�?��Z����{e�TvT�db7��8Q;�m�b;�Ϊ3�)� �˟�������-��FY�r�6���j��@aF3�"�n,�;��E����Q�fK�Zh���Hd�-c�}��_:�-����[��Eo|���'v�N~�I�l��D�Q��C��ي�3l�V(�gS�XR��,�����d}��,2v ��M"�@>-4OLڥ��h�n��3�	F��m�B�l{������.����Yu\���ij	�_�����������������R�EN��k�C~M7+�=��R>Fp3��G!������-�\��ik,�ms2��-(��\_FU]��A�p#��{��Лq6�t�z��2�p���`�▶tS:pV gdm��õ����%~�-�m$� (��n�) �QkfB4�a�>	����:��Ŧu&c�P�#�Ch�"��pmj�m�g�3�¸�l~�	�glhY���خ?��r��XYcJ���bAWљt�*= r��  \D@��E������Ȏ�fj�@w�Ip؀ZB!��]�X�9�c�6�;�ۄ��&˩�r1��WcGqt�.5}ݤ����5�]/�!iZm�= �~'_�=]����(����t���f���

*���S���C�T3�>��g���I�i0�=��_��=���X�����:D�^�7��a�&�P*쥅��:��簳	>��K�B�rs��2�jT��=th��{���FkBe���t�q�����NB�l�YSH�;�!��3]:h��7��V��G��
�o��Ut�BR�?����d,�\%Ĺr���\&��r7eF�g�|轆���x˂Nt��6ɌPx01�x��r5�m����TB����;�ӖV!F�sZl.�l�`A&6��_�ߘ�ldٕ�F�
�g����٩��Ɓ�4.T\ܢa��q[��rG9C�ЙX�Uv$(fj���JGI����0Rטqі5�nƄ��K�	�1"��Dc��b�A�w����*4��u�@j�q�;j�H0��64�t�#����Ƥ��,�Xq(Hg��*�GJ��1F"��X&��E�
|�F�nE��B5K���}?��c"���(���.�A�˴� ��#����I�4�����f���������Б,����A��T6l��8>`���Khp�y�%-�Fc�K�륙�C*G'��#�i4^���?GY�c6oW����.У* L��ף�	���c�G�e�Ҡ�jW���i���M�QIg�j%��پ�a0��'���M.u�.��ۀ�8�y��MW�rn��\Ym;'4�%_"���M��..�`��XYi'��9�kջ_�ٹ��ќ�'8K}�d�a��L����]���V�	��P���� &C+�|�:i29b�Yc�)�	�����77�L�j��3����Ÿ Ν���7hqY���@&qc�qG��ǉp���
�� �L�5�(q�1�u�� F{q� �Lm�#d3֟�����ֹS\�o'H6'�ڦ��8v�� �����o߹� 2�~y.w�s��AIҌac/w�@�;�=�*po�R���lh#��Lnfḵ�Rl�L!Dng�&�|F�5(Mz˄�̺��Qh�t4���R�H�X5�Y��:���0?����դ��˦$q٭!�̰pŷ��*�Jp�Ӽ-�x�Оh�g��`����0����cS���k��1�-�*�$z���`l$Bm�����ײh��	�T]]H���c��í�$5��ps��[<*{�.�����^��$s&0��5[lz6�̽E.tc�(ю��:[�-�'Hx���    ���f"��&z1������ނ���w��~��\�����X_V��Ơ���  ���::�a�|�ɅTF����#Z#ƈvG8�n�zH}��5ݨ)Fa��ۏ�%88T��X4vL�tј��I@�����1��%�e琅�A5�5�DcBW69����2�|+|l؉�\��
=�j��X4�?�f�8� ��V�l�;�����&.b��D�M�P�ҹd�˚��6�:�m�&����Z�=^7�qC�9� �āӝ$����kn�aN���-� k����d|^���E��r6��{����W6I �3nQ����B"'�ْ�v]�II�D5]�ߗ+s�гr��ϒ³�V�.2H@�&@@�r!kT9,��50���Џg��f�`���&���e���jhd9k �_��o��"�`�z�B,��rG"n��A_5���������*�P�q���Z��� m��0;MA�Zx���QH�s-�����@:����´�=bb_6���
�K��� �3wA�u�!ݠ\8��r �a���3\A05}i�p��㧄��d�n�.g_�	��.kw�#���A�2�YB�����d�����c�Ύ-ޘ�pJ�ٝ1�Uf1�����]�S�K���/��楑gj�:J�{+hV�	�����c�n[�8j5�_�h��"�AY���j�E�f�YB0[yH�v����3v6�BK������*a����3��֦��[='3�ĮBb����m��
n�&�kiw�\)�����-$����Pd�:���������t�Ka`�뾳�<�겜�tFw.1�Ĺ�ї��-�N�|#xs�-_�pf�5�5����C���ᐦf�⨅:�;q�h��Q��W��`k��)��3�Z����[C��U�U�Ʌ�%Vj5����|��K�Mj�$�	�60ΔNh���h�p�C�V�!$Ҫ+:A��5��A���	��D���
�`lӪ�9� 5c���C�>tɆ<���}}%9o�ړ�������=�n%�i�?��m1ھ���f
�5�f�3�u?�A�yԤ��.�U��8�M���p����8�{���˔&$�IH&�-��m�����cX���,�pk�����\�a2�nN;D��|�X��0�e�/3V6�A�\ťH��V���r�hV�����Pڒ����Rd�����$�ڶѲ��.`�6�.�t=˶�dX:0ы �A|�s{���� 3u�_ɫI��Dv���Dq˛��0&����&s�kNb���/m�<]麛�ݳr���N�n_,l*縃I=|m��`f�R��K�rݖ�}�.�5՘�cD;���8�$_Ⱔ�sF̀�b�\�c/�=S�Vi.1*���v�{i��J�Z��������k�[�Z�8e7�m&./���x#�z������P����
u�E/i��s��Բ�М�VBo�H����S��Ŋr ��]�[�H*��-8��;�}i.��O�̠J�T��\=>��,.a�+���rT����gw�4S��Hӕ�]�g�HqS)޹�vz�i��<HGg.�i�;�мC�К�*Xh�����ֶk��>��a�.�Fx�����^�7�d��C�U��˿Jw�bC3D;��Ϙ�ɞN���`�+�Еvَ�*aKW� K�d��/��u�4k����o��4)d"��ٚZ�����md��.�
@�ۚ�\5<e���J��8�NyT���y���"�!�V��O����v~�ѕ?�c>P,A�[L��<� �6^�3NA���)���x}����DA�m>�)���]�!������\�A��p�mÐ]���.o�b���X�}ٍ�[����F�;�(�����Ќ\��H�ksp��`w�@�닻T3z��Dd�Ȫr횒���b�B%�d�0�%��Z|^'a��C�ZմxJE��Ou�-��L�͆!���S��H;Zuv��pk����P��QG�	��|�D4�fi�AW��ζTs�K28�~����a�$�r�7�ҰA�b,r�(Å2"x���;�"Y���U���r�EKvf��Yl���&�Q��Pn��:�k��*F������a�^;'o��i9����u��0\�5ͷGK�p-J�li/��L��;@RWޫذ��{�a�s{���𥨟�,j˃��sV1�o;FT��	�R�nX��_��u�/�)��s2�̂���nnb��;���Ã����^�,��m����l�_�y�0�^|�&'��`���.3���b3��p�\p]����9��÷r�� �IU�{�+@*�k�3*��(���ّ\�a���A�����cW��M��Ǳ.)k�E= b�x�-"�vC"��$1q���GdC_��`PD��M�f��W,�W0�U�l����L��ٗΌsQ�� ,w�G8�J���+K�F绷����NG�.ُ�rԉ���|(s�}��zK&k[�s�����<ț�A��wsٙ䛟U
kpV��z46q�vs2���@\����N�a�V��-���UW���` �	��`�pv���3���B5ܗ�P�y�u����Er#[_Yl��T[��0*���'�q"9�1lC�G#Ή�1V��Eb��fg2�'�O�����*%jL�=�u\�<�B9�vlU�~�eR1f��.oq�w}�@CW��5�,��OI�O�`�h$1�y%ћM�
�&����>&fz�(�+�=;^��r>���7�*u<�8��-z�C�!�vx�+o��ކ��љ���n���X��2�2Eи1�Ya����\p�\���MS; 3�"@Hm�W0�^�cZ)_H����力c��f6 3�j���3���P^x�����x��.�������R
d�^f�����VTkw�_	S����^G|P���3�8��P!T����(�P���챁�N|b��;����Cp2�����̐�oE�h�9�v���Bs�4}�Mb�N\%�j�Jc'�a�T����⠈���=&�q�U7K�j��n~,�K(�.\M�;'�!c4�eUaR5w,����9�&)�p5I��}�b�_]�*[��'1�Xsζ����*��3�[Ok1V8�(�����da�/3�́���U""�46�<��������ui���p�:W\��<yL�d<0We]*{��rc���Np��R����d��ǯ�}��u��^��*��Y�
�`N0����*|F�z��U�H%"ԍUS�ㆣ��默���}N��ʧ�T4�����ɍ\�t8��؉�UAw�g�y�MJE�:�q��/�
zL��w210=�HᄰM:�f�w��*��vk�0x��W�� dH˦��e���2��E���J�a�� � �H�����ˌ��U�o�W��0�#,���B�4����L�쮘~�r�{'A�5GX�R&��ruVK�P��
�6lnF}h�.�vbt���38}U3-��VV ��T������V��[�Uι��GnJ����_��٣�G���AO�2k�}(U�T"PH��s�pȽ��Pì��$�7!ƃ��M4�>@�k#�"uc/c��	��K�4z|H�wz�Q��1�&����h���<�S� �W�Sz�!{,2�?c����Q�玒"b��bvcC��V("8�s��%=b*
���#9lj��G�f����~�J�**6".G�R5�J�碵�]�	�Ɍ����M�$��*�Dl�[=�xZ�V�Z��{�WObx|�P�r��[R#��%-| 3�Ĝ����Pǡ.Ñq�,1;!_�H�^�6Q$����z�#-s���L����5r�X�~`hɏ�{>�l�*Oq�|�#�����=6�����Ur�
��rg&v4�U�-�����O���M�N�����y�EO�ȉ�n"�H�Q��*P:��j��=d`o]1�D/�ߵ�F��-��� �3qe4�������q���TYF�(���yK��Z2�� �x7��ry=�\5���k͟� ���`j!�����t�֣*m���:n�<��M�v{��g��Fu\�?�K�k\O�sͷJ!���=읅�w�G����/A��(�� �  �6GO7���eO��ໍމ�g/�ߟ�P�w�L�	��F1�
[����N�a����~#*��Ȉ��xaN�P�u9{p"\Hw�clJ���C��m+�yh���rNB�͎1��-uq�^��Lgue��h��V��E��*:Ȭ�s�IXk��Jزk8qr�f�g��J���I��Ԟ�*c�����M9������z��*��y �'`_E�F��~R3����c��q���VF���I����%ܧ"�U�d�� {��ۢ�]�J�͌p5<���n�ke糫���<�F�c1S�+g��,�w`���zζ4�u^�R�sxz�������g[%"j�gZ�����g7���lͦng�z�;�T����zܖ؝�a�܊m�2V�3�kfl]�&
�)杗`6�}�C�q���Mo<U�A�b1�htw�V��|��BHW-s���6F����Յ��Z�!uS�ٻR�R��4�]l�{��ƕ3�E1Y�>�Z%S�ZC�6�E��P��"��)�>�\9�۽5����{ؒ�ӵ��D�(gEJ�����.E�iƫ��<�T�0F�!��a�D7E);J���w��9�*�D�K����vpפ�ʸ���e{��H`��ܫ��ZR��ҹO�ۅ��Χ���������L�M� pړaŏ�
Vcx9MG*�Z��1?�����R9��H�'�T�kS�f����Ѱ�
J��"����ɱd.0�������W��q;��\\E�fB��<{���A���*��J� �,#e\g�5f�̏��Pf��E+c�c=�HU*�b�%zA2~Yq,�\�>�V������4v�`�ie�����nG$�+p��u�*m���(�y�O�����X�Ҍ� �1wCҮf��4��i+#l�Jf�C�ˀD䶽R��W�1�_1���7)�W���0Dh̭��s���qV���!����!k��(ٓ_8�,��7Fe��8�+���8��3�>Q>g��΢i�B��nb��}�I�A�_�yo,�����<{TWfd��E���Aet�r-��s�ʛ�������klW���<�z�ϟ�i�*�Qc�i���q��x4�*�~�3�ta�s��<ǣ�ONN�
���Â˥15�J�z8t��}yL���o��o�Fb9��DXչ��L�"JM���>�DpJJRN�%�CB8g����2u��C�6��brF��!����5�T��Q���b"�@�����~��?�Ѹ      �   �	  x��X�R"K}����v�

P��t�Ӽ��8o�~���3q"��?�����ZlE���݊P��teV��0kg""=��QQ�̝;�^{�*.��{���]>�Oy�(/}�[Q�j0P=jP�A�9>�VL�6\^�����s��	��ɺ=�<�<�<����<��@XQ��\��G��,*��L�ϲ�|����^��T���	{�s���^�㤓ٲ���'�+V�Y��}���V�O�B�u��Й��-^J��,�N������}6�N$�����}ksh�rV�� �+e�.�hGǬvl}���5l���w�l��f�l4��}Z�_��|yz�x���϶��$�۝��7�Rq�����;���[���Pg/|x����OV|7�UYw +0a��UŽ�fX6�+��{܏`���f�r}��c����"�43�v�k7u���$���E`���)���5�8��l�t�+�0�laj�1�W�Y�:.X���lV��G��u����'ꂯVy��W��qHx�e��>�Z.�>����Ч����N������h��,�oO������>/@p{ȵ�9:�����#S#K�1"���#�S��hjm=�q[�k��f�"|�WN�9��Mֿd��|��'y%i�}�2p�(k��Dӝ�����?�Աu2d�C"����1�'5stFSm�*���9�S�Z;|`��$0�p"jo��n/�m��ZU��C���Wm.-+�扤ݺB� a+y��3�x�|�e�6��i ���9HٷU��b�9����ͳ�>������yA�;	�l�G$:�`���"���N���>ef�c���ۀ+�$����S� ��u~���Sgh�ZH`;�<���y�rr��� ���B�[�3��!N��2�( ~<�o��a�e��xL�$��7c�Es����A��B���@^�H:3��:����o�>ƭ:�s�jA=)���7)
#�gc&q��;rr���1� �β�>6 ��!Ų}�dխ⍵uc�R +���:<#4�+�dsƕ��������w�7��DQ���/H�RU^��"���� �4��X��VT�m,��,���pAd)i,�`�;26:r��y�y���Q	˂�t��t���ڍS��p���f1���+��-f�'V$�ٍ];y1�7�O�<y�`���v���{�v!�mʚz���( zbI�X_�u�l�mJc�� 
�v�a��N��4l�_��������B��r�9�L�kڥ�]�H2bŇzEU�>Lg������'53���~/
���k�l�ޠ���k"Y*%����υ���Xu���%�d�<3�$"�{�@�a�6�7^�W����^���e�&6�[�H��.R���`�(k5vxJ��SV�C���~�j`�iž����x$iY(HTDIxKL N��`ų�gv{�2��~Q����DC���[m�>������'xT��9n����<HV����("��uV+�mn���dEM�͏�t�G0ݷ�ř��p���Aa�sr�lk<_��,�:�� \�$�<�H��FB
a*�(� \��=�"	/M)�O$,�ߣw͵"$y����D�Fx�c�7s������\O� �K�z��{f����X�D·���%���r��bb]�-"J�Q����rN.��`v{%�4�	-�y��4�8�.�VRG������h_dq��S2����!� Z՛��^à�hI�SU)���i�J��VI�#������p`������Y����#�~X�b5��<
�tu9���Z��k���2�B�����/�@��?,���������S\P]��0\#I~�s���l\X�>�.^�����u%���,�w�Q�_�Y�c��s��+�h����y����Hj��St��6檏_D~���Q4�,*�ID$I����-����Gc�}������a�9?'U:�覷=m>B�Q(��#M�8�x�� �� Ţ|� T-E�&� �cM'J���$-�7��:��괘Wd�A�Xf�cV��?6�y�&�A����e���U˒n��Sd���v���qty�b���^�~-��! 9ϝ��,J��1z��"��? ��a砶(�A���:M���D�G�$��P tV߄E���<vJDѐ�k��xt�'�x*�n�b.gZ��}ޕ���i��=���G^J ge_�S]T�KiVkY�}���s�hՠg%������>�y�!����l,�Vհ�x|!u���[X^�p�DG/�W�6ao����UU���p���B�����0<X4�4I��ۡ��s��*�h���w��6g��R�g�qD�O'��X6 RL����(O�H9����L�Q��i�Jt%))�vP����ÅU��oCxY�`�J0�<�Pp�,��!��6t�gUZ���y^�x�_�x�|      �      x����rVI��;V>ȵ�A^�w��0"���kAdX�rr&u�U�YUfYf�5��A��A !@��h	!�]N��F�
g��;��D&i}ۛ���}y͍nG�{�����{+s_|��7�`��E�h���&�<ey27Y�x���������la��b$m"J4`$d��:}�4%�ɛ��3R�A������gk^B2��5��%gy57�tI�J�h�����@��0���@��OoO��-��/�A!X܊Y�J�T��'OB�H9Ei0�HAE��Dt�n]C��W^�
h���ým���V]���X8��jn���ڃ��VW&�~<�p�M
,t��]ڦ��i;6m�q+f����d�Q�A$�9N��0�R�c��ҫ�ƫ��X��Ծ�$�v�N"�B�d4�H�_͍66�{�)�d�K��Dt47�}4:�:�$��?�}�}+���f��轨�cI���ѥ����A�cMy�KM{�r�ޓ��ڷ�������h,��ܨk,�z�|�}+u/��&��O���ߪ��}�iLjK�h{��5>��kS���4m2�7�{
z[}UOC���}��A�z�_m_���T�i�K��X�R
6��J��A":�����g�f��7��e�/�oS�0Pok��k;`?]�SIX�ր������ӏ�A�T�,�����4�uy�dM�|�Z%�J_:T�~[a=]^pi.���4���Q�q�tf�qu��`�6��f!�_�_�v� ���X��<�z����iic<�u�9�{�<�"�W�S!鶀G��4o,i�el�])0�2��o�����8�E1h2�d`��H��y�K%p�����ҭɛ^�y-Hg���]��V�̂�RǢ�"�ڢc�[����{�P"XKG?��Qʷ�d��c��O]zIO9���\����|b�/�VL���L$��8*1U�i�4=Y`��|�.��Sk��U�%y�i�f�L����k�cێa�Z�A����dt�L�ǯ�b�J��А�T �5��'�_�.�ؗY��A}��[�N�P��L���Wfo��=Y^�}]�7		�j���k_W"+}G�Ghm�|��~J"Ʊ��&��c�Gs��9xř"q2�+�[}0�;7]�^KH�H�D$-�"�E}|2z�x�����%o"��j䥻Ӌ�7J#.)���R*�������ZR$:Q���O*�Q�������ٷa�M7	EKj�t��n��DV7"����Cli��.b�z�:�˓�7^XVY�Bw���<�k]������W�#�Ԟx�b�-�}�y9��K.�≇*�D���vet�Z= �:I�a$Z�V�_�4R�~�Ė������O�h�9���zJ�۬�c�ZDG��p�X<U�4�c���hs��@��&QB=�6'o����T��9�_��U��e ������x����;�>����+FI6��W��q��$9 �?}<ǘe9W��Hx���/���X�����|U�P��,��>�����z�7	ES�s����ZL�j9�|�5Ƹ��{k}�av(��ё��g�5<p�����_+0�^(�Ep�����D��7�^(�Kt�ꈄ��$�K-�UDR�Ynߧ�y�����H(Z.Y�gk�<�#�h"28��A��i�]XV��9k%D-)p��Ds(h��A�9Cw͉�*�\��&&�}��$�j�X��U$�}��aa���\Mt�V�������=8b�>h����}�������O����-q���ۣ7�����µ���m������~M>��n�&��4�M���u!�pM/\�6~qS��j��Hu��iAs~�o�'h}��Pm���i`�8{���{.�к�LE{B�)�\ɤ0�k�|D������VD5Z��1Y��_������.S���%1_N>^����c5�K\j��P�;�1�x�55Z��d��}Q3{�V�u�D���P*7�k�)�?(���ҝ�
�����x����#I���|,η/�ʂN��O�+��\+8ZV@�\�4�o������;�f�nC���Xq��V���"u�����x���X��������ds{�b��Mu��-]�]�5alB0�s�ǗF�޳�G����/G;K��瘍��j��^=��U%��`W.Cei(�JQ�a��Jr�����w
敂��kO�.q�ܤf�bhw�|M��E����3u��'_���_�*�n	�KOu��T�I]���d�~�5��P����׹�#�Q�u�gkw�b��!��'*N<�ܾ�	oh�؞W_����	l�q��7��@�����Ǐ���Xb��N��/,�/���k�öW������]߼�E����nGW.z2U�c�|8[8�-^��ZB�]�0�;�ɴxbՠ�T�c�ɺ�i���h��h���YFT��\Ɵ6=�r�5q��������x���田�T����{��|2�n�����W(�S�h6���k~a�2?�{-��&맽oJ�F�GO�Y�d�e[z�Z�]���?�?tD��+I�g��i1�We�Ghಗg:!i1�oF�z�'ZI��ɴ ������F�����RcAO�b���Li��вK!yђB���7j���NN�jр�6���%to� R-�#t!O��R�����&e��n�>>�.-y��
����k���+�f��x���j2��yw�`m|����g�S���������1t�Xva���*���JC���d�\,S���2n��F��у#�HH�F{^��T��Ɓ-3n�6��x��4�ɱW�{c7��b�2L��s�*Y��W�Žh�s�Sް�Q���Հ�+naq%�83�]�@Z��4�l�Wۚ%%;�^���'ς[6ڻ���R��;0�m9O�|�:�t�[�@�Y�����������!��TWZ���_�����_�z���_i��Ҫ�nߑ�RՓ�]Q+�{Q��V��^մ�i*�A��z_i��e�zM�bp+p�V�NT��w���<t$�����g���g�,5Y}8�q%�\Ԗ�<h���&����O���-�G���N_��A�;P7yf<-�3�E�5����,Ko�c�h?]�n��X��8�݄֊���L�iz�Tt���iu>�ܹ2y�g�_<OW���%z��_���ܷ��7ٲ���#��Я�N�N^��T�.ir�C�1e�7��H���p"	����D�2���g��?��Q�5�D�d��<��,I�������u�@̵�DPC?�C���LU�u�>��Nׇ�E��I������m���?����w�d��͟��aQ	Z�=��z4�I��� ���ݟde��X Q3�M��g@KZ��`������Og�|�����ʖMb2jw�{��1=_���������̲�â8%N(I�9iζ������+t�b���>�4��?�6�	L��DJ���&8".��OyE�V5d�T�w�[k�	9���ݣ,v�^��t�L��N���>�U��SY�Qq��ZH�&Wvf�F/M>�H��;�] h������`�@��1DZ��\�~`1�vpC��Xx˨�#���Vp���E��8�PAc�.�������k�ӧ�4Hm��ua@\�kpZ���{�7�P����Qi@Z6I)�g�<l�R^= N�D��+��Ϗ67�PS�ć4�\=���^�_���+m�9JѢ��7�f��Qa�P&��o�[+���T&��ɾ�ӭ�	�KO6��{ѥ�M�>��}5�}�����1�t�e.� �<?�#�x1�s���UtC^^eidi.\�&���B@&y	(=�痐l�V�PU&��!���Z��	��g��HJ�A��P�!��͐�,y���*���ɻ+�>\�����$���mf �(R�O�M�ܓ�j�ii�#����#8w��T�~J�iz��"��
��rԖ�R6�Ae����y�*\�DU#t{>���ɓ��.*>��&�!�"�e%0��(P�P҄,�T�T����6��y�e�e����+G�㆞�@ E��E���U�,wU��4    w�j96�Bh���FX����� 5�BI�-6�R�p�/ܦ��)�&d!�������++���(j��a�Q�ݲ�W��Ȋ��Eh+�r��k>�@��2jB����C����k�8fAj�+���֖X�J�_n�2-�&�!Y��;8{v�Q�W�����a:+mF�d)aNeo'�U=TZcǽ���)�w��ݿ���P�xz��%J��|e���Z"��&1X��[�+R�El᧾x��TŠ�?6��T��b�:W1��K����	x�x�D�P|qitv�A�J�6o��޿� *&��E�t���tk:\ǖF�"BB?�D\(�F[.�j��2��~c�&}��*�|��7v��񍢉�:�ԍ���d|r�UA�)9�_X��T�%7Sr�wu�y#��ąz��v�z�hA�X�8�K�*�_����[�n+����|d5b�����c���pt�*���g�}aՊ���b>>�<9?Z��Kb\Oq鉡��x�b2���?��{ n!f�O@h��X�2��/�0b�.+DF��e���?�o_���0Ґ�0b��� �ȭ�C����Pl��¢/�L��zG����ʕZ@�/s3�ឥ	j��E?�Dd�����{�����0�G�BD�#�h	q�c'�UX�0q�D��
S'LUX�0�i��'<\�cM���?�y���P9KIQ�`9{r�[�e���*����ɕ-.���ϿА��T'Up��"�����:��&4TH��K���\d1&����ʥ��I����
��R2�c��G���-zX���e�_�%�Zh���l�!#�i����Pe�bp(Y�fp������F�%�ŭ��ie�ȟ��_�iu�R_�_�gNܞ�X�Zej��np2���D$�v�k9[\�3�T�5:�I��j�P	�2���^�XeZg����4%*h�T��Q�jN��)�:̓3��0�0C$�:�	�3D�h�!�6�i����e�-�2C���͐�D��x`C"U�#�0Ґ�0"#�.2HG���c@H�+�o.C�X�Z eHXT�jyYVB�O�y�hcC����D�˯�!�ߊ[�q����
Z�b/蚪��eJ�����%жy!��%Юy!�&o�nQ��b�ٖ���5�(,;Z	��քB\lmM$��CJm���퍸���F\z��Fhc����͏��	*���	*��ԉ����S<�>ۆ\y��?S(jBC�r�� ���DѤ�P�TѴ�LV��j�ex�/ �J�J�}����U=��#V��#�;��gxw� Z � ���0/C�k�"����I�To� ����l��H�@�ԥ5wa~����3뗂kт����k�6�@�7�.Q���B��ro�6�4�꾻E��l�Z�͝ч{�YV�#�qgt����>D;A�L���d����W)o\����!�����|�H�j���F�®�	�F$l�+Ҧ�pU�5Ҡ�#���Ng%0p�v�=�h2�(��pi���� �5��%6�5^�x�:�e1}�JH�:�C[�ܹ�� �΁�����OO��U*���(���C�S���Z6�ם]���H��HL1U�
���Č�~�10I5\}���*�����,��(]������;u@U	�����ċ"k�D ��'��"gQ�N��`da�s�@
j�P��z�����:���
�WէO��'��Zqu�������,�;�A�¤��0�0$��X�Ќb���˦�_#�禋O'߿��R効`�NĖ2���klz!�`qRh�u{`�i�d�� �*U!\Wܹ?�_o�b�`(�ͫEx�����U��µDj~�5�`��EUO�N����.���b�?����uh:�Y)��� �`��8q�͋��O?�7�Z����2(�64Q��TcO��>���l�Uu�O(}#uz��n��z{�-����)��f�d��s�T�q�*+�>����5���a9q�c���"��a��Z�����a9A��r�ڇ����rp���������瑦ng�뿟���2+f�#3Ҙ�I��/-rh�RI�/���6=x?���-R���;�;E-�e�'J�}>=U�O�DU�l\,���\pb�c{��'�����x��-��v04�K�Ԯ*_�-"Zb�b8�b��uo4 &���I�y�j�jN�cɮ$ٖ1�t���5��m������Ъ.�d �*��c�]�HS+�o��%�R�X+���у'��ҙ(�y��E�K��V��I&f	rt%5�y�EW)V60/Rm�9��[�gC�j��W��7���dU�B38�����Ƅ,�6��$i]��<��;���Gh4^��1�'9�����1�[t07vgW��dZ"������ѝ���G���-�1Y-?�^p��Xb�lj ��Us��=�P8������-k��IǍ������Ϝ٘ed�d$�y������?f�~�	$�� �����#ru,s�a�M��,I�����8�y���)k��ר��SP,��Y��wv�qk���tFY�Wf����K.,;���Lg�����_�耚W}NQ�,B�N�nl̮�<�tZ?�� �8���P�E�G�A�^̱}�zB�2�/i��t����9��
�r�	��M+���^\BO,t0�/�L����`[�e(��ih r���}�<U��c)Bϲ�(��SId���]�̅��w��t��q�~�B�Yۡ ��3
��s\}��k2�=B�m�3�\2�o[X��l�FiX��L7mc�;?�,kQ���E�g���fZ<<��$�	?�[`?�ISWW0&pAxWT
��L�f��0�5"��(�a�%�N�?x���(��YW����6�����u���y�i*P�g*P�g*P�i*P�i*P��0��7L�E��vΏ�q�&�\��=6�U�My1�)(T���D�Y�4����P΍ϱ�<	��'�0��>\t�!���%1�5XH��6��G�N%^zʖ��8�^�q����d{����o���uR�%�T���a�};�xT�CV�����W���/sO�����"�u���yWEa��FQ^��Q�W]m��6v�QF�o����o��'�I/�x(��rZ�A�E&/�v'\C��z0�����8�>���?��l����*�0y)r*�z�[�/��ioHD���K?˅
��4F�:����JCI�Ą�D��N���8�b��ʵ�ZVXe��Bj�Y����l�����u{��9Zz���ҟ&Ut�����f�HmY��0=��#۰�-qo^[�Y����i����T	P��p��)�'^�.�Vrň�T��� ��zZ!i�E��	���Q��,}��iH��؛������!(����U�S,7>Pm�I�:T��׊�q� ���)����k�P�L�"�8� T�<��W�Z�J���,���g`E�y'�:�+�����D{���}[��@w
�v�C!5;��R�%��ś7	���������lYw����}�7��y�S�a�eN`H�ʔ�j���a��ý9�����MN���h݂YM�-4N����l�O��[	#���������)S����0}�rT��K�u�%�l���M���p�A�x��SO��0	��Z��=>�8:�ʠ�6#Ń{Ƚ��d�L�f)��qoÈ���x��:����7�B�~�س!���dm!B�F�j%�Cr�E��YV=�v�\J�ee��!�Vh����p�@�L��[ҩ�L���͉(i�u�j����g�X�m���Yh��u��2WvZ�jH���/��E����@1<A@�@�m�Yx8��E�*� ����Z�x��'�lc�>��g(�\0`��9�ٳ�'k�l1��-I������O7_I?C@��w�C�U���h�%~I�aq(���/V��[�O���d��N�J�<X�L�4 o@�� �o^j�{1�-�&;J~�
�uƐ
��.�:�VA��$�]��ii�e/�l~�2�1���mf��p�̍���r�K��T��Շ�a�`)@�9z�$�U^₆    'p�KԹ����Y+/�ql�
��ɡ��p�����鵇�	Nq�%|��K��V|�bqk��­
ƻ����[����%c��Y�`�h��nF�W�w�M3R)%���:���+��tRUr���I��H�2�xE��{�N����
d5@�Hr�[������2}���s��O���­���ڟg��[`ps���o�[e�fH!#%���},�^WWX��F�v�q���Pt��q�3�y˞�7A_��^���`�(J����������k��{�Ԅ[��5w�>3����E}�hr�^l5*Ҧ��zE)�_B]�PHS/t�W>�v���ހ�@��4jM�d��"���:���{�9N��(�,l{!��:p���SX�E���e�B�R�5{�թ��,l�-k�Z��K��g�������$ym���n�cv���>�\TR�{��]r	�wr�O9Z]��ο������k�E�����7�`m��!����Χ>Xu��tx��=�ja@��b�y3�����{��G��c�W�(t'�4�j��7������ǡ`ZE���������	Hu�~D�KŨAvT�i �"
-�4�a�k�H�!"�#!��NG����A������+R8�������_#v*[��trE�cx:f�p5O���hO����$=~
i��BҬ�O!&��S(B?E�0[\e��HQ=&�HI�.��-�+�����ٕч{�b"ҐpoHH���b���v�PP��9n�[ǖ��5�uQ�?y:�-�ax
���iH4���˄�q��m#�p��Xԟ���rcHZu�1(���Ɛ4�rcH��1$��\�oa�Қ7Q��U��:4TH�3�w"^]izDB,ޢ�,�.��m*{hK��\r��WW� �&h��A�W�Kwzy}tiKj�@�!��7�G�oL�ߜ�}&Ѫ�0x����A����Jh)SI�ߵ�-�Y�UH�š$(��������
�\u�&��jfR�Y�R�6]W33�_���i�*u�d�W�ԕx�U�#��B��_&�6B�qBXTi�ױ����^����Ɏ�ƕ�e&�b��U�ԙ#s��+u�#�dي7����i%TB_�UB!��(uWg��T������?�L��$��D�2��-Ui},�^MddsM7���f���'Gw^�.�Hb#˚`�^�ݺg�����-;PQAf����6�_50)�*R[3�|1޾�Df��
]��3[�tMSƳ2��R�hq�6��
��Q\A�ԅj9��9�*Of�u�������W&gO�w�l4�B9������C��N#Zqp?/��c&b˩��A,V�xB�
q��<�J%"��[�V�`�/�Z��|cjk�Ust���`M��\?H������*����\�Jkn�s,-�痀�O_M���g��E�C�@�'D5�q~t� \���7'�q|�zvw26Y;�\��j��ͺr���D��Mmi��?д�5H�z?���L�`1h��h�Q��)I:�[p�+鄚cwu��U��kh�[h31�@k&����G^�.��6}W-&��mhi�l�Ѫ>��=�ҦMw�i�s��n�i�ii�C5l��;b�>A"��3#�Q+|}D�]-�OT��n-��ij�%��"�+��v���bW���v0X��zj�� �i�-e��\�6�Q��B���\ڷ�J@5�p�SB>h�;I�����D���&߅������L��f��}�ŕ����ć"�ωˡܪ�7�AXq��"K�b+��1�ֲX��A�S֤�B'�k�J�{�J���EA���(�JV�/�K,�����2�1j+F�!���X���#��Ė�������'8>�����G��r �Y��~UKxDET��!��W�k� Ԫ�h�em��������Ʈ����>��R�&�T���{-�&�����o�Z�35i�i#/��p(;�WW�ƣU-R���Ϗַ�'�3�K�?��\?q��w�JMU�2D�Y5h��(�����#��`��P���\��7���W	���������=s��J�ʠwW��R���f�h~�~O�R��*o����M�^M�QZ�UC�_��AZG�Jj��*s��S����Y5��Z����'ܽ��R�4�nd�\`�m��A������'�!�"ymQ2���ﰙ쟳f��l'��۽e��ؾ͏J�hcå7������t����)�<�;\X��2��::�e�]��E����g�H���H���p��G|e1:��EQڷ�[������hө�.=�;_��}���inu�����in�4*�F�)!e�М��o�MH�v'�?�f*�x31�f*�\�cyz��Sdv��9�}l4p9��.�Q��}�,[�,�ZG�$K��lE������~?�� �4&��1`C�.��Fϗ�3�Q���c���M�˜����^��?���J���:�Ū���F8�����[z6o�!���!GH�qŗ���o,|DU	�B�0���:煗��:۪�--N��6��B\�.]<y�cZBN'i栠�eZ��<��v-Axy�J���O����ٙ����f���/^$��_j�FK��6�+%�^�ԡN��:�J��Ќ
u�������)����.��2o�¯FY�*gF������V�i7�ҹ���_F<�b �uU�ѥwI���du{|u��EjE=qk.d4j-�e�li�>��nV��_5��z-����<�T�o\��{�۪F���>H�j-���.�T�R�p)��`r1��:W/�+��D���M$�n?/�����YG�� rD����&��i�|HLǝ�ߟ�t  �j�-w�����t���̄�Y�7',�����L�Ѐ����gY��ᳬ�j�ElQ���L��r�"��(�ue�D\'�be0�\"W�zMc�1i��:�dl�^t!�5z���u���%���9{���rj�������͇�V7q�����k�o|>�X��5�XI�L<���~���Ǜ~��-��sF&F&�!{��*�����rL<�����5�x���ci�`34�jUԙZhN��6ޝ���������s|�)é��J`9m���i��mb~R�L\���9��$ƾ��R�O���>�"H�zѢ�tu�5եN�xK+YKa|&C�B.����Zȕ�Qڎ������,	��\MB���?2U��?�i{8�wH�j\��uZL���<Q�����S=A����ھ1�z�����.b#��ó��M�:��yn@f ��K���5 7����9��S"㎧�M�F�����^�eI�NP&` u�^hFy���VS�댤.IyPJ����d�d6��]z�ܥ��벂Gض�mx�.IP��N�hctQ�J���4w���1t�Y�wp��5�]_�i�MI��Ho��Uz��.���R�]b�9ޙ��Kz �:���+���>d���ԃ[����ؽs-�������,��6>��όCJd��`���y����Z?.��=m�&b/iV+�G�d���2�����z���LO�O�>b�ª:�sqv�/�����/�����w�R/�[��R�_n�!\hEÐQ��eN'%6���e(���H���� �4.�d_�4Zz�;O4�UI��گ�<8�C���G^�ά��VI�-�M���C+���t���4��g����W6qY�;9��$��l��fc��xٔs+���j�q�����$J�c0�?d S^Cc�p�72+A��X�=#�@Mq�ڂ�n��k��\��Ρ��}}d�5���69���j/Y�i�������Kػ\��e�엦̤0��>O I'G+d��g��
��݄�2�6�[���@*J����q�#[}�"^���P5ðU<߀���`�i8��c����f"M�"j�ä�l~b&�ȴܻc�JB����/�G�홝��1V�Y/|��a�2olRԌ��X�~���h-�oeQ����Vx2�����ߜ����K	�vwkv�:>?��K]r��ͺ�mr�o�M��]�6���`��q)^��q��n��ʲ�{�|�iή�on�H�a��ߡ�m��7�1�    �S���:ɽ�nYw�?�B����g1�8AV󳘊��,F�^��,��/hR:��]�vZ\��_'�w��s�7��=�ez���sA혔'�.�ec:����U�\ԯ՝@,z}1f�c�bL�߿²���bY��~�,�t3���_,��(�,�<0��/p�HS��U����"p�����:I�EA�|.|�����N���&6�_'������ߺfH!�ؓ �m�����3��cV�R��Cķ9ٕ�X�G�n���e���U���x����bq$���V?ߤ��%�f	��)F<R�IW3L��x�����YC�������
0�G��2e���;H?N�a�qn%aN�Uwj��#��?x|�.a�9��4}�31u�>���2x�y	=��aC�.>��{�DV�8�p��ho�����F�|ނy+|*���c�2�/�7��R���`P<��dz����JOt�~�VLIX�n�$)�%�:�Ѣ�M�(p���hiV=Ҩ��zc"$]�K�6�̰5�4��Q��:�iO}�°�r��TGg�6��Hg��0l�:C~ưӼ�t�/lM�ZN�7[���㯪�At�@d���\dQ[W.��c}P���Z�N�T�;|��v
!�#VM������v{*Q4V���A!ʎuD���2!,.�l�9T�Ň�0n|�~����0䛨c��ö��TD�j!�Vy�:�4�%~��ޕB�MS��s�:!s�)�[�^%d��h�2�rSv�2�W5���ڏ�赮2g��:ͨ�\���%0�,exJ�g�i�ʴm��!�Ĭ{��Q+e���w��?���k����+��]:d�����ͩ�5.������ � ,J��� U���R��e��d����󳨠�ѧ�婿/�:A��&!o���5CNU�!��� 	)2�h��́�D�s�%>��O{Q W��B����M���]/�Zv��82m�+�x6��`�`"zq�eqz,�x7�O�Kd_�%`�u��xm=ȐKq�Ǣ�u��V����w�R�e��RS���������Rg�3��
W�{���'x@��xk�EB9�$���r?,�s��g��tq�;����_"W��js���^1-�,%���-�\M�3y���� �����xww�xӨ���s�7x}��L�� _-z3Zz��������퍇�����Hu̇4DE��H�2��b�u�xF����\'�ܠ�$M�F����D��{�_���86"ì���.Yd����k�$��� s�Kl!�A��+b�7��%������<C�i���x���Y���x*������K8}��8��
/�gڒ�m��2cV�?�'
��Q0��+}/�7/K_�Ti���Pm�1���-�F=Z����X�3y�Tv�S Ss�[��(�r}(��k��X�F�X��ß������o��������S.x��>�����Z#Ig����_���/������$t�,�:z@��= K�|�T�#"U�8/�*{��H��9��H�m���'?y��y�4�	����r�!��7�j��q ��]@YfS�)Gwt����=t]k�����1��:�"�0d 6��Y�����$KS�Vs��ϓ��RDiLfvOj�͢(�O�H�Ƣ����ZXj�6K�������I)Ut�+�/;xX�g{ɯ��M��@G�������(#;}R{O�^o��m�ʣk�+�&���w5y���]M��]M��]M���h���3x�&���<���+����RG>@,`q��
F�q< �'\���5`�Ǎ察���w��w�╗��~ ��3(�;�Rǹ�A���ϠlY*���RX5]a���A�YƪwZ<%N�J��f�� �g�q4j�<��*~v2�jz�]�
�zO*�
�^)U�j��oE���������������h`�$[�
}�ӯg�-צ�.!�m�ú��j�)��sJ���ITҔ���y2L���X��K���?�ia���.�7V+�j������1�`V���8.YJ��se��5��e6e����-y�\�>�+� �K+F�0�6j�z�>�ǽ(a�M(P�dV'$/�������AAHRC���i��A'�`��7;	;�I0���F��`����S��QQ��:	��;	c�.r��=�qJ�|�K�8QW��c�\�ILm��:�bO⒁"C���.�Es(yJG�L�����l�#5����	>
��vry��9C���A��S:��⸑aVZ�e7�?�.�ш�a�)�.�K�B@��v�p�����U��h%��H<�����K��?�H�ԉ�+���I\�������ۣ��u���2�t͹�$�seiל+K��\Yڰ,��G�:����#�y�[�Hq�[�T�q�_�U��R=N/��:��Uh�����C��m8ɍA�.��I�n	bE~&���wӪR����x���H��!�Ǝ#%�n~VY�0F��$��ǍCE,�x�Zk�`06��G��e?�>��84:���,�!�[a�򜙡~z{��	q���I�ꆻ���L�����#��F�bU�އ�*S�����_$蘒2�J����W/����˟���㭬� ��͢�+R���q���i�,͓V�Ҵ�@�4���6C���f���JUs��:(�+��T>��?��Ը�T0o�`�e���d)��*�u���R��槁Hꀤ�0���o�X,.��I�se\���$�Y�We
�2�s�{:��ѕ�b.ي�bi9h`^h�a�`�ӯ&[�-��Wd����؏%q"U��>��T�t~}�|*�:`%E��b�W�8Jg�)�N	��Y����k����ۓ�W9��l�t73Ѧo�M�Y4��kA������:ALҸ��4�0,M[G**mwm<H��kS����k<H��>��=W(0��/QRJ�#�#���\<Ei��\��9sc'k����4^ql���|�s|Ԙ���F��7�D��gt���]b�`JI.��\|�*]�ck�bK&:��d7�3G�؍Ŗ\�4���,M��^�� �B��lX]	� �Ko����d�����\%�D.^.g�U\b��ĵ�,��
Yn91>��WC�o���A�f��<�tk|n�)��ǵIoVjP�� \�ܻ3[���Y�2�i�=�t#Z��D�H�UĞM�l�
	�AJ��v"�)�Vǲ)�&��y���y����*
����U����n�bPC_�(����x��4e'��V�wgk��><�X��|0�N��)���92=�������Sb5)��wL�.�C���Ik�Z����
��W+�:�j���Y�P��Z�"3�팱��W�)�B�:�fi�6�cQ�=�c����Ֆ�`��0~h.�Y�o}�Eⵒ,��xR���1
%����3~��&^�ʪƭd$���7�bW[=B 6���Ҝ;�N!�6�Y��
�"�X2绝��vK,G��c�����Ͼ�.��Y ��2�_G�\��;�(��+p�8���$M]ރd����tj�T��$��S��U��w��]$�PԄ���q)ӟ �9iϳz9]����)������_�S����?���o� =���?�єA�An�0[�WIGC�t�D��%��K�l[,��訋:څ����z1��M���Oaߤ�ASqlb�OO/c�61]y��܉��U
�T�=_�#re��V�0�j(j%Yj!y^�Bi�e��ա;>�4��@c������u��>�.XdU�J����������8e���w�'�~�#������y/08/
p�"�m�	O��{]+�TS��wi�z٧i�����AfP\�j�Ź��^˅k᥮�Ev� kG������a>;y��O���s'���ZG�k�7.��+���Y�|��_x��&�V'����>xs��m3k���<2�����e�J������8��r��(�b�������i�|K������)�v_�	��_Dl<��Crg;�m�	d*3�lRC�\jqU���H���~8�]6 �BXq�&q�-��~^�jZ-��~b�o]�{��.J���ȳϚe��X����    c�C=�Ξ]1ňW'��s�
Z�.E���!Z��bdh!�&���W�X��*R2��T���ʽ��p�����9�y7�s�rKz�H]�-^��>�r��0�	
*7@Ķ0��n��O'߿��#/
��WB�UpqC9D�)��
y���]�ʠ��Y oz�p�2^��C���%<��JB�6>��8��ψ�x1���M����_��w�سF��o���y�Ԅ���$3ݙ��nY��J�P�����e�B&�XX:��xÌ������5I���ܲ��@t�2cq��3E�|s��L��sX���a5S��ѝ7��{0�'�a-�t��9e]�8[�#�U�a�[��E�W~����^��°�,<�9�6�&Dh�W����������Z�.��ȅ�R	o��H�{��LSK�U*w񀝸�azi����7ÛQ)$
�,�m��8^1}l�KQٽ��@u�rax����`�-�
�c�ӊ���Z�CD�E�i�4�$"+S�{��~$�e�Z��5�pw|����9�V��tP��6�ՠlj�2�:)2��mܙ~XWF(WW��\<?������3vI�P��u<蝗G��0u6o��G4o��X��?���`�q~o�óڻ���Ҝ��C�����E��M�ljd!�<-���	���s ��OM!����>;%Ҳd���X��=���0j@���cOiP��?Sr�%�.i�T!#&3�JR�3������Gy��Gy���Gy��U.���^���p1��C���8���ȀXk��j�Ϻ~�@RBG..-7�D@j��{ӸTf�6���Җ��(�13�UQ�*�K�4d~�|U��t��<�ɯ��i�/�}��H�0����"s=�;m,�V@����X~�� �+6���~8��R���D��"����n�5F/8b�4�����+��r���A��~�rM�v;�f��H[G�,$Ve�>�o-EW�
�1Q��3�
%��+�t�2�I@�H��WH_��K�5�m\�	��:���>n}��	3m�{:Y�x���8pϮ�n[�����H�m�n�����w+��_}��<�e!�=�z��b�E����T��鏇�� ��-ڤyI��_�>#�:c����P0��p�l�j���hs����m���@��9�Y�΃�.�\�H���*�4�wvlM.�*�%M�`d�BaӁ76��iIib�A��������Ԥ�c)�ÃU�J�J��������Y��$vQ��^QDҬ}�K�y���H��H"m,�76 	�X�ol@b0븇=�, l㢈����8�_|�M>�N��c|�@?H��qxv{�����}w+�B��c��-;~I�\~����;��Տ����0���p��l�!¥�p�H140�.�fs�DQg��)�\X��ԙ�-)�����H������H��ݡ]�K���AB�B���4�	�b��x��(2�#�{���G���"�v/�!�N��&*e�3�G�6c?Ԫ�Ů �Ap<x�7)[�ó���]�
����>�)[��}�x�o:(D��bbI�>&c�'(�EKy�^aY��I�wX!���W���RU���rtW�M�l����B��܉o��T�MhȐKO��!�U1�v�jlh6�"}7�ę�ˣv	vԎ!����R�V�b6�×�e?�ҥfwo;M&���ʟ:4�ԃ7��P���S��ێj�����n���VY�����H�T���S���5lwŃ����ǵ�BUo�ni��@Qϼ� ��Z�� 1YlqDaD�vL\�,�%��N.��Ҭ�޸�Lى��~9E�A�q�|׷'���z��o��q�@��g��B�R�f+�S�:�K�Dd.<U�)a<Ʉ���ڮ&\,�^��7EnD�T ڢ]F|	�����w)�L�+���E��e���DF���@E�������8�y�,q�� ����t��ݟ���>k�l��Hy���2�R]/쪼��]�t{��2��ܠ����>���k�>�PiPX�q��#/��7NU�Ic��� $X��O�t,��4i3��'δ��m����.�~A�V+�7	'1�h���~���77�	W�,/r��r2W^~��{ܽ�U��E�\���i�&^Y���_^��������,IM���+%���p�9�r 
���|[�H�:���sڰВ++���~H�����?���h
I���W�Yܷ�Q��H��\s;��	����m�ؼ�����V=2�nx�x!�Y��
�b � ��+�*�3�`�j�(̢\�3�Zq��6�X����#��d�r�/�sk����)[���Z��ك�cr���(���U��o�i.a��ޛ�=c��ʞ^�f(2|�E�R6�%�L^ͅ��W����1��fe�n"mZR�/�(;[4\��M!}���Y�m�^���'@�>�M���vcot�[@e����cl��+b�ގ/ܝm� ��<�!�����t�Ȧ%Nw]�3�zs"���Y�������d, ��?߾V�\�9��B޹;z�/sr֬��y���F��5���>����h�$y4]��g��,�b���շ�����?m���j
�����4�ո���t���к�e�TB��V�S	"���&4U5'4���4��+Su�_aL���B01��^���?���2�w��#�?Dބt�_j��p�?������ǟ�a����@����$���U
CJ��$ߺ����j�����Ȁ�� �*��M�9n��,v�^��H�_�O��X%�D.�,X��B�_��}�Kؑ���Շ&M�o;kd����Ҩ�F���F��85����Hk7�`��@Ҭ�����*�����JP��oД\��vAT]����UWb�ѯ��=Օ�����4���d�Օ���q�z���i	ܿ��LҲ�>����(��]����U��:*m�]G�-��Pbi�*��}���8qeMh(PlP>���Ku̥��k��%¥�Ԉx�o�!(J�U	�{�M�q(�%���{ۓ77��ڔ^�X�P܄�U%Z��1�ս����RB%_I?H�?��_���Ƈ�cСD�T�Dv61��*+�L� �����P�^M����H|�VMH�����m��V��E�'�(,#��9�n�@���F��FPꇁ��,>?C{D�Rо*Rб�*k_Qi���XZv44�V���|���������������<�iCL��Za�^�rZ$�;#��d�KD�k,v)h`�*%e[�`R���6ʐ�T`����?CW�8��%|���U�Y.)V����n�*� в�|Z�8���0E�{~�q�D��$p�F�V�)CV'�������о�m�n<e1؜�O��O�b��J�����
~����� .+�Z�	������-��bK�L��w5t%eU��դ����T�u�B�6N��� ]�����h�5��싲mPƍ81�j�1�*������������>�<]�Z]�w wCLC����ܙ���dB�-��Z��6�'����9U&*��z��ģ�ͶL��L�(�J�b<�M/�B�ӐPZ������w�&�Sʳ�Q��0Y>g�%�`E;�B���S�o-��53�	�-oB��=]�����˭papM�tڂ��L�F������S?�����Q���*m��\�����49�c0�o����~�d�֧}u2�@�t4^���<���d�'�C�9�jv�B#X�@�Iv0�%)n����Ds"�5m&b�I�D�u�`���c����bN�^!❧Wp/��_��=e��M���$^%���[���ď�Ż�0_��·���/�D(�����4�%�����K=U�~X�N�/��3V��G�����@���e^��)Xx8����u��3���/i������;񋀗|�5��!D4θ�d�d��I����[�rc�����l+�W��*;ޛ�J����>HL�����1�^��&p�����e����� ���5O\� �����*H����� 
  2��<�"��h R��3��e���2��J��7���T�2p�xU�~e���U��=X���
v܃�nV��Е y��+�"w�� '�:^��'�y�b_���?�n0��������'�Zi�uy�g� �X]�%�.��y�
�O�Ċ���
�-��;��#��R�t;8�v�����qaV!�ΘD��a�z��f��I��t_č�'��^H���b�N���*M=)���p�J���Ow�뛶��?7�5eO,N��p
\v�˹�.�7FO��K�ה�~�ƽ���2t8�W
��
���_ߓ`�M��8Z�`�2���?��O�H��SQ���r0��2	����,��K���6T����a��߲+�5�2�%��s���Ir�I�� �z�\���ST��$=d.�e-���P.�������,�->p%��=�SA*�q
�dढ़�W�������fe�V6���YQV�4�R.\u�2i|�i�����l����2`5DR����2t?]�����+5(b �.�8Tb&�E�'x��$�.�A��c9q��_;��T�_�R��$��o�@Y�~�J�����bЁ2�~�$�@l"	.�*j� �_`�`�;���
6��.مHF����UZ����'��J�
o�_p�Tޤ�.����wW���&ea9��O�u����/N}u"��2��3U�X�V�wӆ΢ѧ�5���fz���z΁2�W�M�ﵷM�5�ڻK���-��H�*�s9*�ʇ�5U����L11�X��D ���cO�I��(OO��L�D��9I�MJ,�\�'��'�=d4�ѹ�H#�<��������wOp�4�p��"6�تaa9i�!�h��J�"���@�������EYG�M���81��h5�%������n2:��dw89K�|��U=ܞ�ӊ$�01�a���O���B���8�>��lK����ʁ��pWWW�W^���C���n�R��D4��&�L���u�����#"��������UY�
�+����/#,�Y�S���pP�}�V_�,E�We�5oc���YAd���}p��L�,��K )�'��!W�T��P8S���$.�s�i�����c�JGs�X�d#^B߽{�����B���5(w{y��tdB�����(�:���BD��X�h��ac!��l,(��ym��dQgc!q|tc!.9Vc!4�l,$��y{c!Y��X�(�h,U�et3iKc!Y��X���n,�%G7���6����B����Q�5"ʖƒ���l,(��;Q_c!�����������8mo,$�:��qű�egc!q��X����Zɢ��BD|Dc!(io,$K�ɲ��BD~tc!�8��W��]�7�E���BD��X�h�+���8j�+Vi�\�J/���R/H�^{N;+��Y����"��O;+�;V���_�X)��8Z/L((�;Y�B�rS8k����<*�{�P�X��E�V+���l�ՊO9�~���~e����W�g�5b�'V�����	�V�=��ȓ�x�F�
<X��]?^ʔ����i����L-�u�cm����6����pCf��8-A),�O�O�⮍�M�	�8��{F�k����D_���;�K�)0�뀗�ش�&u�'D� �Rc�Iz!'�O;�gǔ����u��i��S�9�'x)V���˽ك�� +8\$@�u)|�W�~˿��W���;�X�v�S�n��ɒ��Y����Ъ��؅��Ͷo�������<8g;蘤N`,u�)�uZX�g����x��|�8bHG5��s�p{��0`�e�U� ��۩�Yv�Q�M�?[jy���gK���Y��#���|����X�J��#�ȸvj�V�����_���Hd:)��<6��,?��qM���ύ˩�����t��������o�3\�S����/vĸ�6���H��*��w�r�Gvٜ�u�xYb���x?�����þ������ke�rTۻ�Q�88��~�����k���º�XV��4�[K��T�Cʬ��r2aVI�,��A�7L=k�{AC�*L�5�R\���k�(�-�*ϑb��0�H��� T V�:7��f>��U����J�ZVjl}+5
�	we�󄻲e�x����:R�u��Y1^g�1�%k>r,K(���a�����fs�.�\��[�N}'^CE�aJ��O�)U��0a��1�SVMMK�%.�ڳ+��w~.��W�E$�ԴOj/�1g���*�Z�����-�fR�U���z�*�ʠ���%��Y͍�Ǟ����K$"n���Řx1�Rz]��q.�8�����Ң\�tƃP��]zn<P�i���Qs0L�]�%'��N_���뢮��L���ǥDY8kVAq�)��5!�j2�rm�ٕ!������4�D�����n!�����p��a������rfw���~G7$(���f6�]�NI�b��>�iN����\��	iR�����/~� ��1      �   �  x����V1ǯ�I�M�r��oчQ�AEP��
�~@qW��/C��-:�d�]�co8�o'3�����Y�G�,�Z���턌�alCon�8�i�/�=��XF�;�_�c��!ޡ�)Y����ZO� �����R$f�6��αaA�}pU�S�y+Dx�"�Dp/�:WS��={p���@V伦���9a��;(+��*�_u�̀��	�!=�~��&�:�i'QMoV�r41$�)�S͝�"�h�E���G}<��:��ܷk�j+�PI�~Iʹ&�$0�r�v/�>�FXy���S��a=7�'5��l�	$��}=5��dF��+ɿ�y~�cw�P��CP���Y�Z-��LW>���:4R�Ƚ��@�v2c�E��@�rђ�y �mj�â����6�N�x̓��."d@J:���������s�@�x�
��c�li���"�^I�Ll��ekU�����V~�wji�k�W�����vG{cڪ+�1A�2e�@XF|�ι��Q�a �<�_��$Oz�2A?��\���^LI���+?_�%�[q��
��oŷ���+�V+V�E�2�= �8�A4'p���ʩ@����/68V�@���\��8?�B7]�sʦ���y�j3CƢ�C��p�b����|����n���B���4����xџYֶ����S�gഡ̗c�A���7�jۢN�>>>����?N���G4�b*���4����!��&Wf���}����By�-ޜ@&<��3ɼ�NS�{��^l:P�@��|��<��%�J�>bH�]���N�'�9�%�j[��0,�B��� LnC�T!��tbz������R���=������������j�)}�;�֫1���7\�����Q���� p_�"��k(��D3}      �      x��}YS[Y���WP�nVb࡞��V��~���7�_2��7�U�Y�j�y�M�$��H�� ��<� $����9��������g���ئ�p���=�y�������U�Xv2qwvÝ_p6���\�l�����+�2�>]v�'��R�}����v���F�~�r�J1B�9G���4����U7�v�x�ğ:G���3[����t2�Jy�R��oԓ�N:�掜�����G���=5Z<C#��8gS��W����Y��Uw���n)G�}��� 3��̌��g�H�^s�q���Q7�q�y���r����\=����W-�V�'x�N��i�v_W�����L��V��򶳒u&�١�掻[�&��8��~m}T�Z,�T���r����8����k�Jiԝy*g������3n|��|I��ήٟӊh�J1�N�h����d5�kz5KW�I�VKIur�4eu�L�L���*G�r�4�=p7������e猶?P(�ss,�@2A��L2�SZ�P[4Z���V�+2��az��.dr;���Q�NnK�<�w��Q�|����*�Qr�O�c'=��;+�t��B����~+�ϫ�2�;:�f�L���r'b&�8J�g�v������/gl�I���/�Ϧ���3C6�����}��������F�5�]c�5�¼���}����)�6;Z���s���$��Ѩ)�T�%��e�x� �>=Fkk/�Cg��0F�K��FC�d=�o�����)g�I��
�G=�H_����� ��W} {O0��V(�Wh>���s�),����L�����~����Y��4R���}����m�����<�-�m$)���9sso#)�*��K'�ጏ�SW(��N-�"����~��( MOh|�9����{qr[�ؾ9w`��r�[����\�p�����h�8��Q�R�IOZ���O�owbZ���b���<�y;[9��z��?�=]tV���;����A��:���UI�S����S��v�~����i^��f�M�$'PmI'�*���X�b-%iP{�I�fN虅K��4�,�'Ǩ�t^��!a��Ql�H�`���F�|�ã+�Mw��ۇ�6�83��T��"a��D�� ��/�����l���>OFA�gf���kwl����.��Fg��
�ۺr���!��gQ����l��A����~���;uN^����Ȑ�N"�4��_p�	�F��Zb �e�۷e���<�uG? <�ߵx$s����]�sBH~/iA/�E*�<bѨ�'f�GB�H�u7���/��Y9!��q�x��4m����s���3c[�G�k�t�	3�Cz�y��� @SW3�&��ΐ\'>N�C_�.�>��'4���F�:eE��Ygb ��x����%2 A�d��%��v}����䍛���B<���h��5MB'�U�;�W}� !�e�f��:��۫�`<�{n�=���+$�D��Z����~�{Z�l��i���,�>��R>��:�ôT��\/A9���|�l���Ks��.��G?����O���I����Sз�5�0�UT�H��pd˘���L/�9LT�9���
�4�T/�K�̨����g�ܢ<n�|�>�qR��+�ch���M���hb"��1y���/��}e��s�sw����@,/��S�]�k���A$��+u@��7�.�|�HN
է5�����t AaD��kGJ�6�ɽDS	A�HL�+�ՙ-��pGs����ʲ��芼#���]+l�8"��8a� �R+8������ݩ��ɇP��'ϱ�EVnJ%�}�����/�|a��vA$���kQ���Ͻ��s��F� b���^�~vxDw+�r|��F�=��XED?	w�[�	)5CQ��@wE�$���N^���$hӒvY���Q0��)ws�N�	�H�:,��Nr�6}������X@;n�?�B�">�KYh|"�1+��:����mR�m,Qo�°ڑywcDV�N-��1Z4����]b�~�W���وO��M"�z: �Nb�`�±/䡠_�O��I'�{��������8��%cU����nm��'����� �h	��ЦVl�� Ē�phy��L��j��t0���RF�$��}��%r���>�#}%���O�..��^I{]1e��M4�`��$9OG�o����H\9�1>u%G,�.�v���h�c'�����Xm�yma�$z�l����㵃Wj��eW����P)��o�-�8�=�]X�ޓ�I#C;a������͛������G�<9���G�����nj�����Ƙ&�H�?�	����r�>!D��P!үj�˰n��$��҃����;#XCϚ�C�<[ �͏�`�Ϝ���;����s�6�&�e늴��{S��ӳ����+-J���j1s���w�
F܁m�1Mi�-������ͦ����D���>Ë�{��,��-Yn�#���~t[	[(k�+7>�DƝr���c��l�q�J��1x86�r��t�Y�|K|+D����nd�R~%,����m���=�uHU<�9Z��E�Uœč�0�F���;s� �JH�6k��>�d�	]p-U����đ�5"����O
��u�CrV��5R���X�IF��:L�>�@d�>�=da�Z�_i����;���������*'�s�+Br�Al�`��:�;�#�B��tW����se��F$o-�.@�h$��#��������r��-4�ꁡyFw� eAf��h��|=��"?���2ADɬ��y~�FH�����	�4\�r��ٗ�μ��X��S����]��с�bݺrN_��� ��co����cĻl����'�q~<|x1K`Z���cN|	���źKH���꾀���� x�be�ʉm�)XC��p��lAΛ�.T"g2����"d��F�:�|eD����6�$V���^�UN���6I��^��m�LX�M0M��F�Pr�,�ԇ
D(d5":33�I�_��5�*�_O���3� #6��˧�'(��r�Y�=Z��#��Ų��h��D��7��Jd���&^eP��)ܜXI�	����9��%\�锓Yv��Nw�$<!ۑ�@1�=�7�t�Ӄi(�_"�r�d����e�(/�X��D�9�2&(�<�z� Q{��>i]t�tn=7�L_H�;��d��VԶ�0e��#���+�� 8+�៴/�A0�0ܪ=�ɦ&��U �
�3P��1�e$�yG���m���$���u�'��4���Y|��[P_.��� ~�����f��-z /�&����21SH|�\��~nD0e�r�o��߱l`����������D�	`�]#�Z!.#+xl�8��t 2���?� �
�
�i�F�Ŷ�B�����s��_�� �O�ȝ/:1���Q��y�\e�o�����5�4_�Y�&G��3g9�e�%��]ȂE����4!���	�:"
�W`�e����7�@}>C^��VW��׎{�^��Ѷ�1��^̲�6��e?I(!%)����!���at�8�ѿ��$/�T-&ݱ,���.N/�^��"ۻpYeR@1~�*8£ʒ�\)t�ecA�3�z>V����Xl��N�㗢��8���#x� k �+�;8�!_���;	�B��B�+&�:6�'��#o`�W�4%��`H���kN4�)�t`NZ�s�**�m/�	;[�B��8`���:��G's�Ǉ�zڝv1�|
���H@;��3��$�;gC���A�6X�|)lcOƑ_���Ӆ��tX_���I�q6��0 8g���D��9�Oy��Hn&���ذ�ha�� �ګ�)ֲD
lU˯N�x��o��sʒ��w��E2�Xam�k����)7{��,Ak�����15V�+�/=�l�l|��`��D��^}���y`'L?7��Ɖr0W��H@w.ׄMĀ��N	�M�e��%������;@'��siY�.:Żw�&��f��6B�g����U    h� Jb^�h M�+���-���F�*؈�`�lѶq��!(�t[�-�M"4�"&Pl)�^>��T8\*Bw�B91�6�u4Z��s�v<$q�~bC��Ћ�#��r�����Q��G��-ڂ�Y(uE��krF +X�t�	@+�_l{�	/������7y�`�&��3��p<9��am�+�}�%�дp^X�f�9�\O�=e��� ,X���;��Ȏ�h�qE#T�w�����N�$�HH��6I��E'�-��665��ӊ�=m�;��e�+�g�16�Vf���ʿ�$��\��k�Ӗ��^K9�$��\��_����F�Ѷ,D	G}a�:�n�;Ȱo�p/��ѯa�Y�S1����@��_�K�7_?�''2Z_��d�p+p�f���A���Oڼ�������F�r=�w��)T��k{0÷��dd�@o#��3�DY�Au������]�ǧI�q���ڦ7n�̺;�z!0@����
��2]0�KO건7��Xm=g^���'�����?��Z�:��cHX�}��?���ҋi��x�h�ky�����C��R�@!�1�y#��w�E���6�	���Ov�H(e,I�2�;�����x�x��,��E��Ԟvb�i����i�]xT��w�}�k��j1���& �{�ǅ�	��P���wL���<�> ���?v=����v`�P��t�t�P���􈺔�ς%�7��ӝ��7�!���1��������I��UD|2��	u+�gY��?�u\NEMp2��1^�B���)ᦀ�\��Jq�K:��c�����Ϸ��w�7�		���o������ �aDU�Y�JϤL$�`F��$EKr�~�����zv͉�(�+-K����N7��)����$�"����o[�0\�JR�wH��߂�Z�Ӡ$߀-4@�H��a��7�nu��GZs|C�I5�g�[���W���P���Ȥd���u8\� �֘R�@aU�։4*������ϳ6�c����M����?�d��z��gh\�G9_~�&t�f*�V�d;��u��u��p̇QI���D��_��g��O��.��9���1��i�l1'�z�R]e�_��W<��L�89$E
6��Pމ��A;{BJ�AÀ�τ�d�6��	t;I \��NI�����	qA�9�#@�p3�X�8p���u��JH�BSH��$�b�p����۪��ha4MUzCD購&i�
����,���2Nb�i"ry�2�e��w��l�q1�R\�ST�|�����ޤBl��� D�"�d�~�`��ý��s%j3��iB6�����b��X© :��r��B�`��7��m)
d^��SA۠0�"@r��}(�� u*`'�H ��qe}&�h�#Di��C�LhEcJ1	�/K����.�}�� _%pAX������G�.�	�7L��S.����_�z_\4���>�#�w<=���w�n}��w>䣻��Q?.�痪�'�zoW�]�U��ˤ܍ħ��Uӛj	���*��`L[A-_u�ޮ WJ�l���`��P�;n�e+�/��t�2�׳�~B�-�����Rz�NHE�LB��秈�Nt���/���^���S�jypK@��p��9Ei�[JJ'p"󠊕m=��!�;��P'7�S+�9�4�[�i� ��ڨY����ԋ�t8L۝fR�T���2|�`{L�)�_�O���o�#45��خ&�`c��^~�X�3DC�l�	�-�.�\=]��V26M;X�Y�B
9ϙ�1\�VN�&��j?9�Ru;xX�y�y9�t������	��N��``�JpWF�y�k֡�*����x��n��rj��� d��}�;*�?� �gqE��5��C�8�y�A��Nt��}�.��,t ���/E�.�+��	%СT �O8�������`z*��h����r�)-d�c{{���ZFt�G�8���%�I�zY�jDC�xuk�~V��V��I!��w��+fuzF�/>��3"�����*
�d@&ꀆ��7�1z�S%µ0���z'�����)��&}L2�� 9����D�G�����}ۤ������?<~��<x��M� �n}�̢�-T�{�0އ{I˻�Q9ʫ����
&�`�=�I�7U,:^��nV�y�=�O��DF�5#�Z4��q�M�ݖ͵)Ogy��� 0�]�0X����6�꥔.l�i�5uI3a����om�$�yG�%u�#�?_�K�8����"�8a>��a㹂�N)7j4f��/}�qh�H�A�@t�n��]~@��@��ug{��0	�ЄWƭ|�A���|t%<���f|s��xz�)U��톈_�<Rޒ�{n$��'󤖓�9�h4���ɢT���~J���@�$�K֜��b������a����Af����>��i��$�?�ZQ6�;���Z�k٬7T�63U���#���
"^�Y��aΓ���;�r����2&"��2z�z��i�ce�(;7G>���_�W5�~�l� �eҩ2������Vt�G0Yeen�a	���a���B�a�rU� �����=?N�6^\� �E;�T�����_����=*�V
�a+����@�H?Hy������qbEWC�:M�	)\��-
";w.��\�8x7����� cy+~�H7����8]� �)Vm�� �R�P[��yS���ꘉ�F|�$�j����DST��:>!�C�	��Uct��1-nܘ兦�*mBMW�	�`��P��E3c�A�����$���, c����-x�D��� d�ͭn,&:t��(����8�y��mWh_lfk����ѿ���_���C5@�,�\������V�q���k�ΐK=ǫHċoC�Jqf��ǱJ)k|v ԙuDtq��4k��CmF�=�#�wڨt-ՎƁ���n��Ʉ`�傌�����bB� �>:�M�������c����n )�Q��o_�VZ�U0�W��x K�7v����x�!{�^=^1��o�D�{/2�����p=d�͐��UN�LEi���dGA�XreLHxk���[���[�D9q��Ȥ��2`��W�ɖ���*L�5�Y��l��4�5L'R�L����	2�)B�;�.T)f=��\!o�3�Tt-0U���.d��ǐh88�^LA�]�7��z1U;d�T?y����4�,?e��(d�������k�؜�L���������a��>N.��j4��q�B�m"w���뫾��i�{g��l�v!���~��м�6v����/�SB皛�G&ѥhtR
��FrHםug�O� �7J���. ���|ϣ���o|�Њ-���q��H�X]D7
�중��D�rρ�����0I�O+	@J)jE�0Q=|}~<G��"������i�^M
e�-]�A	�<^�U��G+���N̎EG��;�K��h� �[�e	���mY��
��z�T��y_�����������G)��;�\�0�k�7�գl��`@� UCs��j4 N��7�nd�x0�	�-l�A +��Y��Jq�I�}��v����sR�~���kαQ*G����N��cgw25-��B�&��/�ty|�'�F2S�^D�
(���	T�S8v�yWbz[��_�%e�e����Ь����W�Z��� N�o�T�FKb��5�I��^[5Z����)�!�K��;;��b</��a:�T8s��|�Z^�*��?�г0��K�����~Z[�-�_����j��`|d�Y�G�Ձ�ªH�d��-���z#�ե'��9��q�;)���z۪�c�B��gOks{JĒ x.H����`����ׂ��8�	��鲧F{�j���s������2��>2?~"�e�##ё<�I��^�
���?��eMX�l�m˲��̀
�R�}�5_�Z�s=}.�ypLY�H?��6�w[�H¹Q7{j�ٳ�8�z��^_z6�E��p�+Ŀɭ�^��L�@zDb����P0	�
X9���P�    �������E��}�k/�-�����'����| i�$�H��ޫf`&kN���>��s�u^X����Iu X�t] �m
XLͳ9��ۭ'�c��Z��_*��K��ߔeEŘ%Y"�>��d�|�h�ؕ�볆�U[����Fw�����Y���� cUbG
���f���M��_�,��X�0�嗞��U�֍jnÚ���v[���#��8A��%I;[B�����}60�5���m൹,��t)��q�T� �̜�g�L�IVSc��ϊG".���pyA|�4A�fR�zH�r�v7���-�Zog5"��F��7@�Tq2�����b1���ktB��mj�2�q˞4"pgUu�㷾��L�;s���_��m���������*1c�L�X"�R�kr+:sS���H��K���}{ݞ1i}�I�\U�e�U��jc`�67�n�����+�}�ЯY2�Z���f	p��_�\#���x��h���Jw�6�2s��f�n��\>�ĥ$�V?��-�AXe�Q�a�S�L~P�K�hs�u�],Yu���j�SN���u�c:�]��D���_����2HZO��	�+E�*���%UB)X�Qq>W"d 2�U�
W�	I��[]ϛ�+���������/>����>��͓G�����wO�r���?<x��G�������2�.C�)B4f�%�2�x���6���b���A��y�*)�O9��|*6)e�܃m��Elߙ�O�T�`i3��e�Ϩ��i���^�I���YJƔ#��r\Qu����m�9�	����^�
%��^�}�RD7�%m���v~<v�h�]�%��pw�`����}�B3�rm5Ľ��uy	^u-�c6I�X잿p��U:qF����G�%%'�Vؔl}Oa�W���͍�s��}PhV��/R�N���S�wÇvqu}tJ,�� $�����s#����X3��/�e{�vl��d�Ҭ*Ē	��� ���� D=Q�bT��ꛌ��8�/��1{=�̈́dI�-{� �f }+&v	���βq~�i��@M�]�]t4.D�g�g@�7�ћV
��{\����W����G��JU��[��~r�?�ܷ��!����d���a�zhp�-24�.�l/KV��ߦ&�])$�0�Vu��F��r�KV����u��7�6w~ъ:b1�u����/����-�|��p�M\�U�tgO}\��GwkP'L+��p( ��~�U��P���/�>�F<�A�9�������0x��������T�M�'��s���LI�������"�B�I���-z���0�hmСƂ����U�ɳt��ͺ�$�H��xc�梎	�
���IK�+��BO���q Bs(E=;Ҧ�A�}��ߜ�b�Ӷ��ȳ!�����Ů2$�1֚��9���nam�Ui����&,.ɭ�ck�l�/���(g�lb�&^��
t����3�M���!�H!��ɒL���,P-���j]����'t&	�v�/�H��{D�*�
'�Tt��{]��jl�:| ^��ߪǪƑ8��mWs1�o�����iI+��nYk�k[����{����� 
�dy��$�>|6F�K���3������V�g�\N�p���4q��䐆�i�R߁O�~�U]�f�����ȧ��U7O�M8��2�K��)a����L�yaz��Y��0�x�]��jx"DuVN���l0�#�R�|89˅�|����:,eA.��\���
Mu�m�����:�=���ec��=���$�v`Y�
XB\gqη�z��'�8�̭�W���@'��!b1��4@I��(�O@��)�ܭT 09v�)����jki�Jt�ޡڛٕ���S7�:	���w���/�@�B�F}[Õ�l��s�X9��ғ~�U�QVJ4*��Nd������7���@d��cw�3�Ba������j8���q�ߤM��	����dF*�=�
���Ë��K�\ ���x�U�a(
c��"}�K�2�d�w�n��� �A}Ϲ�*R[n�jj��x[B�R�MS�N�Ѩh6P~�ɡ4̐�Hd��s���Isx4�?E�����Ȗ�,:*�7Y\�3�c��A���� z����o�3���ڮ�܍��L`���w&�bp$r����ji��ɣJ酲�'��T��dm�ľuY)$q#�  ��y]�xH+���~9$���^�UȎؓ?6�
 ��k�)���+��!�����X X�>��=3��n�+�ظ��M����h��=�IR�
\�J���~���Nې����⧶	�kQ������Jwb%D�O��y@ J�)?lF�мl5�X{��>�K:�t��ą�!nFe5J�J��N���p���E\̘�z�a�6cV�����Vms��Ӆ`SRm����`"�0��<��o�yB	Z(�0���6�)��F���,�drJr��mw�ȝ��j�3��_}�#/9�;(Gg�������j<P�9$��M������rS�גsK(ݕ���+�x)�#�X��x%��-�a������?0��|>@�,��_ �r'�g�b�&C K����Q�U�k���$� �pz�.Hsw��d�����vP�d�e�/����^ͷ�b��ND�����Y h�X|
�Ͽ��L���Y���mۘ�w;f����[�RoM7jv�f,��\M���W(��bc�b�^Tۦ7�Z/��Kx	ķ>d�$e���&q�!_���^���]�I~t��GM~g W� ��j6r�HB��1�7P�ޮ 08�T�[>CQwYe�|g��Ui亚;�4�,f�|�;��Uθ�!i����� �HP��{6Ip��Õ���B���� ���[��*�{�ya���׋��4���k(�`U��Y�����gg��/�R���s�����!���
/6����<+T�]��rs��+����,�Y���1��"�{�%��xV㖤�iU�D~���`�hI�� ��v�/>�hjH�ċ��G%��|-?)]��,�bK8�e�'�H���^�	X��bIݺ�a�g-cp !"SC��IV%Ҳ�X4!]o�tM�V-��(��K	�R翳P]��m�`�,�t�5�wg�Oꦊ/��.�+M�b�rb��9��A�_5�D�6��=]�ϴ�P.ZtaB�I�w�D��P�`	��%j[�$ȉ�)��{��@����;��X�;��ag����|�]��z������5og�IC��TvX�v����tC �}�Ϙ��)�������D�Q(�mAE6:�R	���S;c>��:cbA� �
���_i��U���=�d8�Fc౽�v�SLc��Z��s��A\u���Fr��W1����>5{A�/]�w�D�X
X�Ӧ'��	��T�~����X�	��/�����J�U>���m�W%(��A<[�Y��1�Z�{�(V�u���U&*&MJ��M'J��'�����NCa�oZA�����6F��D`{@uGZ�Њ��$v�x�%E�G�v)�&ЛAՆ�p=a;��\2�a:BFq`NŒ��,��%_��k�|͒�Y�5K�
,���%_��k�|͒�Y�5K�f�w��[��Ҽ6R�.� [�T���3�Pٺ��α�	j5ۄ����*eʇ)�"�B���+.�AU�k��FR�KA&,9�շ�	xX���r���B�3�K �X
�#�FU=�����y�g@r?_�y�j�i�fL�[�	y����N ���!��#��ʳ�^��N���dT!�żWX�I�0$7���%�Rz$�W��ӝ-��U�r]QSEWW(��Ɯ�0Q���zZ���sĨ;�!�q>:��U#�̐N��ٵk����;�#!����h]��J��z*~�s� ��o]�3I��V���W7CJ��>��2���0h�v�YȦu�ե�M�[%ԝL����K�U��5�/������?�VfVO\v�
f�f�_K�dR_ȩ��#�Lv4"��|`�=tG�ʖ�*�ئ'VٖZR�H�p~H�>%rq<ጾA��D>�x D   �U��aIvE%��t����t�����H�� Q���OhU�]�912���ck��3Р��>������      �   �  x�m�]������CY� x�g��8��H^k��J%�#{��ϧ�f�5���գ�sݗ�v������L�ٯqE���0�y�����������c^��/����c��������1?�b_3��\晋��.��v�q�n��i���;W����6��8Sd���
szm�3X��X��kۗ�l8�9��aO��n�b����uW3�Q�W��p8GLc�����v7,6�~�	�����M�`w�ף�e^4�𱹯y�I�{9?��O[�rZ�uf+3��!�ǎ���|�FE���₄W�<��ՐA�.�Κ��|:RZ{"|x��N�
C���ro�X�6|*GpL�%��x��a�k�	�#]ıQ��`�-��*!����	fy2�BmMn4+Tرg������i�s"��e�Z�e���l��x+�Ĳ�x�x�?���O~<h�
��jB�Ai��g!�h��B������F�����zҙ��&���_u= �y�����^���FC5����U���C>f�yo��R}�X���0b.G��A�V� E�V���( �>Y<�������dYL+�hW�NmZ�2B�7m�3�P��A<M���Yt�(��U��;�B�ikf~�N�B43�>+� D��8 �̢]��*�Y�ב�b�{$��Y���!u�,
�3QB�� �-T�0΂�ş2�O���70�Y��At�aY(Q:f��V���E8Kt�(��I톴F!��_�B�� (
A��4E �%��E
AYr쳦VK1Tx{zC����X�ذ�D�YM����U�ى�s�"�a���k�tH���"�n�n�gd���U�9����vÿ�^�,�]�an� 
}}�ܠsrc}���˨�]�QPI����.�耜ix�݅���h�] ҃;��v!�4�;�v!�xY�`�Zj��Y���/�ك�ۊ7�h�Z�Β�����V�E�E*��&6>���aG�H��X�YlLb[h�E��=Ă�Ӌ�ę�st~v�ꙉy�߬v��N`�ɱc�,����O�У	�2�&a��-^$e���� Oي����w�q8��O,4619�[G![��b�,M�^� ���ߤ�*��Q ��Z(	B�:o���jd�He�\:׵H/
-N2t2�I�1`�G��o&yTA�p���Y�p�ćI�{��9�����RB&��E�w�I�O
���/�.��
�G��4���HRHUj�ӊ&�T)ڙ�gKwDj��?t�I'�����
M*�y�n� >agjd���RF���xS�؂�I�|��`��P2i��U�G+y���$Ӂ�\�Uz��R��s������݈ �٨���"��%(��R�u��RH�Pgq���ӓ;}?y�pi��Ճ�ڤ��y�y��	�ȝ��
	���li!V���H���
K�}�3��<A'��Iz/��' @��[�!U>ub	KQ\xa)~aI
*����u[5���R�\O�9�K�dGI�sLnf��)=T��5@`IMe�]�b`�������]lRtU�8=5�B
s�#���H}I$���W�$U�Ϙj߼! :kۯj1E�Z��)~�"�Ց�,���Z��S���}��BA��U&.F&�;S^U�8tXL�3ǋFr?�Hue�QW��Y"u�ￓ	}u����Sި�\>K8rމ�p�QP3H��Q�"�������e����r`ÐY���L^��a�đ� OF1�����GqtI�ؚ�)�/�i�[js6-K�0��J M/?>�l;
H�뫐�U@�ן3=ﷻ�4	$M�v�1����	8�w I����BW3�⚹�#չKo�1�:2)�`�Hg�N���("M^& \�:�x4y	Ѡ�Q8b}_��\`O�� 6�\��U�������sˡ�����U��a{`4%��������@:p��`ĭ�(V��Kp�1�ENU��Kp������:�6Y2Ԡ�6�i��3��
���\��Cĳ��4���sɭ���gE.#��;ut��v��s8ޙoݙ>"-��Q(��Ls����g�.�ꊿإ�2m�',XC^���D�j�*�A�9u�U|>ht�.�ĀE�F�����C�9F�2�A��Q(���A�f�,)�=��K����l�W�hj��cr��y�;[W�>u��d��=f9��t�h�"&�8�/�B"}�tD�Om����!�����Ͽ4��      �      x��}�r[ɕ�3�|q�b ��O�j���;���R�j��v�-uW���~� HB ��D��}�H�!��_��d��{q�Eb�mG�d��y�ɳgt :����[+b"cն����nإ��厳�pZ%��̹X��쭭v#k-�sV�bg�Cb���~�-�	h#N���"�a����,Զ"�J��w�x�@��،�ϖۍ1h���GE�l�OE���5#�#n*�Ȯ2��C").���E�)&^Ӑbwݪ7����,C�o���y�����|�$RbtC�2j���UNs�܀+Qq�_��xdX�}���8��rv�?f^YS�4�j���
v�!&�Ve�.�sm�Z��Vm��޳���H{t����汱��A�C�':�� �-.S8���vu�Ow�ggn���ʷ�_�K��Q��[YKe-6��#|�+���L��%ۍ�<��W�nQ��-��������ۇ R:t6s|Z�p���v��Y{��-�g>�n��+�٪6�V&�̆�� �b�6�氩��FF�9���ϧ�W���5 =�I6g7��,'�t�G�ь��=k��n��R����s�r��+���ٴ<n�@� �r��b1L�;�>�N}<�D�=CE�?'��n!�6�p�w��X7D��ܙ*
VYܴ��&��E!��<5�(l'�+�Q}���`?���8	��^>��D@�jn�� �ae� ���8|t6f�G �P���	���=k��r�ۊ����ͧ�͜��`�a��c�F7Yz� �笝!*.��xܣ]8�N��Y<��*\���VV��A(:�����)4��Ћ{/V��Ɂ�m�$>$�<�[+��>$
rN�
EjK����C�gM/��P�>=l7�Dj'�-@��Sf�@�y������!~leDz�9L[�
 4t螏)PN�� S���i e^~�ֵ/�Y�3���k2 �=0,ԑ"��9�,:0��T�,7���C<@h_F�!@��{i�R��4W`���_�f����0.�	#���� UH�H�Z�R��hѝ6�Щ9}��z#g��LU�Pf�02ߞ48�
LG�i�0�w@����7�a�+ ���&��[m�Tݪ����`��Q�� X/2K��\�B'���P�����/���t*�=���5�l�N�,�*	^F_�������k�-���(2�|��>���$�'��>>����e��7ϝ�K�H^_�ʰ�	{��s���f�+��'��.�Ƈ>�
��]*<&�F���F�>��רW,
I���F�1�d�Tu�����	� @^�>�>@d���٫�����^1��:޾�]�|��[��0����t� ��G�	�m�u\r��~�4$�1��$��T8i��u�!fP�Bg�f>��a�S ��'���C��j��� ,R��3��dB��X�(JV�8�1�۩����ַ�?��p�dS&6MdG�iz�g�]�W�zj_�+����G1g)�Z!p|�T���ߧ���e`�oX���Z��(A	~A+8�Y���=I!+�vf���)�l��Ξ�̲�c5cx3��]�?_�'�O$1�E#��L�im� w\�;]�=a���
���������K�77�Č�Ǘ�>c�cf/�S9�¬ ��ޏ�[���N��n�#��'��z�VV1L}�[���gĸ��]q��|@� �>b�<H���Z`@D���Vq�����mm�t�5��S��0'��V�卒ZL��d���-�rśtn�j F#0C�#��r�Ʒp���翀I��<�0����驻#��g�<[�;
Sŝ��(1Wi_��;�0�o�0_|���y���g��C��?�	��d%j�C�$/t���C7W��+� �� ��e%$�*���C��w��v���f0�S�Ǔ;;�ik�XA)n��LY&@ڀ�ո�;?��la�d�q��$B�<ʒ(qN�g3���u5Q��C�&���p�L����M��;馝\�ͽ��7��3D�?<�"!���i���O�J-Hx[K@�P�E��*BԽ��$�%lRTqgJ��?�%es��e�D�\XG�Ea�ty�̼�sC���SӅ����OS�drW2���QPB�SOL^}���=��1�~�D�;0��s��3V���UWQ ��9�f.x����v����D�6��5a��p�i�y,V L�s�ڶ�"=b�Q/#v��_w>߫�<��������	q8��u�p��wx�(P��3�B�a^q��f	��1��PI�1�����^u <��P�V�_NbD���z$�$�m��!�W���$D#�U��5�X���j���;\Q?s��5<�� ��.�Aڨ�UE���P|4Vi$�`V��J��&������
j53�0���õ+%�|�[ze��$�~��C�o�y��5k�b�Ob�V
vX��e�X	�"�$i��G���OJ�Z�<Cd���%ؒ� P�x'/�DJ�6��}Z�ͷ��qS?�f(� �ǼH@��ףO� �pg(������h�Y˰�L^�\�&���[[c<[�k�v�fc�78�`h]�����;u�>��7��{�����9�ޘ����uHl`�+�	CW_��U+ ����,�%�b�,�T"=I���FVF������j���<��7|r��v�%���cY��B���X��]�����Q|�����H}�8��#1 ���R�]�R���Cg%g�>�	����"�_0C7���h?��y l�/����C�eG�5@[V���0S��A�5#���C	﷦�P�Ie��6$9{�□�s�(��σA$Z�j�f6Q&Zb*�%��Mz�'��4:�X��������BT6s�MT�� яr7*�?V6����e�	�*hi|L�'E��N$�o��F�a��'�����O�T�Ƞ9&��8i{��pF��X� oǑ��w���;�(�
��'3��n�G3��?rǬ@�j8��\�o�^E3�sKA�5�^�
JjJ��i�"F�?�������M���b7�L��m�DڔR��e��CF�/F���V@i������3�s�^$��ǐ<w����x} #��@5�d��Y�k�W9^>0�rھ<s�w�/�k@��������zvpLՐ��{Ä�B�`�CY�R���Y�m����}<d���_DOPU��D�Ya5��KsKk{�Cc��nbe/����B��(("I�ZV��J��{e��C�8Ѿ�j��2�x9��l&�����?��q�{@��Xڙ~��OZ��u9"�g�L�9^������(�#Q��Y	����%�/��}��
�1�FU�˗�����z��g߾��Y��1���w�>��_�}���^���FB�;y���+�Jh5��N&����"PPh��JR��;[~��o�{��C��T�-�/��gǨ����!�І+}��i���a�C9�X�Y�k'�DdM��5��V�����K p�E`yL��������}qi�n;��J���F�Ԫ�9�+�Y(`m��
C���1t�35�Z	+!L,V |ᴳ��[���Y��"��mM��{͓߈:Ht먊���4�.F���t�C�A�;�܄��Ɍ�Xm�-� �&*Ѓ���Y�}�\i�א�O�$Y���*��_܀�VjǪ^��g�Ğ�sF`�-럨u�(ع�u�������D�������^9��I��V:�*P2�0	f2��:2����\/���{��o���&+��#Y�p��y��
��.�x�]�Fލ��R�.rS���V�"E����)�̍�5���$�bw�.�=�������}�[�{��`��C�qfM��1Tv�
������x��/��$pH��d��"A͈[Y����d-�%���@$4k$��<a�zg���-����>n�5d#�ӈ��E���c@��r�n���Ac�Ln=����a|lUfk �n��&�EfK��c$�?�2	>`�_G�͓�A��Jk�(��8r�G����~(!�u}����F ��$���t��ʴE��Dv��<��w    @	�*�s�����I"�y�`���N�V��U�Ex6,׊j�&S�L�0�����6�(��J�4=��ۧ-<`�Bh�;I��T��p٠I�X�lU/��s�j5�У"��vX$���
����?�=�a�����!t�=��HO,~��c��b$=���t<ig�q< 9�� {X��Χ|X�V�bS*;�.Q�0�>�t	��T
��W�S����dHn��^Lv)KO�ν��ݢ�~>o�����w�G��*/����@
�I1j\N�tŮ������eF��;2��Ɂ�L�:	��1 ���(���>�kw~ч�'3��e��Uh����#c�M8b�r^(��d
IJ"E?����>�?�ɔ=f	7�&����bl�H&éc�T���,_�&����������"g���(ô�ne��?)�Z��H��gm��0���8���𙗫�z�jD6�#��ܽ�rth�������W��בּ޽W�|�/�ښѨ���PO��$�o�Y�},��>�]�Os��C�,��i�+�����^�WG7��i��
p����z��\��s���)\F�ki�Q
�6vz2N���]�u~��@��p�h�H��1�C'��'R-�Ji��&LCu8�M��R��{4�H)8�&�?͕&�r���_���$�Q������N�i� ��ݱK�'9#�ڞs�aڢ��LCMgq�WlO��yB��R����M����	o��su�Z���<=4-ź�{�7��qo�@���D�@��do[�ϴ)���#��ɻȔ��./�f�0����&����^�V�@�h��,���]/ax�7�c�����Y��x��q�:���|������^s�"���T:�}���ȧ��	� t��ܹ`���8;cV*�(|
) �_i�,] thgv�@M�ܲ6K�2���1����R����I�tT�9g��v.�Y��Rt�0�۸?�)_�fL,r��^NB֖G�#��X��� bfx�=�U�����PZë�l!���v�wi���5�7��c"Ÿ��vܓ	Kh1�V�|�$�yH��(��217�f?��E!�^��t�`P���f��VF�.���^o���8O�IV�,�q�:3<��j��3/{m��;p����a ��{2�3t?���U�f7���#�T"){�_ rSJ�O�e�X�_c_�L_1P�:v��2r*G8R]��*5vD�p���»�-��bE�(���\#�]�����xg��j�W,֨ގw�ݚ�jS��9�LnՈ�L����#�Xe��=T;�L���^�>fq�³�G�{Ɖ��fGG�=�#y����BQ��A��bѻ��R �M?�����q+v�C���wj{A>j�雁��d_��=��FJ���;��n*o��C��dh.Xx�>;���@<3�dX'ŀ�]�V�?�M�i�p����D{�
�W6�Mib�7�z�+
��{�ҥup�.�W_��n	fe�Y�_����/�Z{�ё��n�֝\U��ǭ,�����4�22Ybx�xn������`pӝ�H?'�d��V
�<C0l.�9��y�����i���w�qOfHHmQH�y�&�q��F��Q��c|���R��R����_*a��Z����D"��9��m.'�o���%\Nw^l�aP���P�igt��g�~����	�1iS��ž��*z�),���t�Fd�b�0� I-{�w�B_��pW����~�ȹ�%�xҺ���<*H�A��q~E����F�y�!�^�<���J����q����޳�RO�oә6����|!���eF��a�|���%w[�{�9��X��j�?0FGQ��k��5������7927�
�cx�u�Tר�����<E�;-�D�ce�
���"s�-;��K�K�NB�>������M�G�:C���gQ���uT�)��vf�"g-��u�-:M-�`t���G��VV��5��P�!Nm�K��
����ge
�����,�)���6t?�f�!��Y��J�	٭B{Y�N���A΀ �p�O�3��e]���z�d�s����Nl��:�a��@x>�z:7�&G�z��$���t{g�P�W�k���I�R��|HLq,d h�Ͳx�F�^�� 1#ǔgiK���
ٽ{ib89`�F��v1Q�<�Y8�����
K>�jb%0����O�������ט��]�2,OX��}
_�s(�t�&�:�-@�΋B��6��Ѣ�@���Ы @]�����%��ů���/~�'��>��{d����/��.��[:�ј��f���ޫ�Z�N�_6ѵ�Q�� I;Y�TG��G�Ho�7@w�5r!5�H��	Ȁ �IK:�fO,�t6N���YX{,G�B6:�.�	�,l�A���Y�����@(�l���z��Y�m�9b~T�`B� �=
���@e�����1<C���*l5����);�5u���hV�y�[u��p�w={�d8W`ߘ�L��y�<_?���<~��v��� ��DG�B���*�42�v�R��!j�k����4!V%������Ǽ�ŒJ�r_�qk <��^� ��s#�5��m�re�ְ��y �o@n�w���.��P��;@K-�H�(������P�U%�{�)H
A��o	���5��.ˁ�С��r��������_�e?^6������5S�vFSR�63ȇ�Yne1b5'�)��`�>�36�!9�s����^�@���X]�?8�ù�r�,�GA�=��уB)D�o�)WZ�i�{=Sw��ƖpC}�����d��Z�WQ[уٲ ��MX务,����>�5�jg�����cʺkۨ���X���Z`lNn�_í�3|��p'��'ч�
ρ���X��ѭ�.�ΧC�g��!��ꪐ`�� �ݳ��b�����������_}������w������ߕB���#�_�O+�b<�M��J�d�[t�(ݑ�V/T��ݨ�E�x/��@´<�0b��ѣ�܊��UH�ʰ�%�> \2y̍�_���]�9��y�a)������<�;rk�$�L��ܢ�̫��70���3?��C��#j�
̼��x�L��INJ��#�H>t���;Z��H�0�r!�$�S��"����=A7�棈�ɞ���qZ�D%�m��B�6���ݚ8_2}&_q�K3��[M�	,t4��.E�FR�L9u1}c������;Y.����v�MWR�F[�����?��v�4�Q8����� ~�����k#$�[����.�P!���!Go��Daf:��qV?���O��*Z�ɜ�gDޱ*��4��D{�)m@C$Z*m]�~?a�����3�(��V�]�%�o�(g.X�7TBhD<�zƎ�z|N��Ov�+�K썋�׸�V��ՠ���fD)_)C-5�,~I��@ľ�w*�kKN�܄c�l�H �;ă��v�7���||>����9�M�^ѷ���/ x����f�$�7��M䯸*��S�#j��y(�F�#�)�@'Cѕd<6�6ȼ|�L8߿0�W0�ʸ^ 	ˤ4a���*�Y�+��<c�n�d��o��W*�d�=�iՀi{6U�O=وh��Ⴄ�:� 糝�*��Ճz���Y� ;�13,��X�;���xtW�܌R��@ ��iGt.ِz���W�Q�G��J�a*L'ҩi��´%�TJL�ዑSj�M�cGǓxk�����A�Ӽh�G�ݧ��i�$N��i��P����ұ�T�s��gg5����P
�Nm�O�{`.P��=�O������C(�a}�L2�ʲ_w��[f��O�h.�m��W�ze�fM��KԿ���Y��Fm7���O���W���-؍����6'SO��.��.�,�Mq��W�'�_)Z�#*H��Dh�q�)��&[K�2�\�+3f,_��
�7�1ì'j�T�^F.Z�鬣�Y�Ӝ��/����lܹ!��Jʐα!����    )���%��	F����/���58}�˧����r��=�ycÇ�@wB
���([��+J�@)%�XP�^�+����Ru�K��^�̀G�꧰�k�]������ʧ1��q�g���p��\E������~���<���ܡ�RZT�@#�ɫz�QRd8$z<�IYc�-ya>��oO�]�7��H�	���'���<���
�{�uz�ޫ��j���%>%<RK���U��� Q����ܥ�>�n�ɑD�睕Or���[�,�:��`]�cN�����r��4�6n[�s�G^��-%D�}�����-c_Մ����쌹�T��k.n 	����i�f���S5-�pٮS���8y'���<,`P�b͏z�vʸ���Ǭ��c`��;:�v?�O����A�{��m����7y������Ю���.�>�Jv�P�&߉tHE��!��3%7<#�ǜXD��˂�Y-ŋ�^��2��W�����p���%��ѻ٧�N+3;a�_�N��tz����R82ČA��J���qV�ه���Ig�  )�Ǆ2�wf�G���1=!Z�{�R���Ӭ�������?|���������_a:�_��w�_|wos�<4�����!����y1$*ռ�	t���'��|a/��^���i%�8�"��)$(�$LN��#�{�y�+��a�B{���5����e�3H�k',��s��u��a8����hV��mdG�i/�߽�/���h7��\E��`<��ܮ|*�0P�����`�)���D�ɜ;v"���n%��5k�sn�'7�)�v�P��7h�ֽ��S8I���~������RwAN�F9�2U�T�s�d����H-pp�)������P��  S�ǟ��woN�z��=����:��ڍS�-І:v�(s4&j�G��p�eoXh�;��b�޵S�y��:�-�X�}����zC��L:�)	�Eb��fg��Mԡ���G������5���9zg�]��e|��%��o|�*��^�9H>o#-�r+��5���J��6S��羛5#%"�S�ET>�t6p#~���C䐺���g>�������;���BpgJ�/��V����_� �7y�4v��2`�������7�pf2�_�ƃ|%HUwr
��)��τI�r�x&����@�����ݔ6Z��=fK�f�iF���,�g�����1	3���=��y��7(��n�7J~��r�BT4���R�j��X������#|f>�w�� �Z1�fO��A���H,N�t
+�?ܫbl�]��b�ӛ�A���g��3�~Oq2
��6>��F��jl���O�0�D�A��n���=]́��5�9Ko�� A�$d)"���Թ���Gn�w3*�N�V/��� me�t=�wlHWw��C�fȇ�V�(n`�U�'��G�T�W�,O�I(����
H@F�Y����Eg/ikb�NZ��u��7�Zؓ�X���S>��J�׋ֿ�ʚ灝�ڥ�/yRL���p�d'}��\�S6���������H)���N��J�J�����O#��Z��A���}��`�O����D#�(v+fs.ֆ��?�2�uJs�M1���4֝MٛP)jUY��cMO�CU5���z
�z�3�F��X��@LO��=�*��E]��6Bk9>< �{��<�,�l�^^CV)9.
c���c l������@����WΜ|�cLPNO� 苼���I�io������-�;Sy�_:�gX/��;���z
�Ъ����J�����əu� �����Q��^>�.u:����.߹m�gtv�9'��;~�9d�+�����U#F�}	� ��Ĕ,Ȉhax}���̓R*�� ��&�tw41����:c����Q�Q�ԡB��A��a���
�g)CƧ� `Լ��	� �S��~�6��>�S�����S-y��MÇ�}�����҇��]�p�w}ګ��>�a)}lv̅:�g^/!XX��T��������J�h 5rQYZ�Y���E�: �>�Q���>=l��]�.]�t��f��x����Cx=;�CX���|e�W��yi�:�U�a�(�+����z�vS���7ȗT����9t��(�J��.����y��c���;L�����\�	R�w(dو��]RR�eX%,�O���q#n�0��63Y�l"�HΪ���N�^�ן3�Z���N�.��Q%�vx3�s�H�/nc, �Ч��c�����X���'W��~�&�kl�'ZZ����1pXU��:;G��7O��E#b�����%jόR���ɾX��O|����>C>:�Dq�o0b��+>�?
@�z#*?��*��IZkk���,EcNe�����޸��7L:'�0C\a����z��jf�<��e�ǃ~�����&�˟�k�9~(�������Ņ��7nE�A�PBXt$I��ʒ-c?n���`@�S�M�~4㥁2�YI��.��H�2�h7�QLv�E?�X����BO*���d"�t9"s#��+�9r@B����X~HLA�[�Z��̌	rk~�wmUT���DrY4O<�*i�ح�ˍ�p2�2�r'y[����z�*J`c���?`�E�͊�b�)�ɏJW)������ �h6Hmᴈ�|b~9�1'&$ ��=I�q.#z�T�^���+���aAω^P��g�􆤵k���QS����)���������Df3A$QS�$���%g����j�:g�����9^��7�2�hA���ӊU�Nťʝ�����#_>yzK�.����@��;�V���B�Z�����R�`���~�;�0�"��`�0�i��a "Z7���&����Z���NW�v��~\�BҠ�my�s��'�[m��sξ��S��/�zD������1���K��������>|R��~8BFzV`H����^<�7ӜtN�.tΎ?bb���9*cbtP�V2P�@�zh�v��Q(�P!�q̒B���;v�W�/�қ�H��n�yL��_�T�B�l���Wz�#i)"ܱ$�7��n\�Ĉ�����I�9�nb
��(FT^3WѳeВ�@O�ES��H�����'�k���:)��_��I�;�9�"-��� r�mο-��l!:��A��G����tG����ԥ�7�H-� t_��l�H/e�?ҹO�?N��[n�ϐ���1�r��I|im/2iQ�B447�G�=~���˫��ȟ���R�&���p��)|��8yR�G��:SH��\�`�(�AI���k^��E;�Sii���a���&.�O'I����"k����T��"�k.聞`��q�Icj�d���>Â���hʡe$�&�1E�%�ϴ���Q,��:�+��#�H����qG���b��H7��5�x�;�gm/Ip����<��O�a§t̻�F�?u��Q���_�I� '���QRN`su�0 k��P�Vg.�FK����KfK�����X��(�*�қ;��F,ͬ�T�%Cx<xѲ���H�Q��nnd�#��D�<���~l>�?�'O�z�Uu~��[��R"kzg3����~h����k{��,��N��ZZg	����۬ݚ��s�33��+�ӈw.+���=���baW�젾�8���r�����1G�~_�U(�d�Q�ה�N=1���e�_��f�="kJ�A9����۾<*�����=g��� F��CH�1�b��t>!3c��f'��e^;3*�K�e�.U �P�/�R���c�s���́ʺ0�{�	=�m�ң��vv�b�nu��Z������%r��Ю58��+T���K�t�\I%���%�C���˞>L���J��'��
�b"F8��{3����@��9CV����w�&��הr�Ð��S2����,tkF��*5a0{2�q�ʺ!
",��*��҈<�Lst^�^��NU��o��2�uM`���A�7�>����2��CYi$�Ԫ��zޓ�y�7�ꀘD9��.2+� �  [ɏ��T��̱c�+�Q��;yW'-�˦
t���>0��X��p""�掬!Y�G�'rD*����b�+���y}�d�a�6G ����UtG��}f�
n�C�8g�%�H�|���V�d�B�a���bS��p��$��#̅8��!���_����O����>0���9�y��\@H~��^�(�N-��$�Ib�`��"ő(ݩ$�)�$�̚��M���[��}�S�t��'�$a�i!x��Dq���-��|��=oy����T���?���\+?�A959FT�F�U�C�ywT�
�$�y�� �{�d`���\���Jً�%���b���(�(�W-�NufV6-H��%��)0f��������Ϙ�X#���4�?�\ � �=�w��4�G̦�vcE��t� sjf�w���Ke7��X��QB�@v1� 
?E{	e�du�}��G�ьԯ��q�&�=I�������3��?@^��W�p�w�e+����Cp�>v³�'^cR��T���HK���Qe�gq~��>� I#'�QC3 wh1�����ũ�BK�u�ҡ��z8�j�ʂr�6���鰍˭, �mV�A��ۛuZ6w�i��Vz��5�G�S�{֯N��[�* ��y�0a�y!���*~��ut���0���5S&}� W"��u�.*\	\GreP��o�� ��c����SvP�L�[�@P1�]f��c&.�h�+ߏ��g<W#=ګ��N"�R�g�AYI�J�lx�:>����9���b��k�A��4I������6��m�� 6��x`�]�t��JA>c�-K�/.*eX�ˏ�_������L���Kx��1dbb%_���-�N�n�i(��Z#�,����|� <�kFʭ�L��dk����pv�V��G��Ke���8����Diիe�[˗���JlS���u���*`\�HR�{f9e��ny_�É�H)���-�Խ�!�}�e�c+�I&܈�ku�����ޓ��=�Z�cr'�,a^;ү\!=r�6�xLk*�z�޴{��]���<S�H���H?����9?��K�j�;�m�i�ତ d��r�=6�t_�<�I��j�>�#���+�xQ�$b��F�'Q�e��uQ٥�t�ȥ�m/7�v9�P�Ɏ=�G�sU?�{��To e�tp�2�Y>D��>^13xU�ֈ�҉�����
G{�Ȭ�$Pa�z�T����^�<,P� <7%�P諀Sg����&ټ�_l��}���!2�-s_G��?;�2��T�] }Q\p�G�8�����B�B�8*�q��8���}r2�z ���=v�}���"�/]s������*�J��n5R�T���q�L��,1>��vxN�.V�/A.��L�C�0
�Q䨉���SepQ�H�P�HE�6i	�BS�Ĩ�5���JгJ�88�*�7�����3n�����k
x ���>dѯ�O���w��n��4�5��͛���1#�\�_��2��Xɦ@7`��Ft�;;�W;|$��R�t�ޗ7�}��W+���V�o@����n����ԇ��%��C$3b�Х y{B��^E4���|�O���eB�;Ă�f�"��r	x?z�	�r�8O�5)r�9����R�n&4n:���wld�e����Swi�9Y�9�A�hJD�5
�������VP�[      �   �  x�UXK��*�������O2(]5�:Nb��,ڬ>s>^eϧ>V�����3j��6K[�������v^]o>c�>�s?�_O�9��8�'�4+�=�Y���C_t�5o'-�1a���O��Y�F�و���W�n�Yfzw���nz����g���
���x�@H���%�� H�0��fdE��^�~�g��3G|�~>h��va&���{�|��1�����ӭ�l������X�4�7/Tɕ�j���`H���Y�%�(v���Z�W:�RQ��P�8
��;KzK��5V,o�޲;��8��j�z�@HvG�7�:�c�|��:�<��j<��B���a6�l4PI8�����������t����0(yN�mC���3U&$�o6m>K9��$�^�~[г�9c[��$�4�����M���{�B���f�@��@-�w�װ�\��k��b� T�|��8���qds�`���C�0p}]��>�Q�&�}!�y�Dy/ƹ��籧&V�g���)8Ǩ�E=���8��.�a�-�	��i��硃�ڑ���:ƭײ-�U�3�9 N�E>C�O;Ǻ������clN
�;�� ?_� N�.�]����L*8|�$�b��q X4�QS�1?�yp<b\��/:��gD�0je�/.�i�;�ء�8G�@	��2] �5C#� dl�����^�����Q���8(0��-�] 9j�y�<s\�3�ݶɩ �Љ��X,������.����=�E��y �=�"> TJ����������R�j�Y$22b��_��@�v�<����.�D\�{}�-,�����|���H�%�Q:?�7�6A%�;����s%��\�Z�|;ɦ���[������&�Z�<�p��2����cY��Ծ�u��d����8՝�����ǩ:܎����ꢼ�G[�� ĉ��Z�<�c�P�}�
-���E\�X�����6�R�J��䶸��ɫV?����R]Tmv8}��"����	<���??5J�]RzI �P�ܰ��L
��D �d73I ��?06��~b�d7�$h��2���C4�T@ֈ�0w�`�ݜ|�_�@J �iwy �"�Ab9ޒ�'��%j*��*t:�`7��ӥN� �R�=�-.=@�j�R4ҾJxp�% ��#�`�J�T�Rlkn>pY����uC��l�U3�Pr>�f{%��EC�G�����P�% Z��h��������z�
�9j��Ӭ���-�t��.<{1�*.�`d=�$�;�\L�{q�.6�_\KY�J��D��]t0S/�(�>����T=ƄQ;�=���>�u����K|09S�,�6?t03n^V^4F�=��`XW?/A�.:8��&68��8��������9��`���G�s?��o�ۘ"�T�G�0�%.�jIڷ��HQ���	�0�>U9�i�0\�?'�� �&ܧ&f�A�cх��)��bJu �u�sq��g��Ҩ��D��q���I�Hhf0[��)a\l6��?)��J�	�,�A>a�M�*��B�_��A!���� ��!���&��~�9�H#^rzr��/>7�e�u�ם�+��^���y��B~>��ɾ�&�Ǔ��dn�.�G"��)$�,%��vx��}�I���)�G�h���ZB}p�ՖF���������UY��H��j��mB}|�l�P)�:
zj�	�g���M�A�#�9ƾ�{�8��J%Fai;�z
}�ʊrkO���;�,���^�q�a�[���{}���Wz��p�W���d�.�qyF���s���B}|����3'��J����T<w�u�$%�<�m��B\U�P�����iwx�+s��/�w���?0�η�P����rҺc��m�����w��/���������~_/�*���A^�A.VK��W~~~����      �   �   x�]�1N1@��>�^ �g<c��p��HB؂�D�4"D6R�i���R����4�IP���j�/��4��
-�`�� %
�F�0�ꦶ�4�uu�����h�;�Xk��)T��QI���D�4�W����\6/�OH	��ֱ�>J_�*ۇ��{S����lJ��oL}r� Y''�X_���k�}����-������`��(��z�p����4[��nl�d���(��k���o/c      �   �   x�}���0Dg�c���в�v���JE�V*��q�(�2�w�S% ��P���2�jb�ä́��&��9ާn�-�t0I)�u�ِ|Q��wz�����zv�݀GҮۑT�[	m��D�3���n�l������/2�;�      �     x�U��N1E��W�N�LRfV�hV��[�#���v6�)�;vn&Dwyp�˕�q��T<_>?�7��y;�"�ƾsY�'`�G�؀�|�����"�1k�^		gผ�ؚ�vk-"��� ��P1�틉���ʈ��E�&��U�h5��^=���jb���}�_�?��:��>)�He㞉⌵('���3ӡ>������<C�)���� �{��r��5Ta�֟�~�նr�>A��b�.F�Y2���Iy[�@����UĔ��~����      �      x��}[o[ٕ��+��D�U%ٮzJe:�`�'40/��N� ��T�P�ˀ�D�IQ�u1u�$[�)ɺۺP���'m���'��Y�Z{���!%�NJUc�S-������k}�����u�ֵ�����3�u�_�s���^}t�;�շ�㊻=V��t/�>��*%gm�m����D���v6����O;/�g�t�ϸ�q�~��{�Uoy�^͟�%�I�%�̝�k�<w֗��ų��Xw�]�u�_�ّ�ޱ3�F��q���1}E?wJC2�����覷��>�uwuu9���N�e�C��}�q��A�4����k��u,rt�[��;��z�to���U/xէg�w�P���NkywꡬV�jz�Qq����s'Wt���{�4�p�Wt�1�Ӄ�ӣ15�Ӵ�j�\�^+�i:���L�Vs�������0摟rGw��bc��O����s��4rz<�N�����~^6��θ��S�������$�!N�\�����w�]O:��A�䰄��������3���6�����at�}x��Dg�У���R���������:7���[ūo8�+�� �C4<��l$'�a{�tB4��[?�;��y�Lɴ���Γywz�>w�V�Ŵ6:����J��J?��ݱ�����qzT�^/U�͚�%s>t��N��ޘ��r�r�n�Tr<�wd单�8q�h�Ig�W�N����ʕ�Y�0���a
���u�e�6.�|7��q�烴V ������A�I05��^��z;�)B��Q�@rQ]tQ.��=�
^~���x�i�6h���19L҅0����:G�1����G�o�����xg����9����q���u�>�+2�tU�-��d�zq�I19>x�BTY<�~H�[8,p��-7W���&����Sgv�m����*�tү�G�Qi��	�o����".[�H#���=����bGo�F�����p��!M�I�DO�uJD���ׄ(�N�&����6�_>�O�)�
�;����-w}���X�$���/��\*�
H�VpN&�j,7��&�����Sp��� ���T�ޤ������~����|Z��֒��ѧG�D4	y�Fo��Ax�{�����6q�5]ʞ�k$�.w+����Gtxw�k�eEhAR�h@!��:1��i�l
�h��"m�+�����{ 7�B��[���ј�8��3��g�����h��� ��!�}H�C��j̥N���aN_4��^�1'3��t���״h"gn�.�1Z}u����6&�����!�HS���w��6�t�����\Zn�\[:��ԁ�:�.���4ߙ�F2ELV~�HnY�mq[~!X�^�ldB3$��v]̓�����o��h�4���׆/�;�(��L�1���`Gf��T��r�Daď��ӓ���&��K:�o���/�?������|���@#Ibm��"FH��š������Z��T�} ���} ��_�{%3&� V'�N�ߘ*�������)������yk��6}����ia��~&�ez11}�I�|c����$�;]�D7��nr��	:���@m�� �>�$�URثl'D�`%ӎR剘�	�FD�-mʱƯ��u]�}Yޘ+B��%l�$ܥ^>�&,@�\\Uq�?��s���[$����� ��FZ���h�<<�q�`:-΢>8�v�&�� 1��Xg��t�I�c��t�"�f�4a%��OiSX�����0���Fy���p��f�]}A�h�p��R�x�H�̲ӿ�m�3�Dĕ��$�k�����|f�2��
OK�(�r�c��,�^x@�6���/���C�N��bB\:������s��s��"�G�ӝ��&���"gq�véUn�����|B�G�HS�6���l���f�}�Z`�+i��і&�m���im�5��X����W؆tR���2�Y�(�r4�Y�b��޼�w�&Co�*J�;�v�S��B���J��wh˯k`���~�a���d͇?MF|�7j���(B��V�Ħ��c{�˞ήد��[���U2��A0����~ň� Nz��$@���4Q�Dk�<�-o�T�B���s2E-%�LW-�'|ƕ�:a�gΝ*�3�MF�ݠq����71��?!��8Ó^6���P��EtX�����s@���[x�DyFH\��Wֲ�QB��u  ����'�<����������'��{�����'z%}��}#�i��.ZoL'��(:���jۛ(Z����A�J���يͬ�&��pz|R��|!<�n �{tu�/��}�p�ꐛZ�T�n�RX���;��3Η�"-z:��b2�[���Q
�����ߛgwtw�����b�����߼��c�$��;�5fQoi�o��3��ۥ-L������H�}5�ܑ贯D��tpy�v �N�ɗ�/�x8��՗��3�3r�^:&iQ�PZv���b�i�:zX���'l5�Cc~�y��A�#3����c�8r��e`�xQq�`+�,l�%�'Y$�*�gTqr[-�%#�w9`��$�6�p��g��EkK��Rc^�I_+�봵H7�s
ihZ����q91�C�<٠o��.��|���ӣ9/��_K%���<i,M��ş#�<9(��O�:ǀ�0��.��P��dQz�TYA�ܾ�6�15�S�i1����d ���_^�?���q��X���fk�Eu
1�c���`��(*��&Z��j��躻Ϧݩ�F�D�M�8�����'�oi[6�f��8��~�LV�Ҏ�1�A4l��q��U9��HN��|�vA��<��<��g�k7K5B�����՟~��_~���_Zl�C�7ΏGN-��t�]�í=����Ap8��L��a����+��$Ɯx�%� 1�|�+���l̱�C�!���XJn�e{ʰGE%�y�kX	K�lJ�,�����@�}�S�{�xz4F�)��#ǝ��$�5� 9�~��H��Uض�[6�+**����f¿g2ư��Ka�W�.ݤ�|/y��OHT�zb��2*_k�=������'q��
��B�$�_�w��iu��$]��Z�8~ �-JJ�L��\��஗�]������O%�A���! ��؎\oQ��νY�V7�b�D7O=δ��h$S��sz����2v\�
8C���H-���;��8!��!}������沤���J�j��E�w_mك���
*�;e6���N�㔽s�hV���B�4N{�B���B���I�G�D���i��D�T�M﨨�tU1O��K����&L����OM��~Y9�5M���=jPE�f��[�����ObƉE�.�bG��#��b4!Q��׺_�6����H-�D8{��	��nK�
$E��=�v��u'���ǔ����)�?|��g#2k�ꦼJLq�x�4�f[=���
}������*嬈s'�v�����|òഖ��m�����`93ϰ�1P�A�t1&�ŝ�Y��#́��:�o��h��ڴȇ��e7� ok��z�?�w��:�E�r����%a�B&��.���e�I!77�ݱ��n fNpiY������S��^m)Gk@q<s8�U,�.�N���N8�`%B
��'�����b7)(�e�G�*'f�u�W����Q�R �����_��2���K��G��D2�8l�H\E�{��c�Š	mj2�i������KC�^�D�06L:�L7�E�N� Pg#����hٶq����=,W����^�A
21y��Jb	'��fwXj����������������O�ق����uҩ�L0�R(�|�#%�i(�2�O�g�9����Pp67�����i��m��?!����k���=]����n��Cl
�i�tvuE�[�S1H�Q~d*��1���G�䟓W9�U��C�^ȍg�߱5MZ:�*M�$��H�<�h��@:dզ��n�J#:�SL�*eV*�887y�2e"��q�; ���1�<m�`� j �\��Rjb�_֞29���6l�8;����8;�?�vt�GL�
��H�M    ��H����K�=��#y�lɻ��Z����_�6i�j\v�#N߲��AU�s^%%���p
�0�;O��0�t�-S�Nl��1ˈ'�uҋ>a�`����ދ0�˦��KA���ɩa�뜓�;���_X�a�#+N*�N,ƕ�͡�ڙ��|����E�,��3M�A�(�`+YY���ԑ��݁Y?&`���W���Z��[U�f�HD��$;\��4��|�H�qy�8b{ð�Oc~�6������[��v���ݽ��$���$Yw�-E9B*(��;��HHD������+����_���eI��+;�$��t����Zꟑ��&��9��H,�H�~��K��?VQ}l���e��ķCT�pzT~ZSab��n�9���l�EB��B�Ϳ��,�h�G9ʹ%(���{���b(_q��&��t��|�O
'��,6��d��m���9�2I�b��ުf�1���O����ï�Y��5������t�q��N�u�ϒ��vg���l����Hk�J2%A4��/_� L3�z���&����o�O8�!>w���V��d�p���1�	� ��|[A��	"���s`ip�4��c0`MA�_-𲘔G��4��B��tu�H��\7�L��V�ov[�7ݹl��v��':[�"��hfD���b���/K�fC���<ÉDH�W�c恺gw�6�p��r"����M ��F����hש	����s���iB¶������v�O��
�b�w���#㻂����	�j�V��L���#��?*1O"��b��P����Yc��Ak�?��S�#�@�Z�!|^�4|^� �*[H'�ɥhL�(՗��k�lB�_@��;�\2tE��v��+|j���p�s }^E���f��of篟�́�V��?����L;A����~��:��
��P6D|.m�Bk�ȇ�SR�V/6>e�J�a��q���x�I!Չ��I�-�3<��Z�1uϸ���7��8+q�����`�܌4�/<&1�q�ij:傫����H:����)�2.�H��:��
��L7P����J~�J����w�����@�W�������=��hmG������51�H/H ɹH;G��X���[Q�)+E�����EK���ċT7��������FjO�Ͱ۠Θ�$���G�኉�`s�c�>L���#������xF�y�p|R8K�>�%h����3�/����`]�QD���y�QZ}%tj���R�X� �^R[E=�$y��Y �F�28����4����e��v�,�8k�����'�q��m9CS��g�s)���K!�����䷎�Ϝ�׍L�19]_(�NaG����x2��1��>�v�_�Ш�i7=L?4f(&r�vj������@���l�2�!�\�p�l�=f���H�E�!Fl�*��*B�}���Ҫd�$b�i��6
2(fo����U�vߢ���^o<#���z�r���uDO���8��x�[}�Y�.z��
R�;��6���}]]Nz�{}ƕJ�;,lvW�&��W�z�&��^��Μ������	�Z�?��8x&�8��y�P{�	�A���О���&�3�&���̊'`f��*�bXj�9G��L�cZ�[����&����v��ހր� 2R���F�T�8�*��@��#e�.��	(eG~Ԭ3���W
�C9�+Nz��Q�j�o��Ҹ���,߶�H�;C҆�B� z�#��P-VE0���\}�aD(��U��g�?aQB� �\�&?&�m���P�O�vR�35ųB�,8@�`gƴ�K�8��d�[۽��)�+m�&�.�����" ��c�p���e��
T[t�6��ٶs�:|�)7x��G������+�B�yh1�Zl��bkYAB����q��!�z��ۤ�YHzx��0�&��<�����[I�\��)��NzIT���Y(@14���]�v�>k��]v'��h��.pp��*�3�%�y 9���@��@����D�5���'"D�s��8��@9ٍ�̘x)"����m�W�w* QBf��U�|��J&���#mN�Q~Ab]a��"���7�/�����Ol:��yar �4�A�'�\5Gݪ��u�څg��:ҵs�9v�ciKIl�m���z��F��������KH*��'��TWM�R�/��S�(��/��V���*��h���6	�tu�{�QL���LU��T��5J�Nv����j=(�u�4��%�e�Y���t�����Pe���Q������ʸ?��4���Zcr�����GmX�8�-���3SujCj�$ ����24_K���I�C΋'z�i�D��r�3��19$/��5R���D��N�E��z	�P���TH��D'�?`%&Em�J,���&ZKr=ʵ2�vV��]g�"�^�e�t��(��rm����I�_i��V�%�8��������:L�A�$|��p�Ј�݈�	��!'<�̈m��Ww����O�|�\JSF�yi��Dh�����*���V�*��p�t���}�p�2m�?��s���a\ҍ�؞�>}�,��!���ѾN�9��0�P	��5��DecB�*gU"~TU��N�>=R��n�2%7��l"AL�����-� ]]s	C�)�J���q�.@���j.������0X�����&Xm⪤"���1�����v��>?Qp����,M�o���	��������)�(?�vDew�۳�A�Fx"�̥�f���lgR�����$OM�D,AX��9)�l�d�@�	?4��lHα�z&%J��!�:%��b��K�}�-"�'��O�-�`�<V��e��*�jhҥ����4���f"+�Kq-c��QM�,ն��$�L���WCO��;e��mE
w��a%7Æ��Ƿ�9���F�������^(e����dt)p�V���}m/r�ι_�բ��K��_t� !���A�A�2�Y���2#�g��p*ś��2M�]͡�=�mҏ�gT�}�p�$��VH6Zg*�jb^U��ou�ݫB\ɔ��T��'��们�|N���(D�'�EX�X�Je�����8E�
����;����k����&V����b�}5D����-B[���-J�|9���Rp��x��$�i^�@�S�	��o_�-gm!N�v׵O/�_���_9 ������
�(%M&�gQ�I��˩�������n~(l��/5�TLB%�h�B�d��ӣ���ɰ� �Z��ھ�G��d]�Q�=��<QrA-�`P��n��D�Td,��"2&�6Q�mBƬߩ�˵	yҏQyb<�6��`������"��mn�j1��Pjoʤ�թй�w�Ȏ8W)|����k�WT��?ϑ��PCK�BVrvX�zC2��a�;����LtsZMD �uԊ�Q�����Q�&θ��Y����`X���Q	
F��5@�V\:D�l�A�Rv( �Y����Xޛ]g �/:����9�*�R�Z5��0ԕLB�#�$�\A�ʢ�]�9\��2�M�^"�K��`I��D�T��;�E?��C}B���'����{��Ń���/X�Ӯk��sT�&�]�b���o�������s_y�S��� }8)wN��bf��<�����)Z���Wc�)��/"5���{�y���[N�D�����M<"g�u�Z_��.����p��F��>�}0����{��kMk�L썛�����*�罪0�6)����'���bƔ���N-S���:����~��3�#�{G�s�f�R/?GT�QH0�/��DO�<���w_}������#���⛯IL�҂\��RgS����������`�<��y�T'��Q.��`���I�B�v��֫"�X�+��J�Mr\��+��q�d������t�"�h�"G���p-�Q��@#����.2�*��bN��ƾ( �v糍���������    �9n�}}�<Iy���Fܧ8�L��Ĵs2@��.6}c�Ќ�^�t�b�X��-O�+����[�Ih�	 Ӻj�┊�:@�5ҳZ#�Z�=ֲ�	�8L�E&���t,֟�� k:'~�i�)/�LG�6���ҙ��Btʪp<A�4ч3�w�v���	�m�`�D�p�zn5J���`I�ҙ�����C�s��`�	Vo$_������Ål�V:��5���W��y�Q�=Ъ���������y�9%�d����K�y�N��-��`X�)�%���Ei���خAz�)�b1֔8r���Č�㴻�ف�|vH�u+�B˴�N�M�"�m�.0��@���� ���N'M�(ߋe�WZk�[+D�P6�3e��H���YDnA�J߾L���6!1����5��Fj��fĝ�����*����⒀v�XR"Z�6|Ef5�!l��E�"#�����@�(��1�w������M�������zcꭓ�G������'�i��70��z2A���$��;�PF׾͎��+���/�q$�=����O���ѩ�&��N�����]�u�o����_�,hu�Y6Q��}��d�d����S�ДSL���ܲq��c"q�����>�o��|�������o���\��u8��0�m׀�������~>�Ҳ;�c׌0#�*����ZrG�_��Eh���ZX���-f|Q#f��E����*�!�K�[�\P��Ha��.h�ŭ!��ُ���}�{x�֚����f��fa\�<���}�j�)`vֺ��@�kqq�2�J�"sAR��b����Dk�!~I�V<d��,��
eQ�`�В�j�e.��X�%[�_SW�٘T��2�f���h�e�hO�~wCY�qC����.H�o
=n!��8R����3[��\iG�&�V[���M�LPH$��1��|�L5� e�c��$�ß��( ���r�laJj�~!���tr�+k��m�i���cA-E:��Т��+ң]]v�3�^�:7l�'���4�u	���'[ʲ��ۓ��g�v��R>D/m?�A�"��X��_�=��5ݖǈ��$[��s�A�ms���7v�&��j^���ov��y�P����H�pw�nj]�������(��8M>�|k�;u�	�I�hs}ZA}��1��[.׊��ɣ��#iqK��/_��Ĩ�FҌ]A"���i7fe��rR���9IŲ_jdY�-�;���{�NwfDhi|Hj�O��()��J�@��.1��P�vD(�د���S��iǧs��weǥ;����/B?���N �0T�� aVfq��V6�«
S	�Vxd$������k`�aik�3������}�B{�Uj_<�[�O���k���Z<�X"��h���:/�gsU;��5��V��v��KϜӘ��_!h�*����N7��$��״�<4�O.��?���.��Ar"Z�?@E�i\�	�Y�e�M@�M/9M�f�3���f�P6FX6��1���$��QIl�x�V磎_�UA[[��mDB��҅P�Q����;[;�)�*�]o�2�׸�A�djzݹ�K\a��}�[:מ�ж�0&7������6�NbB�>�To�B�${g�矫lc�k��ʙ�v����h���Qw�s[(�y�	Xm�,a��'ѻ��n�D�Q�*�HJ��3*���n�~�H�9�b?���jw��˪y��V�>Z!�-�8Ԗ�u;V�,��V��I�F��� un��S+O��Jv��1H�ʹ�[���?8�j�y�BZ��vh��ډ���z9{�r��S��ҘKە��hᩩI�ݑv��0vdL�^�zod;���/߄�6��ޕ�^�P���7Q���y&��M���T�<1�����F:�a���_�%rT׮T�c;!݇1(��:�1��y���Y�{v�-:��'����cRQG�Xv���	��	"9 ��4��K�!�A������_�p�~���U��89f�~�+I(v3K_D��z���,��mv����e�L�I�.)��z(���`�U�	UU<_۠u�8"�.tt� ��� ���|��L"=�`��>�*5l��S�%F�;�BZ]Z�|vȰ���-!��`�a۰�Z�v�%����`w	���K��-��5�ۂ���4P;�w���e<�V)D��7��Ў�������<1 ��_1NM�~�5���Q�Z�7���ѐ�mحhѧ}vW��t$`]��lT�=8m[,=�'d�?�ξ� �J(�V������5Zݕ�Ԣu��_�P��_~����w�~�c���<��6�<��g�Ц��Hz� @�r��@r���#1�þMM+���r�0�������-�<��F�x�e?��lFŶ�~$i��ycӛN�X���7ˏx�2�7&�ݵ7&���n���l��?)6�~`�����{��U6�I	��'z��+�R.�N$�V��)eNW�h.�:��&̿y�U��t����}�P���('Ǭ:Ŭm�Va�U�K�RI���H~E$��Uw�Z/:�cN��=�)�,eEO�!�=ء�é'v�i����u�%_�(�ZH^5�k��zq`dJ�V�TD��2jC�'48�K}	y%�!�;�b�v�2z�Tqȶ�Y|���+�`u�O�<z(��"&/����2V��^L��c���3�*�h��͑�Nq�R�"�3R�����l9�,>hdx�X�z�ݡ��b���3�S�Ɋ!�-9�ܮ�iF�E��d4r����k�s��#����!.\�D+�5�!S�GH$
^j�Qq�8��o�hG���3�7��0m?�ꄭ�ڥu���*������}�3]_��z��Vq�˦��e��~	ULS�}�_���綜�/rMI����BO�m�@7��]K�7���b�XlH������V�-T�;�%�Dd�Ii�;?5z��� �Tvn]J����R����}w�{X_�WNژ>���y�����ߍ��!�ƿU�X��:zB9��ﳦ����b�9Bp�b@��G����c��SrS먛��]
�c��ᾈ��K]Uͯ%�UL\>J��U�x?^�v�w� )�΁:3��ܖ�?�@��0���nTE��F<�t����«�MwT�u! ��˿��_�濚"��|�U{�>�#W�kB�~�(H�*O,ԣm�M7^Ek���F,��R�$���������;�����	����_<�߿��AVv0w[�0��=p��?����[EnY�u�3��*�Z�$��R֢6��S���KYF)�n�-:b��8=���o�D���_��˒,Uhbg�Q)5D�r��s����<@�����X���%f��Y���韍L	�gW�あĥ!ok�ɗ���;�a�`%�;4|``�dTޕέ�F��>jF���}[u(�q�%S{���.�P��"1�h�=�ȯZ�+ ��.�( �b	63;]$�]C��s0n:i�f�m�ʀSڸ��Tߎ�;C����n\�ズ�{![X�����H^rG���2����#ҁ�͜�m!�P�=�H���[@%e������]7��&ۅ�.1�� t�,,1z]̜�NMp��ʫ��	ӗ8�؀�Bc9�R�Z@��Ӄ*pZߒ����V_߽�����w��}�����|����~������O����{���ۻ���{��{?C���K����M��r���+H]$S$#���g2��謻����=��tE�S��e���6��rj��TL�یp.�3%x�[��!Yϩ��x�G4?�l�Mo���?Ԯ�2I�^�$
�x�?W��ԆA��6��"�����'��=���/y��>�kP�"HC-ϵ�%V4{a��΂��R�(O��H�ؗ�����wm�m\$�罐��M߄˰{I	Q	rD9���h�v���fV�sQ�g^�*D"R�b���~�H�_uWС!��WEk��xR�����l�{��ck+�F�&!ʯj����\�o��� �
  h}���pV�akfC ؑ��j��M���bȡ���&_�+éXˡ��mr��F��e�W횿�#��i�c��e`��!����<P���W8�/K���Ƽw��
�����������j ґ����(��ۊ�z�T0��~�KE�����F��AD��t������hwu�V'�g�Z>���1��۝�:��C�5x�Y�G���o��MD�9d�R��IK|'�٬=��bW��T���=���n(h��!��DaWP�~X-�MA��A�"ܱ�(g�ƻ�#.x�I�s)���k�5�M�����\�&(*W�R�Q<c��;*�
vr�>�����uM��NeML���|�给�8w��D�W�Z��I2;��y�3�tc�p-�j?�Fg$�U���ku����u����\uuďޤ@�4��[���[�v�?�6�]�T_����{Ib�&ؤ9iEK�Ϫ�gEL�U!4D��w��pi
����AH᫞N�;��Lt��6�<�/�����@��uy�؃��Mz�R��8�idM��n��]]z&����@?7K�je`���_���՘C�c�OO�:�1;6�g�՛��HJ������Fy�ġ҅�62g/�?5'�
�H/�GA�.^���;d{)~�%T��hw[�y�J"e1�!re��>߲�t�n��N kM����ɔ��i����d1�ɗ���)L�nB`�]��(���G�=���A��mz���L'xN�;%�v�SjR�:���6�6&2����	�¦�^6Ն*MYIE)�l���T��ڼ�bmDA�6+႘���5��p'���^&˘u��������3[f�Se�Tv��l���U�碇,).�(�.��D��>���5�Iz�������/��`�O�G�N�`A���G��g'v�$LxҒ/>2ث�R�'P쌾O��q���}�%�L�7/�;�ٴxYX.	`�0�|��^��-/����xi�W������/N.�-�f�+#̆�0�!�G�ҁ
�V��Ih11��E�}nS(iO�P/nٖ�zq8f�-q�'�,� �u�,8�1�4D�
c����~�Gv\��;�%UA�\U�.�,3�	m~�Ҽ���-c�F�����o�֏��.�O�18dW�ؑ�ioD��&�m,�F.3[�w�>���f��l�)�֞)#!�x�1U�js̫�;��������qZ���;2c�Č4������TU`iWO�|hjL(�O�l�"R�| =˙4�V�Tɤ�`��D�O�&ZՑ%�E�����eJ!��[����ub�HC��V!�e��E��Pr,j@����ռm}�s' >����@���Y����������t���o�ro�dɝ�,�4����n��ɦ]�!e�����oQw�3r$�� Ɯ+6`�XP�WN4
Nk�lɮb�/,��r���G��J�9����hi�'Н@�>�4���ʕu���W�<]�e��]Av�q�$x��<��v���l��$�g���OηZ��Rt��
�ay�Q&tr���u��{�5�}��^��-l�6�.X���n����`�LhyL�Ro��1f:���T�C/mG� /�ZZ�I[	y> ҉óT���i�jps/�g����T 6�v�RdI(��lZ��译TRn�K,�Pf��䀦�������?E��-tɺ�Ϣ�N�pp� �V�Kƃ�>n	|�ø��SU�O6#^&U�K��U4dn]g����+�"h�t1��.�Q��o'�>�F{-'tg��lT���١��v�a�;cu��;'���nM���5*W��n�3�]��S-�B��H���O,,��������t�J�x�������qJ�O��� ?eO�d���0��jF�9Yb������^ݦJ6/՝���B�I��
w��6�������;V����*N2�#�d�7Ĉ�8b9�blT~�/�/�5�������35H!7>=�bh&
�	z�J���^y���*�,�̙]!���Yav)+N��������Ԟ�<l�A����Q=��tyItB����N�"��e�Q��\B��5٘�����/8��t����ٖ�@�ˣ��e\�D	5A�Qٶݝ��ik��"D'��g��G�!���E�V�©P�bi�(�M��n-�s#��V��Ag�H��v���N�h�[�.���}{q�!�T�"A��|��&}���%Jl�o��>{�<f�B������(��8��;�<=��iJ�Z����5��a�����-��� m�Al�2��'�]L�.����� $��<�Dq�.~mNk�ΙP5��Q����\�l�h��\�ڸ�M���JvX(	r��n0%�	�L�M�i�� ,1��Q���}�__��zS����mЩ����#�Uq.�Jo ��jO�q�Oӿ^�R�t���n���'�K輶�!�M3J�JV�������)A��((?
ʏ���((?
ʏ������((?
ʏ���((?
ʏ�����w�躴���@0���$:$�h�]����Uk�z�ܯ
"��� nQCgv���[5<z,/��~�6� B���5B�Hb��X+]fƏ۫�ÜW
��XJg?	f����*��ͅ��ru��Z�i�Z�y�D���d�cG�x83[.���6�ϔ��QDέ��6�j���h�)�jj�Ъ}[��z�.�t!��o�7�D�D(�����-RyƮ=��~���%�;�      �   �  x�m�M�$)��Q��i�pX����:���U�$���j�}�3}?O�����y^���_��$���o������ԾO�}�����M���tr��Ʉ}m���aԞ���0��2��в��cϷ�Ns�|�������]����T3͛˺i%&<s<s�䙦��lAf�zO7U�i�'ws�G�����'$߳����5?T�2�)���8a_;c�mS��_�.��%�K�������I| ����&_�/�mg	�|�����Ŵ��݅�X\�N�;�����+7�|�B��Ӫ+��u�|g;_��p"_ߟ1�����G��"z�߿�L9`z�\��XMbG��� ��.ӛc�U���9�D�Y��}��7K�wPƶ���cc�9�U#:����E�����8G��E��.��S�����2a�m=�ww�2�N�Z�ڇ�Q��>�E��4gBW,t�=�;��p���6"W���a��;PW�o��h���2!�����a+�-�I,��ﰬ�����a��f��?�3vX9��4��:xӵ�c��2�!�a���aFj��(ra��f��v07p$�mi�|<�ʥ����"�<�e;�f�|�,I��E;��MK*�>��h��a�ı3�d����L���v�<�x����T���
h��RtN��W�?���X5�(��H\��2]u�@��.�V�ȵ��9F�˥=a����������Dx��	]�w�W�~he�rOܙ�Ng:�޻.�9[L�D^<�7�<�ݪ̉<_����Β�{Wժ�������1o��+�g�y~�g�M�Ńw
!�%��U�CJ�v<��|&�N>�Ǭ��������s�^@+�|��-�+'E|a�r�jr�e���=d����3q���*#�&�|5����4�kK��X.��W)�Zo��7<�+��$^���#���.�:�}�Q�9ᷣpAF�J�/\���&�B���@��� ʊe֛�۱;�J�j��w�~��;�~���z�ϫ��ɿ�ug.�t���vL��L��	�q�8�g2�(�$�wDͫ�0�,M�Yp%�<����	�9�w%��[b��%�bmvlQ�<K_J�]��[�d�"�w;%��n�w$w:��P�b$]L�y��jFB0B���|%1xR~5!x/u����k�z�v�U�����V@z�5����Lf]k�,ܡ8��h��W���y�����=�j[W���'S�.�����1���	��Q��֑��\��Æ��Llm%�`��P5�&}ϝ�,5��.+�4P)%#�Y�Ho�=����3�����ı�qT���R=KK)��Zf�]�)�Z֏{�x��@���s��I�Ա��'��l�)�@^ں�ϯ�;�Ή��n�����UC�\���I����1�HX�.����0Gψ˵N��~��+@�q	��u��@J�i�Ⱦ��z�mr���h��o�7�q���A��{-�m7�n�G/ի8�+����M� S#[�60˓�@�:9�q��1�ԓ�Z�b��褦�5��6HEt�l��	��I�n��,�η�-��d��k���
�I5�L��m����n��	��o���x��j9>�+����:*z��a*��I�(�z�p=��R�/�������<��&еց�;��K��m� _��X0p<w�zD8��zLK�z��X�׫0T���������X^��H���w3����4뼓�e��_뼓�e*tpM:���O�~9G�z��J�L�U�nJy��k5�z��=D�V�0�.
��-�	��h���-�q1bqL���|���'G��^/�o0Z������^���7e�v��k�[�� ��V=�E�1C*@�^צlm�O�J--��Y�絳�`��Y�ت���eټ�Eજ �V�fupU�J��5�U�fz�r/�k�rN�kY[�J�Bbg�u#c��Z
�ʙx�
��*�Ѩ��}��s$g+��՞��u�*��*��j^{.�*upd{.�*W��1�sN�;�W���E�^\�x���9��� ���#��FC��Q��С��O�'N�YO�-��K�������)"`5|���������c� W�*�_ ��aN>D�n�aRk��FF��+΃1�}倂":b.�0��a�C�a�6$Ll�\�є�Z"�l}5���F�0����lE��ƙwyFy  赴�&*�P�*D����~��t A���
��R� �����=G�qzP���o ��x�\��J�&�gw��Za�-a���!wCu B��3*�q��wC�bh�%
�F*x�K� в�� ��h�Ai4 �.:N��IFFEh���-u� ���5C�� A�J�1APO'_G�������k� �Qa5�T	��s��Ķ���bX	2_�ύs<��2�W���'_s��t��}}C��) (�� �A���X�P>�����{Q�}�A��\9{6��r/A&0��p�_:gnh�v�A<�P>7�J�@(��^�3�ь�(�'�"
(}���
��i�pC%^`(_��f8�낼@(Ǜ�YP/��|�Y���P�Q�#t��$u�q�ڞa� �/�y}�gO�OlW��|xT��Q��((�?�T(ǝ����/0zB����*��%0�6���*�����_f�p`(5�P.�WH+����_��2C* �L�騂�'Z�Su��P��[�\/�uu)�VBO@_\��)^�)Z��&j���hP��k�=hMP��N�����Q�Ǽ݇
�K�Q>�+@ʇ�9���w�/���s�֫�|��E�m�(��]�L,��ѝ�3�v�\��ѨM^6���� )�+��x��|f|蓺���R]���9Z�[����!%�2L��}�K���V@R�w�I`�����W��Aoo����ϷW���׉�~�����ׯ� �8o      �   #   x�3�4�44�2�4QƜ� ڄ�D��qqq O%s      �   �   x�mλN1���/^����#@D)J�@����X����l*G��3w披hRz��K7Kw�u����~�޼b�Q5o#J�J��#m�&U"o������X��5�2q1�{����P�5"Bi�h��% s�)��o^���WҖ�6�JwM.��O��Rl��;Ϙ3��t��o��7�� �ܩW�      �      x������ � �      �      x������ � �      �   ]  x�}��r�0���S�	:�����љ5JB���N޾�Z�����H���k��g3���=���������:~Y�04 ��fx��rS� ������������m����=�t���$k<a*iN��N��O�hP�5[T$xܕ\�M���`�6�Y�����Tz��A$c+ �����l�� ۟&-�����;���#��;��q�v�:�6���N���&%8��mƤ�4�hH�W�+�џ�3�h��ؔ\�ֽ�
��d�3�>	S��1�G����+B��7}�>�����q�����<g2u�wth���i�r�	�)��s�i�n�MjgߍL����w�1�ƼI��T0�|y����ǩk�+Z]kr�2*ĠdDD� ��)�ߛiݦY�d-p継m��*"��7�a���Gp!¡Qw�d|ک{�Z�yk�Ե7�͘B%$`Ѭ�UR�J\$&���D99�����ӽ�3N���}v����OR�2�:,�US�4}������}���<���}���`{p��j]��)*U:�:��*�Q)>�^*R�s�e��ej���B��������Q���p�>ptQ0����Q1W����݇�}�KҒ��^1�*/q��e�U����φ@]���o�P�ii>� �P�6̋6T��S�w
U��	�;��^�d�]�"�\�}�+�z=L���Uq�A�ȈjB����>G��,s��*A0i.�hvH�Ei4/$
���,���t� j�W�v�:G��p����F��j�Wa=#�+��x�r��v-TՇ����N���a�"��;9m}>�K�;�8�"Y����Z�V����ʪ���iP�����~c�<�;<      �     x���뎢H���O1�f��U$�������L�D��E䢼�>�>�łvO�̶=�R���s���_o�_'�m 
�Oc�j�X�=Sq��l.�F�ʡ6��ӄe��G��̛�7��YE��}��v�����̓�d�������Ή��Z�� ���_�(! A�	bƚ�=��m�~.9XD֎Ss�jh4ڹ{����c3�z&Vv�Ք�K���G>}*<��9/�o�f�\����'F� ��5L3�]g\Z�JDP��aD ��D�1����nw������ͅώJ����H������s���8	����:�ܛ��$�� !���6$L8,
@D���S���`#Ɲ��v�i� ��<X���̅-\�ѭ�F��`-���B�S+�%xg{�#���@�P\�ȝʵh����yN
?�u�h�牘����i�i�*Y�ػ�a�4SO��td8��������6�IK�ȉ"�|5�}�;���9	���\�蛆W
�!��[�ri���%�5i-�T]�Ha�L�I.a�Jޏu�1/�,�:N��=��R_�wѷ�7���-~�V��X��!λ�U�a�o4��7w��(7����y��>���ļD���X�<:�-�	]mRD% 9A�oj��F����D"<��H�uAp��0��M��,��e���5�ӌ���R�b/�
�t�]�w6d�r���;+�΍{�c3	�j ^xS�5��Z�� ��'�Z���v���;-��hLVŴ!��G�]��7��0MVT��j;/�ܣK��/h(�U�0Gx!{S���u�*��QUk0 2x-��vj�� ���s_�0���cc�]p��Ii�e�P��e�t5m�w��E;O��P��73�;�z��xx#W��3]�����N� �c�7�.fms��<owz;^[�n�֗*��%��l�i����{Y��6��,ohw�];���\f��HJ|�J@of7_����d�*R���Ȑ \��ن�;�4%3�<�%C��>�h�=�����Sa4Ji`���%|s1����DuW�4�������V�T���b��k�wfV^ ��4���`駣���,���ތʲc���h��%��Z>-��'b�V����� ~�D�U˯��F?��oA���j4�@UU�A*�⭪w�Y2Q=�Q�@�b�#x�ɩaO��)�N�1HF�2�ۗ���~���Y�N�LW��h��'<�/��_���)poi�V�sW����*J�6N�s����]w��      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�uP�n!|�S�����gTZ��$$,P*�߇t	z��3�cF+������3
K>�D<9��ı$�,Mb�*C�cyN$m;%�5-����˘8^�d�ޛ8��%֛����'8����,�U���,f�[���g-��%��{����8���z݊j?�MKg� G��Vq�f��J2>��]����K�)����:*��>��w!��?n��.�恷' ����M      �   �  x���ݎ� F������v�����>�&�،�F�A�L���t'��N7��%�i���u�s��ڍ.:�7��G������Y��Dp"�Y��QB�)#J�6~�)���9�΄�9�s�x���)(~���.��:��X����\.��p��ΠwF�i�F�G�ڛN�o޵I�.K2� ����VͶ���`wQ�" U;Ѧ�6�Ɇ��s.)��`>uo�.����@e��(���9-v0�?�HE���*�=b�R��S��Õ��4�qe�GFo�ݻ������O�Hv����]gi�0��+�V��*�0�����\N߆���<��3,
�U��9�,@1��x%�/��AI�|�����hCu�/�s��!����))�����>L���:<u�1y��Յgے���-��v���]�k���t:�=g�      �      x���n+͖��u���
a3#rF���&�����|�NR�ut4��OԔ����Z;v��� �QV�*r�<�b���5E'h�U�ח�l��&����p���4_�ݰ�V�}��Y�HO��<疖+#���u/\{(
w��l��y�řR����ߺ�w'��l�y+
7�繌ѮD[;��!�g_��3�>�s3���h���¡�v���W�r���Xk�����È9;	�0�v��o��_���RϦ��b7��Z\Cg9�.�� �� �7`�$_cL���_�P�2EE�2�MP�yBf�s��Oe�Hθ~�mrҔ��p*�@��l.��x��a��B�W�!�E����br�t&B1���BeZ��A�Z�ܹ��ϳ���`��[l{���45
�Ħf";������d�$�� Ŕ�/Fi ��hꆄ`���8b�6~�N*~*��T��Uƹ|(v�8N1�X�&W��|M��$��������+���Ѻ��ж| 
�3�J�2�\̓n�?Q�K���.�(WYq^�����F�v��1یǨ�>���,����_XB/F*���:��$�������V���2®�PF�NRB<�h����0P�Ң�yh{~|hr�����K�[��fD��D �8JŐy���XzԨ����)ɋ�0;]�?��/]G�	�Ek���v�?ܝ�BH�Ш��+�Y]��y���� җ#$
�8e�:�q�xq�Z^քV	F�&��Ɉ2I���S6�;w7٪�T�:7�]�9J�I'�-�X�0�R�	�/�#��(�������%**Q��90J\f~(#��jE��E3V�N��!�,}�Aݡ�Zd+��n�`��D�/�)��f�IX�.��D��U�Ԏ]_�)r��d46e�P�h�Ҳ��.$�xl��<)�9F�t��m~n�?�D&/	���;�Լ���`r�w�,�5`��Ws�����yHu���^L)����HC��.�i�����ϡ��tW�d$J~!��_�����aG}XY��0��+Ӓy�&��8��ˮ�i��0��c�\~�M7�v8?�7u���k������o��{?�/�b�'u�ЦtDY�+�̅8O|�8*�PFKS�QB�9Ng�V`�U���ިS}	�S̅Q|�G���(� &�m�\�X0qj�b��yA��b�4��1���v���v޵�p�o�d�M�Ζ��Z�G����h#���n���7F�K��\KU��H۶���M���<��@�e�S�W3�Ń��/�����*W��;�.A�V�bd$�e?�WI�����8r�5u,��޶�WZ.MSSt����?��H�7���tp#z���z.���q��#w�d����63"��3L�;���+�
:�,U7��0�[���0Vɇ�I>�&�Z�$DGK�]s���\�	�8��T�d}���z�~a$~"@ �}-�{4�p�����>���A���bi��b���ó�^��Nn�[���$���/@�@Tv��zDq��_�~�~��ԫp��y��I�� a	�2N0+�Oe�I�;"��z��5Bg�<�d.g�[/<i9ۿ0�_T9~�ؒ��(b��&�7J[�Rj� gfB>�Q.m�n%<G�r�@Ƴ�o��.9nIk<b��ms4��Q!�0� ��f{A��ial�� R�W|sf�ʨJ]봖�k.�J�pt6]p5���`�('0\�V���ߌ�"B��߹�FNJ��{��.��Uu��j�����؇2*�(���kS˔�z�
1
T�}�����l>�#(ԗ��ȋ��÷���"+��q5u}������Y�x�s�[�DcPC߱g��wVe����2G�ެ��m�9=�2�F��v�>̍�`���y�0��2��,y�l����z�D���E�[��b7��Gc��4�Y��-���tYW�ˑ�{X�:���К�v���T��G�����+#��6m�٦�݃��>�t?��pԄ�~H{>/	� E�F���Pw\� Q�'� ���:���#�������(�l&I8 us��ϭ��a~����ĝH�*H�}(�E����1�"�[�Y�M��u����,r:_7�_��?�4�6���"�-�p1�p�h��_�`��Ń���M�]��'"�� b��"=U5۩�ůN�52׊�j���h��&�8z�D[�l����:p����G�Z��v��n�@����F�9-��7"���ф��AmM�\c}E�E��_{�?�<i%�N�3��� M�-xэ�q�m��R��	��(��y���׸�GD�[Zd����0s+@���4�2�+t܏D4-)]�,��X�<��9y�[�+�\˗DЦky�\���v��?����$�З�"����VC���e��nuuay��ۡ����/��Ν��6#}Dĉ�F`:CU�4$� ?��4�Y��"����}55B}b��h/�Xs�:��(+`h|hG�K���w:�� ���>?9U�84\�yU�����//ޟ>M�@����\�w)r���"%�kiM3�3=�}����i�xB�K�e�N�,w� ���ڠ�~3gb�(�zz�FW܎C�b�~��^�EE.�w�~؄���P�@J� �3Ơk3���_�F�xD
��n�o�����t/���vz����*?��*9���u8� B���E B���X�MHY��܈)�8���L��k-A�u �G4���k!<
�r�P��a�:�a�So�W�����"�� #�=Ws��h����&d�wE�aGs�3�|��!nw�|Z{wV'��lB�T��ߙ�l."\�Tey~"�KQ�? ��盂�%�F�i�Uyg7������b)�$H<�3��=���cQy��j����}&�9���!n~"^�Z`G�r�:QK��*��m/�B�	���:�� D�����l �7���m,�P��>�@�M�h��;�oD�Eb�y�0,��sB�x��q_��a�|h-�Ҡ��ã��Q ,�F�7��srmE��\���g?{>z��/�޵��L�羧���b�gEq�Fd�N-|hMRi<N�7>Ħ��[SX���<!�򾚠�-�!����	� �+�AcS�,#��W�&�FO^(�E�J���w���7���s��G������Ӹ�ZO���4&�߈��%Bξ�~i5R�RC���J�ݠ�t�QcA���-"��oD���1�LMP�NGL/N\���N u���������X&y����Bal���������je'��c�� � ����j��Zԉ�b��FG��t�g5�Cg!�!�'�{t���qE���.��D�L@��@��������0��{��ھ^ö�J�Գ��x�w�6��vAA~ݢ�_��
�[�In�DL�� P�~hy~�� ��m����G47%���ـ����Zx�3k���m�\B^�w����ݹ���"��ῷ�l��!�	Pٙ�T�z0��.��6�����w_f�)���jp.b(_h�H��?	"Q��@/��-4��SJ*���@wS�Syi�T���}&�� �����t�:k��J���D��un��	ʘ�*�\'?���)��{ZԘ:(�ż�3ϊ�9�/� M�JH�$((y8t��9i�:���5Y�`d����r4N,���D�����_�[[��ť.��C��-\�#O�F�a���Qs%q�n�S݆�z�8&쒍W�x���D^��P4��v�Z*?G!/D����UQ^�}��4��rM�Ң��$/�����[�F���L��Q�k�wݘ��v�$�­��N�Nm}/�i�s����$���(^A[�<j�.���N�DoD+ss��B#�Kn">���Co�1TXSm�e�c���hy���:����\

��L���iWC�z��ZC1)�]�=�PE�)t��V|%���l�x��_0a��m�J#`;�>� �fb���pIB�;L^����bU�|�D�g�*)lKO8�5��0����ji�X[�ij��=z4GvX��:�O��c��@�Z�S��D$�FTpN��r���4S3��Y �  �
}m�"׈��g�,�#)���.����N���7��v��Z"g�q6Lϻ�5Dt�@�Q�H���1'��C�<ϲ3u��2)�;-(L+S?�M*���XYy}��g��rx7-}my{�F�\�Jy�W�'"�W�/"�_b&.7]���Mk�S� /z�ܠ |h-����|iDE���a{�[����p�d��j�&WLd�Yl�F�Z�a�\�k�l
���IAm�^�6�:�'u����I��:���xL�=}�f���d���=[Y�t�3��Z�����/�D��h!�� HVf�^a��w#�i��� �:�3-��^�|�N���u������3AY-�ڮ��<���#w��D$�V�eѻ�63�g����)�j�0�<�i��g�-�{�!ʽ�b��"�,"5\�����mcY�ܩ.��l)?-�(��"�oI� F!d����5J�<��i�������?��,���2=m-�+��,�D��J�#�CS���/��Q��)����)���U�ވ��&�Đb��$���v*�C����7�vys�v�ʜ5\��Ӕ��z�ȱ��[���WGc�r-����Mbi�Ԃ���1������z�C���-�쀱ˎw5!�6�M������b��&�V��FD���{�2�	r<'-I�Z���q�;^�C���bUI+{ڧWji5Jzo�]pY��4u7k�a�T��~A{D�÷��V햼��Q�N̸�inP~��*S�?s�{���l�4�C���遙��S�v�����~̦g�K~~����ˣ����'���նrC���B*�"ѓ��dӊ_߿��#ZO�����zrSg�}:q���am�{NǋB8\"z�@	�����������6�ΰiM{�e],v6Ϣ.3�q�w�? �\r��x�G��`f�T-�d}���r:�/��(��g��n��/��@���~◍�����zl�'p5�K����^H<�g�XSs�M��uc�õN�w;SE��}F)G�Z�zK�w�/���+T�Nl�T�q��ì̵�R?��w��I�;���%�(��pz�ӫ���yl��~�>Qԛ��|�Z����-���e���j�8����v@]��Bs��3g���)m�啈l�=RƧ���l�������d4����g�Q�ڋ�G"z!REשL�&XyU��S�Ҍ#^|&�J���YL��{>�h��Q坕�e�U>�.�����������&V���g��;Em1�bAm}N���
x���@�?Q�J��6;h]��5զ�{=T��X�q9W�|{X��~�y��L��p |?�\����"�Pm��)A�Q�ЏM���C�u�KkKL��Jp�W��wL���J����t���cp@�����]����;�<��hD�~�5�aUD��ﯹ��-�IrɌL���TO�&����j'���gv�M�7����"/�	a�=�"qC��W��`;s�4�bn9'&`�g��.�Br�v>�b�l�|q�=��B��q>��u��������i���@�7�Vd�j��"�H.�QN�Ѓ^���2�,#2�c�L�Cyk���y�F�4���<D�n�bRX�'jd�k�?q��7%i���wY,�y
|{�E}5�a�u�����&)��"������(o�es��;�qbO�M#o��V>/֦-dB�q8ٞ���xx#_$y�G�OTO��a�q-t
�K�)�yP�auv���~""��\(�����:������(���jܖ��ص�ǵ�^F� P��2�#b����r�,���` ��,����h޻D!�恫w�R�<�gK<>�
Ƀ�Ao�	Κe�:��M�<|Y�o�h�_���~����l�.�..TD�=gh���E�&����]��5�������c6.,>���;S;0v�hu���(�����n�X��1MC�u��{����>3X&I�o�jie[d���W�/�^=S�ι}����@*l����i�Ӻ$�Z��YF�M�bc7{e����s��T���Ò-6�}���A�<x���r��0t�c:6����d4�]7��Fiq��%?�=d6���yW��zR�jތP)��#�o�>un5�^�3r�� 7�~����Z���bt?1	�/ ��AHg�Qʈԁ�i�js���稱q��?����4S�1����lb���>"G�{��=�Z�?��h�i�G�~�T~��/N���UQji��֥����[1�^����Pv|I7E}�L�U����Gn�h�O�x�VCz8��\i�:�����X��0��k����Q[�d�'�@��KC�j�u|&"�I��z[Me��EQ=ԙ�+��9���������2���\>��{&[v^\0b�&8���&����L��tk�H'k����=�M����H�7��15ex=��oBP�0�������6�t׉�C}�z^��"K��<e\Ϩ�I,��f�s܀a�M��;W��8E�;���vM�P�*�"B%�zL��γ���OP�ز��&@O\',�(*�<�����������b�\����J�� �cTm��sW��X��7�>[�Y[h��B���~jT���=/�e�ԐSN&�{*��Q��x7D;�NM��eҢ��&����b�����M���j%Φ�3���X
�ʡ;>��\�6�)Z��1�۔Ň"mʻ���k��t}�ߐ��1�U�+�f�%Q1��f�E����nU~���?�Z/F��K8:������a�i<�q��:����(U~��J�Ꝝ]R������=#A�KU1�K�������1a/�v�wh�#�>cfobsz�&C]�*��R�Uw��B�{��M�~��O/�,���q��/Dۥ-5���-�Y�j���(�,�g�'�<���B�������k�&|#��.�0�Q/����X�}S�$fZc]P?��ߤB-�g��(��2��a�z��rl\;u�fI�.��mM_QD�(��H����M��6UPtm����&-(�
�$"��������*۸��a~�L��R���6�DK턕��� |�
@��{���M�V0"Q�BQR�R�?w&�Ak��ў��'y3X�/�f�fx��=������>�-#�xn�x�U��>��=8 UQĵ����x�ؖb��*�6���U�w�RɌseU�lX���xt_�O�=~���ɂw�N�ΨC��h~���a9��.NzD#��dը�c2|C��$���ϝ*G�8_B�T�"P'~�]7�p��	���v�@"�׏_���ީ������?{4�     