/*TEMEL KAVRAMLAR

Veritabaný nedir?

Üzerinde iþlem yapýlmasýna uygun düzenli bir yapýda tutulan veri 
topluluðuna veritabaný denir. 

Kurumlar iþlerini yapabilmek için verilerini uygun bir þekilde organize
etmelidirler. Bunun için veri yapýsý modellenir ve buna uygun veritabaný 
yaratýlýr.

DBMS (Database Management System - Veritabaný Yönetim Sistemi-VTYS) nedir?

DMBS ler verileri oluþturmak, üzerlerinde deðiþiklik yapmak, silmek, veriler 
üzerinde sorgulamalar yapmak, veri bütünlüðü ve güvenliðini saðlamak, 
yedeðini almak, yedeði geri yüklemek vb. görevleri yerine getirmek 
için gerçekleþtirilmiþ yazýlýmlardýr. Veriler, DMBS 'lerde tutulur ve yönetilir.

DMBS TARÝHÇE

Bilgisayarlarýn ortaya çýkmasýyla birlikte verilerin saklanmasý da 
bir konu olarak ortaya çýkmýþtýr. Baþlarda kuruluþlar kendi veritabaný 
yapýlarýný kendileri oluþturuyorlardý. Veriler düz metin dosyalarýnda 
veya firmanýn kendi oluþturduðu bir yapýda tutuluyordu. Veri miktarý 
küçük olduðu için çalýþma açýsýndan(çok uygun olmasa da) amaca hizmet 
ediyordu. Veriler genel olarak birtakým özel karakterlerle ayrýlmýþ alanlar 
ve satýrlarda barýndýrýlýyordu. Alanlarý ayýrmak için virgül, noktalý virgül 
veya Tab gibi karakterler; satýrlarý ayýrmak içinse “CR”+”LF” vb kullanýlýyordu.
1960 larýn ortalarýnda genel kullaným için ticari DMBS leri ortaya çýktý. 
Bu veritabaný sistemlerinin mimarisi að(network) ve sonralarý 
hiyerarþik(hierarchical) mimarileridir. 

Ýlk iliþkisel DBMS 1978 de Oracle tarafýndan mainframe sistemler 
için piyasaya sürülmüþtür. Daha sonra IBM DB2 ve diðerleri gelmiþtir. Günümüzde
ücretli/ücretsiz bir çok ürün vardýr.

Mainframe sistemler çok güçlü bir bilgisayar(büyük miktarda bellek, güçlü 
iþlemci/iþlemciler, geniþ kapasiteli, çok hýzlý ve ayný anda bir çok talebe 
cevap verebilen sabit diskler) ve bu bilgisayara baðlý çok sayýda ekran ve 
klavyeden oluþur. Ekran ve klavyeden oluþan makinalara terminal(dumb veya 
dummy terminal) denir. Terminaller aracýlýðýyla mainframe de oturumlar açýlýr. 
Her þey mainframein belleðinde diskinde ve iþlemcisinde gerçekleþir. Bu yüzden 
oldukça saðlam ve güvenli bir yapýdýr, dolayýsýyla kurumlar için çok önemli 
olan veritabanlarýnýn tutulmasý için idealdirler.

DMBS'ler PC lerin ortaya çýkmasý üzerine PC ler üzerine de taþýnmýþtýr. 
PC'lerin yaygýnlaþmasý ile pc aðlarý ortaya çýkmýþtýr. Bu aðlarda veriye 
ulaþým yöntemi Dosya paylasýmý(FileSharing) mimarisidir. Bu mimaride
aðdaki bir(veya birden fazla) makina ortak kullanýma sunulan dosyalar(veya 
yazýcýlar vs) bir paylaþýmda(fileshare) kullanýcýlara açarlar. Kullanýcý paylaþýmdaki
dosyayý okur ve üzerinde gereken iþlemleri yapar. PC'lerde Fileshare mimarisi ile 
çalýþan DMBS lere örnek olarak dBase, Paradox, Access gibi örnekler verilebilir.
Bu sistemlerde veritabaný dosyasý (neredeyse) tam yetki verilerek paylaþtýrýlmýþ
halde bir makinada duruyor, kullanýcý makinasýnda bu database dosyasýndaki 
tablolardaki verileri okuyup kullanacak arayüz bu dosyayý paylaþýmdan alýp kullanýyor. 
Bunun dezavantajý büyük, çünkü arayüz programý tüm client'lara kurulmalý, ayrýca 
farklý kullanýcý arayüzleri herþeyi yapmak zorunda olduklarý için örneðin
bir tabloda bir veriyi ararken, ana makinaya defalarca gidip gelmek zorunda kalýyorlar;
çünkü veriyi okuyup, aradýklarý verinin o olup olmadýðýna kullanýcý arayüzü karar
vermekte. Bu da network trafiði oluþturuyor. Az sayýda kullanýcýda bu trafik kabul 
edilebilir; fakat kullanýcý sayýsý arttýkça bu mimariyle devam etmek olanaksýzlaþýyor.
Yine yerel alan aðlarýnda(Local Area Network-LAN) að hýzý yüksek olduðu içinbu tür
çalýþma bir yere kadar olabiliyor; ancak iþ Geniþ Alan Aðlarý(Wide Area Network-WAN)
lara gelince iþ deðiþiyor; çünkü bu aðlar zaten yavaþ ve bu tür bir çalýþma
trafiðini kaldýrmalarý mümkün deðil. Ayrýca ana makinadaki veritabaný dosyasýnýn
tam yetki ile paylaþtýrýlmasý çok büyük bir güvenlik açýðý.

FileSharing mimarisinin yetersiz kalmasý ile 1990 larda Client-Server mimarisi ortaya çýkar. 
Sunucuda bir server yazýlýmý vardýr ve client'larda bir arayüz vardýr. 
Veritabaný sunucuda tutulmaktadýr. Ancak bu mimaride iþin tamamýný 
kullanýcý arayüzü yapmaz. Kullanýcý arayüzü veritabaný iþlemleri için ana makinada
bulunan DBMS Server den talepte bulunur, örneðin bir kaydý bulmak için sorguyu
ana makinaya gönderir. DBMS Server talebi alýr aranan kaydý bulur ve kullanýcýya cevap olarak
kaydý döndürür. Yani filesharing mimaride olduðu gibi defalarca ana makinaya
gidilip gelinmez.

Büyük çapta veriyle çalýþan büyük özel ve devlet kuruluþlarý, üniversite, 
hastane, askeri kurumlar vs. verilerini mainframe sistemlerde tutmaya devam 
ederken, orta büyüklükteki kuruluþlar mainframe maliyetine göre çok daha 
düþük maliyetli, ama performans olarak yeterli, PC tabanlý 
Ýstemci/Sunucu(Client/Server) mimarili sistemlerde verilerini tutmaya 
baþlamýþlardýr. Bunlara örnek olarak MS SQL Server, Sybase ve sonradan
client/server yapýya da taþýnan Oracle ve DB2 verilebilir. Yine ticari 
olmayan MySql ve PostgreSQl ürünleri de yaygýn olarak kullanýlmaktadýr.

Daha küçük kuruluþlar ise yine PC ler üzerinde tutulan dosya paylaþýmý 
mimarili çok daha ucuz DMBS leri kullanmaktadýrlar. Bunlara örnek olarak 
FoxPro, Access vs verilebilir. Bu ürünler ayrýca arayüz ve programlama bileþenlerini
de içermekte, paket olarak çözüm sunmaktadýr. 

Ýstemci/Sunucu mimarisi genellikle bir veya daha fazla sayýda PC tabanlý 
sunucu ve çok sayýda PC istemciden oluþur. Ýstemci, sunucudan istekte bulunur, 
sunucu istemcinin talebi doðrultusunda kendi üzerinde bulunan veritabanýndan 
sonucu bulur ve kullanýcýya geri döndürür.

Ýstemci ile Sunucu arasýndaki veri iletiþimi iki türlü olabilir 2 Tier veya 
n Tier. 2 Tier de istemci isteklerini doðrudan sunucuya iletip, cevabý da 
sunucudan doðrudan alýr. n Tier de ise istemci ile sunucu arasýnda bir veya 
daha fazla bilgisayar bulunur. Ýstemci aradaki bilgisayardan talepte bulunur 
bu bilgisayar kendi üzerinde gereken iþlemleri gerçekleþtirip DBMS sunucusundan istekte 
bulunur, aldýðý cevabý da yine üzerinde birtakým iþlemler gerçekleþtirerek 
istemciye yollar.

Örneðin internet ve intranet uygulamalarýnda bu mimari kullanýlýr. Tüm client'lara client 
program kurulamasýna gerek yoktur, zaten evrensel bir client yazýlýmý(web browser)
tüm bilgisayarlarda vardýr. Browser ile web server'a eriþilir, sonrasý web server 
ile DBMS server arasýnda yukarýdaki þekilde cereyan eder. Buna web based mimari denilmektedir.

Daha sonrasý Service Oriented Architecture(SOA). Web servisleri en bilinen örneði.

RDBMS (Relational Database Management System - Ýliþkisel Veritabaný Yönetim Sistemi)

DBMS lerde günümüzde kullanýlan veritabaný modeli iliþkisel(relational) 
modeldir. Ýliþkisel modelden önce hiyerarþik(hierarchical)veritabaný modeli ve 
að(network) veritabaný modelleri vardýr. Bu modeller günümüzde kullanýlmamaktadýr. 
Son yýllarda iliþkisel modelin yanýnda ODBMS(Object Database Management System-Nesne 
Yönelimli Veritabaný Yönetim Sistemi) ve ORDBMS(Object Relational Database
 Management System- Nesne Ýliþkisel Veritabaný Yönetim Sistemi) (önceleri adý 
extended relational model) de birtakým alanlarda kullanýlmaya baþlamýþtýr.

Ýliþkisel model 1969 ve 1970 yýllarýnda IBM araþtýrmacýsý E. F. Codd tarafýndan, 
hiyerarþik ve að veritabaný modellerindeki eksiklikleri gidermek ve büyük çapta 
veriler üzerinde daha kolay ve esnek iþlem yapabilmek için geliþtirilmiþtir. Bu 
modelde veriler iliþkilerde yani tablolarda tutulur ve model adýný buradan alýr.
(Genel bir yanýlgý modelin adýný tablolar arasýndaki iliþkilerden aldýðýdýr). 
Tablolarda veriler kayýtlardan(record)(iliþkisel teoride tuple) ve alanlardan(field) 
(iliþkisel teoride attribute) oluþur. Kayýtlarýn ve kolonlarýn sýrasý önemli deðildir. 
Herhangi bir veriye kayýttaki Birincil Anahtar(Primary Key-PK) aracýlýðýyla 
eriþilebilir.

Bu modelde veri tutarsýzlýðý ve yer harcamaya neden olan veri tekrarýndan kaçýnmak 
için, tablo yapýsý normalizasyon kurallarý çerçevesinde oluþturulur ve tablolar 
arasýnda mantýksal baðlantýlar yani iliþkiler(relations) kurulur.

Ýliþkisel model çok güçlü teorik yapýsý ve pratik uygulamalarýyla veritabaný 
dünyasýnda çok önemli bir yere sahiptir ve uzunca bir süre daha böyle olacaðý 
da açýktýr. Yine de birtakým eksik noktalarý vardýr:

1- En büyük eksikleri nesne yapýsýnda olmamalarý. Günümüzde Object Oriented 
yazýlýmlar geliþtirilmekte. Uygulama kodunda ilgili tablo bir class ile temsil 
edilmek zorunda. Yani, yazdýðýmýz programda tabloya karþýlýk gelen class'ta 
tablodaki field'ler sýnýfýn birer field'i olarak temsil edilir ve bundan sonraki 
iþlemler zahmetlidir. Mesela bir stok tablosu 100'lerce kolondan oluþabilir ve 
DB'deki field'lerin kýsýtlarýný nesnenin field'lerinde de gerçekleþtirmemiz 
gerekir. Bu problem için günümüzde birtakým Objet Relational mapping(ORM) araçlarý kullanýlmaktadýr. 
Özetle Relational Model'de tabloyu uygulama koduna taþýmak zahmetlidir
LinQ ve Hybernate bu konuda kullanýlan mapping araçlarýdýr. Ayrýca, 
son olarak DB'nin yapýsý deðiþirse onunla baðlý uygulama kodunun da deðiþtirilmesi 
gerekir.(Gerçi bu sorun OODBMS lerde daha farklý þekilde ortaya çýkmaktadýr)

2) Üzerinde deðiþik veri tiplerini tutmak ve sorgulamak konusunda-özellikle çoklu ortam 
verileri-BLOB(Binary Large Object) (resim , video, cad/cam, gis verisi vs) lar
yeteri kadar geliþkin deðil,

3) Relational DB'de tablolarda inheritance kullanýlamýyor. Mesela bir taban 
tablodan türeyen üç alt-tablo yapýlamýyor. Bu yapý gerçekleþtirilemediði için 
bir çok tabloda iþlem yapýlacaðýnda anlaþýlabilirliði düþürmeyi göze alarak 
JOIN'lerle tablolarý birleþtirip iþlem gerçekleþtirmekteyiz. 

ODBMS ve ORDBMS ler bu eksiklikleri gidermek için geliþtirilmiþtir; ancak bu 
konulardaki avantajlarýnýn yanýnda çok büyük eksikleri vardýr. Bu sistemler 
günümüzdeki RDBMS'lerin yapýsýný karþýlamýyor. Ýliþkisel modele sýnýflar(classes), 
sarmalama(encapsulation) ve kalýtým(inheritance) gibi OO özelliklerin katýlmasýyla 
oluþturulan ORDBMS ler uygun çözüm olabilir görünmektedir.

*/
--Veritabaný yaratma
create database Bute5 

