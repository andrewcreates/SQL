PGDMP     "    +                x           US Census and OMB    12.2    12.3     %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    25162    US Census and OMB    DATABASE     �   CREATE DATABASE "US Census and OMB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
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
       public         heap    postgres    false            !          0    25214    cbsa 
   TABLE DATA           A   COPY public.cbsa (cbsa_code, cbsa_name, micro_metro) FROM stdin;
    public          postgres    false    205   �       "          0    25223    cbsa_divisions 
   TABLE DATA           u   COPY public.cbsa_divisions (metropolitan_division_code, metropolitan_division_name, cbsa_code, csa_code) FROM stdin;
    public          postgres    false    206   JE                 0    25179    us_division_codes 
   TABLE DATA           Q   COPY public.us_division_codes (division, division_name, region_code) FROM stdin;
    public          postgres    false    203   I                 0    25163    us_region_codes 
   TABLE DATA           >   COPY public.us_region_codes (region, region_name) FROM stdin;
    public          postgres    false    202   �I                  0    25192 	   us_states 
   TABLE DATA           f   COPY public.us_states (state_fips, name, postal_abbreviation, region_code, division_code) FROM stdin;
    public          postgres    false    204   �I       �
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
           2606    25231    cbsa_divisions fk_cbsa_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.cbsa_divisions
    ADD CONSTRAINT fk_cbsa_code FOREIGN KEY (cbsa_code) REFERENCES public.cbsa(cbsa_code);
 E   ALTER TABLE ONLY public.cbsa_divisions DROP CONSTRAINT fk_cbsa_code;
       public          postgres    false    206    2713    205            �
           2606    25205    us_states fk_division_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT fk_division_code FOREIGN KEY (division_code) REFERENCES public.us_division_codes(division);
 D   ALTER TABLE ONLY public.us_states DROP CONSTRAINT fk_division_code;
       public          postgres    false    204    2709    203            �
           2606    25187     us_division_codes fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_division_codes
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 J   ALTER TABLE ONLY public.us_division_codes DROP CONSTRAINT fk_region_code;
       public          postgres    false    2707    203    202            �
           2606    25200    us_states fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 B   ALTER TABLE ONLY public.us_states DROP CONSTRAINT fk_region_code;
       public          postgres    false    202    204    2707            !      x��}�v�:����+4��ú6I�1�+�L[����:k��`�-�P���:_#6HY�^�DԠ�Tfb�lDb������v��~mm��`~�i�y�weјj0oLS�M��rp�����yz
X^ʀ1��V�����6��_��cj�6���N��׾0�*��rs~�Mk�EY��{mV���^ėJ�����s����Cj]���8�v���]pOʕ��.�'\�}�����br7.�G�<��d�Y��w�ا_"~owƗ�5���~�������>���Yy��D��|�1a<������!:3«�ߦZ[?�.���Q�#�&��G�k��� ��rE֭��CFK�qUte�����E��nxj�.���kN0�;�ZK��V�洬�y����CF��Z��`1��4_��d��b;닌�p'��9Xlg��w��Aa��!�4��������U�;o6<��g��h>ُZ3E��`��1�}��9(���+��^VUϸ���Q_XO�?�~_Z�ԥ�A�s��SW������;�j2���͊����8�5k[�s~����:��1�
O��yI� �	c�o̪�O�@���끢��>���,/j�ps �jh۩U�:�/�Bꛋ�!!�yt]���k�V�j���N}��Ds�"��|�jSGD���i��@\��"�ݛ��UX2e���E�������U�+	� ���Lb1hͣ�-���@�k7mM��Rd9u}�1���8b؁�O,�n�����K�G	XT�}9��y�B����l�Y�7�7_��3�^��Z�b�t/�?1���Z_��$
��'�)���Gt��v�*L�pX����:��>�����f�\`r�SC��_�a��)ƼI��>����pSy(F>���u!?%�WSں�H����Ƽ3}*V�]i���w�x�^7Ьky�ȶg<A_����[��������3�5��)@�߄��ʚ���}�i��E���1�9�'.}��^��&2�����<7&�+�mKKZ���`���`��ܚ$�� P�X���o4DV��&�8�hs��sq�$)z�+��Sh(1�Y�%���\��UE;d?�����E���(���e}ɼ�$����^̾X��&$l��o8�;���̞�"r�*���� �������'c���Tt�-����Ǌ������I�T�Xi��s�1攀�Q�q���s�L�?�!��g�g������]�X
��y1�5Ƅ7�	�Q��o
�+[�����H�������J �9�򶓂
�Ɣm��;$ ��+j����I��]��R
Zs�R�R0[h^�� 4?��삑=����2z#�)hε�y�,���>x��<B��Ma�?��O�Sp�7�&5�?$X��f� y/H���V&��Yn�7�m�V�-|� � ���O4/�w��6��>#l���R���i7����WL<؄�؞^-�;����S/\�d~��ms�_xTEG��C!���O�|p��d�۸�_�|>1������*��"�;�sk�� ���	�����6;����LY��A�#baS:ڝ��&��l�f� 9�v��^��Z�[������_��NPr���t�Ds�6���7^��j��v�t@�a�f��pN�i��f�kS��k��v=�}A˱"�����̌�j|������3��N�y5�[�ּB��b�Q��Wd���Rv�/���:�k��/&�
�����k�����.&�ў�mޔ�7f����:�r�=<�;�]ቃ��]&������W��N15�Й��s|g_�+����5|�Hox�1�ޕe85��ch|}�O��9�1 ��͌��5C&�k�6�q�Oq%�0��5�@�L� �����̠ז�E�2i^۪�9�uE���tx�'�isxq�!�v�5�ɜXє��4���+��2c2~o�M��+S�4c�|.�����y�Кh�|N50 �O(�3�9�>^�Gi��7�kWel��,�kE�w8�O~�'=�#�C��g�x�^<E��0����!Ւ���7=u��tt[n
u��)��F`>������v9�2G��fI�@WE�UE�Ɛ��W$��#p�t�8�<�Y�!@��56�<��ތdi&*-���a���x��M�j �O�B20Q���pgn��9!����L>����W;cQn�����lr#Ў3��Tj�/�2ec$g[?X��ː>$F`&��f�$@0�+�|t�17G0�hc���H���ʓ��\I���'��0��՝��Z L�N2��&�#"98>�O12c�φ� y����N�i��<=�k�+lA�x���h�=���1h��l�v�Ǡ=����9h<�1�zaK�����h
6��S���i��� e���1r�\l|:�o�A�լ�q "_�߱�$GƁ_|X[�f�Z���}�֜v��Թ�]$ab�d�iܰ1�ě*��4�m��i��|���y/�G�ܖ�d��ʚ,�n蟊J�ǍAK������Ԗ%b�r�=!�w�UE�'`��-�n翉d#z��tC3��ݐ�)L~�1L"��	���R��0Wݘ����pO��>��4a��������+}3��ݞ��CLK�@&	��n+DI�Ԑ~�+���-�(��;)�y�.N�I��ͣK�C8Ɠ7�	s���LӪ��&L����~����^�S�}+L��l�	��-/��P�d��5Q1�-�g�t�A��'#��.��}9a(�w��֓�=�!"���4��_�5b䣫�CY���`-����?&c.�)����Q#��|�ɥ�0;�ٶ�(Ob`q�N�M�[�O�Io�zӟΉr|��y�=��e�9���"E��C�p�o�,�
��v��}͏sw[>�TyŐЯ��"�6�羶e�I���-ܴ;��S���m��ЋYH1�
7��-�C�������d������B�o��	1$7�.,���j�[�)�`fj�h1Q�I�bD>�Ԁ�ӿy׮�W�t1���\���YE�r��-��~]������[��#.�*��r�' Z���� �pjK1��	q�Uq&#���,�4+�!�ؖ����GT��*�[q4������̆"� �!�Lv�I��� X�Y�b�+�2���ܗcJ�繈���<��^s�H���契M����B�J�7 :���u�3�Vd������3�����j�,��5��+�f%���ޛ
�	�X���m�2�/#yw�x��X2xC �K������ۭ�X��CGp�n��@�b	 8��r�5���=�����4DA!Ҁ�@U� 0�SB�)1� �re��f�ᦼ`�)�f<o�O7�Td�P�h�4����h|LO�mb���BD�\�7s`�H+V��8usG�/n���Kq�C���M[�+Ԫa�� Up>�)�[Q�K�$߉��͟��_J^��|+ͦn�����bϙ8�q�^�1�1��ґ��YE�� �' ��uF6�<w��X��!F��nߺ<r��l�@�@[8�SZ# ��d�"�
�Ǿ,��1t �1ҰD�<Zr��z��S�X���aS�f�T�`ݶ�vQ�H�q��o�3����ʘ�Hk�WHđ)� �C� �|W0��%��h��"^P�� 
�F����p�PI%�	B���I�g�5�E�#NٶF~?�����ޑ�O��7�G12���e�BZ?��+�����;��C��	H�#z��vŔ�)�w�Y��b�0�È��:�/ŷ����������l�C	�w��T�c0��gLե^�k�&��J>�)>/�;��j���w�n��klK$�ߕ��pZ�����Qo�>Nʴ��~=l���]�a�~�gD1���\��2~d[	�w�H4��T�t|�Ėl\�lM$�XTcmH��m�5ș��Ӕد��4"5�L�� ��&Dze� F7�����м.�tw�?�A�;ɋ:� �X)i6��5 0`�Vd�@8#�m1� �PDǐ ��    ����X��I>:;���u�ПB�g�1��O!��_!�F���OHt��CjU�[�N�q��ܧI�!w:	�P.�#?����NS'���-�pXwU��w�#����a�T�l�����M�o�~�h�f���_(t��1�A}�V(kc��MAǵ���e`���*r�K�� ������o,��KU�z��u�$�R�������` �~�ӴX�����.1$��a���`H�M������#��Pk8��5J�vŧSb�t�$�{�n��Q4���YcU|(f�{{dٟ�>��z�_��q1Fg��@��֕i�b�
��er�kTU��Q�Vu��Ql�#*l/�]	Av׽�q�Ɯ�roMoE�jJ�Ρf����H��j�2S�gn]v	)b��9�w;W�Mc>�]ٷ����M��������5"�:�{�|������޵�<�7��H���y�rk���P9���,_���:����!�W< ���]׽�Zx_pm[1٭C�.�!:�oM�'$:VZ�r����C[�?p,U!O���+D&h
�[����1��-��t��2�
�}���M�z�]�@��,�^�ӗ:���յ�V5��;[��r$���#8���>���k��U�w�>�)�1���=kiĐ#|or��N%Gl(�`�����i{q��h��^6�Gl�ۋ��1���_�l{B�A��0H"���H_A�VM�W���!��av���#�1ŐE�M[m��8��)�DF�@��w��ʖ�h4N��rB)����o.s0d?̡=��!&���۷�� �3&1���p�<���G��Rkb��W��5:o�,�����;)��4@a��Nt?�Qg'�F�p{$�)����G[Apz)��PQ<��-�"Z��n������{q.BQ�`J���tePR�BH+Y���,�����T[���l��
��y�fуȺPX<��1�R�k<�d/:����ޠ���R�R�5CY�Ji�v(+О���]gv����뽚l���6[$i�s:�{�۩P��PX<�n8l�ĿZ�vBh�@�<����}��A`�y`^
�&����?9 ���H1� ��|��2i�0�8|*s�i�y��{Tv���V�)w����O@8n�X�'[��J<��ە����#Y�,���sE�Vsu��w�����-�h��I|v����Pt0F8���1���0 Tt�d�Ng�Ӫ�%��.d@ܛwS���(�����Q�w�@�dYp���Ո}b�٪�Ȳb����L1���C�@��zb��4&��ƛ]�:��~��۵*c��G�)}��Z�q	C^�ƨ�DP�1&ͨ_k�R��$b�M�m�q'��м��2�A��h>�4%�d�R�(��h�����Z�c	}��h���#�a��"���G��ǰ�����?��%��B1� �����M$�1	�=&�+	��d\���>4a���c�Ř@�pDD���A�mM�Kx,V����;%�5��i�	�E��R��I a8�O��ԃE��P���o�]�a
/*�F�uz�n��P������H�%P5 P�uI^	t��BHU�*I j��ֵ*H=��� ��]=�� N'ȸ��=A�A���4w���m�S�5&�5<��6��=�t�55>����q5�����15Yr��۷mQiB�G�uu�w����r�f�Ô���J�!v��UtU�V�r�	�SC��Q}S6���Q�r����^��%�=t�����,Lͦr��
�ʇ�)CO��㥸���;�:b�r������y�9+B�G�*�R�)	��(h�r���t��.���&�7}�wyaI�߸�Y��@�r'�n�U��G��܏�8�t31>;�l./Y�)��r ����jC�ׇ�un,�;p>��EHz@0f�����̠`��c���2���$t��Ut$P��lZ��"�(��i.�N��v�@�0�.K�K1)�t�����upx�iQׅ��C�4��F"�V	�lZT�6=/��a�����@�Jq%�Ԛu��t��aڗ��%��v����M�lSBt0��۹��2��`j}f5�b$�E���pm�8R�aJ�׭��	t���
���Eh��R��Ռw�=T�VH ����Y�!��h|z�	z%�F�l-����\��pS�>sT�ǀ���ꁒbʓt��'y6�[�ߊ�ô[k�%��HXc�@YA���D,��b�%�鯖1Zـ���������?3Ӗї��	��[\M_<eM��`�r���	�	dӢ!S�7=17#��b긐�A�b@x���C�-I ���5k<�O���;M�8�8�o����+W5��^S�&�N�!�՚��	tS�mΉjJ�\�DH��0�d�Z�O��ДM�� ��5�qC�����>��	jn��#�8�B�"�)���p�/ ���Z��-5^���R��Ĩ�e�uߒ�x�3�h����/.��(#tVZS�^T*����d^�H"���_�h6%�<<U%�J�� �K�\��ᔌ��Zʁvb�VY��S!����M��:	���?Tj�!�v�ʖJ �`��X��V	$�߆�şB�������Fb:Q��f��?W�+6��^!�h�s܌|��%O��GBэy/8�3��+�yL�(���,Tt�œ��O68#��!� �h�1R�����}�I�Np�h���f�?��ԍ*m"�L�";H0Qe���r��10��gU��-13� y�̂���(��<��.�L,i��O�(3��e�~���N��0���r~������mM�ӯ��G$H�r���2�@\���q{>]ޓ�����(��T�{f�A�GJ� ��b��]c"��V�b�B�@\���.%0@ˢ��e��n�QL@0���r�ރ�D^7P%<>�	����Ex�?��A��٣)*�m�@��LV~�7 5�o󼡏��wB�)��������, ����(<�2�A��Li��{d�	�	����ngN�Y	�bryfT��������U(&��h��jزMM����&�C��*�"1�<�@Ṳ|���u�ٞ�����/r�u=_J��ڨ6S���������gT�u��w;k���)�	g�u�u5/a���&b��s�5�s�Zd�q8NѰG�T�}���}c>4gPs��������S�=3��߄
����;<t�e�!?4�-�r�����\&Z�<ɪ����^iwiu{#.Z��'. ���ff�f&Ǹ2�)ufr�����	d	3��f��j=�"a�p_d�rB�X�N�Z�r��l�(�V]$��`Ɨ�����W�9��	�7��O�@���������܃!���%3���J��5H���!��5A���zX4�F�5������+�x3�9]ǹtҌ�44Y��=��������j��ר�����:�����0�J�������L<�g�l���F�d	r�g��U�Rm�D++v�r�g�����V�j	�g�ť�rP7&̈�m��"�h̥����n�tdvf��lACE0+���r��;tGD�I׃� ��t��CW���L9�w�cE�\W5 �wF6��<��%j}ɓ���V�)!'tAx��!'���k$;8P �\�mY���X��3$Ժ)�����Be0s���~V˧P@�SZU*t����1� 6�u�[t�7�Ԥ`BypĿ�*s-a��#Qdx˾�xҿ��y� T1������c��"�*s5D���+�(f��.rم��aƇ�����7c}}�t!*N�.��z����Kr��?k�:�|�s[,L�@�0����ҍh�@�0��X�P��t�Y�|�d�����.z�v�qšm��vU:E�Y'��&�c��a����zU����Uv�mm������d��e��7�4��M$���P%�c¹H�.�.���J��^�Y�G��]x���z�	��O @
  �}$��	� �7(^l�"����+R%5P(��/��r�O���J��'�}��(�R�^
�)�B2ȋ�i�7�`e@jZ������EE����+���!]��҇g*����B�е?����Z����j>����4&fl��0� �� ����C�At6R(�_��8���:�S�"t|�Y�E�/B߷�P)B�h)D/��ȱ)T/8nӫSH$^\����}/���@��h�Q{~��X;.��i���ֵ=ʏ�xB
��K�7b�2�����=Q��Bf17�7;>�x��	�7W�N#6H�����0��`A
���l��|(N�R�(�$�.]�֬�s�AF�ڧ
$�b�!?h��NݞB k���K�S�$�y���rR�$N��ʙ6<�%`�=�B�з�ܥ�j���o�B��ך����Ci��M$��B�@�fp��U|�!�RK#�L�0������ʛ�z�}��i����n\t����R����i�}��8E�%ŝ�h뭦�}
���C�g�o��q�DV�K=�m��f��+m*�l�����E>=�tc��7��Uux�dZ�+2��aM(>=�D?Ӛ��Ʀ5u�E2+�r���v����`�*꽋�����[���_����}�'�_ͧ$GO{�7�P�P7��ڬX,���D��RӍ���+�X㶈��]�D3ۘ���	�ޖH7/�G
��ܼ�
gl�����&J�B�0gO�^WH�QH!~�0���h�B��AtuuS��G�(
)	ѕ�}Ǆa �Z�3�m)�Ԝեт�t�k2������e��ە�����j�>>�(��l�F���p��A� ٵ)�=
i���u��uS�j˝Q}i0��lfG�)4��i�t	�^��k�'�A�9`�)��BL1�͇a�\b�PSp�J���BO1����10)T�(W�L�*��\=H�H0&���ԀD���bmT~34�]2��U�z�H����
}hLv�*湷�6T�quM��$�\z �^�FY'�b�gL�at�VR����X̋��u�#��Q�֘�YJ�/qļp��*.z���x\
�D vT��U\f*;�J�Y�P[�]')�� �����r�N/5���YW�g3'|�dwR���7��Lʑ0ܧ=2��\qR�BmA�*Cm?�W�Y���/�N����������7��;�l��\|�/N�6!���c�)�_1RT>����]v�Z9M�_K����
����EOv�2_ � ���d�B��6d��AIH �5��3�p�H
!��U��L����Zh�2>��Oh���tw>�;7���%ʛ7���e[�l�C�@ �ӯ<pPC�Q�Gb�y[���~K�gW���јRL5pU��p�����!<"���^�6�>��O�am�}D��.��dmm5�o�&/��Z���y��!Ėfm7�qJ��v�2�!a 6�D_��r
A�˂L�6}�R�����z�� �B˰0���H^��,8%gpoZ��7Ņ�����%��	ģ����Y���)�`�+��l��,}
�ÂS��'�!�B�� pX|ٲ�*��k߈Ij��]s�+QaN�:!�X���E����5��k�h ��7|�GTeބzaᡭ�8� 7G���)t�����·���<-�%�ې�j�f��ƿ~1Hmr���2
s~���O�y�=bѲ1�Ău�]�(BN!{X|���}
���P���Ԛ��s[0�+>[Y?���xCj=�Z�T� Ls?�>bM9jw���ߔm�**7��B�俉���A���ݔk��%M��	\BȀ5�?�C{h^韖�kn�L�>x�[bʲP�ސ��Pq=1w)�>�W\)��	���Ny��jB4!�W�ܣ3<�ʤ�;^�+�ʁ2��"]���z�%���2����v����;��Z�a\���v����)�5�@��7�൨���R��Y�Z�x��N���Tgu,M��0\�(<�9fɆ� �_�#�i�f�*����"�Ʌ�=��byQC�䠽��b���м_���J�K���P}��Q��i���B��+��?!�%�X���L�j��{s��\G?���jMs�Hs`���%����F�vm�q?�?�d܁�KYE��� GD�t�l��ld�����v�٧ X�6��^�)<�cC�f�ܪ�)dKsȸV��Z!,XZ�ڀ�4��@B��祑Kg��1��e�/�ܶ�4���,$�9��k�
D2~������!I�b;�΀�򢱽�S�G��4ը���w���!�6��lU�]W�U��!���.���@C�{EFi���S���"��"3�x����/E�����H� e�C�;��z{�����Ȉٵ�s�D�)�	�TR�����V��KE���KN4�����(���M��Ȑ��>��E�O�����I��t>�H/#Q��"'~��>k��bs�٢��Mȋ�e�u�w!�����@�	����Aqo�PLC^�Hp��Z\�A;U�]�+G��@��r�9��U���P$��B�@��?�����)�\�O2M&�蜼ֿ]9��k�[�8ֲ���t?��O���������������       "   �  x��V�r�8}6_�@S��~�L��
�a�j^:v�V!K�d���or�} x^(�����9�-�$��`^�J��p@�*�B>�J�1�ݡ,���������`�l@��|�NDI��A4Iq�e"�Q����G��w�����g"�����M��6������w�Wy�,�E� ���m�=�[�C���%t�a��航�5�a;��>����
J�d���X͗��h	C��X��D�1I��Z��ɚ�߂���"�\/��T�TC���[�0:���!�O/P� ��H��E�G�:�4�d3�����T?�8��7U��h=�oL} {���E�*��!���b���{4	�E^�$Ԓ�~߸~�jS�8D*�c��aP������4�����ñ����+t7m���h���K<�,!�?������,���Ũ�Ґ�k<����o.�L�0엱{���a��*�U�AF�%������*]4�c1��@�K���!1����VF7���v�ן���C�9�۠����>y'צ�

T���d�HS?�R��`q�W�/���1���{�D���l(��&��bzD�&D�R�(%
avkA���?bq4�8[�5mS���#��љ�^ UOPB��Eh��҃��"�yE�M3d��qB��1�K�	rS��_�r�Gk+ecۃ%;��E�(2��G��O/m��%�IFc:��$&i���Φ~�z>U��e}{,���ԛ��y�r%c̌�$���V%r��SӬ�l}3�~B=��-��&3KW���	y�o~�:��nY�ZA}-:��; i�/�݁4�����=��))_�}�D=�_�#�V9r�jQ����(�{0�ݰ4G�$>���[���آ���Oٖ��+zwV���a���^��/��{�gSt��Q������%�Ǿ�iK��+Y
�o�iˊ�I�k���6���	R         �   x�3��K-Wp�K�I�KQp�,�,����4�2���LI�IUp,J�d&#Ks�&�(���d(8��%� 䍸L8�S�ɛr��0�6�2��Q��ט�b6NyN��Ҽ���<��	�%g@brf�U&\1z\\\ ƈS�         6   x�3���/*�HM,.QJM����2���L)OEs痖d��&��H�1z\\\ 7i          �  x�M�ݎ�8��O�"O��?pAw��D��^͍<��n����O�zW��s�|�T9���u�12/�Fb�VH0���(I�o"S/H�\�4� �ѩ�d��V�RZ
�y�NN1W���0߸�3BR�s/�C��!B/��-�b�c�L	S/�������Oy��R/�n;�e���#1^���;�bI9����z�Ņ5
�	'(�VH%�5"�^8E!/�Q�E�����eN�ċ�\�ځ+.��|�a�f-�"�� �M�έAQ��	�Q>ے�����2yA��z���1�����A����87�I��M��F�e�L�3~��e���,U�&���q�R�~W�q���k����E�~3�:������dݧi5�ZZuqb�����A0����g��t2ߔ��zsqTJ��?gZQ'�6��xz�X��Xc�p�f�4Ba��6$6ז:J�YY���?��fg��D�r)ͭ��������$��Q���`W�j���/�v���qT;A�{>6�p�}e-O���Є��r�f8������8r�Qpt㟆8
��Q���n���g��S)'���'nz�;�tt�)N�4�b݄�N7�Q���Y�������k�)z�5~V�yY�~�����=����h괢�覗���u`^0�4�m�^��.��s��/�Z2����mk��>������ [ֲ�ӃP�{��ƙ��<��~"�Ri3�퍊��xx�L]�3�{�X��>y��/��U     