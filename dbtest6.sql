PGDMP          
    	            |           dbtest6    15.7 (Debian 15.7-0+deb12u1)    15.7 (Debian 15.7-0+deb12u1) '    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16540    dbtest6    DATABASE     s   CREATE DATABASE dbtest6 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_GB.UTF-8';
    DROP DATABASE dbtest6;
                testusr    false            �            1259    16542 	   companies    TABLE     S   CREATE TABLE public.companies (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.companies;
       public         heap    testusr    false            �            1259    16541    companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public          testusr    false    215            �           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public          testusr    false    214            �            1259    16586    referral_requests    TABLE     �  CREATE TABLE public.referral_requests (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    referrer_user_id integer NOT NULL,
    company_id integer,
    referee_client text NOT NULL,
    referee_client_email text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status text DEFAULT 'pending'::text NOT NULL
);
 %   DROP TABLE public.referral_requests;
       public         heap    testusr    false            �            1259    16585    referral_requests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.referral_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.referral_requests_id_seq;
       public          testusr    false    221            �           0    0    referral_requests_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.referral_requests_id_seq OWNED BY public.referral_requests.id;
          public          testusr    false    220            �            1259    16569    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id text NOT NULL,
    user_id integer NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sessions;
       public         heap    testusr    false            �            1259    16568    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          testusr    false    219            �           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          testusr    false    218            �            1259    16553    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    company_id integer
);
    DROP TABLE public.users;
       public         heap    testusr    false            �            1259    16552    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          testusr    false    217            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          testusr    false    216                       2604    16545    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    214    215    215                       2604    16589    referral_requests id    DEFAULT     |   ALTER TABLE ONLY public.referral_requests ALTER COLUMN id SET DEFAULT nextval('public.referral_requests_id_seq'::regclass);
 C   ALTER TABLE public.referral_requests ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    221    220    221                       2604    16572    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    218    219    219                       2604    16556    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    216    217    217            �          0    16542 	   companies 
   TABLE DATA           -   COPY public.companies (id, name) FROM stdin;
    public          testusr    false    215   `-       �          0    16586    referral_requests 
   TABLE DATA           �   COPY public.referral_requests (id, username, title, content, referrer_user_id, company_id, referee_client, referee_client_email, created_at, status) FROM stdin;
    public          testusr    false    221   �-       �          0    16569    sessions 
   TABLE DATA           S   COPY public.sessions (id, session_id, user_id, expires_at, created_at) FROM stdin;
    public          testusr    false    219   J0       �          0    16553    users 
   TABLE DATA           P   COPY public.users (id, email, username, password, role, company_id) FROM stdin;
    public          testusr    false    217   �2       �           0    0    companies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.companies_id_seq', 8, true);
          public          testusr    false    214            �           0    0    referral_requests_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.referral_requests_id_seq', 7, true);
          public          testusr    false    220            �           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 11, true);
          public          testusr    false    218            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          testusr    false    216                       2606    16551    companies companies_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_key;
       public            testusr    false    215                       2606    16549    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            testusr    false    215            &           2606    16595 (   referral_requests referral_requests_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_pkey;
       public            testusr    false    221            "           2606    16577    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            testusr    false    219            $           2606    16579     sessions sessions_session_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);
 J   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_session_id_key;
       public            testusr    false    219                       2606    16562    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            testusr    false    217                        2606    16560    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            testusr    false    217            )           2606    16601 3   referral_requests referral_requests_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 ]   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_company_id_fkey;
       public          testusr    false    221    3356    215            *           2606    16596 9   referral_requests referral_requests_referrer_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_referrer_user_id_fkey FOREIGN KEY (referrer_user_id) REFERENCES public.users(id);
 c   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_referrer_user_id_fkey;
       public          testusr    false    3360    221    217            (           2606    16580    sessions sessions_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_user_id_fkey;
       public          testusr    false    217    3360    219            '           2606    16563    users users_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_company_id_fkey;
       public          testusr    false    3356    217    215            �   �   x�M�;�0 ��>EN���^h�T���%VkɲQ�V����7�-�foa܁�-��Aq���M#V�Q�2�!��&saӌhXqM��b)��њĤ/����bC��ȹp�x�:Q(���P�Q]7�� �5.�      �   I  x�}��n�0E��Wp_�Ћ��U�p�I�����4��P�BRI��J�kH`@� ��ãa��^��kгt/����A���������|�~Z��2����s�ۃi�����u�,e9۶�ϷX�,�N
_���{a0�,Ɋ�dq��y��
Y�H��ȿ$)�q�8��7ب4�a�����@�7�
&x�y�G��P���,�?B�����
-�1�'��JfB&���2gk�{~� ��a�և���ۀ�y��������ڳBn�{��T�ų�u�XFB�F��-�(�.ƏieR�K�͋<]���i����c�zKΎ^���օ3j8�!�����i׭�3�01��U��e�&�sDɾiE�ƶ�[��z�q��W`��`��2-�����.�ܫi[��`����t�[c��L���4����)}�^V�R,�e~9�s�K]�/��ķFC��t384/t2�B�O��=��'��T�ЩfY�h(~DTV��$�"�/d.�<!_Y�.�pm�N��PǗm��iBO��r������G�E��q�޴u�FD�ǘټʥ�J�]`�����xr      �   �  x�m�َ�@��kx�yIUQ$^�5����h&1
������d�;J�����V(�KJ	��}g�Z1;�e�DV:q�6�־��!�ڃ�)@��5�����
d� �K"o�@$"�Ho�F��7lu�#�w�c�ކ��܏�E����u;-t�~d�"(fߙ�E��H����"��U�f8��9���r)���4JZ�����%	�5�P����`޽9����Ѱ*�Ar
>¹a��Bw�@[���ع��}W0T1��,s^��gc��7#��Z�G&�ls8�Oo'�Ϗ�
�|퇫�D��Ę� Rg�'�p���d�����V�,*'���������u�e5{c�/��Ǣb,AH����BE&���t���5Ui��.�8�|k��t�gv�1���<3TS��.) k�WbH�Bi8;����;U�d�H<3[&Z�H��vk��zS>�Aw^��)��K� L��WbTT�dncd��0s�ma�r�9GZ�/-���f�X�/�S���� �)/I&\�@�R;]lZ��5��kn��Hq��0Y>5��~-�:e�s7��<R$H��Ok�W�!H����Ҏ��v��$��|��N{ҧFw�@��*.��\w��Ge� �;�Iy>�ߒ(� /�      �   _  x�u�O��<�5|
�f��2;�QA&wS�XZ�S�|���w��n�I��<T(GD:Q���59��<�bZnW�G!��&�>�Z6,C_�����e^���8����p���ni|��Q�%��B�.��&EFY±BG	Oj��%�J�cE�EXt������VIO���]%�D;c��@�����lk�'|����h���&^9�lg m/	�6�W��
DE8QL�����v�>)�E7PB-���)�7\�,6��vzsԴ���$��Mch�T�.���<�;��{��	��?���/x?7Yh��6j�!�W�CJ���g �6_�6�3����8-��B`5�:H`��Hz�)�4(Ƅ^��N��~U=gV尭A�k�qꮦS;�{��/s;n���'�0pXp+��}�8"Iu�5�79���{�=w�F
��ypP��Rk�����w�Ԋ'�[`�����P_�y�z�u�8�
��Tdy��	��'2����,L��ooIt4�� 0�KȖm��ܵ��댪z��������,UԻ�	�k�,���ppx��7g����Mn�W�]vQp�Q�z�[~-��s\�8����r�|�R�?�(���%[     