

--Q.All musicians data
select * from  Musician


--Q.Name of people living in India
select m_fname from Musician where m_country_name='India'


--Q.find all adresses of Saurabh
select musician.m_id,m_address1,m_address2 from musician inner join m_address on musician.m_id=m_address.m_id and musician.m_id=(select m_id from musician where m_fname='Saurabhsp');


--Q.find the no. of musicians living in India
select count(*) from musician where m_country_name='India' group by musician.m_country_name ;


--Q. Find names of albums produced by Ravi.
select musician.m_id,musician.m_fname,title from musician,produce,album where musician.m_id=produce.m_id and produce.album_id=album.album_id and musician.m_id=(select m_id from musician where m_fname='Ravi');
--or 
SELECT musician.m_id, musician.m_fname,album.title
FROM ((musician
INNER JOIN produce ON musician.m_id = produce.m_id and musician.m_id=(select m_id from musician where m_fname='Ravi'))
INNER JOIN album ON album.album_id = produce.album_id);


--Q. Find the number of albums produced by Ravi..
SELECT m_fname,count(*)
FROM ((musician
INNER JOIN produce ON musician.m_id = produce.m_id and musician.m_id=(select m_id from musician where m_fname='Ravi'))
INNER JOIN album ON album.album_id = produce.album_id) group by m_fname;


--Q. Find all album producers with respective number of albums produced
SELECT m_fname,count(*)
FROM ((musician
INNER JOIN produce ON musician.m_id = produce.m_id)
INNER JOIN album ON album.album_id = produce.album_id) group by m_fname;


--Q.Find producers of album "Rock Music"
SELECT m_fname,title
FROM ((musician
INNER JOIN produce ON musician.m_id = produce.m_id)
INNER JOIN album ON album.album_id = produce.album_id and album.album_id=(select album_id from album where title='Rock Music'));


-- Unions
SELECT m_fname,count(*)
FROM ((musician
INNER JOIN produce ON musician.m_id = produce.m_id and musician.m_id=(select m_id from musician where m_fname='Ravi'))
INNER JOIN album ON album.album_id = produce.album_id) group by m_fname
UNION ALL
SELECT m_fname,count(*)
FROM ((musician
INNER JOIN produce ON musician.m_id = produce.m_id)
INNER JOIN album ON album.album_id = produce.album_id) group by m_fname;