--tablolardaki char alanlarda varsayýlan olarak Türkçe karakter setinden veriler tutulacaðýný bildirmek için
create database Bute5 collate Turkish_CI_AS

--Bute5 veritabanýný kullanýma almak için
use Bute5

--Sehir tablosunu yaratalým
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

--Sehir tablosundaki tüm satýrlarý ve kolonlarý getirelim
select * from Sehir

--2 numaralý sehirin adýný 'Adýyaman' yapalým
update Sehir
set SehirAdi = 'Adýyaman'
where PlakaNo = 2

insert Sehir
values (100, 'Karþýyaka')

--100 no lu sehiri silelim
delete Sehir
where PlakaNo = 100

--ayný komutla birden fazla satýr eklenebilir
insert Sehir
values (3, 'Afyon'),
		(4, 'Aðrý'),
		(5, 'Amasya')
		
--Bute5 veritabaný hakkýnda bilgi alalým		
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

--sadece veri girilecek kolonlarýn listesi verilerek
--onlara veri girilmesi saðlanabilir
insert into Stok (StokKodu, StokAdi)
values ('RAM2GB', '2 GB 533 Mhz RAM')

--into yazýlmayabilir
insert Stok (StokKodu, StokAdi)
values ('DSK1TB', '1 TB Harddisk')

