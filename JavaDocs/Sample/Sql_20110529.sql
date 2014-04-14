/*TEMEL KAVRAMLAR

Veritaban� nedir?

�zerinde i�lem yap�lmas�na uygun d�zenli bir yap�da tutulan veri 
toplulu�una veritaban� denir. 

Kurumlar i�lerini yapabilmek i�in verilerini uygun bir �ekilde organize
etmelidirler. Bunun i�in veri yap�s� modellenir ve buna uygun veritaban� 
yarat�l�r.

DBMS (Database Management System - Veritaban� Y�netim Sistemi-VTYS) nedir?

DMBS ler verileri olu�turmak, �zerlerinde de�i�iklik yapmak, silmek, veriler 
�zerinde sorgulamalar yapmak, veri b�t�nl��� ve g�venli�ini sa�lamak, 
yede�ini almak, yede�i geri y�klemek vb. g�revleri yerine getirmek 
i�in ger�ekle�tirilmi� yaz�l�mlard�r. Veriler, DMBS 'lerde tutulur ve y�netilir.

DMBS TAR�H�E

Bilgisayarlar�n ortaya ��kmas�yla birlikte verilerin saklanmas� da 
bir konu olarak ortaya ��km��t�r. Ba�larda kurulu�lar kendi veritaban� 
yap�lar�n� kendileri olu�turuyorlard�. Veriler d�z metin dosyalar�nda 
veya firman�n kendi olu�turdu�u bir yap�da tutuluyordu. Veri miktar� 
k���k oldu�u i�in �al��ma a��s�ndan(�ok uygun olmasa da) amaca hizmet 
ediyordu. Veriler genel olarak birtak�m �zel karakterlerle ayr�lm�� alanlar 
ve sat�rlarda bar�nd�r�l�yordu. Alanlar� ay�rmak i�in virg�l, noktal� virg�l 
veya Tab gibi karakterler; sat�rlar� ay�rmak i�inse �CR�+�LF� vb kullan�l�yordu.
1960 lar�n ortalar�nda genel kullan�m i�in ticari DMBS leri ortaya ��kt�. 
Bu veritaban� sistemlerinin mimarisi a�(network) ve sonralar� 
hiyerar�ik(hierarchical) mimarileridir. 

�lk ili�kisel DBMS 1978 de Oracle taraf�ndan mainframe sistemler 
i�in piyasaya s�r�lm��t�r. Daha sonra IBM DB2 ve di�erleri gelmi�tir. G�n�m�zde
�cretli/�cretsiz bir �ok �r�n vard�r.

Mainframe sistemler �ok g��l� bir bilgisayar(b�y�k miktarda bellek, g��l� 
i�lemci/i�lemciler, geni� kapasiteli, �ok h�zl� ve ayn� anda bir �ok talebe 
cevap verebilen sabit diskler) ve bu bilgisayara ba�l� �ok say�da ekran ve 
klavyeden olu�ur. Ekran ve klavyeden olu�an makinalara terminal(dumb veya 
dummy terminal) denir. Terminaller arac�l���yla mainframe de oturumlar a��l�r. 
Her �ey mainframein belle�inde diskinde ve i�lemcisinde ger�ekle�ir. Bu y�zden 
olduk�a sa�lam ve g�venli bir yap�d�r, dolay�s�yla kurumlar i�in �ok �nemli 
olan veritabanlar�n�n tutulmas� i�in idealdirler.

DMBS'ler PC lerin ortaya ��kmas� �zerine PC ler �zerine de ta��nm��t�r. 
PC'lerin yayg�nla�mas� ile pc a�lar� ortaya ��km��t�r. Bu a�larda veriye 
ula��m y�ntemi Dosya paylas�m�(FileSharing) mimarisidir. Bu mimaride
a�daki bir(veya birden fazla) makina ortak kullan�ma sunulan dosyalar(veya 
yaz�c�lar vs) bir payla��mda(fileshare) kullan�c�lara a�arlar. Kullan�c� payla��mdaki
dosyay� okur ve �zerinde gereken i�lemleri yapar. PC'lerde Fileshare mimarisi ile 
�al��an DMBS lere �rnek olarak dBase, Paradox, Access gibi �rnekler verilebilir.
Bu sistemlerde veritaban� dosyas� (neredeyse) tam yetki verilerek payla�t�r�lm��
halde bir makinada duruyor, kullan�c� makinas�nda bu database dosyas�ndaki 
tablolardaki verileri okuyup kullanacak aray�z bu dosyay� payla��mdan al�p kullan�yor. 
Bunun dezavantaj� b�y�k, ��nk� aray�z program� t�m client'lara kurulmal�, ayr�ca 
farkl� kullan�c� aray�zleri her�eyi yapmak zorunda olduklar� i�in �rne�in
bir tabloda bir veriyi ararken, ana makinaya defalarca gidip gelmek zorunda kal�yorlar;
��nk� veriyi okuyup, arad�klar� verinin o olup olmad���na kullan�c� aray�z� karar
vermekte. Bu da network trafi�i olu�turuyor. Az say�da kullan�c�da bu trafik kabul 
edilebilir; fakat kullan�c� say�s� artt�k�a bu mimariyle devam etmek olanaks�zla��yor.
Yine yerel alan a�lar�nda(Local Area Network-LAN) a� h�z� y�ksek oldu�u i�inbu t�r
�al��ma bir yere kadar olabiliyor; ancak i� Geni� Alan A�lar�(Wide Area Network-WAN)
lara gelince i� de�i�iyor; ��nk� bu a�lar zaten yava� ve bu t�r bir �al��ma
trafi�ini kald�rmalar� m�mk�n de�il. Ayr�ca ana makinadaki veritaban� dosyas�n�n
tam yetki ile payla�t�r�lmas� �ok b�y�k bir g�venlik a����.

FileSharing mimarisinin yetersiz kalmas� ile 1990 larda Client-Server mimarisi ortaya ��kar. 
Sunucuda bir server yaz�l�m� vard�r ve client'larda bir aray�z vard�r. 
Veritaban� sunucuda tutulmaktad�r. Ancak bu mimaride i�in tamam�n� 
kullan�c� aray�z� yapmaz. Kullan�c� aray�z� veritaban� i�lemleri i�in ana makinada
bulunan DBMS Server den talepte bulunur, �rne�in bir kayd� bulmak i�in sorguyu
ana makinaya g�nderir. DBMS Server talebi al�r aranan kayd� bulur ve kullan�c�ya cevap olarak
kayd� d�nd�r�r. Yani filesharing mimaride oldu�u gibi defalarca ana makinaya
gidilip gelinmez.

B�y�k �apta veriyle �al��an b�y�k �zel ve devlet kurulu�lar�, �niversite, 
hastane, askeri kurumlar vs. verilerini mainframe sistemlerde tutmaya devam 
ederken, orta b�y�kl�kteki kurulu�lar mainframe maliyetine g�re �ok daha 
d���k maliyetli, ama performans olarak yeterli, PC tabanl� 
�stemci/Sunucu(Client/Server) mimarili sistemlerde verilerini tutmaya 
ba�lam��lard�r. Bunlara �rnek olarak MS SQL Server, Sybase ve sonradan
client/server yap�ya da ta��nan Oracle ve DB2 verilebilir. Yine ticari 
olmayan MySql ve PostgreSQl �r�nleri de yayg�n olarak kullan�lmaktad�r.

Daha k���k kurulu�lar ise yine PC ler �zerinde tutulan dosya payla��m� 
mimarili �ok daha ucuz DMBS leri kullanmaktad�rlar. Bunlara �rnek olarak 
FoxPro, Access vs verilebilir. Bu �r�nler ayr�ca aray�z ve programlama bile�enlerini
de i�ermekte, paket olarak ��z�m sunmaktad�r. 

�stemci/Sunucu mimarisi genellikle bir veya daha fazla say�da PC tabanl� 
sunucu ve �ok say�da PC istemciden olu�ur. �stemci, sunucudan istekte bulunur, 
sunucu istemcinin talebi do�rultusunda kendi �zerinde bulunan veritaban�ndan 
sonucu bulur ve kullan�c�ya geri d�nd�r�r.

�stemci ile Sunucu aras�ndaki veri ileti�imi iki t�rl� olabilir 2 Tier veya 
n Tier. 2 Tier de istemci isteklerini do�rudan sunucuya iletip, cevab� da 
sunucudan do�rudan al�r. n Tier de ise istemci ile sunucu aras�nda bir veya 
daha fazla bilgisayar bulunur. �stemci aradaki bilgisayardan talepte bulunur 
bu bilgisayar kendi �zerinde gereken i�lemleri ger�ekle�tirip DBMS sunucusundan istekte 
bulunur, ald��� cevab� da yine �zerinde birtak�m i�lemler ger�ekle�tirerek 
istemciye yollar.

�rne�in internet ve intranet uygulamalar�nda bu mimari kullan�l�r. T�m client'lara client 
program kurulamas�na gerek yoktur, zaten evrensel bir client yaz�l�m�(web browser)
t�m bilgisayarlarda vard�r. Browser ile web server'a eri�ilir, sonras� web server 
ile DBMS server aras�nda yukar�daki �ekilde cereyan eder. Buna web based mimari denilmektedir.

Daha sonras� Service Oriented Architecture(SOA). Web servisleri en bilinen �rne�i.

RDBMS (Relational Database Management System - �li�kisel Veritaban� Y�netim Sistemi)

DBMS lerde g�n�m�zde kullan�lan veritaban� modeli ili�kisel(relational) 
modeldir. �li�kisel modelden �nce hiyerar�ik(hierarchical)veritaban� modeli ve 
a�(network) veritaban� modelleri vard�r. Bu modeller g�n�m�zde kullan�lmamaktad�r. 
Son y�llarda ili�kisel modelin yan�nda ODBMS(Object Database Management System-Nesne 
Y�nelimli Veritaban� Y�netim Sistemi) ve ORDBMS(Object Relational Database
 Management System- Nesne �li�kisel Veritaban� Y�netim Sistemi) (�nceleri ad� 
extended relational model) de birtak�m alanlarda kullan�lmaya ba�lam��t�r.

�li�kisel model 1969 ve 1970 y�llar�nda IBM ara�t�rmac�s� E. F. Codd taraf�ndan, 
hiyerar�ik ve a� veritaban� modellerindeki eksiklikleri gidermek ve b�y�k �apta 
veriler �zerinde daha kolay ve esnek i�lem yapabilmek i�in geli�tirilmi�tir. Bu 
modelde veriler ili�kilerde yani tablolarda tutulur ve model ad�n� buradan al�r.
(Genel bir yan�lg� modelin ad�n� tablolar aras�ndaki ili�kilerden ald���d�r). 
Tablolarda veriler kay�tlardan(record)(ili�kisel teoride tuple) ve alanlardan(field) 
(ili�kisel teoride attribute) olu�ur. Kay�tlar�n ve kolonlar�n s�ras� �nemli de�ildir. 
Herhangi bir veriye kay�ttaki Birincil Anahtar(Primary Key-PK) arac�l���yla 
eri�ilebilir.

Bu modelde veri tutars�zl��� ve yer harcamaya neden olan veri tekrar�ndan ka��nmak 
i�in, tablo yap�s� normalizasyon kurallar� �er�evesinde olu�turulur ve tablolar 
aras�nda mant�ksal ba�lant�lar yani ili�kiler(relations) kurulur.

�li�kisel model �ok g��l� teorik yap�s� ve pratik uygulamalar�yla veritaban� 
d�nyas�nda �ok �nemli bir yere sahiptir ve uzunca bir s�re daha b�yle olaca�� 
da a��kt�r. Yine de birtak�m eksik noktalar� vard�r:

1- En b�y�k eksikleri nesne yap�s�nda olmamalar�. G�n�m�zde Object Oriented 
yaz�l�mlar geli�tirilmekte. Uygulama kodunda ilgili tablo bir class ile temsil 
edilmek zorunda. Yani, yazd���m�z programda tabloya kar��l�k gelen class'ta 
tablodaki field'ler s�n�f�n birer field'i olarak temsil edilir ve bundan sonraki 
i�lemler zahmetlidir. Mesela bir stok tablosu 100'lerce kolondan olu�abilir ve 
DB'deki field'lerin k�s�tlar�n� nesnenin field'lerinde de ger�ekle�tirmemiz 
gerekir. Bu problem i�in g�n�m�zde birtak�m Objet Relational mapping(ORM) ara�lar� kullan�lmaktad�r. 
�zetle Relational Model'de tabloyu uygulama koduna ta��mak zahmetlidir
LinQ ve Hybernate bu konuda kullan�lan mapping ara�lar�d�r. Ayr�ca, 
son olarak DB'nin yap�s� de�i�irse onunla ba�l� uygulama kodunun da de�i�tirilmesi 
gerekir.(Ger�i bu sorun OODBMS lerde daha farkl� �ekilde ortaya ��kmaktad�r)

2) �zerinde de�i�ik veri tiplerini tutmak ve sorgulamak konusunda-�zellikle �oklu ortam 
verileri-BLOB(Binary Large Object) (resim , video, cad/cam, gis verisi vs) lar
yeteri kadar geli�kin de�il,

3) Relational DB'de tablolarda inheritance kullan�lam�yor. Mesela bir taban 
tablodan t�reyen �� alt-tablo yap�lam�yor. Bu yap� ger�ekle�tirilemedi�i i�in 
bir �ok tabloda i�lem yap�laca��nda anla��labilirli�i d���rmeyi g�ze alarak 
JOIN'lerle tablolar� birle�tirip i�lem ger�ekle�tirmekteyiz. 

ODBMS ve ORDBMS ler bu eksiklikleri gidermek i�in geli�tirilmi�tir; ancak bu 
konulardaki avantajlar�n�n yan�nda �ok b�y�k eksikleri vard�r. Bu sistemler 
g�n�m�zdeki RDBMS'lerin yap�s�n� kar��lam�yor. �li�kisel modele s�n�flar(classes), 
sarmalama(encapsulation) ve kal�t�m(inheritance) gibi OO �zelliklerin kat�lmas�yla 
olu�turulan ORDBMS ler uygun ��z�m olabilir g�r�nmektedir.

*/
--Veritaban� yaratma
create database Bute5 

