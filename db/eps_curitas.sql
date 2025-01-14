PGDMP         0                |            eps_curitas    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16463    eps_curitas    DATABASE     �   CREATE DATABASE eps_curitas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.utf8';
    DROP DATABASE eps_curitas;
                postgres    false            �            1259    16464    administrador    TABLE     2  CREATE TABLE public.administrador (
    cedula character varying(20) NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    cargo character varying(50),
    telefono character varying(20),
    correo_electronico character varying(100),
    contrasena character varying(100)
);
 !   DROP TABLE public.administrador;
       public         heap    postgres    false            �            1259    16469    cita_laboratorio    TABLE     X  CREATE TABLE public.cita_laboratorio (
    cedula character varying(15),
    nombre character varying(50),
    apellido character varying(50),
    edad integer,
    direccion character varying(100),
    telefono character varying(15),
    correo_electronico character varying(100),
    fecha_cita date,
    tipo_prueba character varying(50)
);
 $   DROP TABLE public.cita_laboratorio;
       public         heap    postgres    false            �            1259    16472    cita_medica    TABLE     C  CREATE TABLE public.cita_medica (
    cedula character varying(15),
    nombre character varying(50),
    apellido character varying(50),
    edad integer,
    direccion character varying(100),
    telefono character varying(15),
    correo character varying(100),
    fecha_cita date,
    motivo character varying(255)
);
    DROP TABLE public.cita_medica;
       public         heap    postgres    false            �            1259    16477    cliente    TABLE     C  CREATE TABLE public.cliente (
    cedula character varying(20) NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    edad integer,
    direccion character varying(100),
    telefono character varying(20),
    correo_electronico character varying(100),
    contrasena character varying(100)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16482    medico    TABLE       CREATE TABLE public.medico (
    cedula character varying(15) NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    especialidad character varying(50),
    telefono character varying(15),
    correo_electronico character varying(100)
);
    DROP TABLE public.medico;
       public         heap    postgres    false                      0    16464    administrador 
   TABLE DATA           r   COPY public.administrador (cedula, nombre, apellido, cargo, telefono, correo_electronico, contrasena) FROM stdin;
    public          postgres    false    214   q       	          0    16469    cita_laboratorio 
   TABLE DATA           �   COPY public.cita_laboratorio (cedula, nombre, apellido, edad, direccion, telefono, correo_electronico, fecha_cita, tipo_prueba) FROM stdin;
    public          postgres    false    215   X       
          0    16472    cita_medica 
   TABLE DATA           v   COPY public.cita_medica (cedula, nombre, apellido, edad, direccion, telefono, correo, fecha_cita, motivo) FROM stdin;
    public          postgres    false    216   ~                 0    16477    cliente 
   TABLE DATA           v   COPY public.cliente (cedula, nombre, apellido, edad, direccion, telefono, correo_electronico, contrasena) FROM stdin;
    public          postgres    false    217   �                 0    16482    medico 
   TABLE DATA           f   COPY public.medico (cedula, nombre, apellido, especialidad, telefono, correo_electronico) FROM stdin;
    public          postgres    false    218   �       u           2606    16468     administrador administrador_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.administrador
    ADD CONSTRAINT administrador_pkey PRIMARY KEY (cedula);
 J   ALTER TABLE ONLY public.administrador DROP CONSTRAINT administrador_pkey;
       public            postgres    false    214            w           2606    16481    cliente cliente_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cedula);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    217            y           2606    16486    medico medico_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (cedula);
 <   ALTER TABLE ONLY public.medico DROP CONSTRAINT medico_pkey;
       public            postgres    false    218               �   x�u�=
�@�z�.�l�4��" 
��͐,Iv�l"�,�<B.�l��R��㽑Q���z���Q�iz�zA�H�AA��+���q�����
*�Ae�@h�F��H8"M��������Gc͖A���ƌ�VRk�3����il;��u�Y��^��#!�H��XCu����K�HB�"�c��gS����Y.��0�Ko�@�Fs{r      	     x�m�MN�0���S��;�QU�*"j�l�DA�Mk����8B.�]AR��ߛo���fyQ�cxph��H��`��h^QkU;�ቐ����͇�;���`t��D,�U,WI9�������!�&H�H�a?~��f�y��V�3y�O��,�,�"��E��o O�GdB������:��1��F����u8˃��P�F��*nX;�TB6U%���I1Q�[.X����	�f�T��o_�-61R�X�C_��v���͌�3��i���{5��c?@���      
     x�m�Mn�0���S�A��w�(U+U���m7��1h��ʍ��*G�b��e��|�=!U'i���<��b�&}��Ѽ�ƖM���@���Å���¶7:(�d(�]�v"���t�+�K<���!�i�"��[�0Q�π��!\
�,M�HI-R�f���c�Ϥ�rY���t�'��պ��I�M����5�__��n#�U�F�юȖ��N���Tz�����������z��AAzh��he�Dp��]�6�'�Wx�k�x�u\�Hۈ|�у+V�����c��         �   x�u�1n�@E��S�	,v��QD�@BI�f����zm!nDA�|�̠�."�o��|c]^��r&��w
7p�1ƠwT%_����G�۷pź�!�M�Ig�SHȔ��H�a�?[6��.�^��f
��b^����*�ZF�`��G�9���?�-7f�+�.�Ť�t��zBϐX���K�-��!�0�?L��Q�9�UB�l��ʡ�Ef�EF�T��aB��2��3��ċ~         �   x�U�A
�0E��Sx�i�����T� n�6H�I�XA���G��L��w!�?�0��(\l�Z}�Ҍ�x�}Սn����%�����O�]+�J� �%>�ԛAY�Y���)<]gк��L&�*(�*��	������:����������^�2oU[��Q���$q�@"5s�3�X�P�QZĉzݹ��}�V9t����A| fp     