select * from Stok

--! Tb lýk disklerden 8 adet geldi. Bunu veritabanýnda güncelleyelim.
update Stok
set Adet = 8
where StokKodu = 'DSK1TB'

--Elimizde bulunan stoklarý listeleyelim
select * from Stok
where Adet > 0

--* tüm kolonlarý döndürür

--Elimizde bulunan stoklarýn kodlarýný ve adlarýný listeleyelim
select StokKodu, StokAdi from Stok
where Adet > 0

--2 adet RAM1GB satýldý güncelleyelim
update Stok
set Adet = Adet - 2
where StokKodu = 'RAM1GB'

--Fiyatý bilinmeyen ürünlerin fiyatýný 50 yapalým
update Stok
set Fiyat = 50
where Fiyat is null

--Adedi 5 in üstünde olan ürünlerin fiyatlarýnda %10 indirim yapalým
update Stok
set Fiyat = Fiyat * 0.9
where Adet > 5

select * from Stok

--Ramlerin özelliklerini görelim
select * from Stok
where StokKodu like 'RAM%'

--Tüm stoklarýn kodu, adý ve açýklamasýný getirelin
select StokKodu, StokAdi, Aciklama from Stok

--Aciklamasý yoksa '-' iþaretini koyalým
select StokKodu, StokAdi, isnull(Aciklama, '-') 
from Stok