--tablolardaki char alanlarda varsay�lan olarak T�rk�e karakter setinden veriler tutulaca��n� bildirmek i�in
create database Bute5 collate Turkish_CI_AS

--Bute5 veritaban�n� kullan�ma almak i�in
use Bute5

--Sehir tablosunu yaratal�m
create table Sehir
(
PlakaNo int not null primary key,
SehirAdi varchar(100) not null 
)

--Veri ekleme
insert Sehir
values (1, 'Adana')

insert Sehir
values (2, 'Adana')

--Sehir tablosundaki t�m sat�rlar� ve kolonlar� getirelim
select * from Sehir

--2 numaral� sehirin ad�n� 'Ad�yaman' yapal�m
update Sehir
set SehirAdi = 'Ad�yaman'
where PlakaNo = 2

insert Sehir
values (100, 'Kar��yaka')

--100 no lu sehiri silelim
delete Sehir
where PlakaNo = 100

--ayn� komutla birden fazla sat�r eklenebilir
insert Sehir
values (3, 'Afyon'),
		(4, 'A�r�'),
		(5, 'Amasya')
		
--Bute5 veritaban� hakk�nda bilgi alal�m		
sp_helpdb Bute5		

-------------------------------
alter database Bute5 set single_user with rollback immediate
alter database Bute5 collate Turkish_CI_AS
alter database Bute5 set multi_user
-------------------------------

