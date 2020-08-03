PGDMP         1                x           US Census and OMB    12.2    12.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25162    US Census and OMB    DATABASE     �   CREATE DATABASE "US Census and OMB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 #   DROP DATABASE "US Census and OMB";
                postgres    false            �            1259    25179    us_division_codes    TABLE     �   CREATE TABLE public.us_division_codes (
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
       public         heap    postgres    false                      0    25179    us_division_codes 
   TABLE DATA                 public          postgres    false    203   �                 0    25163    us_region_codes 
   TABLE DATA                 public          postgres    false    202   p                 0    25192 	   us_states 
   TABLE DATA                 public          postgres    false    204   �       �
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
       public          postgres    false    204    203    2699            �
           2606    25187     us_division_codes fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_division_codes
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 J   ALTER TABLE ONLY public.us_division_codes DROP CONSTRAINT fk_region_code;
       public          postgres    false    203    2697    202            �
           2606    25200    us_states fk_region_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT fk_region_code FOREIGN KEY (region_code) REFERENCES public.us_region_codes(region);
 B   ALTER TABLE ONLY public.us_states DROP CONSTRAINT fk_region_code;
       public          postgres    false    202    204    2697               �   x���=�0�὿�*�~�T4CA�تc�M�@H�M��
.���ýw	N�>�g[��g��Q]�?xŕ�EY�x}@)|\̞��UIa�s=��'��cm8��A���y��JV����I]�%[22��J����h��C[n�F��Z��6�?rּZ�R.�Pd��#�|��q�ws�         i   x���v
Q���W((M��L�+-�/JM��ϋO�OI-Vs�	uV�0�QP��/*�HM,.Q+Q״��$�#���)��`4 8��$�<�&@�ᨖsq �@S
         �  x���[o�J���)�-�Rc.Q��@���rr^����+��hwݔ~�.3���	�Ah��?�C���՚��:c��s%���~��;a�6Zl�9���s���]G�5s��6���*�Z�= a����Nᜑ��B��wGq��r�
ugO��y%�k�$xr���9]i����2���E����?{����|:7�F�=Ť�3@ i���c�;�5�3�grO�Z|v�2�:�(�yA/#2�2�y���Z��%��jO�5��\UI�%(6>e"�tg��b��'N��Z���|��������O��s26�5���u���n�=�bQ�? ]%\*�dJ�� D�9V\���P��a-/��
� �IDv�Ȣ�/\�S������Қ����b����
���ߝ1�1�Ȩ��A��V�I���mԚ�gs���)ٍ ?8��tK����76���-%��tFUI?<��
c�_�)Aw��LI�OY�DLrP�3�I��OdO@��6�d��h?]1�䋪?~'M���:!t����ͨ=�f�C�o\Ѳ9u�� �̈� [Q��$�J�c�����2��'��J�,��1����Aq�n��sN�s8|'��9'�9��iVZ��N�C.#�'^��ɕ�m/�<����0��`����m+�v��dK��0�v�O6��P�;�*> ��u�;�-�P�N�B++��e: �펺�1��D�������\����/�n�t�X�;� ���/�,���������1cɅ|���5�o.��۵ʖ��ڱ�[��Bb����*���cv�`0�Q���i��߯-/��Tm�+ހ���#��i�jo���BT~s���R+mXָ���1�ͅe�����>B���Ы����l     