--Tüm stoklarýn kodu, adý ve açýklamasýný getirelin
--Aciklamasý yoksa 'Açýklamasý yok' yazalým
select StokKodu, StokAdi, isnull(Aciklama, 'Açýklamasý yok') 
from Stok

--Tüm stoklarýn kodu, adý ve açýklamasýný getirelin
--Aciklamasý yoksa 'Açýklamasý yok' yazalým
--Kodu ve adýný da büyük harfe çevirelim
select upper(StokKodu), upper(StokAdi), 
isnull(Aciklama, 'Açýklamasý yok') 
from Stok

--Kolonlara takma adlar verilebilir
select upper(StokKodu) as StokKodu, upper(StokAdi) Adý, 
isnull(Aciklama, 'Açýklamasý yok') Açýklama
from Stok

--Stoklar %20 zam yapsak fiyatlarý kaç olur
--StokKodu, adi, fiyatý ve %20 zamlý fiyatý
select StokKodu, StokAdi, Fiyat, Fiyat * 1.2 ZamlýFiyat
from Stok

--Takma adlarda as kullanýlabilir. 
select StokKodu, StokAdi, Fiyat ÞuAnkiFiyat, Fiyat * 1.2 as ZamlýFiyat
from Stok

--Takma adlarda boþluk kullanýlabilir. Bu durumda takma adý '[ ]'
--içinde yazmak gerekir
select StokKodu, StokAdi, Fiyat [Þu Anki Fiyat], 
Fiyat * 1.2 as [Zamlý Fiyat]
from Stok

