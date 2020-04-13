CREATE DATABASE `slo` DEFAULT CHARACTER SET utf8 ;

use slo;

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
alter table admin_info modify a_rank varchar(10);

create table member(
	mem_id varchar(20) primary key,
    RFID longtext,
    passwd longtext not null,
    name varchar(15) not null,
	gender char(1) not null,
    phone char(11) not null UNIQUE,
    birth date not null,
    adress longtext not null,
    email varchar(20) not null UNIQUE,
    loan_status char(3) not null,
    add_date timestamp default now()
);

select * from member;


create table main_class(
	m_id char(1) primary key,
    m_name varchar(15) not null unique
);

insert main_class values('0', '총류');
insert main_class values('1', ' 철학');
insert main_class values('2', '종교');
insert main_class values('3', '사회과학');
insert main_class values('4', '자연과학');
insert main_class values('5', '기술과학');
insert main_class values('6', '예술');
insert main_class values('7', '언어');
insert main_class values('8', '문학');
insert main_class values('9', '역사');

create table sub_class(
	autoid int  NOT NULL AUTO_INCREMENT,
	s_id char(1) not null,
    s_name longtext not null,
    m_id char(1) not null,
    constraint fk_class foreign key(m_id) references main_class(m_id),
    primary key(autoid)
);


select * from sub_class;

create table book_info(
	id_num varchar(20) primary key,
    type varchar(10),
    name longtext not null,
    author longtext not null,
    publisher varchar(15) not null,
    issue longtext not null,
    form longtext not null,
    ISBN bigint not null unique,
    class_id int not null,
    class_num varchar(15) not null,
    language varchar(10) not null,
    collector text not null,
    sign varchar(20) not null unique,
    status char(5) not null,
    image longblob,
    constraint fk_classid foreign key(class_id) references sub_class(autoid)
);


INSERT INTO book_info
VALUES ('EM207872', '단행본', '팩트풀니스 : 우리가 세상을 오해하는 10가지 이유와 세상이 생각보다 괜찮은 이유', '한스 로슬링 ; 올라 로슬링 ; 안나 로슬링 뢴룬드 [공]지음 ; 이창신 옮김.', '김영사', '파주 : 김영사, 2019.', '473 p. : 삽도, 도표 ; 22 cm.', '9788934985068', '180', '한국어', '인문사회자료실', ' 182.3 로58ㅍ ', '대출가능', load_file('c:\\fact.jpg'));
select * from book_info;
 insert into book_info(image) values (load_file('c:\\fact.jpg'));

create table book_loan(
	loan_id int NOT NULL AUTO_INCREMENT,
	mem_id varchar(20) not null,
    id_num varchar(20) not null,
    loan_date timestamp default now(),
    ex_num int not null,
    return_date date not null,
    return_type varchar(10),
    constraint fk_memid foreign key(mem_id) references member(mem_id),
    constraint fk_idnum foreign key(id_num) references book_info(id_num),
    primary key(loan_id)
);

create table wish_list(
	wish_id int NOT NULL AUTO_INCREMENT,
    mem_id varchar(40) not null,
    book_name varchar(40) not null,
    book_author varchar(20) not null,
    publish varchar(20) not null,
    wish_date timestamp default now(),
    status varchar(15) not null,
    primary key(wish_id),
    constraint fk_wishmem foreign key(mem_id) references member(mem_id)
);

create table watch_list(
	watch_id int not null auto_increment,
	mem_id varchar(20) not null,
    book_id varchar(40) not null,
    watch_date timestamp default now(),
    primary key(watch_id),
    constraint fk_watchmem foreign key(mem_id) references member(mem_id),
    constraint fk_bookatch foreign key(book_id) references book_info(id_num)
);

create table recommend(
	reco_id int not null auto_increment,
    book_id varchar(40) not null,
    reco_date timestamp default now(),
    primary key(reco_id),
    constraint fk_reco foreign key(book_id) references book_info(id_num)
);


select * from member where RFID='12345';
select * from book_info;


