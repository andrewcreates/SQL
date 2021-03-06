PGDMP         7    	            x           US Census and OMB    12.2    12.3     7           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN9';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    25162    US Census and OMB    DATABASE     �   CREATE DATABASE "US Census and OMB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 #   DROP DATABASE "US Census and OMB";
                postgres    false            �            1259    25214    cbsa    TABLE     �   CREATE TABLE public.cbsa (
    cbsa_code integer NOT NULL,
    cbsa_name character varying,
    micro_metro character varying
);
    DROP TABLE public.cbsa;
       public         heap    postgres    false            �            1259    25223    cbsa_divisions    TABLE     �   CREATE TABLE public.cbsa_divisions (
    metropolitan_division_code integer NOT NULL,
    metropolitan_division_name character varying,
    cbsa_code integer,
    csa_code integer
);
 "   DROP TABLE public.cbsa_divisions;
       public         heap    postgres    false            �            1259    25295    csa    TABLE     d   CREATE TABLE public.csa (
    csa_code integer NOT NULL,
    csa_name character varying NOT NULL
);
    DROP TABLE public.csa;
       public         heap    postgres    false            �            1259    25253    us_counties    TABLE     �   CREATE TABLE public.us_counties (
    uid bigint NOT NULL,
    county_fips integer NOT NULL,
    county_name character varying NOT NULL,
    state_fips integer NOT NULL,
    cbsa_code bigint,
    csa_code integer
);
    DROP TABLE public.us_counties;
       public         heap    postgres    false            �            1259    25179    us_division_codes    TABLE     �   CREATE TABLE public.us_division_codes (
    division integer NOT NULL,
    division_name character varying,
    region_code integer
);
 %   DROP TABLE public.us_division_codes;
       public         heap    postgres    false            �            1259    25163    us_region_codes    TABLE     h   CREATE TABLE public.us_region_codes (
    region integer NOT NULL,
    region_name character varying
);
 #   DROP TABLE public.us_region_codes;
       public         heap    postgres    false            �            1259    25192 	   us_states    TABLE     �   CREATE TABLE public.us_states (
    state_fips integer NOT NULL,
    name character varying,
    postal_abbreviation character varying,
    region_code integer,
    division_code integer
);
    DROP TABLE public.us_states;
       public         heap    postgres    false            1          0    25214    cbsa 
   TABLE DATA           A   COPY public.cbsa (cbsa_code, cbsa_name, micro_metro) FROM stdin;
    public          postgres    false    205   _$       2          0    25223    cbsa_divisions 
   TABLE DATA           u   COPY public.cbsa_divisions (metropolitan_division_code, metropolitan_division_name, cbsa_code, csa_code) FROM stdin;
    public          postgres    false    206   �N       4          0    25295    csa 
   TABLE DATA           1   COPY public.csa (csa_code, csa_name) FROM stdin;
    public          postgres    false    208   �R       3          0    25253    us_counties 
   TABLE DATA           e   COPY public.us_counties (uid, county_fips, county_name, state_fips, cbsa_code, csa_code) FROM stdin;
    public          postgres    false    207   X_       /          0    25179    us_division_codes 
   TABLE DATA           Q   COPY public.us_division_codes (division, division_name, region_code) FROM stdin;
    public          postgres    false    203   �       .          0    25163    us_region_codes 
   TABLE DATA           >   COPY public.us_region_codes (region, region_name) FROM stdin;
    public          postgres    false    202   z�       0          0    25192 	   us_states 
   TABLE DATA           f   COPY public.us_states (state_fips, name, postal_abbreviation, region_code, division_code) FROM stdin;
    public          postgres    false    204   ��       �
           2606    25230 "   cbsa_divisions cbsa_divisions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.cbsa_divisions
    ADD CONSTRAINT cbsa_divisions_pkey PRIMARY KEY (metropolitan_division_code);
 L   ALTER TABLE ONLY public.cbsa_divisions DROP CONSTRAINT cbsa_divisions_pkey;
       public            postgres    false    206            �
           2606    25221    cbsa cbsa_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.cbsa
    ADD CONSTRAINT cbsa_pkey PRIMARY KEY (cbsa_code);
 8   ALTER TABLE ONLY public.cbsa DROP CONSTRAINT cbsa_pkey;
       public            postgres    false    205            �
           2606    25302    csa csa_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.csa
    ADD CONSTRAINT csa_pkey PRIMARY KEY (csa_code);
 6   ALTER TABLE ONLY public.csa DROP CONSTRAINT csa_pkey;
       public            postgres    false    208            �
           2606    25260    us_counties us_counties_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.us_counties
    ADD CONSTRAINT us_counties_pkey PRIMARY KEY (uid);
 F   ALTER TABLE ONLY public.us_counties DROP CONSTRAINT us_counties_pkey;
       public            postgres    false    207            �
           2606    25186 (   us_division_codes us_division_codes_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.us_division_codes
    ADD CONSTRAINT us_division_codes_pkey PRIMARY KEY (division);
 R   ALTER TABLE ONLY public.us_division_codes DROP CONSTRAINT us_division_codes_pkey;
       public            postgres    false    203            �
           2606    25170 $   us_region_codes us_region_codes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.us_region_codes
    ADD CONSTRAINT us_region_codes_pkey PRIMARY KEY (region);
 N   ALTER TABLE ONLY public.us_region_codes DROP CONSTRAINT us_region_codes_pkey;
       public            postgres    false    202            �
           2606    25245    us_states us_states_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT us_states_pkey PRIMARY KEY (state_fips);
 B   ALTER TABLE ONLY public.us_states DROP CONSTRAINT us_states_pkey;
       public            postgres    false    204            �
           2606    25231    cbsa_divisions fk_cbsa_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.cbsa_divisions
    ADD CONSTRAINT fk_cbsa_code FOREIGN KEY (cbsa_code) REFERENCES public.cbsa(cbsa_code);
 E   ALTER TABLE ONLY public.cbsa_divisions DROP CONSTRAINT fk_cbsa_code;
       public          postgres    false    2723    206    205            �
           2606    25266    us_counties fk_cbsa_code    FK CONSTRAINT        ALTER TABLE ONLY public.us_counties
    ADD CONSTRAINT fk_cbsa_code FOREIGN KEY (cbsa_code) REFERENCES public.cbsa(cbsa_code);
 B   ALTER TABLE ONLY public.us_counties DROP CONSTRAINT fk_cbsa_code;
       public          postgres    false    207    205    2723            �
           2606    25205    us_states fk_division_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT fk_division_code FOREIGN KEY (division_code) REFERENCES public.us_division_codes(division);
 D   ALTER TABLE ONLY public.us_states DROP CONSTRAINT fk_division_code;
       public          postgres    false    2719    204    203            �
           2606    25187     us_division_codes fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_division_codes
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 J   ALTER TABLE ONLY public.us_division_codes DROP CONSTRAINT fk_region_code;
       public          postgres    false    2717    202    203            �
           2606    25200    us_states fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 B   ALTER TABLE ONLY public.us_states DROP CONSTRAINT fk_region_code;
       public          postgres    false    202    2717    204            �
           2606    25261    us_counties fk_state_fips    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_counties
    ADD CONSTRAINT fk_state_fips FOREIGN KEY (state_fips) REFERENCES public.us_states(state_fips);
 C   ALTER TABLE ONLY public.us_counties DROP CONSTRAINT fk_state_fips;
       public          postgres    false    204    207    2721            1      x��}Mw�:���կ�n6������W�NK��RZ�ufQ��E�@�N����9s��N�)�5缈Zt��L\� ���@��������K�W֖�z��?&y���ym�ެ6u^�yf�ޥ��o�g��)`q)��[�o���1��_��cj�2�zϏ�o'��+�z�Ƀܜ_eݘU^&z�������R)���;z��ܺO��sk�W�[�i"����X���ww)>�"�GcK����ݸa�lC_$���ͽ��>���x�3����t-���_�Ɩ�z�$Bg䝾=�r,c�x4�l���C.tf�W��M���w��ݣ�GM�o������W�b�x�<k׌�z�!�%V��2�������nMU�Ԙ^FO?��awF��F��-U�iYs��9n?��&�7����b4)i�8ɜ��v��?�Nd�s���R���Aa��&�4��������e�qެy�?�� ��|��f����ʵc�{��9(�,�K��^V�9ϸ���Q_XO�?�~_X�ԅ�A�s��SW�����W;�j2���������8�5+[�7�N�/�3�q�ƶ�D*<Wm
␰IO�}m�r,E_�,�Ug����8`����J�>����\�� ����b�Gׅ�[ۻvMY����Tӷ�M4�/r���>/�UD��1�ֵQ��?�g؂�{�۹kA����S[޻b�^�l|�!���6�I,��y���E�5��}ͺ�h0_�lC�_�|�h&.�v`�C�ۮ�ɭ���Q�f_�A�h��+�z/.�Fw�����W���L�W&/�>_1���O�,ye��Wo�-�����Dye�:��]���-s��V��F���+C��c)5G��Y:�\�T/�WU�Gy�1o���,lo�D����2y��O	�U�j'��m�Ct�6�L���2BW��#�]#��4��8���З��һ��n5{yr��~h�b�
��7a⻲��0q��u�0u�ar�����K_o�Yp	���οa�L��	�ٕͶ��-^�G0�]�U0{dnM@g (F,� P�7"��D�dP�9m�sq�$)z��W��k(1�Y�%���\��eI;d7�g����E���(���e}���$��+_�^�>_U�&$l��o8�[����̞�"r������� �������'C���Tt�-�����򊼯���I�T�Xa��s5�1攀�Q�q���7��C���L�����u3�A�X
��y1�5Ƅ7�	����o
�+����H��y����J �>�򶓂
��M��;$ ���+���HA��G�)�9W��P)�-4��q��{mv�H����xr=��4�bŏ�~����w��{w��GqѦ0�ܟv���ȉ)8ћv�����y�a����DO+C�,���6k���V�R�v��'���;Z
̂g����lu)��[����}��+&lBtlO�Q��}����)��E2� y��_xTEG��C!���O�|p��dw۸�_�|>1������*��"�[�s+�� ���	�����&;����L�w�A�#baS8ڝ��&�Ƭ�f� 95v��^���[����At�/�G'(9�tJ:B��k�M��7^��j�ڶ��G�a�f��pN�i��f�kSl�'����zR���cI>�����M��j|������3��N�y5�[�V�B��b�Q��d�w�Rv�/����·�Z�����a�hb�����z��h�7E��{r��
�ܿF���}�{�`ry��dc��>��+�SL��uf`����Ҭ"�9m_<��c��wEN��_�Ó�u�cH�g3c!rM�	�ڮLw��S\�}6��s���>�(@!�#��>3�%nQŪ�L�׶�i�]��y?�A�	e��_�}Aȧ�}f�k2'�4��,̡���y���̘�ߛ|]F?�ҔF5M��>�G~rȢ�<BhM�|>���'���N/m�����ĵ+36��� �ص"���'�ґ������5��s�Uϟ"�@��6��!Ւ�m�o�.z"�
���X����)��`>�����vd�\=͒���2�˒��!��H�y� >Bi�q�y³�C�0kl�x����.� LTX�fk��I�n�Q���@F���<d`�As�����s B*�GV�|�9 !��Ƣ��w�y����gv�Q�Ԛ_�e��<H�6����!}H$�L���:H��`"W�>��Hcn`���n�6�3���?�'3 g��,���N5a�H�=�	�� ��d:�� $FDrpx�bd���O�
����ӂ�yz
���W؂4��!H��&�;>��oC�9�V�2A{�U�+s�x�C������!����7�O�"���"R< ��^���s��E����zm�W�����|E��~�u`mśj����Js�1�Rm\V�"	C�'�O�A$�|pP�ߘ��o��L���?�pP�{n?��0��W�d���)/5~���]��ALMQ �)�:�B{����(��԰����7�lD���nhF��6��O<�I�;b���Pj�T#�Sv�[���'@��FLT� �b�`���F�M�7nO��!�%o ���%��jH�É��*|�6�%�N�~°�Sj�&]��ђ�����b�xc3S7�#�S౽�l�}��;yc�rSf*[�dyc��K�4T9��<AMF̴���#]�,�� c���h_�������d1Ec2�CX6�F��K��A�|t5`(������qZ��Ϛ��h���6yM޿��$j�Г/5�#f�<����I,��)���|�3�[���9�@���»!O��޿�5��fM��0b�n�eC�p�,q���q�n�Ǒ�#����Y��צ��צh`>)\����fg4y���-3z1)�P�񜳥� bHоV�<���"p�1{����Û�yB��͡�)�9�Z�֬ۛ�J7ZLT]һ��!5���o�5����0]���iz��vV��C7pK.�_U�/�4r���%�;�
���	���c$�3�#���R��B��uU�I�H��-�?��r�0�%c,F��U�����V����x�}�<�� �ƐrG&��$|��,�c1�C@�]�K�1���\��s|�`
�r�9{��a����&b�niv!\%�ܖ�*|�Ǚ�nK2����i�chn}n5kB�ۊ�åF�Chp[��C4!+1��͛A���8�w'�n��%�7���ѹ��!�m�ݚ���q.zq1t��lO	$_ �� ��)�]c�	�X�rKKC�"�v �Pe#8%T��C��	P,W���&n��������tMD���� ���LNQ��˽�v����41�&F��)DT��� |7���b�J�SP;�q����8�g8�߭_7U��B��xP	�S�ј2���@�M�=�a^�I�0���E���¬�ڼ�Q��!����;G�C3~/y�UDy	�ISedc�6����=����[5�1'h������?�5 ? �	H68 B����y�ˢ�CW #�@$ �ؒ;�W��R�*v�����G�Ͷ�rD�_��_p~͞�lO��W�L�DZ��B� �L)d )����f��!�/���CC�F��Q�wr^�o�S�Jb(Nb,,Nb<îX,�qʶ5��	��?����~��I<∑�l/����}U�,}d�ߙUr�DN@b��[ɴ+���H����ήcG��F���|�(�]}/l��o��E���Hп��R�A�>c�6���bX0\i6��W�HM�x��~P{����w�}_c["���0՚�嵈��;v�:{@�qR��p���a��0���
KuSG<#����U��#�J�ȿ#F�Q�H�b��3`�#�d�Zek")?�����kCZ~ �hʬFΜ����~-쨧�9e<ѶX�!�+�@P0���-Đ��mpIv�����Y���I^��Hg�JI�1� ���l�"k��l�A ��     :� ���>_o�,����䃳#:P���A;�)�x6#���x�a�"o�H���D�\>�R����v^�}�_2q��0
��":� 0�k���4�pb����uWy�~��9|�vNɆX�ް������:憐�h����\�YC_��+��6���ޔt\;�9K\&x��$���8����V�Ʋ��PE��X�I"�!� J}]� �j"��?M�ժh�Q�C2pO?�i��T���uޙk��8@���/X�to�|:%�K�H�'�F]E�~�<�5vPŇb���G���i�A�%�Ct��rd�N�am�1)����\&�FU�roU'@����v9�b���ٕdw�+�h��+��tVQ�����j�������-�*3�6��E��"v
��{�s�4��ڕ}+(	��D~�q+a�	��^#"��#�w��;��?��]�ބ���}6	�3�|�/��4�5T9�0���P�y͚��qH�H 1�oVU���\۔Lv�P�K��G�N�CS�	��U����-����KU�ө��
�����5�D�a��}��J]�!��Bd�ꂇ�ٸ�~3�c(�Un�Rg�3����ܪ��}g��R��A�~�U��a�0�F[\%� <���M�8�AŜ�H��C��PoL�:�������ݪ�ڧ�������c{���%zl/f��D�/~E��	ADQ�� ��
�#UD|�[14_A�z�,��ٶ����CqDD7M���6��k���ۑ�+[���8�2�	�trl�������U�0��`ڇ��Bjn��Z�Ϙ �8"��=b� "���J���C_��V�T����)?�I�~��
Gvr����:;ٴ�0��#�L1LL�?���K�w����l��ɣy�Ͷ��fc o��"�� ��O�P� e!e.����9ML�˒=h+M�5[��&���  ���i=���ţ����!�x���8A���x�	��j�]�,.�Y�1���t��k����� *۵f�8���x�ޫ�vx��m�E��8G��x����
%Y��#�P�ÆH��4n'�����n�uIf�G�hb)�+���P^ �+�Cx�~̇�6�F1C�ç�Q1�����Mg�ʎِي3�N�����m��dkR����]Y\oI���dɇ��K����C.'�;��[�'��s���+'?��`��pa5c��0 Tt�d�Ng�Ӫ�%��.d@ܛwS5��(�����Q�w�@�d�s���Ո}b��l�idY1��og��S���f DE=
����҆��f���,�_��v�ʘ�~a�;�o2[i2� A`ȫ]U���#":��)�k�\J��D���4��q4:��6H,�d
c�Ѧ)�&�
@�5�@�@��;f��g$�*K苌�@�pl�t���q>'� �Y^�N�@W�
�<���/Ÿ�����H�c�:L�U�&����}h�b	t�">
�1��ለ�w���ۚ@�0Η����;%�5a��4
�
�q^f�ШyH����2�q�z�(]Jw��͵+?�A�E%�(�Y�����qHZ�9��pZU �^��@�0v%B�bVIQ5_��UA�	4� y@�0vU��h8� �B��?���]�fc��1��a�<؜��$B�����H s7˥�:j��5�cj���%;���m^jB�1ĺ:�;��a|(���P3��aBV�n�Y�;p�2�ʗK}9�ʇ��Mۨ�)Tm�f9@�pl/F����Z�p�[&f]�BuB���������R\DNs��@1�9�vd�d�M�:+B��2�R�)	���i�r���t��.���F�7]�wyaI�\�,\E F�\������#�L��h@����}6��,�]s�DP�6���CA�jc,�;p>��EH:@0f�����̠`h�c���2���$t��Ut$P������S�[�ā	�4�i'\xPW;L ^�d�������@�����*8<�$��\U�!��a�]c#]�
�I6��R���@�0ɦ���@�Jq%�ĚU��t��aҕ��%�&v����%��"٦��`bK�sen5d
�����j��Hp�5�W��8q�p<�[%��&���Ʌ��:\ɥ^����3�k+$�C��69Y�!�36=>=��h#B��Q��F��pS�>sT�ǀ���ꁒbt��'y6�[�����4[k���HXc�@YA���D,��b�%��1Zـ�����m�g��{S�ї��	��[\M_<eM��`�r���	�	d��&S�7=17#��b⸐�A�b@x���&�$[L܊��5�'L\�&x�@��5WLg�+��Y��w�@'��*M��:���vÉjJ�\�DH�k1�d�Z�K��ДM�� ��5�qC���U�>��	jn��UE!|�Ąfxu���Gty-�{��/��A)�nbT�2��oIk��ܙC4ۘ��/.��(#tZXS�NT*�����ɼ�D��j\���l"J�+yx�J6	�_A�� ��)��)&��Ĥ)�\��B61i�7��	t�ǥ(52�2	Bl�Z�-�@$� �����H$&���?� a9<�Ι��t�
�'��ʱ��Wl�=��*B�5��8�;J�d#
�	����s:g�W|�6�FQi���
�'��lpF2CdH^�c� 1?��^�b���N�5��	~µ�jU�D��)Dv4 �`���i���	.b`�'�*��[bfl��������n�ںT2�\�a0C�Z<1N��8��]<(#��~;M��n���-__c�??�?��5mO����| ���rP�q�_���tYxOf0�7���7P1��(=�p��r���:[�)]q�W�����\ -�bkO��0�s�)F1�\�o�����uG �*���9N��W��p/�3��hF��MQ�n���g���9}��5}�����O���6 u�g	���@�9� ���grH��GV���@��-����I9+�SL.�́�~���\v{�
�d�͛][[���Ixޙ����#�����HL,O Px.-�k�z]f�gj�|��`�@���Һ�2��r�g��#yw�&��c]������Z� 8�_�e���s�ٺ��0MÍ&b��s�5�s�Zd��?LQ�G�T�}��}m>4gPs��������S�=3��߄
����;<��e�!?4�-�r�����\&�ox���j������\���O\@$f�%�=Lͪ��&���ԩ��f�W��H K���[�U�		S����"���#b��u�֊�k|i�y^7�� 	�S�4E���*͑OO�@ϼY�~�� ��5��'�t����_��.�y�-V��A���iԯ	2����â17�9m��]aƛ���:Υ�����	������,L���T{��οZ��Gx`(x(��'�	L�o4�!T_|�p�WDf�1 <�d��6o$K��?�8[�i)U�K��b���<� �����T[H��?�-.Ֆ�¸1aJ�l�o���!�^bȦ�Un�#��7��e*�i^�m��<ݡ#8"6�t=�	 �J�) <t���ϔ#��ppwZV���pU0]gd�
ʃ)Y��֗<�!<���lE�rB��rX\�F���ԕ�іuM�=`��?Cr@�뜋���)TS�/��f�|��$=�U��Agn<�`�b�i{�E{yc�GM
&�G��)3�pv�>�E���G�ˏ�;���E����q�X���10�jg�<� d��ϻ�eZ�)����r�����҅�8����[8���W�/�����al\�0�9�m�0EIÔ�{�J7�	M�Ի�|�B���f���$u�]���N�C�0m�p��G	���NyM@�0�Ú���������ev�mm������d��e��7��4��Mw$���P%�eH�.�.���J��^�Y�G��]x���� K
  z�	��O�}$��	� �7(^l�"����-R%5P(��/��r�O���J��'�}��(�R�^r�*�B2ȋ�i�7�`e@*Z������yI����+���!]��҇gJ����B�ж?����Z����j>����4&fl��0� �� ����C�At6R(�]��8���:�S�"t|�Y�E�/B߷�P)B�h)D/��ȱ)T/8nӫSH$^\����}/���@��h�Q{~�&_9.��i���T�=ʏ�xB
��K�7b�2���i�=Q��Bf13�7;>�x��	�wWTN#6H�����0��`A
��̬��|(N�R�(�$�.\�Ҭ�s�AF�ڧ
$�b�!?h���=�@�*k-t�R�PI0��p57�PI� Ds�3mx�6�D{8���k-�K)t�UD�:�n!4�4�	�n_�Ҩ��H�(��@u�D#���}t�.�FڙBa |a�Ñە7M�f�@���7�]��z���JmL�]8��Ax��>��͖w:0������)�sy����{�iYN.M�l�����۶��ܳQ;�w���O�p���Q;��|�YS��wN���"��/ք���@M�3�)�+.��K�*����.0~Lt�{^���E|�J��-���� =C�޾��ܯ�S������U�S��2K���j8Ϯ�Rô}e�R9Ը,"�h�1��֦hv:l��7��@��F��B�03���lD@�03�	�>�ؑ���SRhZL�b#��P?�]Y��Y�Q�1�BFMp�uLЫ5>�\ƐB�@�Y\�YJg�$Sa��8Y&<��]�[Z������Sh"�vkt����Gk$�]�"W��PF�,�6���]7E@���՗���fFq�B��VJ�@��{n�VwB���Ś:X)����0쐋1�b
n_��S�)f�tH���K
�!��&7�H"4W�	^�85����>_���v��,��S6@�/�8U�Cc�CU1�x�nCQWU4]N�˥���+Tu��H+f|���E�[%��h
��,��Jw;R
�,g�i��$�r�F�r��>�⢧�Hǥ�H`�@5�Qy�]����ČU	��\u�B(�	�9,���J���Rs,Ep}��1pn��S$���b�7�6�gN���>�Vm�)��(3��{��l���n�	��m�}��# Ͷ�ŗ��dg��/1��Bx�#�S(/�^e'���4���;kk��P^�_[��d�*���ZKv�����nB������Q�[:S�7��Ar���2�)D�R�S�� 9�	���ޕ��y��aVS7�<By��aV�l������w����=�J�(@�0k�����R�Y�U�nw4�S\��0\2�A�@n���l}q�W�̩)A��X[�Q�8���7YSYM�"������b�<��sbK��k�8��L�V�P0 ��<_��r
=�˂J��]�2�ۡ��z�* �B�07��uH^���9#�wo��7�}s������)��	ģ���޳4E	S\��W�Y[MU���9g>#N^CP=�z�A�0���e�U
�5׾���e�3���eW����uB1w{�5�R%)sk��e��� �so�8��ʼ	���CZq�A.���S���4��o2y�yZ�G3Jf�>SռɎ���bP<̛"��G��e4> ��l1}�Z�4{��ecR�9��pQ��B�0��Kua�j������5u��6gJW|
��~�yw�Ժ߶>)*-@��~�uĚj8�<n���ɿ)��QnN������Iy�����)V*sB��+W�F���k�Tg�� ��?-��\,�B|�ʗ�E���!�	���zb�R
y@'�R���e�������C��<�gxD �IW�2	�H]�eH�'D��z���ZK�N�e�o�m+�M�wd'�5'ø�M��meyQ+S��+��d�o
-�k^�!��� �4�&�4ŕ����X�;�p_�� ��=��_����ٛ�+���V����9�|4����E�������)��C�nM�n"
�/8��C�=�G�Q�KC�X�"G_���	�.���d+�ߛ눦��8��/��E�h��U@�� S��/����7��+����G����*�&�8"B���z�^g#��P���7;�>}��4٦�$����16�o6���*>�BU�0��K�k����5,h+S�$t�sZ�t�Y.m"���m[Bү:�B.>�#��Ҭ@��L�����N!���h�׶|���Å�j�ׁ,��}�>d�F6���
�kk��>d�Ԗ�h(�,b�H(M�*ё�B$��Bdf�B?tW���}_�	��~H'TWnO�_�3�1�&�mN��0E�<A�J�����"\���H� #~�y&\���?u۾ɓ	�|�ۇѱ��	��?)��g]�e$*�S��/�z�gI0�Al��2[����	i�L���.���_�8M&��Ž)C-y#���kp�T�v��}$�?��u+R���j��\H6B����'r< ���0��?*� s�?�@�5�؃s�Z��rX�f��p,eK�����%�n��R'��������?]v�{      2   �  x��V�r�8}6_�@S��~�L��
�a�j^:v�V!K�d���or�} x^(�����9�-�$��`^�J��p@�*�B>�J�1�ݡ,���������`�l@��|�NDI��A4Iq�e"�Q����G��w�����g"�����M��6������w�Wy�,�E� ���m�=�[�C���%t�a��航�5�a;��>����
J�d���X͗��h	C��X��D�1I��Z��ɚ�߂���"�\/��T�TC���[�0:���!�O/P� ��H��E�G�:�4�d3�����T?�8��7U��h=�oL} {���E�*��!���b���{4	�E^�$Ԓ�~߸~�jS�8D*�c��aP������4�����ñ����+t7m���h���K<�,!�?������,���Ũ�Ґ�k<����o.�L�0엱{���a��*�U�AF�%������*]4�c1��@�K���!1����VF7���v�ן���C�9�۠����>y'צ�

T���d�HS?�R��`q�W�/���1���{�D���l(��&��bzD�&D�R�(%
avkA���?bq4�8[�5mS���#��љ�^ UOPB��Eh��҃��"�yE�M3d��qB��1�K�	rS��_�r�Gk+ecۃ%;��E�(2��G��O/m��%�IFc:��$&i���Φ~�z>U��e}{,���ԛ��y�r%c̌�$���V%r��SӬ�l}3�~B=��-��&3KW���	y�o~�:��nY�ZA}-:��; i�/�݁4�����=��))_�}�D=�_�#�V9r�jQ����(�{0�ݰ4G�$>���[���آ���Oٖ��+zwV���a���^��/��{�gSt��Q������%�Ǿ�iK��+Y
�o�iˊ�I�k���6���	R      4   �  x�UX�v�:���'�m��k�#^�p�]=)���0-��p��~B����wI��''��R����]�{�`fty0'i�b-��A.��K�Ty}�F�k�n�r)�tδO�lf��-��(*{R���I��)��P��^��DQ0(s�%	1(3�1��e82�.�B�q�5\�-�)���{��2#-�`�6K��`���,v��dl.骽;I�	�؟R��x��^�Z`˧�۲�^pd�r��L������#�W�]U�A��,�=�\��P��ef�V?�L|�?��l��0Z�́rY��q���,s�LzĚ-���X�q��-�e�d�`�|��:Ȑ<�3U�5�,�:-����L�^���81������kJ-��.�X�B�K?��A#�4�'��A�I���0v�V�2��NM�dI��H�X���fq���� qm15�%��ߥ�+���3���a^}|��[�`,5Wʠ��"��E#���q!�/�s.�Ř�WI� I�`Y�]nĈ�mt���v�.%�v���1���M�y./�c�	yq�4�!�b�Kx��/dK�x$D���ߠ�{��%r�56E&��ҚO��:EHg�����C��P%��#y�˓N0�>x�(fc���P�@�]�bg���;�a�<%�3)�/�)1hܵ���f3x�������pF�Z��r*�rQ���E+
|.�9�T��-7Z�8љ�h)���]�-Ĝή�����`a9��9��>9B�w���	E'%���=�V��~�)U��=q��q�̀Q-�j��������@7ڱ ��Ax>Ik���W�%�4ά�v3*K�����Ebd�.�"���13>�_@�b�߭��X [�(��)3�ج@"G1��cJ6l�[���	�X���^"�FV6������'	��A��Q���^��J���X�jG9N���J|���<$Ub���p7�-���"PsS�.�7��2*�ȱ�w�N'`r��g�	<ɤ�����(S)舫@ښ:��d.� ��p��d��W�S������i���ޅ�����7i��8A �E�f?ӧ�Σ��[�^F7hc���n?����1�Q}�T���$aоJQ<3�:O·n�v/p�l�yn
�����5��W��g@)��ŬJgG�y���,K)�L�_2or�Koچ)��E����(c���1W�h'ˬ4-Đ���>ϑ�^0Bl�P*�U��ָ]Q�h�"�u�R40?�@�c~DE ����B�H�l��+�f'��р�m/v\�f���$m垵@��c>�{O����5�{��@�s���&L�=P��YN�����ٵ[h�g&W\)�8�GWHk3X�(�'"����Z�%����]�{#����}��ä E�6�m��m�h������P�*}��u���ͅ�.|`4�ۏF0�?o^�^�c��`�S��d��Wd��n߅K#���V],GL�{�[�rX��J����&2�1t�wmt�ufA�Zhf��e*B�����=�f�W	*r�I���(�D������B'�)A�@3&�-��bUy��c�E�xy*/�]�W��92��h�	�Td������Rn4��G��} *�ߠ�g˹������Z���J}bM��[�'C�ފ`�x7Q29��1Xrjm��][#יaRC�E�rZ&��$o¨�P�cYZ�J�k53�:X4-�G�����%�Y@C~�ȯ�Ȋ�5�0�/�BC�9���}���a�	�=?�R#0�� �-eg�"5�$�(p�� YaW�Ў���\X@n����z�ોz��vkd�]);�.�ү�{7I"���=����*c�nj�,���PV����mo'�@,
�J����|F�6to�`?���J�X���nhvR�d�\���@�E��oF(�"|ǸR���O���h�����W%-��.)|bV� ���ˡ_%N4�y���y 1�R^��!��f����h���g�@��CPqV2T� A�,w΢��WKi�~�Xx���,��ծK�c�	&��=����	��WY���q_�3�u���x��)L����I@��[�G ���at����9�Gb=B�#���
o�N_xw[��wv��>7P�.Bp�#�' \ K?�F"�؍�A��v�,���������4`� ��!J��TfP�5�2���fb\Y�mQ@~-���Y�V�~vS����;$ˬ��n׌��������mQ'S������b������\�d�^g�-B��j��Y�@�_XAGpV;?�������M������� �p��G�XNL�][ ��u�������I�1��x��v��Ul�Ǉ�.$q3X*����Q�CV΂I��a(�a�wt�v�(t����UG�Q�AB�!�3C��ݖ�-�AѲ������bͣ%��_{��� ��AJ�Z��~���ެ���T<�����Jly� JYZ-�������%��T�7�* �1ZZ�/�ҩ	��� ��`��)�}��Ư&�>Ck�nS��-�Ѷ�H)	/5�s�_��C����5�)������D9;5Ws���XW�gRgᦏ��g I}�%wt�k�[�T��@��^�0�5�����_���b�*�+�O�Ҟ��kQ7�N�3�B�95��2(�����#�A:#�Վ��8��������d? }�8F�oo�����p>|T�����A�D������E`�=c�c?�i=��0����Z��&���湛A��~��!�/��:.F�F�#��w��_8�5��=W�"o��	ޱA�����O/� �<��I�3A�ك�n5�%.-&���R�?$&�%BT R�4BO{1N��M&�/���k_�����P��)����m�_7�:t�
hEW։��>�`ś���[���i���ǳee��\�Мo_l�fr�q��,
�@�J�7T�?S��E�A���V�x�+}_Hz��,�ÆO$�1(3�������<[X_�̜h2�s����E�V��Qq?��+0��QbQ��m�c ܏�>ԟ�!��[f���tfm��Z:�*6������-����k����Q����A<�X-��9g�(Ev4�Ԕ��z㑪p�LX���P���h7������ &ɡ~�ho��UG��0��/�΢������m��BjxE��Y�FJ�;&���[�����J�      3      x��}Ms�:��Z�Wx7��e���v��I���yO�L͆���)�/%�������[����y �� �ܪԳ�[`wh4��Fn//#�oA�v��X^�tC�{]Dc��ra���rOh��Y���H����dA�.��n�G�8J���>�e�u�� Z3y|��l|�*����"|��M٬� ��K��_up�.7U��Q�(>�C3n�u���ӟ6 tp���QUR^��/(��M׸Q�8�%8tp�u[��e��â97C�lJ�^^�=�8xS6�9�E��QZ��:pTM)�bc+>��p��X6R���-�=]��m6]_�V	�p�v�tRK�cph��@	9��u/�Z|�(5�����U[��ŗ�J�v��8�eo����J{!���C���g>	�9��[5�B�-~/�O[Ihc�:j9�~�����Fi|*�Uկ�8�����O�K_��J�u|?.s=�>�q��\��t��T�[~8Mc����S�Ү���a��E��Vb�-h��m�o�nl�	%C�8��j5QL�
��`n�v��m*���l&����j�`
w��j���Yc����`L0�D>����VJ�����/L!�~]5�'GN�
�����MS��iR�L�7X�U%��D�"�H�|��E18p�mpV�Ѵ��b��{�<Ur���>U:�^n�u������sp�.�]_>V�C[/�粩�b�4���� ��wNWe������������/�����Wq���Ǯc�߇�*����Eٮ������j�\�On��/w�K�*�'�'~��ܕ��}*�����wm)~���X�	7����8���K�dApt][��H�&��ق�nʑ�d֏�8P���t+���Ё����7��e�,�/S�`��v��#.��s��Y����E�"�č����I�Tn&��lN�C�e�s���߂6��MB:���Z���!��?�`���K�]�w��ڍ�%Y��M%Y� \W��'	�X��u'l��J�l�u!p��O�\ҡ5���O�*Jek1$pp�T?��e"w�^H!E�����(�T��\9�M_֏�m��e~ �0�����G�KJg�e����M_�v�[ۄ�ƻX�QZ�ʡyjU�\BE�H"9x�;+�����'�����J�S8��w;B�^Q9z��'`сv�]g{�O8F���N�2Uc,Aw'��v�Ͻ3ɪr�d
&����Le.�=E�&.�t�d ��S�ˮ9C�C�p{\g:_�k�S��M�@]ѧi���Ns��A��L�Y��;�����g(��m�����s-td#9�
���W�>��C�\�h;�f8�tKƮ<5�#��]Տ^�D1p�wn#���[��L~8�V���yo�p�=����=X ���vDO�ia� ��hO�p������.O���p�.��SC��L�����SiU"i���U�]Rf�&LݢpF0S�ﮏ��w�B[|����T�bq!\����y����rFxS5��$e����9x�\�q۪)��th��@Z,��j�
����{:�g��xt�j'(#��H�~�<W}=��)tm%!���cշB�8�Dn�>��؊��̑;�|*����j�9�T�����u�C��/ýU՗#��y��M���:�-k�<�ٽ�����J���l�~~�����U�W��Ay��b�!|.�%�6h�u���ð�@
;�k��hQ�C%�W��o�U%I#�Q�t�O;�/�}���t�Y�ہs�.��U+�Cf)�<mߖ�J+>�#�F3��o��Q5������,#��]����#�fJ�X�<˟gv�<��g�x�fn6򃇋��R�,��������7�6�H��l�yF��b;��Y����)������
0��sޒ�Z����-�-O���]n��ۦ�L6F����pS(c��Q���r�#%,�Q,��on��͌�9N��ǭ$4b�M���p�zP�!���CG�?�����"L�sx(O	�〚p�*7G�勈ۙ8Jdɂp�;���Ӕ�/�u74�Q͎�P���͏�jVg-�߲Tn��|���"9xS�?!dr��m����a� �-!y̕66fOf�]��ً�rۉ�2q�c �U����Zhҁ[?7]+	,���!q�� �c���`�X�<�Vh��,&3���4E�)N?/���>�c��)�Lq����/ΟJ]i2x��d/w��;�=%�V[�I+�^�����
��sI����<���w[����9����:v���|��7�_O6V�܉m�T�>Y�s�$�,�Z6��P=4b��q��`�v�n'���^�ͦ��s�c�N<�[%�Lᐇ+M���D�Z�p��r�>�!��f86#|(��<(���F�#e� ��r�j���lA��W���V�i�X܎��C�st���I0�V#�qswᶪ�N�b�06A.ߺF'L�A,��v%��L<��/n��א?V��\��#/��t�/A�<D��N��-��W����Gr���Yx�.�1\cn�m&���qd&���{��x�;�s�uR�����n-�>������$�Q| �o�]?z`3�T���?:{=#ML��uc�w�4�'5Rj(6��34˩;j3&��T����F8YNr)�!X���>i�S�ϛ�[B����_��:u���B(�������SQߗ��8�s�6���ƒS�nIZ��z�;3�,�u����]js?�$l�����e_E<H; �~��߮:�븜��
p��~\czʡb�LѲ�p@W7�����n:%�kW8�P_luΡ=Г���ɉ�Sj�+��8�,#��st
���Qa?U羚�C�����3}��X�˶ܩ/�$�rT��r��$ԷMIm��vλ�]�sL�Q�9��+z�w��q�(��Ԣ��n��[��s��DX���+��)�`��D�<U�r�=h��^d��ᗾl��dA�~�.��)O��ҕ�\����W�]�V*�aJ�,<�u͓2g6U���];.a�<J��x%���W���N�V�xﶷ�nW�R��%�W��o�h�w�D�
�ޭ���A�}�G�uuzF\W�����y�e�K ��\l��l0�ac�44j�q� ~/U<N0\�s�|Qit"-RIZ,<�QMƹ�b�x;�˾�^!��1n4�£�ܝ�����,���`�VU����N[��@Ǐ;��N3���I,e��u���>m�MSEH%��g^K�"Kmq��!��]Ov˵$�)���z腹�����8�����.�txSn�Rn0��q��CoГJ�a��*rxSt�)�s��=iB����;��Ψ)��A�+םSU�t 5@J������K�Y�F�s����tÁ|	���/Y�XR���!|ʝ�Ra�)HqѪ�ꄎw��M&iF�f�S�5��~��
a��'~�dded3�/ծ<�hFF���3�/'�9.����l47�F�d��rU�V9�>G������sʓ��^�;w	R+%�)O>�ᛶY��?|r�i���e"d��;���r5'�u�Ds��p9'���n�N+.��w�k%�RSh����Uv��L5a����뷯���6i�������H|߼��Ph.���n���T���V�ޭam�fH�uï;�P"�U�4ʭ&&[�:��#���?���[>���Q�-zt���9;�#Zj�����i��E��R�ϰI������s��� X���>�a�G���0\��)K/U��G������|�VH.�a�v�ѰM��wm�=m�"�Q�rS��6�(�S�֊�`~f� �ʡ���&im���lHDK1�!�61�w�l������5&�>��~�Ơ��)�L��Dl�ňA�:�t�nF���`38´��������NQTPv��,kw�v}چl��m��n�[�t1�:�`�9K1g�L,fȥX�b�2�A��p��ЋCi�w��t4y1M8�vp;��s�SL+ԁ+sߧX�,�d:��4��/��Sk�?    ���\1NчfU�q�@xW�ڇ�v'�:Ægڤ\1�q/�#�Ut�*�x� �w��=���H�;��mT��tGCc�Z/כ�]��1�r�W�ԨH�)�\���u������d��_u->�~W=���m�)������ΌӔ�O�p�=��8��ߺsMҔ�U}_�͎��1m9�ۺ۔Z�4������N�ڣ��u��a{�:�>���ඬ����&����]�������ԏ�gŸ����Y[r�('�����=���qD��.��'��ਊ��|m�F)�5�a	34�@�d�[��5�`��N?10^�?�/e}��~W(B����k����M�����?�C����3���m9(�l�Z�R�����T)���n�Ȓ���m���.���w4�pܢ��Q^��E| 5��M)��"�h]�6�u�u"�~�M,W���CvR�b��H���O�X2���� �9B2���R��@1�DDuپ�q>��P��.��8�Q&��{Ĩ3�A�b�8ÏMZ6�0�}�e.�d)�4D���LK��Pm�ȓ����Su&�|�$��9J�;S#����?vݮjż@$<�$���}����H���0˭M��)M���T��m��Xn�U�t��R�S���/�K�+�2����˫<皪5#���k�i]���:��^�	&rΞr����^�b)PN&������nOuTFs�M܄5,���jg��ī���lE����iŔ�:���I�h��@�-<�<歠��^eO�M1�9wA��qpl���LR���as�H�}.��V���BO1`
-�LE�3N�[�1ł5q�Y�Ք��<�89l����اe<<&�����
Sb�FNϚ2燌�"�*!����٬�#%%!2C�s��8��������`mS�X�\f$f�e&8�Ȑ�m�}v $��l��u�j���s6͉e)V���4i���LW��~>=Ƙ|���~t�������qZ-ر?��_�Ψ.-إ���K�8Nf O��ԇ#o"��@�,<~�" ;��<�����G$B3�>�#���R먐z�q$t����j��u���OI9O��!����#%��i:m8�y�I��M�Rr���AM���'�s��8��y���O�ҩk3�ʧ� �V�<t�[��Q���;dxzz6E�_7&<����y�1ʸ���_�� AYs�g�9N�wU�j�x�O[��$8��Q�A�0�؞N��,:�~��mhH-��E~oˍz��i����N1�)�����B�j?�hR�E��TU����>^��Gv����Kun��@���M����d?И�H#�
�/��h�hҀߑ式3&5����[��r���z1- �{׭�-W ��i8v��PF�$���,<^5r_�;�2,t$Lqg���'��vs�`�O5r�@�4#آ��rO�U�@�Yr�)D����q}�Ҟ#$����x��d{�
:s��	K�OR]A�S�ڋ)�)ؗ#�?���z�'���#�19D�^����63�@C&c\��K/[�2�p�MC>ۮ�"L�)m��0����ƒ�����y^�eS5>�r�fx�j)U����ۣ}���Z���ŷ�q%{RK���6'�L�8�j)6��zqڡ�|�$��(5a�aj.-dG%l!}�F�����#�6pO��)�O��]�j6+%���a���i{�a�+*�(Wֵ��AH��Kw/rAǼ�y0>B;b����"(� ���(�L��)��d!#�'>2���Y����	m+��(Z��vs� �;��ʩ[����t��(ȩ�g	�e=l�:=�/��.���w2��?
�-���Lk��<��v`� 3�dS�
*vzM6CI��B+�@s���\tꉷn��%!i�zb��!����Lt�3�^0���l��8�~-�s�Шu*7r�r�@�������?�ˋZyC��� �TP���Q]��^7�C�S��Г&��T34�@�!br�����0Z�Գ�i�2�h"�u��l�0��8�R'����L^&��C��w�S�x�O�i����-��v�'A����g��������q}�h{��Mmt�Ǵ��?���G@�;��r�+�r����nE��8q�G ���˔(�@Y2W�g�N��'�{d#14�د����<�l��K��_��@��L�����Py2t�4�׍[�.>�/O�ڊ�@�m<j���"ֲ��j��x�W"�m�bLFz:�����H���5�奀v�!W$)�B��Q^0�IPQ5��Yra��}���ف��#�3p~�qJ�>���1�y��Δ�
� �n{q��2Φ�
zU�7n�� d��w�7�\)r`����KqD]�t��������ȭ���n����r��'S��u@ꃺ/���*&�K�V�G��I��\����S�l�bp�&�@�ɄaT;Q���k�;����3�Kd��V��B�c6��u�}*�:����&NB��@�����O���DDF\~�(�=ݙ�#"|����T�I;L.kD�1�>�H8Qr+�ۣ9ب�r���4\ۋ�H��B��u��i�FKM�^>;[�J*v�Ȉ��3+'��\Q��Q����T۝�'�L�*�����ŭ�ڬ����gDD}W��d��H�W(	'�*|��5p|R	���G�)H�؎+:R(�h�|�P�
�w'>�4�����l1Rl�����E��h�`�c��-�j{͢��d�2p�ᛮ��ץ�����(�%v�UO�P�	�s��iS+B�
6��ۤL�ɤ�	EJS,ŉ�B��{�br6��(S�Ȣ�e/?mD�G��͌��?�ރ��)��`S��9b�fNq�=� ��d�%庇
��ÏN���:��K�y.�T,2?UH�~�Si�6y��0CA(�6�Z"5�#�ě��u�'˱��ƣڸ�|;N��Q��L�j�)��m�X�����+��B+���4���x���0���q� �VcQ�XRd̼m��m�K�u�	��֔͌�N�z|�������}%��@����8:pu�._D��T���{�U9c>&�[��ݞi5��~E:��z��l�Gu���"�#�Y���Up�i��_�2f�n��p���"}��~��k�ֲQ��G0��ץ���E.I��?�=������b��vC��s�7Ǭ���%��>Mau�*��y�eQb��}S�ڨo�_
�����D�.c~�x8_=&p)��1�{�i��Ȱtzӽ��+�]XPV%�xSn���C^-�B�r�^(BEY��,�0L�͎�71+�{Tw%3��P�D�I7�@���W� �L9�R6���jӵzj�*M�R�o�8JK,�"�L)���VaF��
���!��͌�b��������9Ts�d ���J�ʗ%?����w����Ii�X��#�ƈޙAR��b�a4���l�0Zi-Ep.�s;T���7�U�=�k��ģ�@��=c��H�$mp�9M�����F�s
�3C%�5~TgK�>��A��	�i�F?��P�Q)"3���-Ҕ ����}��B���L����l֧s���tϓ�QI�B����fb�Ch��:Be2N���x[���Қ o�����e�>��-��jV/�t��3��eZ���v>�C�?�.K�첌ldmK�+���)��/�,43h �wn�6��a]��bR����8�ETG�9s���ӘN��7d�9�l��[��t�IKsX ����ҼZ���{�ikT�eUO�j�	#C&Zb�%�WK7�ʋ��-�k�n_�%ʟ�Ĭ���j���-��F�(�t5�W���yޝ%���a��
�!��?�Y|��u��"�q$��P��cm�p�ժ;GX,<:�jY�V���'�i���J7�`R�˸Wg3{�_7�b�C-0�e�N�k��+��݅s�_��mO��P,6�~�j�s���?���=D/:Q���=�x��cɂCP�܇�_O��D��o+��Y����S!�R׬Vwy�	�N�����q�O�8C����r��E1����<VI    ы��a��)eL�\&O*$%)��u7l%�`�-Z�KQS��;���ꑗ��3���K߸p{Foy�D���\d�1���_��Tg���L�[�W?Wg�HF!~-��j:�9[F��ݿj�a$gù���:og�.����M���ܬ*���E����ٖ��"9�ع�w]:s�ݝ��-���J*Ԍ�GwAq/�ɹ@���V-[�s�5���Vn6e�z����[�>�(��	��u���<��S���t܉�6�䘥�N�@O�+���2��E��(.$��Z4�F�Å��9������꿹��'�'�\	=�Ir��&� {�������4�Ԭ�>RGl=bɶz���6���d�J�C�=8Fv�v�yuTX����\���<Ã!���EHg�	�+T6�M�ܖw���[��00�p,6W�<��2���T�$^�ͮf*ݲ�%�~��=��l��n�'
���9�b��M�5N^��:�U�/��1��y�\�i�pq�:p�ҰQ��1����s�d��=vC�j'hUyQP��-�n9IU˖]m� a�Q�>d���g_` 5�Ԕ�0��nS���f8����w�!ahb��z�.�v�+EP.�c����£[�۽$6���!��8��I鳸�f���7Ó8oJP\6��h�
R)Rr�ph�,��P��(!e(S@��xN��.u3���~�I�:ʷ�|L~�1<^5�pF�H<�3Yأ(L*�:��b��j�W5xb�w$<��ٵ[�J�h���H��#*΍�*�u>�e��%�'ot��������:r>Nul^�/<ެF�"Ud��O9a�A`�^cϤb�o�f'[��1�1fF��I�h�t���&1s�=�-��]��W� G3�0>()a�|�	��7����3��P	�eK�����*#%!�G ���F�\���Bh8r��R#U��e���˩R��𷮭U���8E2v��߶%n$$��poF�2~=�^j��"�����P��)7��]'is��!��:�'�3큜��u���rJ�(���-]��i�����O@�|�_/�u�y�I5�"f���m�[��nK�L���,z�D}��c�A.��x[-���Y7���'�:�[=�y� r�Ztǉ��J��x\#��9�b�Ó�A"� �q�
g�:*�֗i�]�c��鞥�M��Oգ�C)GZC-��^_�O[�ua�s�i5\,W�Q���u��6FMCf���1_��V��D�.�`�F�����h
�߫���t��=^��(�[_�5�S_��{�v������bU��£��ū�����(ˬ��ۡ�x[ʠ��2�*)��£J#a�7	�+�Fs_��&��{�A�NF~�-�o/WM�Ʀ���<b^�[�8�"�dR�p,x ����t�M�}���⻨�4��a�H�*�D�㙯Jn��X�����[M�=���X��p.���~�d�+�uMmvfZ%��Ϊ*���f�L��b���z���"WB%O����#"�{F	�E)w]�=P�q�&�e���g�L�+�pߕۥT�3*F4�R�k`��_��l��J�e!����P��%��U�C5��9���}�Jpכ<�"���s��j��OU���)����)���S�O�r{�ς2!!IV"alH��T�g�Os�N�.�D����BE1k��f����Ù�$���V֍�Ѳ�xhD�!�#bIg% �_ˍ����	�����J[M���>n� �<�x��si�s_�y����� �ZJ��!�P)_�-БV�b ����	)�l�S�駔:MgO ��q���͓�nɗ6�w�Dg��Vq�l	Rr<~�k�ϟ�8S��i"x���(f���<𥴣Ș��)��[d�6�zI�a�Gyr M�\"v�,c��2:�'D�$7�)�&s���NX,w��v|̗��0��+���7r)�=�t��X�	<����{�����FV�3�uGL�(�j2��i��J$��0��]����n�L������n�R+4RY6�¼:�^J�-5e�I��)U���x�dFS	5��]���R�����y�"ٔGiǑ���,ͫ7�FS~?��Dr�5���,��jFCB~<�[��d0B3~�5|cHkU|f�O��ݨ�v|���e|WU�v�rr���u��8���G#������u��"������p�Ϝ�̳�D/	��S4�F�I���QR��bZ�f:��0�<�ꇇj����s�k3�έ#�~,M�ǀ��49�g�zy�]��e*.y�&�{�s�Rg$��{+�5�޹�����3�1�t��l�3QlD3	��7�g����~'uù���֍�=���W���o��'A����m�,�Q�Km��@K�T���F
8�����Sܓ����Jɪ�?աT�P>P��-�c�.G�-��tq7]q�:g�/�y�V}):�p~�ʋ�=)+���Rvb�A`:�O=^�	������y +u07;Y������3cu�.۲=#ULV}U�F}�䢏
����z%��̈���?�nP��U�fb�\�_�x_�x3L�M�`ظ	�ƧLXJ� �IX5�PE�<�e�}֬�.t�$H�q�|�}�8m}�>%M����{T��P���u�z�ݟ��I��;�:e�iX|ff��l��A_0A#��(M6sU�2U1St=2��:�h��;�<���<¤�`����y_�ǋ�Y���
�Yd���.�Jn|�f��`�ӈ����Y�A2�S��Ȝ_�n/�T+�)#ފ�?�f���`\q�y�/�'��g����)�\��T�h&+������c��B�/�;=���疔��O{�;R��n#^�r4�v@�6�6g��iSi���@���x���gEx�ZL)M�H���R�4ӧ���ΖF��~e�2cGf8���3���G�_�]Ոco�v�\�M�z�$"�����Y�ۆ+Mĩ	�ЅJnNL��r=���K/�1'P� ��/�.��ܨp���='�`8��e��H�_`?�30�8������٫��9}f3!�9C���V�6�"ܻ��C n�"��8��dz��P{�)e�qj5c�"�	�M>zf�1���:���6���YW�J����3w���>��0%��߷fj�ә%���boy�&}��/R�����nob�IZ�q�u�M���L�N�n"x�G.�K)�b�bs�"��e+w!u�أ:��K&Y`��٧:ʊ���㵒aV����Ǐr,?�����;��Dޝ��/�	�	t�m	>m��<�,x)��C�Ph�o�]�`�/'F߾0��(��L��g�I�d��4�$^��()�t���}']��0�����U�.�r5C���§���dҁ��{��^)-�̤<���� �H�0���j�����򾤔�<b]�N����V}�J�R����DQ8���_��~����(X�Y#r<v�kl�ų����� �8�x�]��;GK��Rֽ��u�&���7ǣN���єL8�����-rĳ���2Rf�̉�D�K�G��K���[5��J=M�f�\���cQ:��t���#T�� &>&�����y���-<�m����x�d������W�%�!yD ߰y��N���R���(@y����,�l����J��0
M��4�2�v8�c�����U')��j��� k���6h��f]�pD���n ��Vy+�"3����z|ߗ?�h���#��p�p�G"��\�4#�R_ M�>+���|0V��ծ�5��H�X>z�	�h��G�܎���5���<�Fl��4��Q[���ّ�qX/�	 ��Ғ҆5���(lh��$M-*���%���'ņ���.���&ő��7��x`�q�㩅�;oq�������{B�,�M�_��U��,�d��d����J�)�AA����!�I$]��Z\����U�a��p��rRI�)s��n/��r�IM^��:��!��%��~I&iց�ˏu+�y��hR�����@�������8C+�1���׺��r��A����UKF-j�w��g�Hͻ��uK^�^�>�R���� �oY���~    �<��,u`�d���Y6gF��|�E����*ٵdb�M�p��ի61�ل̢g�c�Z��|J�9��l�vY�'i��ǫ�A�u�Y�n��l��p���R�9I��x��j}9<[AmR���ܓG� �|����n�s��Yxt�dؕÿIgb���*�n�c�(#F���Xq�W5W'�`6W�25�ak���h��u�WLnq���;e��d9�H��`q�a����_��Zr��(��6�U6����fZ�mF��PW�yW��@(>�0
eȨ� 曽Ŝ��@j�}<�[�O���i�J��d3���t��"�C��h���/}$Ӂ��L$f��@�1�GWB&�0�v�Q*!���=�U����T�cٗg�,%��U�*O+,%��]�*լ	�J9^~q��+1��Q�̇-���� �(�a���g�P�l_�����r�e�ՔF�bm��k�n�US����R!O�i�iҲe��i�V�]�:gʆ��[������7E˪�b��G��<�'�˩�D�m�OMUe�ihi�"q�:P���<2 ~�6�6��4^<1 ��QgH?Ȅ��hv����2MN�*����0g�)UTG��ň6������4���r���S�n�m�N��g2nF|{���Hh���,�Fl�U���G7��`.���#m��x��V�������{�1���u�=�d�o��;��KX�o�E0�T*��>L�|p=+���`15�/����L��i�F$�Q1S�=��P��F�Jj˰���<t�!�,"�+_��9��!��5Bw"��>y�4e�(o�����q���K�p�<()�I��=�P�dv���jr�C�&�.�;��Q��8U��c��J��J#���wWVz�Z慏3!�`�egSr���?�ؔl�>��
ǫ���c��5e�����0�YM�5K�F�%{!ý�r7��;�\8V�e����f~'��C��A����P72���>� WNrd�6���/��8��ʩZ_Q��v�3#+'�9b#__�nu�f�T, �Je3���a��/��~��o}��6#삂�/&������e3㲙o�u�C �����[ձ���ͿGs�G4���������Ղ�+�Ε��LD碹�O;��s�&�!��
�Tђ��W�'�ƂZ3\p1��^;eYL�T�Q\	�����Yq ~�^.>�m�S��6/d�r) ~F��r�;6�������6�n�ϺY�.��ن��'�5��+7�Ht�-���j���k�v�Ɇ�Ki�y?A��/#Ё�P|����Po��>�,%sxN�P2�_D�{}�\0�n�\��aH��`�.���^�7�^8� ���{�4��o�c��� �7R�x`78�ڽ��fXJ�P�wح�>�űإd�w!�B'\�y�>�˕�p�ҼJ�"X �)���������,T'�p	}J摐]���/e}�`f(Û�nD�6?K��r�����ȪC�L�V�#�*�bI��\�8ɔ��*���u%4�\��ߝ/(� ���Y��El10�"i&���R~�<+�����:�uxUy��?����>��A��5cT����C��2ţs훪w$xKp�W��m@G�2+37<�$�=)r��e�=��v������'�L�4�4�FS2��F�O	3f,ﭝ���3
��)g��$�uڒa�G���T�#���5춛R�g�N6��B�.�xC.�uomJ.s��g��GU`��߉��)|�C-8��`����#�=:�]� jH�z{ .�vx�TQ�^�C�ps[�]	R�rFf#J�l�Ed'I�3��yT�_��9C�=�p�9JJ�ӞezH�>�L|g<x���<X�ax����%7�����HH��V���!���y���*4)��󴻕�
�����o��ۮ��n:q��O)y�ʠʌ\���i��r-O� �܏ꥉ�	����p�4W3��ՏZ-&xT%��R._cE��I����1K���y�J�K���]����jV��PvRx�Ӡ�)Ų3��i�	�r��V���n8PR*��YºH����נ�\��R��t�S	�Jr���U	er�~��V��r�dJ��2��O����DH)��ԙ�-��3* #)ް����f��ᇡW�7�%�(V6ݧ�}0�Ps��s�r?c=�����M|���=򙳧r�?�O9�A[x]���Q�?տRSA�P�EŎ9BF�	BʃW<;��3�iA�~����p.(_����6)��\w���.u�\��:���/�,�a�Z��Y�c��סQ�|�+ �	����t�<q��j���^Lߋ��DU<% �Z��԰Q���;se�r1���!Q��|����t�O���r�ᓞΣ��.b�\("�*,C7��_9�Tܟ�v[����d�<W�hJ�%Y�}�ˣ�\)�⿬E��_�b1��9'�K�)G��&eBx��J~}�~��AQ�~w�Nt��wg�%��w>Š��pJq��ˣx��G eQ��)Vn7���U"b|D{�ꕷ�+l�UJvQ�G_YM�n�3WV+�YɁ�̦E���XY�(��(*�]��b���Z>�����踧����xݿ��t<n�}l���ho�緪�a}i�y��K@h(J����􀫾e�pS��{i��tU�K�ۥ����l	
�]C���v��f� �t��'�(��?J@B��ҶZz�ǲE��.�֓O���c�A�/[D�k���ie�	O�(�xY=����N'yt�K���M:�X�sՓ��b)>��σP�9B����Y�D9Փ#P���3-bA��u�{T��X?��m����Q�2fڍ�.j�<m�F���3�����G�.r��z.>{4���z�k�M
��8�ҀP��|��#w���2��JZ
�I�>c���E�ǹ��,]�T���w\g��3�1Nx_�k�^ǒ%�#�x� "j�Eu�gy�@�g�h���o�_��K"٤�
���l�3lr����]��CHJ6����z�&� �+���	�S�k��uqV7���d���+�Gm�
pUhb��d��n�=�v�1[��A5�a��L��YDNVǨ��<��]�$ۣ���EB$�<G��`��j�T��z���ɇc��5�U^����$���@�\��`��X��}��F#N���w����W�(v(�/Y��Ɗ�:p��,��8H��hȁa��jQ�:�N�S��Sk%%����bh��i"G�Z�����f-
��Ŕw 6;�R�6�\&O��c������$��2�<x�ihv�3��3#4�H�+�3_O�ux�N絨�:�~�六v^-sa��Sj���v�Zķ�D�ԗ �5%S�2~���F&�LH���Q%"Z���J�g�Z&�xd�hgt_��\�[X&�x��7�]ߍ;�9�l�����g(#2�v�e� �O�����x݈$�0�|�Yv $�<>.�C�֊�-�y<��6c��j���^G<��Yy�j��3�Jf��S��*	γ3��%ش<����X>��ѹ١���\Q�3y�b��e��j�������ۃ\��2��D�2{?>AKuٹ�(0�m�8-�cZ� 3y��[f�I�Eb
ƴ)Dyȋ�"��L�&X���� H�T����BS��ҷ|b��G�f�J�A�;�q�����o�J��4O%)�Ja�y��*j+=@>��q�S��MKX�K�!BI��Ȩ	���6^�t쭌��!�f-.0�S!�`��9�]��S�rJ�-�+)PV��SGwN�r���Q��Ǳ-6+1�4D}��&�y��K=o�?�(0�ʶ�	5�T�:�k6Fj[>���}�П��-��Й�V2[d�zn&Z���i<u'���0���jOrE�yj?��M�}]i��c:~�[6b�hh�{8�GZ��I��]i��TmَQ� ��Ac�Q>���-��f�vOlG��&@<k�:�A/��L�~�q5".@�:��cwet��K�OG��[T'���������@n��nTđ�=���u�<[x���zp}pc�Hl}I�W���t��#ʊK���v    ����:�ꫥk= �R�Z��\��{�c����h8�Ҹ}���3�[����z�Q�ObʊP������Ԕ��:Q�v��j���aS^z2��S^F�o���))��������0��w.dΓSN�K���_C!l�Z����2�]��y��2�]�K��9Kl) ��z���aK�P��+7ሥ�'��pz�=��_��R<�c����9O��g��蜣���2��]�ϲ�%�]x|�t}�	5�ĕ��XrQS��[G�$���Ly~'�E^m;�vj���Sj%����MJ�{J�8|?��&��)��w��>;�R
��T�� w��B��#�#���aS.�_p�QR�����f?��/_��P�Y�h)&^V��������UFI����_L��B��t#qJ�`N�l�}8�s
��s4Z��9Yce甒��ۋ��r�����k���_̉�R�p��d���e������/��9JڗïGxA�y��Z>��*��@-g�p&k�G�ixm��_=�FD������NK�n%��|��^�K�-���w��i{�E�h|1���	y`�":5,��a'wn�Dti��1T�����JD���n����]�W��0�:�:4������o�,���D|O�A�~�٧SDM��U��?S�I7Oy�l�Wp^�����'���b�лa�b��{����ꐩ@��pX����������� �u��U�g4���rǎ�ڙ�_�Sj����?io�'~!7��?v�ā����z��O�H�_�oɿ�?0�й�}���ð�~�8����nH�䵬G�1x��څz���O����9�d��s��,�T�H���;�ԕ:	��.gv�!5_t�xU?��5��w|���U����)}�{�����L.h��Լe��8h�D1p��� ����-J�H���@Z,<�[��A�8�Hf+PυG�G�bJ���~�Է*r3X��#���v�X�Vi��������W�/k� ���N�3����+}D=�b� '��3*��	�5"'[*�NT]�X�d�
T�wq|��e	�pUY3C�R>���)�$.�$N�3_���h���	9�c��t�&d���
�
��QXBN�&|x�;<	�"�;<���}�����Q����	�H�n��̾A�/IkT�eT�Cg��@_�;4��T�Xv��@6��fTXv�T�(]�)v3�/��˧�j�(Y6�7��BN�r,��0����`(��\��������9�sx?lt>�`�)i�J
�l� ��~hz2`�֬GgrWbƠ��0��Ո�d���d���x���-������xӭ��"�>��|�x�?e�œ����2��ⵘ �Ͳ����=��3ʽ=���Ɩ~x\W��&�$a�<l�������=緹i�r��-k�%����j>�EN�T�>��>�KsL6�یJT%�@�J�]�3�ӫ۶Z���'�F�o�xW���烖yEd�f�zR�<�'~Û_�i8@�z��έ���Y�O��,�TY��%'n2�����زr���J�h�rkg\H����4g�� �'&� ����g>-��x�)7�"}��d��l[%���b5"�ӀT$v�����c��'U�c�՘��8N|���Ev %4'�1łE��4�Q&��3r�ǏJRZQ~$�8����nw�놊b���f�u���a���R���р%���AJ�y՚��L|��cxO��Gm,+�x�ܓO���O$-���T�����i��Eb��c_%�T�ت�%>X/�4k�xt��A$Zδ�RM<x�IK�(�яs%c��D*_dY&N��=��fIX��&���2J��fG/���TO��T�M��0�bir���<�1���B:gif�l�(�k������Oݰ:g�x+�Ka��sÙQ�� oh:�ǻ�ġ�&�Մ��.c�@��x���3�^�Q�-oe������c2�ba6-���d�����d��F�x��I�9����<h5YS4��I�����ݙ���]_RC��MV�y�v���A�4x��뱚+Ȋ�A�Ң:E�-C 4�e,��Y�C#�ӊ3�4zLé�5��庮Ό���:y��Vf�ƚe�H�&WCS�@�,��a�SVS�?eѺ��ߝv4�������E����1l���ߧH)*�=���R���ݰ�O�4�Q��q�ˮV6B�M9P;}��SV[Wq#�4�#�f8sb6�~��FFU>iͰ��8�h����g�,m?�j��J>��q��H1�"�G���VP:��K�d��ʭ�ȯD�2���2<^��I)��u`Fԁ�Xx��aU/)�T�Q&�L"Y��/���)"D��u���Z�l�����r!>d؊�S,�f;?�J^���k4&�� �ϒW�:��S����������6�Z��9��I%�/�u�Wٟ��P���K-�k�D~���@�����!�S�X�l#O�FR�ɑd٨-��4x�3��I�`�Z*zM&�b2}�o����'�sb��Y���AK	M
��ߺT\F�����5�z�j�j�ɡՔ�3��2�u��L)R��w89�3~;��/drϴ�2~<3��l�Ha��=����ʂ���,���g6g]��
>J�>�m�!A2�CJ����s��mݶ��$A�f��WP=��q�d!�<=G⛪�q��[<F*ζ�\��7�O%��T�91�.w�����*&;��Y|�\ܕ�N~;b}�}��+���/��*�,�ͪ��3�e��Ӂ"�+q^#�ah����������ɐ��A|'�$s%�21<�9ߗ�O})3m�c�7 ��Z���+���
p��s��Ji�R�x.�D�gU��{��)�ZYA���5ZW9������\��e!��S��!N����S�� �t�`����I�e��]jDNp�e �W�Ok>�� ��sq���Z�E��Z'�-i����A�1�1�C�����ę49���Q��"���u=�\���ŵ"����ƨX��7s���2�\�c���Bh^��:r#~k�}����3>6����7؄�����1m�7�Y�h�F4�}����O�	�n�����{��I`���&Au���s�~t�lά!1�Y�#�V�Kc��?�����{E�\
�sE~l*�x>�i�"P=�N�Hyhb�o�K� �,��	�Tc��zz�NQ��g��_��!�
�4<<�
<�U�Щ~zm�3t\�?N�N�1p����Lޖ���m�K5�X��(��	g�b5�L�P�����Sն��똡K�u`���p�o�:ʝ�EO8s�3�+��@}���_o��?���q�-�j�eS'�s�%Ѥfs�BN=��ѺJD)GA]9�<TK=GY��8�')�K�����p�uI׉11��wx(�yo����8�j�2��D�TmO&����ת��u�'UA^�O�N;� �E2sn\,'5��UU�����h��r��Jݝ�,�Ux�T��pO�������ѵL�9n,�3 J֨�%o[����K�w��hC��Y�V�6�+����~�w�� ғ��1�u�^%��8g�[��������y��ӝ�����������E.M�?ܞᏪW�Q�i��1n�9�x�Z:���e�fH����Z.z@G��ʒY�yv�MB�\!Gjr�����A�ZH��r����>p��7��SW9Jp:�g��WK��m�i�C�?�Ӥ�P�O�֔K����v�r���M�
���ej�m�^z����U>�Z�Bl1YR��u����F���=�,�s NoJY�UH�J��tgTO���q�F|�&���1	�֫��4��)��߇�A}�X�\���uL?l(��[ٻYv�E
�Zs$����iY<��iJ6ky�U��6�K��p��oP F�n)��h�P���L�x$.�p�P�*��Np*�X��w8��T�c7�<^O7�K�q�e�7nzS�	�#����H��4�ђ������a��|DY�u$��	Ʉ5�<~T���齩�$�v֍Q�d ��iW�q99`��W�C�A�6�mR,i��ǫM%����T�$,�6x�w'(M4&�&,�����۔ a  ��x;<C�,<^ό�b��`��@Jp>�^���� ��"�N+:*
�t�
Y�;%,�*1�|U>��]�k����K�q1S>M����'����$�����Vt�&	�KF���lׁT�l��$��}��
�����i�7]ӵ��3>���[���ǲ��tؗ��i5l���+G�DE��e\<��ۗz����c7���k���@�Dg|D�x4 �4�r��՚�ԄB!���;��"7����B	˹x|_7����L�v���M7,UX��U�3�NG�NՕ��,���*��a_u���r~�o֨w@&�fa����1�ǹ���:���}�n��ovLe�)S��`J�F�Δ��{�x�sb@T�C�ݏ���gz��
����L����9��-��?�ߘ���7���ޙ<��r:���.�J��H���@6������G����w*aD#͗�''���P��+��N�$�\<���3Q˂)0����!�E�v��� F�!-���h�L&���Un�nU]k1��.J�xL,cf��ǻ�_C�==-3.(@��n��m�O�F4�|n�{Y�ř�h��ǻ�F��O�8M��i�wCSn��� ��~�Wq���hE���i�U�q�����QYp�x<Н�����	���h��nwQmN~�
u�'i�|����ї��L�sj�w��*�}��sx?�87�q��~�n��Nw:�����E�I�M�9����c��]���I
v}�������%}���I5p��u=m59��y�T�#�^�#��]��Zq���U�G��1��Ap�GU���}�%<��ǫm'N�A)��A�,<�Z��0Ι����+)����j�Xx�i ��υU7�RՓ�e�@B.h޽4��oIʒp��l�"^�������̦r*|L�D�5���oT|��Ǚ������^�G�bUxt�t��k՗��)9@��z�~٤��)ɂ���۱���K�\9"K�nd�RK�����6-��r�[5J���	?��ħ�֚�a����MDaS��M�?�pF��s�$�9��rY���1�����#%�:\�V�~( ���!iS^xMg>��022��R��.;9"3^;���:���w5�L�X�R��驧z�>_��	�=����E��|�P��x�uB���t�h�0��#s�$�z�"���ֿ!�6�V�Q~<JT��̷1���ԫU_��Y,���gT�	�4�2f�1S��ݒ�+��%���������o��Sf`&U�gt`ȀÏe[��T3���I��)�����5�"��mѣS}��@����hDOU�S@�ݾ��k��S6 !�IX�I����o��K��HT�s4)�L�Q���R�A|V�>
���4	N�g&TJE9��/ۦ�gdY���Z��v�������S&^a�g�c?���h{�($;t�FsD-����`.�g��0e3������9'�/i�e E��(_[��%4M��4���	�yy��f{B؛�'�5�f,9�H#�E�Ł%<ެ���j,��f/Y��{Zx>�?(���5خI,�d!FD������=JY����K���1tx��X��%⛡�Z2>��(�!��:,�T��3�2�0��-�Mh�Q(���j��T.%��x�0�ߣv��X�֟���gtj�y��u/��(a��Lh�����S꟱E/n�UUg�_J��V�>�wۭ".�q?��=�F��e���ݓfd!cI�z׽tK%\.����&���v���'N�j1E�L�8�m�/<�V-JY*E��1���(\���i�I�:5j8'˹/0{��7�Xt�eؕ��x�`f����ᗿ�AA
�`�Q�t��C�9p<f0'�]����Z�V�=~����U:�^J;�[��y�wIə�"���<֨,ܝf�����{�K�刍h�Y�u����_��=�s�_P�V��D���&�ER�;�IgE4s������<GK�n�۶z(�._:�W{T�n|cѱ)w�ī��'���c�A��
'wJ)
�[A�M���}�:������ۓ�Ҋ�G�Ř��LI���ڌ�&NiK�Д�Rx )W�-(���ϛXʎe�x�RU��R�s��Dr�n"~�dߧx�Z~�R&��¥���2ٞ�DxD�^Z��s�S��Nq�Ꝿ�k���1��)-����#�Yx�k^����d��p>w�������n�0����z�j�3Ć�B�H�	�т���H�-<��,.�g(#��pz�RG�Ə�9��؏�Bɒ�~6G̃��f��w�2%%jq�C;O)aM=/#ϐH�~%�C:�>08	���F���� �|S6�
)@|�ߔ�R2$��������:�u ?�ÏMy�ۆ�<@,d/A����S�~xT��8��qX����+%x|S},��3������[�s����(LY>!e�i��z���(vkC�˃��O��w�0?��Z�wx9�?Miٛ�o,$}��,�o9<G�s�xK[f��hp��],k�w��̐��]���3�<�XQ��v{��YS:NO���E�����|���%H&��%�1P};�����<�a�i?C�^r�#|�̄C ��č�<]x���󍨭3V,;��zX�WU�����1��2%-��B1׫!�����s��b˸7�N����=%�Z%�ل��m�d��s9�Ԛ:G[,<~Y��"fE�`�@��%��'��չV#��Q�ĝ������;��^�$���Y�����׫�e��B��Ią����������ʜ�:d�ù������-�����^���@<�K��:���ա�溕�
Yc���Wg{6���;��<7H	/y�|U��[-�"{��E�k��.��ob�M5��8�<�K5���i�p�l��E�_@mY��c�����H�ݺn�l����"m�xA�qzIoL�����c��z�> vBfɂ�L
�.k���T'9���2��nos�Ԃ�����d��㍒Ï"9W?�ۏU)/�Pɣ��ݦޮ�'l4��k�1g��O�s5N���Y��	gr5G],<�����4%��<~)�$�!E}""�b�1�����"Cf����A����˃������w�������H�ӎ�YxT�5���O�U\x�j���F��1-(Z�D���f;32��N�^�:G�x6<#14��s��hS� Y	���$����mR�}��z�U�n��>�w%J��1!��F�(z�UY�j8�ވ}1S�j��� Q�����Ox<Rb�p�]����m&�0�t��|~FY����}Fz����\xۄ�Xx��ik<C� Q��QEx&�\:=N����	�"�xW6�}4�	�;b��G�H7�v7�G�zm�y���Z֍���ш���z��;����o��o�p�I�      /   �   x�3��K-Wp�K�I�KQp�,�,����4�2���LI�IUp,J�d&#Ks�&�(���d(8��%� 䍸L8�S�ɛr��0�6�2��Q��ט�b6NyN��Ҽ���<��	�%g@brf�U&\1z\\\ ƈS�      .   6   x�3���/*�HM,.QJM����2���L)OEs痖d��&��H�1z\\\ 7i      0   �  x�MS�n�8<��B_XO�G�Nb�-ɰ��,��؜��D�4��o���X�lVWW�Z��:�l������y�s/F��?J�73/!�ʤaَ�L�֊_JK�����U�]��7'DJ~��y��#@�,y˾��X>S��,��8����S��{��˅�x�����qH�W���fI���B`�[6A����|i�S�m+��!"/�!���Ѽt����cF��'X��׵��������/�F��2�̪F(��ųm9��o-�K�7L2�����7(2����F|0�"���)A$�Q=CQ:"3��O��v\�U�&�������H��[!� %�v��K
	��H���r"���>M#hP�ʲ�b�������^�X���Y�,\�ԂoJ_Q���)J���_0�h���o4���:�X.�9�F(T++C<Aumi�d�jmu�T�(�j�b˥4��7�����q�]�.�ύ��.���	j5��P���=p'T;B�{>�p�}i%�g��!���r��8������Lp亣	���8
r�H�輛D81�Y~����mS��M�'��.9�I���FP�sH��tS��;�N�u��I�f��U���Kc��׬����gƥ#�iE��K/�#5���:��l4�iX�޵$��q�;�����ģ�}�};Z��O7�%����~q:���l���@h�׽�w������T?Y��_}{���+ħ3������{���y�פS�     