--Nesne isimlerinde de boþluk olabilir. Bu durumda takma adý '[ ]'
--içinde yazmak gerekir
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

--Donen sonuç setinden Sehir tablosunu yaratalým
--Bunun için öncede Shie tablosunun bulunmamasý gerekir
select * into Sehir from Bute5.dbo.Sehir

--Bir tablonun tanýmýnda deðiþiklik yapmak için alter table kullanýlýr
--Sehir tablosunda PlakaNo yu PK yapalým
alter table Sehir
add constraint PK_PlakaNo primary key (PlakaNo)

insert Musteri
values ('A inþaat', null, 34, 'Þiþli', '11111111111', null, 0)

/*
SQL Komutlarý
1- DDL(Data Definition Language) Komutlarý
Veritabaný nesnelerinin tanýmlanmasý ile ilgili komutlar

create 
Nesne yaratmak için kullanýlýr
create table
create view
create procedure
.
.
.

alter
Varolan bir nesnenin tanýmýný deðiþtirmek için kullanýlýr
alter table
alter view
alter procedure
.
.
.


drop
Bir nesneyi silmek için kullanýlýr
drop table
drop view
drop procedure
.
.
.

2- DML(Data Manipulation Language) Komutlarý
Tablolara veri eklenmesi, güncellenmesi, silinmesi ve sorgulanmasý
ile ilgili komutlar

Select
Verileri sorgulamak için kullanýlýr

Insert
Tabloya yeni bir veya birden fazla satýr veri eklemek için kullanýlýr


Update 
Tablodaki bir veya birden fazla satýr veriyi güncellemek 
için kullanýlýr


Delete
Tablodaki bir veya birden fazla satýr veriyi silmek
için kullanýlýr


3-DCL(Data Control Language) Komutlarý
Veritabaný nesneleri üzerinde yetkilendirme yapmakla 
ilgili komutlardýr

grant
Yetki verilmesini saðlar

revoke
Yetkilerin kaldýrýlmasý saðlar

deny
Yasaklama yapmaya yarar

*/



