PGDMP     /    '                z            SirketDB    14.5    14.5 X    z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            {           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            |           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            }           1262    33375    SirketDB    DATABASE     g   CREATE DATABASE "SirketDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "SirketDB";
                postgres    false            ?            1255    33376 ,   kategoriekleyici(integer, character varying) 	   PROCEDURE     ?   CREATE PROCEDURE public.kategoriekleyici(IN kategori integer, IN ad character varying)
    LANGUAGE sql
    AS $$

insert into kategoriler(kategorino,kategoriadi) values (kategori,ad);

$$;
 V   DROP PROCEDURE public.kategoriekleyici(IN kategori integer, IN ad character varying);
       public          postgres    false            ?            1255    33599    toplammusteriarttir()    FUNCTION     ?   CREATE FUNCTION public.toplammusteriarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
update toplammusteri set toplammusteri = toplammusteri + 1;
return new;
end;
$$;
 ,   DROP FUNCTION public.toplammusteriarttir();
       public          postgres    false            ?            1255    33605    toplammusteriazaltici()    FUNCTION     ?   CREATE FUNCTION public.toplammusteriazaltici() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
update toplammusteri set toplammusteri = toplammusteri - 1;
return new;
end;
$$;
 .   DROP FUNCTION public.toplammusteriazaltici();
       public          postgres    false            ?            1255    33377    toplamsube()    FUNCTION     ?   CREATE FUNCTION public.toplamsube() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
update toplamsube set toplamsube=toplamsube+1;
return new;
end;
$$;
 #   DROP FUNCTION public.toplamsube();
       public          postgres    false            ?            1255    33592    toplamsubeazaltici()    FUNCTION     ?   CREATE FUNCTION public.toplamsubeazaltici() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
