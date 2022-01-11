create table authors (id text not null unique primary key , name text not null );
create table articles (id text not null unique primary key , author_id varchar(255) not null , title text not null , body text not null , created_at timestamp not null , constraint pk_id_authors foreign key (author_id) references authors(id));

insert into authors (id, name) values
('1', 'Fadhilah Akbar Suherman'),
('2', 'Mario C'),
('3', 'Fred D'),
('4', 'Bagus N'),
('5', 'Hanz C'),
('6', 'Darvin'),
('7', 'M. Ilham'),
('8', 'Ahmad Zufar');

insert into articles (id, author_id, title, body, created_at) VALUES
('1', '8', 'Nba 2k Edition 2021', 'Majalah Ini menceritakan mengenai game nba 2k', '2021-1-10'::timestamp),
('2', '7', 'IoT Engineering', 'Majalah membahas seputar dunia IoT', '2021-1-11'::timestamp),
('3', '6', 'Robot Masa Depan', 'Majalah Ini menceritakan mengenai robot masa depan', '2021-1-12'::timestamp),
('4', '5', 'BitCoin itu Nyata?', 'Artikel membahas mengenai dunia bitcoin', '2021-1-13'::timestamp),
('5', '4', 'Sukses Masa Muda', 'Artikel menjelaskan bagaimana menjadi seorang sukses di waktu muda', '2021-1-14'::timestamp),
('6', '3', 'Desain dengan Adobe Photoshop', 'Artikel menjelaskan bagaimana mendesain suatu karya menggunakan adobe photoshop', '2021-1-15'::timestamp),
('7', '2', 'Belajar Coding dengan Mudah', 'Artikel mempelajari coding dengan mudah', '2021-1-16'::timestamp),
('8', '1', 'Belajar Jaringan Pasti Bisa', 'Artikel menjelaskan mengenai dunia jaringan dengan mudah', '2021-1-17'::timestamp),
('9', '1', 'Backend Master', 'Artikel Mempelajari backend', '2021-1-10'::timestamp),
('10', '2', 'Mengerti Java', 'Artikel Membahas tentang java', '2021-1-11'::timestamp),
('11', '3', 'Bahasa Inggris Mudah', 'Artikel belajar bahasa inggris dengan mudah', '2021-1-12'::timestamp),
('12', '4', 'Fisika itu mudah', 'Belajar dari dasar', '2021-1-13'::timestamp),
('13', '5', 'Trading Kok Susah Sih?', 'Kenapa Trading Sangat Susah', '2021-1-14'::timestamp),
('14', '6', 'Laptop Gaming Termurah', 'Artikel yang menjelaskan Laptop Gaming Termurah', '2021-1-15'::timestamp),
('15', '7', 'Game Paling favorit 2021', 'Artikel menjelaskan game terfavorit 2021', '2021-1-16'::timestamp),
('16', '8', 'Kumpulan Memes Lucu 2021', 'Artikel Berisi Kumpulan Memes Lucu 2021', '2021-1-17'::timestamp);

drop table articles;
drop table authors;

SELECT * FROM articles where title like '%G%' AND body like '%A%' ORDER BY id desc;