--tablo silme
drop table Sehir


create table Stok
(
StokKodu char(10) not null,
StokAdi varchar(100) not null,
Aciklama varchar(500) null,
Fiyat decimal(10, 2) null,
Adet int null default(0),
constraint PK_StokKodu primary key (StokKodu)
)

insert into Stok 
values ('RAM1GB', '1 GB 533 Mhz RAM', null, 17, 5)

--sadece veri girilecek kolonlar�n listesi verilerek
--onlara veri girilmesi sa�lanabilir
insert into Stok (StokKodu, StokAdi)
values ('RAM2GB', '2 GB 533 Mhz RAM')

--into yaz�lmayabilir
insert Stok (StokKodu, StokAdi)
values ('DSK1TB', '1 TB Harddisk')

select * from Stok

--! Tb l�k disklerden 8 adet geldi. Bunu veritaban�nda g�ncelleyelim.
update Stok
set Adet = 8
where StokKodu = 'DSK1TB'

--Elimizde bulunan stoklar� listeleyelim
select * from Stok
where Adet > 0

--* t�m kolonlar� d�nd�r�r

--Elimizde bulunan stoklar�n kodlar�n� ve adlar�n� listeleyelim
select StokKodu, StokAdi from Stok
where Adet > 0

--2 adet RAM1GB sat�ld� g�ncelleyelim
update Stok
set Adet = Adet - 2
where StokKodu = 'RAM1GB'