update toplamsube set toplamsube=toplamsube - 1;
return new;
end;
$$;
 +   DROP FUNCTION public.toplamsubeazaltici();
       public          postgres    false            ?            1255    33378    toplamtutar(integer, integer)    FUNCTION     ?   CREATE FUNCTION public.toplamtutar(miktar integer, birimfiyat integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$

DECLARE
	sonuc integer;
BEGIN
	sonuc:= miktar * birimfiyat;
	return sonuc;
end;
$$;
 F   DROP FUNCTION public.toplamtutar(miktar integer, birimfiyat integer);
       public          postgres    false            ?            1259    33379    baglantilar    TABLE     ?   CREATE TABLE public.baglantilar (
    baglantino integer NOT NULL,
    adsoyad character varying NOT NULL,
    mail character varying NOT NULL,
    telefon character varying NOT NULL,
    musterino integer NOT NULL
);
    DROP TABLE public.baglantilar;
       public         heap    postgres    false            ?            1259    33384    bolgeler    TABLE     h   CREATE TABLE public.bolgeler (
    bolgeno integer NOT NULL,
    bolgeadi character varying NOT NULL
);
    DROP TABLE public.bolgeler;
       public         heap    postgres    false            ?            1259    33389 
   calisanlar    TABLE     ?   CREATE TABLE public.calisanlar (
    calisanno integer NOT NULL,
    calisanadsoyad character varying NOT NULL,
    calisanmail character varying NOT NULL,
    calisantelefon integer NOT NULL,
    subeno integer NOT NULL
);
    DROP TABLE public.calisanlar;
       public         heap    postgres    false            ?            1259    33394    danisman    TABLE     {   CREATE TABLE public.danisman (
    calisanno integer,
    firma character varying NOT NULL
)
INHERITS (public.calisanlar);
    DROP TABLE public.danisman;
       public         heap    postgres    false    211            ?            1259    33399    depolar    TABLE     ?   CREATE TABLE public.depolar (
    depono integer NOT NULL,
    subeno integer NOT NULL,
    depoadi character varying NOT NULL
);
    DROP TABLE public.depolar;
       public         heap    postgres    false            ?            1259    33402    kadrolu    TABLE     ?   CREATE TABLE public.kadrolu (
    calisanno integer,
    pozisyon character varying NOT NULL,
    sigortatarihi date NOT NULL
)
INHERITS (public.calisanlar);
    DROP TABLE public.kadrolu;
       public         heap    postgres    false    211            ?            1259    33407    kategoriler    TABLE     q   CREATE TABLE public.kategoriler (
    kategorino integer NOT NULL,
    kategoriadi character varying NOT NULL
);
    DROP TABLE public.kategoriler;
       public         heap    postgres    false            ?            1259    33412 
   musteriler    TABLE     ?   CREATE TABLE public.musteriler (
    musterino integer NOT NULL,
    musteriad character varying NOT NULL,
    musteriadres character varying NOT NULL,
    musterimail character varying NOT NULL,
    musterikredilimit character varying NOT NULL
);
    DROP TABLE public.musteriler;
       public         heap    postgres    false            ?            1259    33417    siparisicerigi    TABLE     ?   CREATE TABLE public.siparisicerigi (
    siparisogeno integer NOT NULL,
    siparisno integer NOT NULL,
    urunno integer NOT NULL,
    siparismiktari integer NOT NULL,
    birimfiyat integer NOT NULL
);
 "   DROP TABLE public.siparisicerigi;
       public         heap    postgres    false            ?            1259    33420 
   siparisler    TABLE     ?   CREATE TABLE public.siparisler (
    siparisno integer NOT NULL,
    musterino integer NOT NULL,
    siparisdurum character varying NOT NULL,
    saticino integer NOT NULL,
    siparistarih date NOT NULL
);
    DROP TABLE public.siparisler;
       public         heap    postgres    false            ?            1259    33425 
   sozlesmeli    TABLE     x   CREATE TABLE public.sozlesmeli (
    calisanno integer,
    sozlesmeno integer NOT NULL
)
INHERITS (public.calisanlar);
    DROP TABLE public.sozlesmeli;
       public         heap    postgres    false    211            ?            1259    33430    stoklar    TABLE     |   CREATE TABLE public.stoklar (
    urunno integer NOT NULL,
    depono integer NOT NULL,
    stokmiktari integer NOT NULL
);
    DROP TABLE public.stoklar;
       public         heap    postgres    false            ?            1259    33433    subeler    TABLE     ?   CREATE TABLE public.subeler (
    subeno integer NOT NULL,
    subeadresi character varying NOT NULL,
    sehir character varying NOT NULL,
    postakodu integer NOT NULL,
    ulkeno integer NOT NULL
);
    DROP TABLE public.subeler;
       public         heap    postgres    false            ?            1259    33594    toplammusteri    TABLE     J   CREATE TABLE public.toplammusteri (
    toplammusteri integer NOT NULL
);
 !   DROP TABLE public.toplammusteri;
       public         heap    postgres    false            ?            1259    33438 
   toplamsube    TABLE     D   CREATE TABLE public.toplamsube (
    toplamsube integer NOT NULL
);
    DROP TABLE public.toplamsube;
       public         heap    postgres    false            ?            1259    33441    ulkeler    TABLE     ?   CREATE TABLE public.ulkeler (
    ulkeno integer NOT NULL,
    ulkeadi character varying NOT NULL,
    bolgeno integer NOT NULL
);
    DROP TABLE public.ulkeler;
       public         heap    postgres    false            ?            1259    33446    urunler    TABLE     ?   CREATE TABLE public.urunler (
    urunno integer NOT NULL,
    urunadi character varying NOT NULL,
    urunmaliyeti integer NOT NULL,
    urunfiyati integer NOT NULL,
    kategorino integer NOT NULL
);
    DROP TABLE public.urunler;
       public         heap    postgres    false            g          0    33379    baglantilar 
   TABLE DATA           T   COPY public.baglantilar (baglantino, adsoyad, mail, telefon, musterino) FROM stdin;
    public          postgres    false    209   ?g       h          0    33384    bolgeler 
   TABLE DATA           5   COPY public.bolgeler (bolgeno, bolgeadi) FROM stdin;
    public          postgres    false    210   h       i          0    33389 
   calisanlar 
   TABLE DATA           d   COPY public.calisanlar (calisanno, calisanadsoyad, calisanmail, calisantelefon, subeno) FROM stdin;
    public          postgres    false    211   (h       j          0    33394    danisman 
   TABLE DATA           i   COPY public.danisman (calisanno, calisanadsoyad, calisanmail, calisantelefon, subeno, firma) FROM stdin;
    public          postgres    false    212   {h       k          0    33399    depolar 
   TABLE DATA           :   COPY public.depolar (depono, subeno, depoadi) FROM stdin;
    public          postgres    false    213   ?h       l          0    33402    kadrolu 
   TABLE DATA           z   COPY public.kadrolu (calisanno, calisanadsoyad, calisanmail, calisantelefon, subeno, pozisyon, sigortatarihi) FROM stdin;
    public          postgres    false    214   ?h       m          0    33407    kategoriler 
   TABLE DATA           >   COPY public.kategoriler (kategorino, kategoriadi) FROM stdin;
    public          postgres    false    215   ?h       n          0    33412 
   musteriler 
   TABLE DATA           h   COPY public.musteriler (musterino, musteriad, musteriadres, musterimail, musterikredilimit) FROM stdin;
    public          postgres    false    216   i       o          0    33417    siparisicerigi 
   TABLE DATA           e   COPY public.siparisicerigi (siparisogeno, siparisno, urunno, siparismiktari, birimfiyat) FROM stdin;
    public          postgres    false    217   %i       p          0    33420 
   siparisler 
   TABLE DATA           `   COPY public.siparisler (siparisno, musterino, siparisdurum, saticino, siparistarih) FROM stdin;
    public          postgres    false    218   Bi       q          0    33425 
   sozlesmeli 
   TABLE DATA           p   COPY public.sozlesmeli (calisanno, calisanadsoyad, calisanmail, calisantelefon, subeno, sozlesmeno) FROM stdin;
    public          postgres    false    219   pi       r          0    33430    stoklar 
   TABLE DATA           >   COPY public.stoklar (urunno, depono, stokmiktari) FROM stdin;
    public          postgres    false    220   ?i       s          0    33433    subeler 
   TABLE DATA           O   COPY public.subeler (subeno, subeadresi, sehir, postakodu, ulkeno) FROM stdin;
    public          postgres    false    221   ?i       w          0    33594    toplammusteri 
   TABLE DATA           6   COPY public.toplammusteri (toplammusteri) FROM stdin;
    public          postgres    false    225   ?i       t          0    33438 
   toplamsube 
   TABLE DATA           0   COPY public.toplamsube (toplamsube) FROM stdin;
    public          postgres    false    222    j       u          0    33441    ulkeler 
   TABLE DATA           ;   COPY public.ulkeler (ulkeno, ulkeadi, bolgeno) FROM stdin;
    public          postgres    false    223    j       v          0    33446    urunler 
   TABLE DATA           X   COPY public.urunler (urunno, urunadi, urunmaliyeti, urunfiyati, kategorino) FROM stdin;
    public          postgres    false    224   Jj       ?           2606    33452    baglantilar baglantilar_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.baglantilar
    ADD CONSTRAINT baglantilar_pkey PRIMARY KEY (baglantino);
 F   ALTER TABLE ONLY public.baglantilar DROP CONSTRAINT baglantilar_pkey;
       public            postgres    false    209            ?           2606    33454    bolgeler bolgeler_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.bolgeler
    ADD CONSTRAINT bolgeler_pkey PRIMARY KEY (bolgeno);
 @   ALTER TABLE ONLY public.bolgeler DROP CONSTRAINT bolgeler_pkey;
       public            postgres    false    210            ?           2606    33456    calisanlar calisanlar_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.calisanlar
    ADD CONSTRAINT calisanlar_pkey PRIMARY KEY (calisanno);
 D   ALTER TABLE ONLY public.calisanlar DROP CONSTRAINT calisanlar_pkey;
       public            postgres    false    211            ?           2606    33458    danisman danisman_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.danisman
    ADD CONSTRAINT danisman_pkey PRIMARY KEY (calisanno);
 @   ALTER TABLE ONLY public.danisman DROP CONSTRAINT danisman_pkey;
       public            postgres    false    212            ?           2606    33460    depolar depolar_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.depolar
    ADD CONSTRAINT depolar_pkey PRIMARY KEY (depono);
 >   ALTER TABLE ONLY public.depolar DROP CONSTRAINT depolar_pkey;
       public            postgres    false    213            ?           2606    33462    kadrolu kadrolu_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.kadrolu
    ADD CONSTRAINT kadrolu_pkey PRIMARY KEY (calisanno);
 >   ALTER TABLE ONLY public.kadrolu DROP CONSTRAINT kadrolu_pkey;
       public            postgres    false    214            ?           2606    33464    kategoriler kategoriler_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_pkey PRIMARY KEY (kategorino);
 F   ALTER TABLE ONLY public.kategoriler DROP CONSTRAINT kategoriler_pkey;
       public            postgres    false    215            ?           2606    33466    musteriler musteriler_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.musteriler
    ADD CONSTRAINT musteriler_pkey PRIMARY KEY (musterino);
 D   ALTER TABLE ONLY public.musteriler DROP CONSTRAINT musteriler_pkey;
       public            postgres    false    216            ?           2606    33468 "   siparisicerigi siparisicerigi_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.siparisicerigi
    ADD CONSTRAINT siparisicerigi_pkey PRIMARY KEY (siparisogeno);
 L   ALTER TABLE ONLY public.siparisicerigi DROP CONSTRAINT siparisicerigi_pkey;
       public            postgres    false    217            ?           2606    33470    siparisler siparisler_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.siparisler
    ADD CONSTRAINT siparisler_pkey PRIMARY KEY (siparisno);
 D   ALTER TABLE ONLY public.siparisler DROP CONSTRAINT siparisler_pkey;
       public            postgres    false    218            ?           2606    33472    sozlesmeli sozlesmeli_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.sozlesmeli
    ADD CONSTRAINT sozlesmeli_pkey PRIMARY KEY (calisanno);
 D   ALTER TABLE ONLY public.sozlesmeli DROP CONSTRAINT sozlesmeli_pkey;
       public            postgres    false    219            ?           2606    33474    stoklar stoklar_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.stoklar
    ADD CONSTRAINT stoklar_pkey PRIMARY KEY (depono, urunno);
 >   ALTER TABLE ONLY public.stoklar DROP CONSTRAINT stoklar_pkey;
       public            postgres    false    220    220            ?           2606    33476    subeler subeler_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.subeler
    ADD CONSTRAINT subeler_pkey PRIMARY KEY (subeno);
 >   ALTER TABLE ONLY public.subeler DROP CONSTRAINT subeler_pkey;
       public            postgres    false    221            ?           2606    33478    ulkeler ulkeler_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ulkeler
    ADD CONSTRAINT ulkeler_pkey PRIMARY KEY (ulkeno);
 >   ALTER TABLE ONLY public.ulkeler DROP CONSTRAINT ulkeler_pkey;
       public            postgres    false    223            ?           2606    33480    urunler urunler_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.urunler
    ADD CONSTRAINT urunler_pkey PRIMARY KEY (urunno);
 >   ALTER TABLE ONLY public.urunler DROP CONSTRAINT urunler_pkey;
       public            postgres    false    224            ?           1259    33481    fki_baglantifk    INDEX     K   CREATE INDEX fki_baglantifk ON public.baglantilar USING btree (musterino);
 "   DROP INDEX public.fki_baglantifk;
       public            postgres    false    209            ?           1259    33482    fki_danismanfk    INDEX     H   CREATE INDEX fki_danismanfk ON public.danisman USING btree (calisanno);
 "   DROP INDEX public.fki_danismanfk;
       public            postgres    false    212            ?           1259    33483 
   fki_depofk    INDEX     @   CREATE INDEX fki_depofk ON public.stoklar USING btree (depono);
    DROP INDEX public.fki_depofk;
       public            postgres    false    220            ?           1259    33577    fki_kadrofk    INDEX     D   CREATE INDEX fki_kadrofk ON public.kadrolu USING btree (calisanno);
    DROP INDEX public.fki_kadrofk;
       public            postgres    false    214            ?           1259    33484    fki_kadrolufk    INDEX     F   CREATE INDEX fki_kadrolufk ON public.kadrolu USING btree (calisanno);
 !   DROP INDEX public.fki_kadrolufk;
       public            postgres    false    214            ?           1259    33485    fki_kategorinofk    INDEX     J   CREATE INDEX fki_kategorinofk ON public.urunler USING btree (kategorino);
 $   DROP INDEX public.fki_kategorinofk;
       public            postgres    false    224            ?           1259    33486    fki_siparisfk    INDEX     I   CREATE INDEX fki_siparisfk ON public.siparisler USING btree (musterino);
 !   DROP INDEX public.fki_siparisfk;
       public            postgres    false    218            ?           1259    33487    fki_siparisnofk    INDEX     O   CREATE INDEX fki_siparisnofk ON public.siparisicerigi USING btree (siparisno);
 #   DROP INDEX public.fki_siparisnofk;
       public            postgres    false    217            ?           1259    33588    fki_sozlesmefk    INDEX     J   CREATE INDEX fki_sozlesmefk ON public.sozlesmeli USING btree (calisanno);
 "   DROP INDEX public.fki_sozlesmefk;
       public            postgres    false    219            ?           1259    33488    fki_sozlesmelifk    INDEX     L   CREATE INDEX fki_sozlesmelifk ON public.sozlesmeli USING btree (calisanno);
 $   DROP INDEX public.fki_sozlesmelifk;
       public            postgres    false    219            ?           1259    33489 
   fki_ulkefk    INDEX     @   CREATE INDEX fki_ulkefk ON public.subeler USING btree (ulkeno);
    DROP INDEX public.fki_ulkefk;
       public            postgres    false    221            ?           1259    33490 
   fki_urunfk    INDEX     D   CREATE INDEX fki_urunfk ON public.urunler USING btree (kategorino);
    DROP INDEX public.fki_urunfk;
       public            postgres    false    224            ?           2620    33600    musteriler toplammusteriarttir    TRIGGER     ?   CREATE TRIGGER toplammusteriarttir AFTER INSERT ON public.musteriler FOR EACH ROW EXECUTE FUNCTION public.toplammusteriarttir();
 7   DROP TRIGGER toplammusteriarttir ON public.musteriler;
       public          postgres    false    216    230            ?           2620    33606     musteriler toplammusteriazaltici    TRIGGER     ?   CREATE TRIGGER toplammusteriazaltici AFTER DELETE ON public.musteriler FOR EACH ROW EXECUTE FUNCTION public.toplammusteriazaltici();
 9   DROP TRIGGER toplammusteriazaltici ON public.musteriler;
       public          postgres    false    231    216            ?           2620    33603    subeler toplamsubearttir    TRIGGER     r   CREATE TRIGGER toplamsubearttir AFTER INSERT ON public.subeler FOR EACH ROW EXECUTE FUNCTION public.toplamsube();
 1   DROP TRIGGER toplamsubearttir ON public.subeler;
       public          postgres    false    221    227            ?           2620    33604    subeler toplamsubezalt    TRIGGER     x   CREATE TRIGGER toplamsubezalt AFTER DELETE ON public.subeler FOR EACH ROW EXECUTE FUNCTION public.toplamsubeazaltici();
 /   DROP TRIGGER toplamsubezalt ON public.subeler;
       public          postgres    false    221    229            ?           2606    33492    baglantilar baglantifk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.baglantilar
    ADD CONSTRAINT baglantifk FOREIGN KEY (musterino) REFERENCES public.musteriler(musterino) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 @   ALTER TABLE ONLY public.baglantilar DROP CONSTRAINT baglantifk;
       public          postgres    false    209    3252    216            ?           2606    33578    danisman danismanfk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.danisman
    ADD CONSTRAINT danismanfk FOREIGN KEY (calisanno) REFERENCES public.calisanlar(calisanno) NOT VALID;
 =   ALTER TABLE ONLY public.danisman DROP CONSTRAINT danismanfk;
       public          postgres    false    212    211    3239            ?           2606    33612    stoklar depofk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.stoklar
    ADD CONSTRAINT depofk FOREIGN KEY (depono) REFERENCES public.depolar(depono) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.stoklar DROP CONSTRAINT depofk;
       public          postgres    false    213    3244    220            ?           2606    33632    depolar depofk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.depolar
    ADD CONSTRAINT depofk FOREIGN KEY (depono) REFERENCES public.depolar(depono) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.depolar DROP CONSTRAINT depofk;
       public          postgres    false    3244    213    213            ?           2606    33572    kadrolu kadrofk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.kadrolu
    ADD CONSTRAINT kadrofk FOREIGN KEY (calisanno) REFERENCES public.calisanlar(calisanno) NOT VALID;
 9   ALTER TABLE ONLY public.kadrolu DROP CONSTRAINT kadrofk;
       public          postgres    false    211    214    3239            ?           2606    33517    urunler kategorinofk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.urunler
    ADD CONSTRAINT kategorinofk FOREIGN KEY (kategorino) REFERENCES public.kategoriler(kategorino) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.urunler DROP CONSTRAINT kategorinofk;
       public          postgres    false    215    3250    224            ?           2606    33522    siparisler siparisfk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.siparisler
    ADD CONSTRAINT siparisfk FOREIGN KEY (musterino) REFERENCES public.musteriler(musterino) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.siparisler DROP CONSTRAINT siparisfk;
       public          postgres    false    216    3252    218            ?           2606    33527    siparisicerigi siparisnofk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.siparisicerigi
    ADD CONSTRAINT siparisnofk FOREIGN KEY (siparisno) REFERENCES public.siparisler(siparisno) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.siparisicerigi DROP CONSTRAINT siparisnofk;
       public          postgres    false    218    217    3258            ?           2606    33583    sozlesmeli sozlesmefk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sozlesmeli
    ADD CONSTRAINT sozlesmefk FOREIGN KEY (calisanno) REFERENCES public.calisanlar(calisanno) NOT VALID;
 ?   ALTER TABLE ONLY public.sozlesmeli DROP CONSTRAINT sozlesmefk;
       public          postgres    false    3239    211    219            ?           2606    33622    ulkeler ulkefk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ulkeler
    ADD CONSTRAINT ulkefk FOREIGN KEY (ulkeno) REFERENCES public.ulkeler(ulkeno) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.ulkeler DROP CONSTRAINT ulkefk;
       public          postgres    false    223    223    3270            ?           2606    33627    subeler ulkefk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.subeler
    ADD CONSTRAINT ulkefk FOREIGN KEY (ulkeno) REFERENCES public.ulkeler(ulkeno) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.subeler DROP CONSTRAINT ulkefk;
       public          postgres    false    3270    223    221            ?           2606    33552    siparisicerigi urunfk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.siparisicerigi
    ADD CONSTRAINT urunfk FOREIGN KEY (urunno) REFERENCES public.urunler(urunno) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.siparisicerigi DROP CONSTRAINT urunfk;
       public          postgres    false    3274    217    224            ?           2606    33617    stoklar urunfk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.stoklar
    ADD CONSTRAINT urunfk FOREIGN KEY (urunno) REFERENCES public.urunler(urunno) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.stoklar DROP CONSTRAINT urunfk;
       public          postgres    false    220    224    3274            g      x?????? ? ?      h      x?3?4?????? ]      i   C   x?3?tJ-?N??L??/(??456623?0?4?2?N-JI,?,N)-*.??45321?05???qqq ??      j      x?????? ? ?      k      x?????? ? ?      l      x?????? ? ?      m      x?3?4?2?4?2?,)-*?K.?????? 8?      n      x?3?4?4A?=... :?      o      x?????? ? ?      p      x?3?4?4B###]C#]#?=... , ?      q      x?????? ? ?      r      x?????? ? ?      s   '   x?3?tJ?I,?<???$1/?4???????Ӑ+F??? ???      w      x?3?????? S ?      t      x??5?????? ?      u      x?3?9??(;?2?Ӑ+F??? ;E      v   1   x?3?L?44?4200?4?2??H-N,P?M???K-΄???S?=...  
b     