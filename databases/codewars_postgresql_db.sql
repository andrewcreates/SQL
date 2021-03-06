PGDMP         8                x           postgres    12.2    12.3 D    _           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            `           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            a           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            b           1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            c           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2914                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            d           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    16762    bottom_half_kata    TABLE     y   CREATE TABLE public.bottom_half_kata (
    id integer NOT NULL,
    legs integer NOT NULL,
    tails integer NOT NULL
);
 $   DROP TABLE public.bottom_half_kata;
       public         heap    postgres    false            �            1259    16760    bottom_half_kata_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bottom_half_kata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bottom_half_kata_id_seq;
       public          postgres    false    211            e           0    0    bottom_half_kata_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bottom_half_kata_id_seq OWNED BY public.bottom_half_kata.id;
          public          postgres    false    210            �            1259    16775    demographics    TABLE     �   CREATE TABLE public.demographics (
    id integer NOT NULL,
    name character varying NOT NULL,
    birthday date NOT NULL,
    race character varying NOT NULL
);
     DROP TABLE public.demographics;
       public         heap    postgres    false            �            1259    16773    demographics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.demographics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.demographics_id_seq;
       public          postgres    false    213            f           0    0    demographics_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.demographics_id_seq OWNED BY public.demographics.id;
          public          postgres    false    212            �            1259    24931    duplicate_heroes    TABLE     �   CREATE TABLE public.duplicate_heroes (
    id integer NOT NULL,
    class character varying NOT NULL,
    hero character varying NOT NULL
);
 $   DROP TABLE public.duplicate_heroes;
       public         heap    postgres    false            �            1259    24929    duplicate_heroes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.duplicate_heroes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.duplicate_heroes_id_seq;
       public          postgres    false    219            g           0    0    duplicate_heroes_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.duplicate_heroes_id_seq OWNED BY public.duplicate_heroes.id;
          public          postgres    false    218            �            1259    16797    eusales    TABLE     �   CREATE TABLE public.eusales (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric NOT NULL,
    card_name character varying NOT NULL,
    card_number character varying NOT NULL,
    transaction_date date NOT NULL
);
    DROP TABLE public.eusales;
       public         heap    postgres    false            �            1259    16795    eusales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.eusales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.eusales_id_seq;
       public          postgres    false    217            h           0    0    eusales_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.eusales_id_seq OWNED BY public.eusales.id;
          public          postgres    false    216            �            1259    16746    factors_kata    TABLE     v   CREATE TABLE public.factors_kata (
    id integer NOT NULL,
    base integer NOT NULL,
    factor integer NOT NULL
);
     DROP TABLE public.factors_kata;
       public         heap    postgres    false            �            1259    16744    factors_kata_id_seq    SEQUENCE     �   CREATE SEQUENCE public.factors_kata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.factors_kata_id_seq;
       public          postgres    false    207            i           0    0    factors_kata_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.factors_kata_id_seq OWNED BY public.factors_kata.id;
          public          postgres    false    206            �            1259    16728    people    TABLE     {   CREATE TABLE public.people (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL
);
    DROP TABLE public.people;
       public         heap    postgres    false            �            1259    16726    people_id_seq    SEQUENCE     �   CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.people_id_seq;
       public          postgres    false    205            j           0    0    people_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;
          public          postgres    false    204            �            1259    16754    top_half_kata    TABLE     v   CREATE TABLE public.top_half_kata (
    id integer NOT NULL,
    heads integer NOT NULL,
    arms integer NOT NULL
);
 !   DROP TABLE public.top_half_kata;
       public         heap    postgres    false            �            1259    16752    top_half_kata_id_seq    SEQUENCE     �   CREATE SEQUENCE public.top_half_kata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.top_half_kata_id_seq;
       public          postgres    false    209            k           0    0    top_half_kata_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.top_half_kata_id_seq OWNED BY public.top_half_kata.id;
          public          postgres    false    208            �            1259    16786    ussales    TABLE     �   CREATE TABLE public.ussales (
    id integer NOT NULL,
    name character varying NOT NULL,
    price numeric NOT NULL,
    card_name character varying NOT NULL,
    card_number character varying NOT NULL,
    transaction_date date NOT NULL
);
    DROP TABLE public.ussales;
       public         heap    postgres    false            �            1259    16784    ussales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ussales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ussales_id_seq;
       public          postgres    false    215            l           0    0    ussales_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ussales_id_seq OWNED BY public.ussales.id;
          public          postgres    false    214            �            1259    16721    visits    TABLE     �   CREATE TABLE public.visits (
    id integer NOT NULL,
    entry_time timestamp without time zone NOT NULL,
    exit_time timestamp without time zone NOT NULL
);
    DROP TABLE public.visits;
       public         heap    postgres    false            �
           2604    25046    bottom_half_kata id    DEFAULT     z   ALTER TABLE ONLY public.bottom_half_kata ALTER COLUMN id SET DEFAULT nextval('public.bottom_half_kata_id_seq'::regclass);
 B   ALTER TABLE public.bottom_half_kata ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �
           2604    25047    demographics id    DEFAULT     r   ALTER TABLE ONLY public.demographics ALTER COLUMN id SET DEFAULT nextval('public.demographics_id_seq'::regclass);
 >   ALTER TABLE public.demographics ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �
           2604    25048    duplicate_heroes id    DEFAULT     z   ALTER TABLE ONLY public.duplicate_heroes ALTER COLUMN id SET DEFAULT nextval('public.duplicate_heroes_id_seq'::regclass);
 B   ALTER TABLE public.duplicate_heroes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �
           2604    25049 
   eusales id    DEFAULT     h   ALTER TABLE ONLY public.eusales ALTER COLUMN id SET DEFAULT nextval('public.eusales_id_seq'::regclass);
 9   ALTER TABLE public.eusales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �
           2604    25050    factors_kata id    DEFAULT     r   ALTER TABLE ONLY public.factors_kata ALTER COLUMN id SET DEFAULT nextval('public.factors_kata_id_seq'::regclass);
 >   ALTER TABLE public.factors_kata ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �
           2604    25051 	   people id    DEFAULT     f   ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);
 8   ALTER TABLE public.people ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    25052    top_half_kata id    DEFAULT     t   ALTER TABLE ONLY public.top_half_kata ALTER COLUMN id SET DEFAULT nextval('public.top_half_kata_id_seq'::regclass);
 ?   ALTER TABLE public.top_half_kata ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �
           2604    25053 
   ussales id    DEFAULT     h   ALTER TABLE ONLY public.ussales ALTER COLUMN id SET DEFAULT nextval('public.ussales_id_seq'::regclass);
 9   ALTER TABLE public.ussales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            T          0    16762    bottom_half_kata 
   TABLE DATA           ;   COPY public.bottom_half_kata (id, legs, tails) FROM stdin;
    public          postgres    false    211   I       V          0    16775    demographics 
   TABLE DATA           @   COPY public.demographics (id, name, birthday, race) FROM stdin;
    public          postgres    false    213   lI       \          0    24931    duplicate_heroes 
   TABLE DATA           ;   COPY public.duplicate_heroes (id, class, hero) FROM stdin;
    public          postgres    false    219   �N       Z          0    16797    eusales 
   TABLE DATA           \   COPY public.eusales (id, name, price, card_name, card_number, transaction_date) FROM stdin;
    public          postgres    false    217   �R       P          0    16746    factors_kata 
   TABLE DATA           8   COPY public.factors_kata (id, base, factor) FROM stdin;
    public          postgres    false    207   #^       N          0    16728    people 
   TABLE DATA           /   COPY public.people (id, name, age) FROM stdin;
    public          postgres    false    205   D`       R          0    16754    top_half_kata 
   TABLE DATA           8   COPY public.top_half_kata (id, heads, arms) FROM stdin;
    public          postgres    false    209   �e       X          0    16786    ussales 
   TABLE DATA           \   COPY public.ussales (id, name, price, card_name, card_number, transaction_date) FROM stdin;
    public          postgres    false    215   f       L          0    16721    visits 
   TABLE DATA           ;   COPY public.visits (id, entry_time, exit_time) FROM stdin;
    public          postgres    false    203   qq       m           0    0    bottom_half_kata_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.bottom_half_kata_id_seq', 1, false);
          public          postgres    false    210            n           0    0    demographics_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.demographics_id_seq', 1, false);
          public          postgres    false    212            o           0    0    duplicate_heroes_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.duplicate_heroes_id_seq', 126, true);
          public          postgres    false    218            p           0    0    eusales_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.eusales_id_seq', 1, false);
          public          postgres    false    216            q           0    0    factors_kata_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.factors_kata_id_seq', 1, false);
          public          postgres    false    206            r           0    0    people_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.people_id_seq', 1, false);
          public          postgres    false    204            s           0    0    top_half_kata_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.top_half_kata_id_seq', 1, false);
          public          postgres    false    208            t           0    0    ussales_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ussales_id_seq', 1, false);
          public          postgres    false    214            �
           2606    16767 &   bottom_half_kata bottom_half_kata_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.bottom_half_kata
    ADD CONSTRAINT bottom_half_kata_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.bottom_half_kata DROP CONSTRAINT bottom_half_kata_pkey;
       public            postgres    false    211            �
           2606    16783    demographics demographics_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.demographics
    ADD CONSTRAINT demographics_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.demographics DROP CONSTRAINT demographics_pkey;
       public            postgres    false    213            �
           2606    24939 &   duplicate_heroes duplicate_heroes_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.duplicate_heroes
    ADD CONSTRAINT duplicate_heroes_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.duplicate_heroes DROP CONSTRAINT duplicate_heroes_pkey;
       public            postgres    false    219            �
           2606    16805    eusales eusales_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.eusales
    ADD CONSTRAINT eusales_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.eusales DROP CONSTRAINT eusales_pkey;
       public            postgres    false    217            �
           2606    16751    factors_kata factors_kata_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.factors_kata
    ADD CONSTRAINT factors_kata_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.factors_kata DROP CONSTRAINT factors_kata_pkey;
       public            postgres    false    207            �
           2606    16733    people people_id_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_id_key UNIQUE (id);
 >   ALTER TABLE ONLY public.people DROP CONSTRAINT people_id_key;
       public            postgres    false    205            �
           2606    16759     top_half_kata top_half_kata_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.top_half_kata
    ADD CONSTRAINT top_half_kata_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.top_half_kata DROP CONSTRAINT top_half_kata_pkey;
       public            postgres    false    209            �
           2606    16794    ussales ussales_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ussales
    ADD CONSTRAINT ussales_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ussales DROP CONSTRAINT ussales_pkey;
       public            postgres    false    215            �
           2606    16725    visits visits_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.visits DROP CONSTRAINT visits_pkey;
       public            postgres    false    203            �
           1259    16735 
   row number    INDEX     C   CREATE INDEX "row number" ON public.people USING btree (id, name);
     DROP INDEX public."row number";
       public            postgres    false    205    205            �
           2606    16768 )   bottom_half_kata bottom_half_kata_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bottom_half_kata
    ADD CONSTRAINT bottom_half_kata_id_fkey FOREIGN KEY (id) REFERENCES public.top_half_kata(id);
 S   ALTER TABLE ONLY public.bottom_half_kata DROP CONSTRAINT bottom_half_kata_id_fkey;
       public          postgres    false    2754    211    209            T   Y   x���A��R1�$M������&H:|W�U10僭
