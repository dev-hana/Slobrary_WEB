CREATE DATABASE `autobrary` DEFAULT CHARACTER SET utf8 ;

use autobrary;

create table admin_info(
	id varchar(20) primary key,
    passwd varchar(20) not null,
    name varchar(15) not null,
    phone char(11) not null UNIQUE,
    add_date TIMESTAMP DEFAULT NOW(),
    a_rank varchar(10) not null
);


insert into admin_info values ( 'wldms3433', 'jang9703', '장지은', '01091473246', now(), 'master');

select * from admin_info;
alter table admin_info modify passwd longtext not null;

create table member(
	RFID varchar(40) primary key,
    mem_id varchar(20) not null,
    passwd varchar(20) not null,
    name varchar(15) not null,
	gender char(1) not null,
    phone char(11) not null UNIQUE,
    birth date not null,
    adress longtext not null,
    email varchar(20) not null UNIQUE,
    loan_status char(3) not null,
    add_date timestamp default now()
);

insert into member values ('12345', 'ji970', '1234', '장지은', 'F', '01091473246', '1997-03-22',
	'서울시', 'comghana@naver.com', 'O', now());
    
alter table member modify mem_id varchar(20) not null unique;
alter table member modify passwd longtext not null;

select * from member;
select * from member where mem_id = 'ji970';
create table book_class(
	class_id varchar(15) primary key,
    class_name varchar(15)
);
 insert into book_class values('180', '심리학');

create table book_info(
	id_num varchar(20) primary key,
    type varchar(10),
    name longtext not null,
    author varchar(15) not null,
    publisher varchar(15) not null,
    issue longtext not null,
    form longtext not null,
    ISBN int not null unique,
    class_id varchar(15) not null,
    language varchar(10) not null,
    collector text not null,
    sign varchar(20) not null unique,
    status char(5) not null,
    constraint fk_classid foreign key(class_id) references book_class(class_id)
);
 alter table book_info add column image longblob;
alter table book_info modify author longtext not null;
alter table book_info modify ISBN bigint not null;
INSERT INTO `autobrary`.`book_info`
VALUES ('EM207872', '단행본', '팩트풀니스 : 우리가 세상을 오해하는 10가지 이유와 세상이 생각보다 괜찮은 이유', '한스 로슬링 ; 올라 로슬링 ; 안나 로슬링 뢴룬드 [공]지음 ; 이창신 옮김.', '김영사', '파주 : 김영사, 2019.', '473 p. : 삽도, 도표 ; 22 cm.', '9788934985068', '180', '한국어', '인문사회자료실', ' 182.3 로58ㅍ ', '대출가능', load_file('c:\\fact.jpg'));
select * from book_info;
 insert into book_info(image) values (load_file('c:\\fact.jpg'));

create table book_loan(
	loan_id int NOT NULL AUTO_INCREMENT,
    RFID varchar(40) not null,
    id_num varchar(20) not null,
    loan_date timestamp default now(),
    ex_num int not null,
    return_date date not null,
    return_type varchar(10),
    constraint fk_rfid foreign key(RFID) references member(RFID),
    constraint fk_idnum foreign key(id_num) references book_info(id_num),
    primary key(loan_id)
);

create table wish_list(
	wish_id int NOT NULL AUTO_INCREMENT,
    RFID varchar(40) not null,
    book_name varchar(40) not null,
    book_author varchar(20) not null,
    publish varchar(20) not null,
    wish_date timestamp default now(),
    status varchar(15) not null,
    primary key(wish_id),
    constraint fk_rfidwish foreign key(RFID) references member(RFID)
);

create table watch_list(
	watch_id int not null auto_increment,
    RFID varchar(40) not null,
    book_id varchar(40) not null,
    watch_date timestamp default now(),
    primary key(watch_id),
    constraint fk_rfidwatch foreign key(RFID) references member(RFID),
    constraint fk_bookatch foreign key(book_id) references book_info(id_num)
);


select * from member where RFID='12345';

