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

insert into sub_class(s_id, s_name, m_id) values('1', '도서학,서지학', '0');
insert into sub_class(s_id, s_name, m_id) values('2', '문헌정보학', '0');
insert into sub_class(s_id, s_name, m_id) values('3', '백과사전', '0');
insert into sub_class(s_id, s_name, m_id) values('4', '강연집,수필집,연설문집', '0');
insert into sub_class(s_id, s_name, m_id) values('5', '일반연속간행물', '0');
insert into sub_class(s_id, s_name, m_id) values('6', '일반학회,단체,협회,기관', '0');
insert into sub_class(s_id, s_name, m_id) values('7', '신문,언론,저널리즘', '0');
insert into sub_class(s_id, s_name, m_id) values('8', '일반전집,총서', '0');
insert into sub_class(s_id, s_name, m_id) values('9', '향토자료', '0');

insert into sub_class(s_id, s_name, m_id) values('1', '형이상학', '1');
insert into sub_class(s_id, s_name, m_id) values('2', '인식론,인과론,인간학', '1');
insert into sub_class(s_id, s_name, m_id) values('3', '철학의 체계', '1');
insert into sub_class(s_id, s_name, m_id) values('4', '경학', '1');
insert into sub_class(s_id, s_name, m_id) values('5', '동양철학,사상', '1');
insert into sub_class(s_id, s_name, m_id) values('6', '서양철학', '1');
insert into sub_class(s_id, s_name, m_id) values('7', '논리학', '1');
insert into sub_class(s_id, s_name, m_id) values('8', '심리학', '1');
insert into sub_class(s_id, s_name, m_id) values('9', '윤리학,도덕철학', '1');

insert into sub_class(s_id, s_name, m_id) values('1', '비교종교', '2');
insert into sub_class(s_id, s_name, m_id) values('2', '불교', '2');
insert into sub_class(s_id, s_name, m_id) values('3', '기독교', '2');
insert into sub_class(s_id, s_name, m_id) values('4', '도교', '2');
insert into sub_class(s_id, s_name, m_id) values('5', '천도교', '2');
insert into sub_class(s_id, s_name, m_id) values('6', '신도', '2');
insert into sub_class(s_id, s_name, m_id) values('7', '힌두교,브라만교', '2');
insert into sub_class(s_id, s_name, m_id) values('8', '이슬람교(회교)', '2');
insert into sub_class(s_id, s_name, m_id) values('9', '기타 제종교', '2');

insert into sub_class(s_id, s_name, m_id) values('1', '통계학', '3');
insert into sub_class(s_id, s_name, m_id) values('2', '경제학', '3');
insert into sub_class(s_id, s_name, m_id) values('3', '사회학,사회문제', '3');
insert into sub_class(s_id, s_name, m_id) values('4', '정치학', '3');
insert into sub_class(s_id, s_name, m_id) values('5', '행정학', '3');
insert into sub_class(s_id, s_name, m_id) values('6', '법학', '3');
insert into sub_class(s_id, s_name, m_id) values('7', '교육학', '3');
insert into sub_class(s_id, s_name, m_id) values('8', '풍석,예절,민속학', '3');
insert into sub_class(s_id, s_name, m_id) values('9', '국방,군사학', '3');

insert into sub_class(s_id, s_name, m_id) values('1', '수학', '4');
insert into sub_class(s_id, s_name, m_id) values('2', '물리학', '4');
insert into sub_class(s_id, s_name, m_id) values('3', '화학', '4');
insert into sub_class(s_id, s_name, m_id) values('4', '천문학', '4');
insert into sub_class(s_id, s_name, m_id) values('5', '지학', '4');
insert into sub_class(s_id, s_name, m_id) values('6', '광물학', '4');
insert into sub_class(s_id, s_name, m_id) values('7', '생명과학', '4');
insert into sub_class(s_id, s_name, m_id) values('8', '식물학', '4');
insert into sub_class(s_id, s_name, m_id) values('9', '동물학', '4');