--Fiyat� bilinmeyen �r�nlerin fiyat�n� 50 yapal�m
update Stok
set Fiyat = 50
where Fiyat is null

--Adedi 5 in �st�nde olan �r�nlerin fiyatlar�nda %10 indirim yapal�m
update Stok
set Fiyat = Fiyat * 0.9
where Adet > 5

select * from Stok

--Ramlerin �zelliklerini g�relim
select * from Stok
where StokKodu like 'RAM%'

--T�m stoklar�n kodu, ad� ve a��klamas�n� getirelin
select StokKodu, StokAdi, Aciklama from Stok

--Aciklamas� yoksa '-' i�aretini koyal�m
select StokKodu, StokAdi, isnull(Aciklama, '-') 
from Stok

--T�m stoklar�n kodu, ad� ve a��klamas�n� getirelin
--Aciklamas� yoksa 'A��klamas� yok' yazal�m
select StokKodu, StokAdi, isnull(Aciklama, 'A��klamas� yok') 
from Stok

--T�m stoklar�n kodu, ad� ve a��klamas�n� getirelin
--Aciklamas� yoksa 'A��klamas� yok' yazal�m
--Kodu ve ad�n� da b�y�k harfe �evirelim
select upper(StokKodu), upper(StokAdi), 
isnull(Aciklama, 'A��klamas� yok') 
from Stok

