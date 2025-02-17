PGDMP      -                {            BD_CarpetaCiudadana    16.0    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    BD_CarpetaCiudadana    DATABASE     �   CREATE DATABASE "BD_CarpetaCiudadana" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
 %   DROP DATABASE "BD_CarpetaCiudadana";
                postgres    false            �            1259    16406    carpeta    TABLE     7   CREATE TABLE public.carpeta (
    idcarpeta integer
);
    DROP TABLE public.carpeta;
       public         heap    postgres    false            �            1259    16443 	   ciudadano    TABLE     O  CREATE TABLE public.ciudadano (
    numeroidentificacion integer NOT NULL,
    tipoidentificacion character varying(100),
    fechaexpedicion date,
    nombres character varying(100),
    primerapellido character varying(100),
    segundoapellido character varying(100),
    cuentacorreo character varying(100),
    celular integer
);
    DROP TABLE public.ciudadano;
       public         heap    postgres    false            �            1259    16429 	   documento    TABLE     �   CREATE TABLE public.documento (
    iddocumento integer NOT NULL,
    tipodocumento character varying(100),
    contenidodocumento bytea,
    estado character varying(100)
);
    DROP TABLE public.documento;
       public         heap    postgres    false            �            1259    16414    entidad    TABLE     �   CREATE TABLE public.entidad (
    identidad integer NOT NULL,
    nombre character varying(200),
    tipoentidad character varying(25)
);
    DROP TABLE public.entidad;
       public         heap    postgres    false            �            1259    16409    operador    TABLE     {   CREATE TABLE public.operador (
    idoperador character varying(50) NOT NULL,
    nombreoperador character varying(100)
);
    DROP TABLE public.operador;
       public         heap    postgres    false            �            1259    16419    pagquetedocumentacion    TABLE     n   CREATE TABLE public.pagquetedocumentacion (
    idpaquete integer NOT NULL,
    entidadsolicitante integer
);
 )   DROP TABLE public.pagquetedocumentacion;
       public         heap    postgres    false            �            1259    16436    servicio    TABLE     �   CREATE TABLE public.servicio (
    idservicio integer NOT NULL,
    tiposervicio character varying(20),
    nombre character varying(200),
    descripcion character varying(350)
);
    DROP TABLE public.servicio;
       public         heap    postgres    false            �          0    16406    carpeta 
   TABLE DATA           ,   COPY public.carpeta (idcarpeta) FROM stdin;
    public          postgres    false    215   ,       �          0    16443 	   ciudadano 
   TABLE DATA           �   COPY public.ciudadano (numeroidentificacion, tipoidentificacion, fechaexpedicion, nombres, primerapellido, segundoapellido, cuentacorreo, celular) FROM stdin;
    public          postgres    false    221   I       �          0    16429 	   documento 
   TABLE DATA           [   COPY public.documento (iddocumento, tipodocumento, contenidodocumento, estado) FROM stdin;
    public          postgres    false    219   W       �          0    16414    entidad 
   TABLE DATA           A   COPY public.entidad (identidad, nombre, tipoentidad) FROM stdin;
    public          postgres    false    217   t       �          0    16409    operador 
   TABLE DATA           >   COPY public.operador (idoperador, nombreoperador) FROM stdin;
    public          postgres    false    216   �       �          0    16419    pagquetedocumentacion 
   TABLE DATA           N   COPY public.pagquetedocumentacion (idpaquete, entidadsolicitante) FROM stdin;
    public          postgres    false    218   �       �          0    16436    servicio 
   TABLE DATA           Q   COPY public.servicio (idservicio, tiposervicio, nombre, descripcion) FROM stdin;
    public          postgres    false    220   �       <           2606    16449    ciudadano ciudadano_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ciudadano
    ADD CONSTRAINT ciudadano_pkey PRIMARY KEY (numeroidentificacion);
 B   ALTER TABLE ONLY public.ciudadano DROP CONSTRAINT ciudadano_pkey;
       public            postgres    false    221            8           2606    16435    documento documento_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (iddocumento);
 B   ALTER TABLE ONLY public.documento DROP CONSTRAINT documento_pkey;
       public            postgres    false    219            4           2606    16418    entidad entidad_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.entidad
    ADD CONSTRAINT entidad_pkey PRIMARY KEY (identidad);
 >   ALTER TABLE ONLY public.entidad DROP CONSTRAINT entidad_pkey;
       public            postgres    false    217            2           2606    16413    operador operador_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.operador
    ADD CONSTRAINT operador_pkey PRIMARY KEY (idoperador);
 @   ALTER TABLE ONLY public.operador DROP CONSTRAINT operador_pkey;
       public            postgres    false    216            6           2606    16423 0   pagquetedocumentacion pagquetedocumentacion_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.pagquetedocumentacion
    ADD CONSTRAINT pagquetedocumentacion_pkey PRIMARY KEY (idpaquete);
 Z   ALTER TABLE ONLY public.pagquetedocumentacion DROP CONSTRAINT pagquetedocumentacion_pkey;
       public            postgres    false    218            :           2606    16442    servicio servicio_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (idservicio);
 @   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_pkey;
       public            postgres    false    220            =           2606    16424 C   pagquetedocumentacion pagquetedocumentacion_entidadsolicitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pagquetedocumentacion
    ADD CONSTRAINT pagquetedocumentacion_entidadsolicitante_fkey FOREIGN KEY (entidadsolicitante) REFERENCES public.entidad(identidad);
 m   ALTER TABLE ONLY public.pagquetedocumentacion DROP CONSTRAINT pagquetedocumentacion_entidadsolicitante_fkey;
       public          postgres    false    217    218    4660            �      x������ � �      �   �   x�u�An� ���p
_��3�n��3��
C��F�z�sWi�H������H?d��"6�@���2�,T�Eq�q��^7_V,4�*N_���ˌ��3�qP,܏�1=�ܵӌ� ��+��v����׋�Y��AX��^�yg[r	�ɗTu�6�R�k&wҿK�����Il��c~�7���'����r��t�	���p�u��Aİy�vǶ�K�1`n��5����/T;-k�ĄH���蝨/���� n�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     