&"��>,H�A�QP^	kWl\{:=�<��#&.\��~q�*�ˠ��#��~$�{95      V   \  x��W�n�6}�~���$EQ����N�8hѢ/���J%�Q��3Cj�����6Ź�9sf(ث�}�LXS�<p��8~�wq�5��k�WgO��$�}:��-?�~��0�]�^�a@#,���3F{][�[�89�u�^�b�����%\���k��7M@�T��'�sq�۵tf17Y�82��~��Wl:ۿmk0I��s�n�~g���!��Krog\ήb�5u�ߛ�0ܙ���%�+H�dW�O��!&� ������;� ,���}��Ir��-J����!a��;�B��3��eH�w�Q��C��1�Q�`�l����B��q �?�c����}D�q'�xg�h�-ցO4�݆&$8���$��>��a��H@�m@{P's )u)����DWb� ��y�`�1�K��C〽hJ����K`�oR�	����h���gNhd�"��b�����H�LUL\���sρ�K�hV���C�kEY��o��dK�R�F@L��{�b��Z�0 O�?�0
Y ODMm QQ�;��wM* `�p_��.��_�Si(\>nɮ=�0�^Y8�A�)��_��g��-�=Z���9�*�_���j^Z����)�}� ��e�2QUq��GCRC���:̵�N����	d���6_3`�"0�`�������ɢb�6X�#�)9��r m�d	�}��܀���1�pI2I��@" `Iի-6A�\l�8)M`�t9��=M7`&@3;�K��?�aL�c��8L��"��O�s(%�F�'u�ΖaLu�듺���-vt��H��!o��ĴbW_T�O�,5�?��I��ă�bo|<��MB�d_�����s�YM@�נ�c�!I��0�i�h�I�3�_�Jw9��_�X�Q)��:�A����i�CSU�K�sh�8���9C*/y�m4V�]���栥a+W@�5�� ��b�*%z:?�8t/�m�����q�[p��@��7}��I��+��]t!�,䪑ZA���wy�I�+�>�.m��&)_�,U��tGT�,v��U
Z��#O�U	�Xݚ��`�+�\Q������&��]w#UC���	�R���+xQYh�:��qI�;����w��o� �`w]���@h��lA��)ص�~jS�Vdo���n��G��%�u���4�i|n�3�f箭�K���<@2a�H#_��p�T�M۰"��6c�۞���<�Ӂ����p�qhSqV�g/# O�m�� �m��	D�j��-l������,^�7�c��y��ג-���'<3��f�Y�<־MO��R��������qi.�ӻ*�g�MӅ>W
���>ر�c�^W��_��v�� ��      \   �  x�}V�v�6]�_�]V���2�6�ĞNcO����Y�c��L�O����
Y6�@ڕ��.�B��5�R�w�j���#�ZYz�n��":�
k��؅�O0�K�>��ʙ�����tf&2���5�B�zƅEWV�#����	 ��K�Aǀ'�aQ8���Πp���8F���C�{PX�$꽪V[:8��%+;Z��Й�g��g��q#� ީ��\Hy@�4:ܚ��ao�vٖ@#U :<14��2�v=�JJR�S>��?�L)�����b*��>�g�D��Q��fY���G���ʉ�<�8�s%B�7mj�BKX��B��uUaUK�Q2KF��{��z%��|*
3��ɥ�I9��u���EQgo�r#���MGm\�c\5�\:&Z�o�z֒�K������\QD�kj~��vU��F1sݶ?t\�=ڕ+�D�2�/XT5�E�1׽S�]������yq�_j�&�+�݈XrGS\�	�!s=�ݖ"�$<��1�9��]u"�<�,\�f"�,<�o��-s"���N�8ÆąT�1Rkm��	'�3n������|��8���V��d|q崕ń��[:�p6��\��3��xS��%��Ƅ~pN�p:&gtb��lf��nN�A�"�T���6�d�R�|'�L�޸Y�KW����B�t졑��7-��#�<˪%��I��m�4�˧m�W;J��)�h":�V�"�����iA��̟���@d{!�GG�G�,���R������&����m�,�#��9e���=�M+!��>�VMiId,�<8]49����s�Ι�t��3�=�U��l7�9�nN�����w�a<r�`�}o��� ���9�XC��2@�[@�/� 9���� �| �;-���w� ��@ �� �I:c�<����˞P�E?!@r93 ��- c,C~��@W���v��݄m��
��ЮYA�����c�%@�l�L�}�ρ�_����      Z   M  x��Y�n��|~����w>�R�ė8����L��5+�c�bC���i����8Z���U�m��ћC-�j���z#k�\<��
�nT+�����*�?o���_���ĜE!����,̼�}�u��}�/�ˋl���Z�e�~lU�Z��ߪ5"���&\�P��,��^̾��Fn��J�������D'YY���7Qm��zӨ�N�&\�%l�&[���}��7�u-��h6�̂$b�%j�/�w�+Z�o񍗲�%�%[T�^���f�ǥ���m�{����YNOK/c����Y��a+6�C��F�E]��Z�p^��uU~�u7��ċ� b+�����F�,N�">=,����3^z{8ԲyV&O[�s�u�dE ��p����ΒQ�e9+PV�ryl�oy���N&�R��>��^T�{��;ٱ2�}y����y���@FF�@�C4���ؿ0�ݶ��h�Û��xkw�D3ӳ��x�~4b�,�q)��A�n��_����j��t�³�s��@��{���P��$�P�<c���QS�Z5H���Ĕ�vߛ�ߠ6��Ut,�AY�/���`ݷ�(1%&Og	�7��#�?\��@�q#@ë>-��Ehfv�o��_��	+^���m�������۷�妝�m�(�H@�PL�A�45��, K�-���_��a��-ǒ"�Rv%j!����*7���ҕ&�ؕj��,��(z#�P,N%#��+)wS�粦|� h�v�i������6�u�#��^�ǀ5E���Q6�����8�"�#�G#�~��^Z�,��"e���8
�^c(�%N)�$�Q1p��kM�d�?���)cw]����޹"q��^�i�м�үx\ʃ�d�����v�0�����A���J��IY�,\���^����Ȑ��@�g��Ol� ����Z��7W��
R�ϊe��滌�3��h(�e�GIW͈�(���Bx5�׶��eA
ܑ�OQod�1'��^T�R�/�b3��+���
� �R�pG���4'��2*�td�C����Z�
W�t��?�j�$K�V�5x�n�R�N�8����9<-O�J}���E-��2/�'��N��� �v����� yj��_��kX��]�y�R"@G:y�t��IN>L��NFq�c�g��(T��?����Ɵ��I��X^	��˾U���$��&��}*/AZ��#�� ��#��F�?��ӓl�j>�U\L�q������F��݂�it���v�56�h�;�&u2�QD���;�s`���@��~6!2�Y#&i�d챑�
u���h���G��Xj\�
1P��yRF��M=�� |L��L�~���(yAr�E�TXH�s��A�ɱ�D9hK�i�j~��ët93F�w�X�3�+�<gVϡR��9�=ڒ��=e��T1ą���T�}`=���h&>��1����c���q�Gc1k�o��M��#b�q� F�@�;Ǜ����OO���� ~�bF�T��!��V� LO.+��
)8�b��c��1��k���
�ٔ<#d�K�<K�a��O|��H�[��gfaI��O5�d7 .-hVo�;����>��y�̧ԃ�x.��yH����5-��ظ���r�:��,
�4>^^��D?���3�rlh�@�J�yl�u�A7�zV��b�r�$�>`��;f��%Ș�W2젛Hjڒ?}]hʗ����îVYn}�1��~��S�)L=�Ƒ��c6|i����Gt��t����h��4d!��a���sb���C����VH0S�6�
ݑՉm(&�e�l=�57QdvT�
��k�׍s�H��D^6S��dv_#��K�Ϡ.���i�O��1�"�]���w���� ��On�%FzR
?��s
O��:$[��/�f�nt'���E�F.)��$�*w��V�_�5%K��̀�jH�(�㹐�Z+�����N�(�"��/N( ٖl%T��c�?}^f����f�i0��V���,(�^���ؘW*��wHs`��. +Xr�?�5�����.>�[N$<K.����>��z��)��^ݲ��>��{i&�RW��|{��g��9��������j׌�KgY�Y��PQ [�Ɯ�@�'�x�|T�|�����K�A��<	cO��F�����L�qʒ� �Yx�
���h�$\��#Z���Íf|@���0_UM"��~s��k�}\߬���~ȃl����R���?=��pi���Twֈ�L7o+l_-4�J���\�^d5��F-B��9�Xwx�%��Tk�C-���	5;o����~�!�~-�_)�8��d��������q�LAN���W��w�ٹ�$�A^��B5�/���=:�������;����u�2lN�l��>�wS77�L>sY��^��.f2m'Χ����i�ޅe2c?U���`6+'$�o�/����-���>P�1ft`Z�^���u��ˢ=қ;*yh�T ���*8,��W�a��ڽ�ӕ�mk�ߡ���F��'Ļ���0W�Fd��5�v�����;}����I���k��j�+�;�g�
8�G,��""�q��d꟫�y�)�ղ�>�͜�����.kC�ވ���9\�5Z�+�ڑ�#��qv^�>�G�N�"��2���f�3D��U
��v��fP3�Lg�fб�
՘yH( k5�s�����zeS��p�A��j�Đ�*t+���~E=]�����^9?���YK����u��J�$��u+�3���^�$U�	��ŕia~/���vJm#�����Ns��WB�����$0<���j't�ƕ8@��Gݸ�{cȽ����W��      P     x�%�Qr�0C��0���]z�s����f#!�&7{�J]��zŬZ,5ď��<{2�$s�m-ɦH���$�.Yg���-2�~ab���{���w
�A��]}T>(kX�Z��w�%@���漍:�MW7�)H��x?h�y�v|�����S�dJ�?�|D�q��Ӳe�O}�L��{�Y��.ŷuץ��s�����9F�ʾ�^Pl�4��o��#Y�����qdΎ�f��ᰡuk�ǞF�D��F��-����!J��7iP��J$c��*_P��c�3L"�ڭy���D"wz��ο=�H�#fAd�{���B�tt�g�h�8:�|�![2�5��l������4����R`����򙥥o3�����7Z�l@F9f�����+Ν�׵v��h-p�uL��H�^z�X�/�k��uHE�w�7��$4�Ҿ2}b)����IK�m�܍�nr;��]��<�ԅ�S,�K�
��} �Et�[YH!����I<���:�7��5��i�?��,`	�ޚ�&�?���8��      N   X  x�UU�r�6}^|� ���Ѷ۱�VO;}����
< i��=K������)ݚx��g#;GM�2ژ���cx���5��ig�Q�&��n��=e�*�vG��L|�E�6T檤�#3�iGvTe��_�G}b�a�BU�j�D~�7ՙj蛙��w�<Ԥ�����^�ȶ��T��w�����M�Pժ4���{��)��1x�
�f���#���9SZ�S���qy�Of:��N�ء�"S٨���ٙ^	�����V�Ō������g�(Ň���A��f��t��TiC_��ulВ��OT�nK[F���g�x��VY����h�x������e�����P�d�ugh�ŏ9]�i�A����Re�'~c�^)�AI;v���Ȍ9*�U�5qfp�T%*�iP�����Le}��8����A��Zz`7�o&��Xq$�?/���^��U��>G�ϸz��pV�]��� Ŭ���L�f0��=��Z\.�N~�b'�Q�[��4᠎�0����myM	�x��G(d��y����k�u���~bg��f8����8n��qyǢ�"�g1�#�g)=NS����-PksUd�ʮ����/�t��j�%�����q���9fQ��0��1�i��QEI����7��^�r"�P3جKU@|(�;�%�y����⋢��v��/���W�I�d�*ڋ�k���;�^9NTú���1:�.����RѪ2�s����v2M	AĻ�Ԧ�����]?Ê/�&�,�������{��,馿�H$����o��Rԩ���Q	��8Z,�ժ�WA}�pY"�l�#T��֭7Z������	�UBw��e�Qo6{��@��z\��y�>\V�@�D+�^�ITi����� J��������ΞE��n�c�{�#ᗪB8 I��֟�����<����`j
U5���4����<�����f0~B�.f�$a�T�	ᖗB[��%jL���6h���:�a�~���u���#��ٸqM׺  \Tx�$b���©�)U�� ���}���D�UB�O�#K֠i1��7X��������N]�n�D5�1ȞXV��h�<ŴӸ�_�QZ��F�Ԃa�M�V}Y�CHh~�G��قb��R�).�ք�~a�Ȼ)A�;BSo�?��bE(�˦�IAo.�Jql/�0K ��܅�"���	i���~������y*+�&+O��I��N�j�ڔv� ���YvbvI���qJ��S۪6�z��#��NT�e $� y���m�����Æ��w[!*�Е�ؿ��W���rD���m���2ўz��3X����D�bㅷ� ��r���CJ�韟�R��|�      R   X   x���DQ��I1#�G�^~�u�ز�XŃ^[x�e��B���C_C�X�0�iR�x
dW�1#_�uwY��Q�Ai�1��f��H�"�z      X   M  x��Y�n��|~����w>�R�ė8����L��5+�c�bC���i����8Z���U�m��ћC-�j���z#k�\<��
�nT+�����*�?o���_���ĜE!����,̼�}�u��}�/�ˋl���Z�e�~lU�Z��ߪ5"���&\�P��,��^̾��Fn��J�������D'YY���7Qm��zӨ�N�&\�%l�&[���}��7�u-��h6�̂$b�%j�/�w�+Z�o񍗲�%�%[T�^���f�ǥ���m�{����YNOK/c����Y��a+6�C��F�E]��Z�p^��uU~�u7��ċ� b+�����F�,N�">=,����3^z{8ԲyV&O[�s�u�dE ��p����ΒQ�e9+PV�ryl�oy���N&�R��>��^T�{��;ٱ2�}y����y���@FF�@�C4���ؿ0�ݶ��h�Û��xkw�D3ӳ��x�~4b�,�q)��A�n��_����j��t�³�s��@��{���P��$�P�<c���QS�Z5H���Ĕ�vߛ�ߠ6��Ut,�AY�/���`ݷ�(1%&Og	�7��#�?\��@�q#@ë>-��Ehfv�o��_��	+^���m�������۷�妝�m�(�H@�PL�A�45��, K�-���_��a��-ǒ"�Rv%j!����*7���ҕ&�ؕj��,��(z#�P,N%#��+)wS�粦|� h�v�i������6�u�#��^�ǀ5E���Q6�����8�"�#�G#�~��^Z�,��"e���8
�^c(�%N)�$�Q1p��kM�d�?���)cw]����޹"q��^�i�м�үx\ʃ�d�����v�0�����A���J��IY�,\���^����Ȑ��@�g��Ol� ����Z��7W��
R�ϊe��滌�3��h(�e�GIW͈�(���Bx5�׶��eA
ܑ�OQod�1'��^T�R�/�b3��+���
� �R�pG���4'��2*�td�C����Z�
W�t��?�j�$K�V�5x�n�R�N�8����9<-O�J}���E-��2/�'��N��� �v����� yj��_��kX��]�y�R"@G:y�t��IN>L��NFq�c�g��(T��?����Ɵ��I��X^	��˾U���$��&��}*/AZ��#�� ��#��F�?��ӓl�j>�U\L�q������F��݂�it���v�56�h�;�&u2�QD���;�s`���@��~6!2�Y#&i�d챑�
u���h���G��Xj\�
1P��yRF��M=�� |L��L�~���(yAr�E�TXH�s��A�ɱ�D9hK�i�j~��ët93F�w�X�3�+�<gVϡR��9�=ڒ��=e��T1ą���T�}`=���h&>��1����c���q�Gc1k�o��M��#b�q� F�@�;Ǜ����OO���� ~�bF�T��!��V� LO.+��
)8�b��c��1��k���
�ٔ<#d�K�<K�a��O|��H�[��gfaI��O5�d7 .-hVo�;����>��y�̧ԃ�x.��yH����5-��ظ���r�:��,
�4>^^��D?���3�rlh�@�J�yl�u�A7�zV��b�r�$�>`��;f��%Ș�W2젛Hjڒ?}]hʗ����îVYn}�1��~��S�)L=�Ƒ��c6|i����Gt��t����h��4d!��a���sb���C����VH0S�6�
ݑՉm(&�e�l=�57QdvT�
��k�׍s�H��D^6S��dv_#��K�Ϡ.���i�O��1�"�]���w���� ��On�%FzR
?��s
O��:$[��/�f�nt'���E�F.)��$�*w��V�_�5%K��̀�jH�(�㹐�Z+�����N�(�"��/N( ٖl%T��c�?}^f����f�i0��V���,(�^���ؘW*��wHs`��. +Xr�?�5�����.>�[N$<K.����>��z��)��^ݲ��>��{i&�RW��|{��g��9��������j׌�KgY�Y��PQ [�Ɯ�@�'�x�|T�|�����K�A��<	cO��F�����L�qʒ� �Yx�
���h�$\��#Z���Íf|@���0_UM"��~s��k�}\߬���~ȃl����R���?=��pi���Twֈ�L7o+l_-4�J���\�^d5��F-B��9�Xwx�%��Tk�C-���	5;o����~�!�~-�_)�8��d��������q�LAN���W��w�ٹ�$�A^��B5�/���=:�������;����u�2lN�l��>�wS77�L>sY��^��.f2m'Χ����i�ޅe2c?U���`6+'$�o�/����-���>P�1ft`Z�^���u��ˢ=қ;*yh�T ���*8,��W�a��ڽ�ӕ�mk�ߡ���F��'Ļ���0W�Fd��5�v�����;}����I���k��j�+�;�g�
8�G,��""�q��d꟫�y�)�ղ�>�͜�����.kC�ވ���9\�5Z�+�ڑ�#��qv^�>�G�N�"��2���f�3D��U
��v��fP3�Lg�fб�
՘yH( k5�s�����zeS��p�A��j�Đ�*t+���~E=]�����^9?���YK����u��J�$��u+�3���^�$U�	��ŕia~/���vJm#�����Ns��WB�����$0<���j't�ƕ8@��Gݸ�{cȽ����W��      L   ]  x�UR�m�0�����u˳t�9*E� �c(^��C�@⥴�&(��b{Hl�OSd��Ó��%:��ë�tKs�&Ć^<�%M����:<}��k���J���'��Oc�I�9ɼ�6j}R�:��r��X&�\J���|�;���b��'/�e53��X�h)o+Ef�#�7�c���W��t)��NAZ�8 ��~�wb��6ԟut$�Fݽ�Qj�t�n�lW���'҉c�n�^z%Lg�����6�مU` �`'$���Kp��K��P� ���^^ێV�t'���PM��/r?�.M��I��/E�!Q�d@o���-tF�� ������2��;� ��w5�W7��x|�1��.�p     