--Kolonlara takma adlar verilebilir
select upper(StokKodu) as StokKodu, upper(StokAdi) Ad�, 
isnull(Aciklama, 'A��klamas� yok') A��klama
from Stok

--Stoklar %20 zam yapsak fiyatlar� ka� olur
--StokKodu, adi, fiyat� ve %20 zaml� fiyat�
select StokKodu, StokAdi, Fiyat, Fiyat * 1.2 Zaml�Fiyat
from Stok

--Takma adlarda as kullan�labilir. 
select StokKodu, StokAdi, Fiyat �uAnkiFiyat, Fiyat * 1.2 as Zaml�Fiyat
from Stok

--Takma adlarda bo�luk kullan�labilir. Bu durumda takma ad� '[ ]'
--i�inde yazmak gerekir
select StokKodu, StokAdi, Fiyat [�u Anki Fiyat], 
Fiyat * 1.2 as [Zaml� Fiyat]
from Stok

--Nesne isimlerinde de bo�luk olabilir. Bu durumda takma ad� '[ ]'
--i�inde yazmak gerekir
create table [Deneme Tablosu]
(
[Deneme Kolonu] int,
[Deneme Kolonu 2] int
)

select * from [Deneme Tablosu]

create table Musteri
(
MusteriNo int identity(1, 1) not null,
MusteriAdi varchar(100) not null,
Adres varchar(200) null,
Sehir int not null,
VergiDairesi varchar(100) null,
VergiNo char(11) null,
TcNo char(11) null,
Bakiye decimal(10, 2) null,
constraint PK_MusteriNo primary key (MusteriNo),
constraint FK_Sehir foreign key (Sehir)
references Sehir(PlakaNo)
)

--Donen sonu� setinden Sehir tablosunu yaratal�m
--Bunun i�in �ncede Shie tablosunun bulunmamas� gerekir
select * into Sehir from Bute5.dbo.Sehir

--Bir tablonun tan�m�nda de�i�iklik yapmak i�in alter table kullan�l�r
--Sehir tablosunda PlakaNo yu PK yapal�m
alter table Sehir
add constraint PK_PlakaNo primary key (PlakaNo)

insert Musteri
values ('A in�aat', null, 34, '�i�li', '11111111111', null, 0)

/*
SQL Komutlar�
1- DDL(Data Definition Language) Komutlar�
Veritaban� nesnelerinin tan�mlanmas� ile ilgili komutlar

create 
Nesne yaratmak i�in kullan�l�r
create table
create view
create procedure
.
.
.

alter
Varolan bir nesnenin tan�m�n� de�i�tirmek i�in kullan�l�r
alter table
alter view
alter procedure
.
.
.


drop
Bir nesneyi silmek i�in kullan�l�r
drop table
drop view
drop procedure
.
.
.

2- DML(Data Manipulation Language) Komutlar�
Tablolara veri eklenmesi, g�ncellenmesi, silinmesi ve sorgulanmas�
ile ilgili komutlar

Select
Verileri sorgulamak i�in kullan�l�r

Insert
Tabloya yeni bir veya birden fazla sat�r veri eklemek i�in kullan�l�r


Update 
Tablodaki bir veya birden fazla sat�r veriyi g�ncellemek 
i�in kullan�l�r


Delete
Tablodaki bir veya birden fazla sat�r veriyi silmek
i�in kullan�l�r


3-DCL(Data Control Language) Komutlar�
Veritaban� nesneleri �zerinde yetkilendirme yapmakla 
ilgili komutlard�r

grant
Yetki verilmesini sa�lar

revoke
Yetkilerin kald�r�lmas� sa�lar

deny
Yasaklama yapmaya yarar

*/



