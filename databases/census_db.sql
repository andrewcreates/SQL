PGDMP     .    *                x           US Census and OMB    12.2    12.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25162    US Census and OMB    DATABASE     �   CREATE DATABASE "US Census and OMB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 #   DROP DATABASE "US Census and OMB";
                postgres    false            �            1259    25214    cbsa    TABLE     �   CREATE TABLE public.cbsa (
    cbsa_code integer NOT NULL,
    cbsa_name character varying,
    micro_metro character varying
);
    DROP TABLE public.cbsa;
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
    state_fips character varying NOT NULL,
    name character varying,
    postal_abbreviation character varying,
    region_code integer,
    division_code integer
);
    DROP TABLE public.us_states;
       public         heap    postgres    false                      0    25214    cbsa 
   TABLE DATA           A   COPY public.cbsa (cbsa_code, cbsa_name, micro_metro) FROM stdin;
    public          postgres    false    205   �                 0    25179    us_division_codes 
   TABLE DATA           Q   COPY public.us_division_codes (division, division_name, region_code) FROM stdin;
    public          postgres    false    203   �?                 0    25163    us_region_codes 
   TABLE DATA           >   COPY public.us_region_codes (region, region_name) FROM stdin;
    public          postgres    false    202   m@                 0    25192 	   us_states 
   TABLE DATA           f   COPY public.us_states (state_fips, name, postal_abbreviation, region_code, division_code) FROM stdin;
    public          postgres    false    204   �@       �
           2606    25221    cbsa cbsa_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.cbsa
    ADD CONSTRAINT cbsa_pkey PRIMARY KEY (cbsa_code);
 8   ALTER TABLE ONLY public.cbsa DROP CONSTRAINT cbsa_pkey;
       public            postgres    false    205            �
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
           2606    25199    us_states us_states_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT us_states_pkey PRIMARY KEY (state_fips);
 B   ALTER TABLE ONLY public.us_states DROP CONSTRAINT us_states_pkey;
       public            postgres    false    204            �
           2606    25205    us_states fk_division_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT fk_division_code FOREIGN KEY (division_code) REFERENCES public.us_division_codes(division);
 D   ALTER TABLE ONLY public.us_states DROP CONSTRAINT fk_division_code;
       public          postgres    false    204    2704    203            �
           2606    25187     us_division_codes fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_division_codes
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 J   ALTER TABLE ONLY public.us_division_codes DROP CONSTRAINT fk_region_code;
       public          postgres    false    202    2702    203            �
           2606    25200    us_states fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 B   ALTER TABLE ONLY public.us_states DROP CONSTRAINT fk_region_code;
       public          postgres    false    202    2702    204                  x��}Mw�8����Wh�6�~6I�c鴝�Ӗ�g)��>��(X�"� i��׿�R�{Ω�^�Tg&�H��ED n������o�+���V����w{W����4E��)�ޚ��������3�(me�,��oS��e�8��k����A���~�C�2����lZ�.��D��Yْ4{_*��zG�y��[�uivn����1x���v�=)W�:�1���p��ͣGK����ݸa�,�/�5f}���c�~��a��_��|��5�o���z�$BFg=䝾=��QƄ�h��ZO��\���f�jm��h�G��0�x�5��B�0��Y�f��-��}T�7����.�1u�Scv=�_s�A��Z�`��R5�e����L2�8h��8�Ѥ���4$s�Y_d��[����b;K������X����~>��VY�����.��d?j�9�UǄw/οsPXU�W·/,���
�q���7����$������KŃ��>#��|�9H˯w�[�d�y�+���Aq~kֶ���N�/�3�qun;�c"����8$�A��hߘU˟\� K��E=�} E5Y^����" ,�жS��t�5_�3��7�CBB��4~kW�����������E���զ��s�m�����CE�-(�3����dʎ�ы0��+����W�Az]s��b��G�{[[�!���nښ��r����cDsqqİ��X��n]Moė���4�rE��^q=xq�6���o,o���'fr�f�j�5ӽ���̒�������%Q��<��(���)x~DW�lw��D��;����]Ç����_ެ�L.tj���:�܃<Ř7	Qч^�v� n*���y��.䧄�jJ[wI�6�1:ߘw�O�j��+���O���u-O���'�KC}\yk���<9�w?tF�0<���0�}���0q��u�0u�er�f���K���,������d�_�E&�̈́��Ͷ��-_�G0�}��`��ܚ$�� P�X���o4DV��&�8�hs��sq�$)z�+��Sh(1�Y�%���\��UE;d?�����E���(���e}ɼ�$����^̾X��&$l��o8�;��n͞�"r�*���� �������'c���Tt�-����Ǌ������I�T�Xi��s�1攀�Q�q���r�L�?�!��g�g�����t/v,	~�<��c��(xXd�7�������k$O��|����% ���]y�IA�ncʶ���������{qR��CW��䅔�֜�TA����W�8����2�`�EO�c<����`
�sm��G^=����^�[��ꃸhSx�O�C�S����M�I��	V���0@�Rp�����z���h��Ug_)@)@;��͋�-�f����[k��D�zڍ����6!:��W��Ŏ�>zr�Ô�W"�_���sۜ�U�Ѿ�5Ɛ�cȾ�x�!�\��<���6.�� �O���?o��k������Z�.�C���@²?~#�����[S}�_x�Xؔ�v'��ɡ1��y/@N���)� ��8�2����	J8]����h��&��ƫ<wAPm��n���4Lu�Lu�i2�1v�Lueʜ|r�?}��'�/h9V�?�ߡ[���[�o|�Tw�Bx&��	B1�Fx�ݚW��Q_�1j����~Y�N��cWQ��v-S��]�0U45u�qw����=�s�͛2�Ό==X_�P�_��gq��-<q0����D�17<C��U�)��:3px����ze������/��1F޻��R{�����I�:�1�޳���fȄxeצ?��)��!fһF�Ȑi�ؑ������b�C&�+[54�����|�� ��2m/ξ ���!���+��p��P�z��xCfL��M����~e*���`̜�eÑ���3�Z�ϩ��	%{�6����A��(�~��q媌M�[�?�%v����ɯ��'{��q�|C��oՋ�H6� ��8��Zr ���f�'����n�M����"��k棟q���l�s� s��i��tUTYQU�o�~E��;�J������Xcӎ�C���Hv�F`����0[�Nz��w���2�D,�!���p�&n�#Ri?�������x�3���{/j�&7�8��J���2.S6�Ar�������Cr afroo��@��r��GGssÌ6v��៉���Qy2#p�+�Z���P&���s��_���)@���d�BbD$G �g�)Ff���� �����)@>-��� ya�a|�-H/��m��#9�6푓m�.���\=�fO~��^�Ru�8y9��M���.r�,,"�@Y�eq�\>_���z�z5kj����wl1�сq���V�Y��nh_�5��@,u�FI�X<7l"�惃J��<�x[gd��>��!��j��<��)�g�fM�G��OE���Ơ%�j}�hbj��N9Ձ�ڻ�ܪ���R˖{��_G�=aj��a�nH�&?�&�����C�	RM���M�oq�'LV� �S�0Q}�s�I�Q�畍����nO��!�%o �����SjH�É��:|�.�%�N�~°�Sj�&}���������b�xm3Ӵ�#�	S౽�l�}��;ym�
Se*[�dym��K�4T9��<AMF�t���#]�,��c���h_NF������d1E�dȇ�l0MFx�b����j2�Pփ��9XGK���5����Km����mE�ȡ'_ir)&���E�-�)ʓX��Sz]����f�k����s�����wM�dϽ�j�=p�HQa"�!\��k)�(��]�d_���ݖ�#G^1���-��ůM���m��|R��1D���h��5z[e<�bR��u�9gKaAĐ*�}��y0Y�9E�*7{����Û�yB�����)�9�Z��lJ;��Z7ZLT}һ��!5���o޵����0]���iW%�vV��C7pC.�_ת/�4r���'�;�
��	���c$�3�#���R��B\�uU�I�H��)�?��r�0�%c,F��U�����V����x�{�<�� @n��%��j>b�Vpֱ�����.������y.b�9>O0v�ל=R�0hyid1D74�����n�b����LE7�a{��4��147���5��M���J�Y�!4�����hB4Vb(n�7�����Hޝ �i7����D�2����vk"�Cpƹ����ܼ��;%�|�B ���w�!&`O`e�--Q�B�4 �C�1���PEvJ�'@�\�p�)/Xh
��[��u4�:+�2M8E�/�����t����Q%C���?ҊUb(NA��������R��P|�~���
�jX�1@�O�Gc��^T�6�w��<�E�'���94�K����F=���s&���Wxq�4��t�idV�%@�	��m���5ϝ�!��{���۷n���!�?#��������0' ������/�~b]@p�4��  ���a�,�*V��ԬY<=X�m�]�#��B�����d{2�2f�'Қ��� qdJ!H�Dǐ6 7��|����.����/����}#�"TC	p�caq�v�b���S����O0$�i�w�� �M�G���c{����O��Je�#��֬�{$r�o��*�]1�?FJ�-g��v�;"���0b�4��F���{i����x#��,۽�PD��-'0U�2�Su)�Â�Z��%��OEj�ċ��v���+Ff�-���������7�(�E��߲C�����2�0�c�_[���}u[rX��:�Q�,�[W����VBF�-1��F:#���%�*[I��՟�X���G[er���4%��`G=�H�)�)��Ū	�^��"�э&o!�$ 4�K��]�-��f�N� @zVJ���` X�`�Y3Έe[:  ��1� �`    fGw�&'� �b��Ύ�@��G�0��P��t�t�S�����W���"��]r��Z����~�y-�i�~A�ĝN�(T����O���5����.�m�7�}+J���p����s�H6�w�}E����7E?}4G����/�������_+��1�w�������yX�20�{U����a�D��x_t�7�Mԥ*��@�:My�@P��b��`0Q?�iZ��egv�r���;���M�v0�w�i��\SL��x�5~��;���)1_:F��q7��(���ᬱ�*>�ݝ=���OCpg��/�Ը�3~W �wF�ʴ��H1Tw�29�5�*W�(x�:
� ��(���̮� ��N�8Ec�_������O5�L�P3��G�$wn�R�)ó	�.���S�ܹ��ɦ1�֮�[AIp�&�K��X�CMp��i��k>�I��AFp��M�r��$��D��X��ik�r�a�/r�P�y�ۍ�ǐ�+�@bp׮�^u-�/�����֡N�I���7����-_9�[�w��-�8�����p�"�4w-j���ꁻ��U��C��>	��k���~3�c(�ua�Rg�3����ܪ��}g��R��A�~�U��a½�0�F[\%� ���L�8�AŜ�H��C�p��&S�J��P��j�~�K������?b����l���=���c"�헿"��� ����a�D|ɑ*"������ y=C���lW�G�c�!�8"���~q�S��
������7[���8�#2�	�trl�������U�0��`ڇ��Bjn��:�Ϙ �8"��=b� "���J���C_����T����W��X?�� ��#;9�E�pG��lZ@���D�&��m���BE�`�l�hIh�m�G���ĹEŃ)�#��9�5@YH�!� dA��dڊSm��j��ch+@&�q�E"�Ba�`��h�sH%��8N��@�$,DB�z�Zs,K�Km�|e�C(]��ڡ�@{�>��v��%�gh&��j�_�Gl�l��)�Q�,�a�n�BICa�@/4��!�j��	���D���]���y)�X
�J���� �
 �^ ��1�ˤQ����`T�!���&�-P�13[q��It��{?ḭc�lmB*�h�nW�D�di���F�Q[��!������[�'��s���+'?��`�pa5cģa@���6t���+�U}K�=�+/\�"��3�nC�Q��AK#f�@��?� ɲ�=�-���P?<�U��e�?����bLy����5�(��?h6LH�7�Bud	���kU�$���S�6��&�
��ڍQE��88"�cL0�Q��ȥKIĐ<���R�>N&g�y��e��L��|tiJ�� �BPf�'�*����	�
��"#'�*�?�Eb)���#D��	$�,/�a'�	�+V��K���b\ApG���u$�1	�=&�+	��d\���>4a���c�Ř@�pDD���A�mM�Kx,V����;%�5��i�	�E��R��I a8�O��ԃE��P���o�\�a
/*�F�uz�n��P������H�%P5 P�uI^	t��BHU�*I j��ֵ*H=��� ��]=�� N'ȸ��=A�A���4w���m�S�5&�5<��6��=�t�55>����q5�����15Yr��۷mQiB�G�uu�w����r�f�Ô���J�!v��U��X����(��6m���lPu���� �ñ�	K�{��k%�	nY��M�J�	�SS�����Kq9�1vuĔ3�,ۑѓ��sV��0\U���S�Q�n�2Eu�҅)]�!�'LBo����>�q��p��Np��.{�\3��q �fb|v��\^��S���@A��Նȯ=!�� X&w�|� ���0�`̈��	$!�Ec�A�Х�h�	d:hcI��3���H�ăٴ�OEnQ&<t�\��8p�A]�0�xa�]�6��b&R�#J[E7���DӢ�U}�:�iv��Dt�(�ٴ�*mz^�4��݁�l��J��5�����ô/q/�K&P)L�n���%��#٦��`j+�sUa5d
�����j��Hp�5/���8q�p<�[%������Ʌ��:\ɥ^��X{����@A����C�����@�J���Z8Gi7�fA��}��%����%Ŕ'�zcO�l����i��FK��������V��XaŔKd�_--b��}/q��ϛf�-�/%�5h/跸��xʚ@y��� S��.�EC�ozbnF���q!��jŀ�����[�@l1uk>&�,xܟ0u�w��qqF�\1��W�j6ng���M�C��5��$��ۜՔ�j��r�a���D����)#�@'A�Gk��*���3�}��	$��փGTq��	DS����2_@����[j��#�����Q����%��rk�<7;_\1'PF謴�6��T�����ɼ�D��\���l"J�+yx�J6	�_A�� ��)��)&��Ĵ��B��B61m�7��	t�ǥ�42�2	Bl�F�-�@$� �����H$����?� a9<�Ι��t�
�'��ڱ��Wl�=��*B�5��8�;J�d#
�	���k�^p:g�W|�6�FQiY��
�'��lpF2CdH�tc� 1?��^�b���N�5��	~�U�D��)Dv4 �`���i����	.b`�'Ϊ��[bfl����gyQ��yF]]*�X.�0�!J-�'Pf��.��z?˝&Va�������1��������_�ӏH>���
O�e���≯��|�,�'3qɛ�Q����J�H��A���xS��D|���Ŕ�����+�]J�`.��E��'�P	�9����`.�7N������n�Jx6|����-,܋�L6���0�9�GST��4�"ᙬ�>o@jN��yC3B��.��S�;��A]��Y@�#�!Px.�+df�@��,'��*�7h�����Μ��:������[_��a��PLfѢ�uհe�����MćT4�oEbby��se�^C��2�=Sc��+�_��z��ֵ�Qm��#<#�'ɻ#4	Ϩ���v���a�R,6Ξ�|�j^�4sM�2��zkJ�x��f�p��a�ީV�8Q��|h.Π�<]s9		5�9�z{f���	2;��!vx���˚C~h�[��!4Ͽ�L��y�U�j������F\���O\@$f�%�=�̺�L�qeS�����e#�fD��Vs�zE7���f=��رv���r�Z_�hQ4��0H���/MQ=3E�*s�S�.�3o6|��&4 � !
���	�}k�C��o�Kf^�� Gk��?�-C�k���9��h̍F#jN�o�2EW��f6s��s�'Fih��-zr5K}g/�"��Q}�	
���	t3�[�a��_#\���x �.�F��������rg��7-��p�VV��?�$�:��š�4�$��
�K��0nL�-��EzјK/1$o}݄����B)fق��`V4M��&Ow���\��1 }�>���4E��r$��NǊ��j ��lZAy0#K0���'1�3���SBN�� �CN���Hvp�@��*3ڲ�	����gH�uSpQ;y?��`�������O;�4�����T0��!Lc�Al0�n��.o���I�����5U�Z.��G0���}���G��b��EQ?����E�U�j�Vw�W�Q2���]�-ÌGɍ��n���R�BT��]��-���+��v��06�u����X�"��a��=}�ф��a��{�F�ȥ�n�~��d�����.z�v�qšm��vU:E�Y'��&�c��a����zU����Uv�mm������d��e��7�4��L$���P%�c¹H�.�.���J��^�Y�G��]x���z�	��O !
  �}$��	� �7(^l�"����+R%5P(��/��r�O���J��'�}��(�R�^
�)�B2ȋ�i�7�`e@jZ������EE����+���!]��҇g*����B�е?����Z����j>����4&fl��0� �� ����C�At6R(�_��8���:�S�"t|�Y�E�/B߷�P)B�h)D/��ȱ)T/8nӫSH$^\����}/���@��h�Q{~��X;.��i���ֵ=ʏ�xB
��K�7b�2�����=Q��Bf17�7;>�x��	�wW�N#6H�����0��`A
���l��|(N�R�(�$�*]�֬�s�AF�ڧ
$�b�!?h��NݞB k���K�S�$�y���rR�$N��ʙ6<�%`�=�B�з�ܥ�j���o�B��ך����Ci��u$��B�@�fp��U|�!�RK#�L�0������7m�f�@���ׅݸ�*oK3x�6&�/W��(��z�q�fK�;��[M��
��9���@��=�4�� �&z6�P_��mW�T�٤�[�a�.|z>�Ɣ�o4o����ɴ�Wd��P|z��~�5}�MkꈋdVf�4����#���yU�{�=+���/�݋��O�OI�����V�<N�n��ڬX,���D��RӍ�7�Wʱ�mE���f�1e��a<�-�n^,4ҏ���y7��d+�9xM� ��aΞ|�
�����B��aB�.��������?�3�:�QR�o����j��4�1��2PsV�F����T���*��	ϣnW������|����]��j0�ٚɃdצ,T�(�s��Ml�{�Mp�-wF�������QE��D�槥�%z�^X��=瀱�V
1�<7�=r1��BM��+U�b
=�<�+w��X��PM�\i2qS�$Bs� A"����S	jQ���H0�v���VA�)[ I�s�+��1�!���޾�P���5M���r�<z�e�d�ڊ9�1����ZI1>�Bb1/���]��BG1/Xc�g)����µ������&�q)D�-P�{Tp���C(1gYBm5w��PJ|dK`z���;�Ԝg\A�5t��\p�� �oL���#a�O{d�չ�2�ڂU��~b�����_4�>A��ۻ���o�ow�����r_��mBt�#��S(/�b��|
��׻�$�r���vgm����k����Fe�@zTgc�>7���m�����@�5jv+g���ʑ*B�s����B��<e|
����<��/^��|�wnH�u�K$�7o��˶j����� ~�_yࠆأ�5��
���������jw��1��j�v�ᒩRrqCxDf�3�RmN}H	��ڦ��r�!]�����j�P!,L^�����wC,�-��n��<�&3�FeHC� lΉ���������m��+�wC���TU&��aa��'��R�)XpJ��δ*�o��7�/*V/�KVi�G1��k޳4U	S���W��XMY����>#N^C�=�z�A�(��e�U
�5׾���e�3���eW��uB�p{�5�Z%)$Vkv	fW�� o�<���ʼ	���C[q�An��S��4�ʅ�o3Vy�zZ�G3Jf�!Sբ͎ɍ�b�<,�2��G��e4> ��l1�Z��{ĢecZ���pQ��B���(*ue�r�š���5u��`JW|
��~VE��zص>�*-@��~�}Ěr8�<��ȿ)۲UTnN!�����Iy�����)�*sJ��kW7F���k�T��� ��?-���,�B}�ʷĔe���!�	,��
zb�R
}@��R���m������hB��<�GgxD �Iw�2	V�]�e��'D(���덖@G�7��_Kە����N�kA�qU�N����N�8�����*�b�עC$�;H�fejM�i�;	�&S��A �4���pa�� �%���_����ٛ�����V���%:�|4���E�������)��C�~M�n"*�/9��C�=F�G��/�!O,�
�������D�pb�J2a�5���UDSTsI���w�}4��. �e�)��l���]ٵ���T���q�.ey�b�e��}rH��۝f��@`i�,o{ͧ�s���-Jp����,�!�Z�j��`ik��T�	a����F.�mWǀK��.�$s��V�������B����5+���.�F�t�%�S���:ʋ���Oy�~��T��:��ߵ�ׇ��H�_�Uav]�W9�z������F��)R�O5:�^���S��,�I��n������#!��������kr��"#f�f��I�H�'�SI5ST�_�[�.I`��/9ф+����b�7yR#C�o~�0:A~<�B��'EF�����"��Di~���%���	&>�͝_f���27!/���B�Uޅ���vU&��ŝ�B1y#���kq��T�v��9�4�z��W��y�ծz��l�"���O�x ���i>�TL����h2�������?6Ae�         �   x�3��K-Wp�K�I�KQp�,�,����4�2���LI�IUp,J�d&#Ks�&�(���d(8��%� 䍸L8�S�ɛr��0�6�2��Q��ט�b6NyN��Ҽ���<��	�%g@brf�U&\1z\\\ ƈS�         6   x�3���/*�HM,.QJM����2���L)OEs痖d��&��H�1z\\\ 7i         �  x�M�ݎ�8��O�"O��?pAw��D��^͍<��n����O�zW��s�|�T9���u�12/�Fb�VH0���(I�o"S/H�\�4� �ѩ�d��V�RZ
�y�NN1W���0߸�3BR�s/�C��!B/��-�b�c�L	S/�������Oy��R/�n;�e���#1^���;�bI9����z�Ņ5
�	'(�VH%�5"�^8E!/�Q�E�����eN�ċ�\�ځ+.��|�a�f-�"�� �M�έAQ��	�Q>ے�����2yA��z���1�����A����87�I��M��F�e�L�3~��e���,U�&���q�R�~W�q���k����E�~3�:������dݧi5�ZZuqb�����A0����g��t2ߔ��zsqTJ��?gZQ'�6��xz�X��Xc�p�f�4Ba��6$6ז:J�YY���?��fg��D�r)ͭ��������$��Q���`W�j���/�v���qT;A�{>6�p�}e-O���Є��r�f8������8r�Qpt㟆8
��Q���n���g��S)'���'nz�;�tt�)N�4�b݄�N7�Q���Y�������k�)z�5~V�yY�~�����=����h괢�覗���u`^0�4�m�^��.��s��/�Z2����mk��>������ [ֲ�ӃP�{��ƙ��<��~"�Ri3�퍊��xx�L]�3�{�X��>y��/��U     