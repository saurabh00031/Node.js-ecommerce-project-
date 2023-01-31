

-- musician table

create table Musician 
( 
    M_id int, 
    M_fname varchar(30), 
    M_mname varchar(30), 
    M_lname varchar(30), 
    M_DOB date,   -- data as datatype
    M_Street_Name varchar(30), 
    M_City_Name varchar(30), 
    M_Country_Name varchar(30), 
    M_Pincode int, 
    PRIMARY KEY (M_id) 
);

insert into Musician  
values(1,'Ravi','Kanhaiya','Jha',to_date('08/12/2002','DD/MM/YYYY'),'Janakpurdham','Mumbai','India',401305);
insert into Musician  
values(2,'Abhijit','Dilip','Puri',to_date('17/09/2001','DD/MM/YYYY'),'Walchand Road','Yavatmal','India',415524);
insert into Musician  
values(3,'Saurabh','Santosh','Patil',to_date('15/06/2000','DD/MM/YYYY'),'U chouk','Baramati','India',415544);
insert into Musician  
values(4,'Omkar','Ashok','Ugale',to_date('30/01/2001','DD/MM/YYYY'),'Mahadarwaja','Ahmadnagar','India',415527);
insert into Musician 
values(6,'How','Are','You',to_date('28/07/1903','DD/MM/YYYY'),'Wolf Of Street','New York','USA',424423);


create table M_Address 
( 
   M_id int, 
   FOREIGN KEY(M_id) REFERENCES Musician(M_id),  --this way ,we create foreign key.....
   M_Address1 VARCHAR(20), 
   M_Address2 VARCHAR(20) 
);

insert into M_Address 
values(1,'s1','s2');
insert into M_Address 
values(1,'st1','st2');
insert into M_Address
values(3,'sr1','sr2');

create table M_Phone 
( 
   M_id int, 
   FOREIGN KEY(M_id) REFERENCES Musician(M_id), 
   M_Phone1 INT, 
   M_Phone2 INT 
);

insert into M_Phone 
values(1,7506561817,7972946733);
insert into M_phone 
values(3,9309979658,9657733709);
insert into M_phone 
values(4,9110929450,8698737677);

create table M_Email 
( 
   M_id int, 
   FOREIGN KEY(M_id) REFERENCES Musician(M_id), 
   M_email_1 VARCHAR(40), 
   M_email_2 VARCHAR(40) 
);

insert into M_email 
values(1,'ravikjha7@gmail.com','ravij1218@gmail.com');
insert into m_email 
values(2,'abhijit17@gmail.com','puriabhijit000@gmail.com');
insert into m_email 
values(4,'saurabh1212@gmail.com','saurabh7866@gmail.com');

create table instrument 
( 
   inst_id int, 
   i_name varchar(20), 
   musical_key varchar(20), 
   primary key(inst_id)   --this is how we create primary key....
);

insert into instrument 
values(1,'piano','G');
insert into instrument 
values(2,'basuri','B');
insert into instrument 
values(3,'Dhol','A');
insert into instrument 
values(4,'Pipani','P');
insert into instrument 
values(5,'Guitar','L');
insert into instrument 
values(6,'Satur','S');

create table play 
( 
   M_id int, 
   FOREIGN KEY(M_id) REFERENCES Musician(M_id), 
   inst_id int, 
   FOREIGN KEY(inst_id) REFERENCES instrument(inst_id) 
);

create table album 
( 
    album_id int, 
    format varchar(20), 
    title varchar(20), 
    copyright_date date, 
    primary key(album_id) 
);

insert into album 
values(1,'text','Rock Music',to_date('09/07/2018','DD/MM/YYYY'));

insert into album 
values(2,'text,mp3','Sad',to_date('12/11/2020','DD/MM/YYYY'));

insert into album 
values(3,'mp3,mp4','Relaxing Music',to_date('23/12/2014','DD/MM/YYYY'));

create table produce 
( 
   M_id int, 
   FOREIGN KEY(M_id) REFERENCES Musician(M_id), 
   album_id int, 
   FOREIGN KEY(album_id) REFERENCES album(album_id) 
);



insert into produce
values(1,1);
insert into produce
values(1,2);
insert into produce
values(2,1);






create table song 
( 
   song_id int, 
   title varchar(20), 
   primary key(song_id) 
);

insert into song 
values(1,'Walla Walla');

insert into song 
values(2,'Hips Dont Lie');


create table perform  
( 
   M_id int, 
   FOREIGN KEY(M_id) REFERENCES Musician(M_id), 
   song_id int, 
   FOREIGN KEY(song_id) REFERENCES song(song_id) 
);

create table appear  
( 
   song_id int, 
   FOREIGN KEY(song_id) REFERENCES song(song_id), 
   album_id int, 
   FOREIGN KEY(album_id) REFERENCES album(album_id) 
);

create table author 
( 
   song_id int, 
   FOREIGN KEY(song_id) REFERENCES song(song_id), 
   author_id int, 
   f_name varchar(20), 
   m_name varchar(20), 
   l_name varchar(20), 
   primary key(author_id) 
);

insert into author 
values(2,1,'Aman','Indor','Tiwary');