insert into sub_class(s_id, s_name, m_id) values('1', '의학', '5');
insert into sub_class(s_id, s_name, m_id) values('2', '농업,농학', '5');
insert into sub_class(s_id, s_name, m_id) values('3', '공학,공업일반,토목공학,환경공학', '5');
insert into sub_class(s_id, s_name, m_id) values('4', '건축공학', '5');
insert into sub_class(s_id, s_name, m_id) values('5', '기계꽁학', '5');
insert into sub_class(s_id, s_name, m_id) values('6', '전기공학,전자공학', '5');
insert into sub_class(s_id, s_name, m_id) values('7', '화학공학', '5');
insert into sub_class(s_id, s_name, m_id) values('8', '제조업', '5');
insert into sub_class(s_id, s_name, m_id) values('9', '생활과학', '5');

insert into sub_class(s_id, s_name, m_id) values('1', '건축물', '6');
insert into sub_class(s_id, s_name, m_id) values('2', '조각,조형예술', '6');
insert into sub_class(s_id, s_name, m_id) values('3', '공예,장식미술', '6');
insert into sub_class(s_id, s_name, m_id) values('4', '서예', '6');
insert into sub_class(s_id, s_name, m_id) values('5', '회화,도화', '6');
insert into sub_class(s_id, s_name, m_id) values('6', '사진예술', '6');
insert into sub_class(s_id, s_name, m_id) values('7', '음악', '6');
insert into sub_class(s_id, s_name, m_id) values('8', '공연예술,매체예술', '6');
insert into sub_class(s_id, s_name, m_id) values('9', '오락,스포츠', '6');

insert into sub_class(s_id, s_name, m_id) values('1', '한국어', '7');
insert into sub_class(s_id, s_name, m_id) values('2', '중국어', '7');
insert into sub_class(s_id, s_name, m_id) values('3', '일본어,기타아시아제어', '7');
insert into sub_class(s_id, s_name, m_id) values('4', '영어', '7');
insert into sub_class(s_id, s_name, m_id) values('5', '독일어', '7');
insert into sub_class(s_id, s_name, m_id) values('6', '프랑스어', '7');
insert into sub_class(s_id, s_name, m_id) values('7', '스페인어,포루투칼어', '7');
insert into sub_class(s_id, s_name, m_id) values('8', '이탈리아어', '7');
insert into sub_class(s_id, s_name, m_id) values('9', '기타제어', '7');

insert into sub_class(s_id, s_name, m_id) values('1', '한국문학', '8');
insert into sub_class(s_id, s_name, m_id) values('2', '중국문학', '8');
insert into sub_class(s_id, s_name, m_id) values('3', '일본문학,기타아시아문학', '8');
insert into sub_class(s_id, s_name, m_id) values('4', '영미문학', '8');
insert into sub_class(s_id, s_name, m_id) values('5', '독일문학', '8');
insert into sub_class(s_id, s_name, m_id) values('6', '프랑스문학', '8');
insert into sub_class(s_id, s_name, m_id) values('7', '스페인,포르투칼문학', '8');
insert into sub_class(s_id, s_name, m_id) values('8', '이탈리아문학', '8');
insert into sub_class(s_id, s_name, m_id) values('9', '기타제문학', '8');

insert into sub_class(s_id, s_name, m_id) values('1', '아시아', '9');
insert into sub_class(s_id, s_name, m_id) values('2', '유럽', '9');
insert into sub_class(s_id, s_name, m_id) values('3', '아프리카', '9');
insert into sub_class(s_id, s_name, m_id) values('4', '북아메리카', '9');
insert into sub_class(s_id, s_name, m_id) values('5', '남아메리카', '9');
insert into sub_class(s_id, s_name, m_id) values('6', '오세아니아', '9');
insert into sub_class(s_id, s_name, m_id) values('7', '양극지방', '9');
insert into sub_class(s_id, s_name, m_id) values('8', '지리', '9');
insert into sub_class(s_id, s_name, m_id) values('9', '전기', '9');

select count(*) from sub_class;
select * from sub_class;

delete from sub_class where s_id is null;

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


