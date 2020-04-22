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
alter table member modify column withdrawal timestamp;

update member set withdrawal = now() where mem_id = 'dw';
update member set withdrawal = null where mem_id = 'test';
select mem_id, name, gender, birth, phone, adress, email, loan_status, add_date from member
where withdrawal is null;

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
	s_id char(3) primary key,
    s_name longtext not null,
    m_id char(1) not null,
    constraint fk_class foreign key(m_id) references main_class(m_id)
);



select * from sub_class;

insert into sub_class(s_id, s_name, m_id) values('010', '도서학,서지학', '0');
insert into sub_class(s_id, s_name, m_id) values('020', '문헌정보학', '0');
insert into sub_class(s_id, s_name, m_id) values('030', '백과사전', '0');
insert into sub_class(s_id, s_name, m_id) values('040', '강연집,수필집,연설문집', '0');
insert into sub_class(s_id, s_name, m_id) values('050', '일반연속간행물', '0');
insert into sub_class(s_id, s_name, m_id) values('060', '일반학회,단체,협회,기관', '0');
insert into sub_class(s_id, s_name, m_id) values('070', '신문,언론,저널리즘', '0');
insert into sub_class(s_id, s_name, m_id) values('080', '일반전집,총서', '0');
insert into sub_class(s_id, s_name, m_id) values('090', '향토자료', '0');

insert into sub_class(s_id, s_name, m_id) values('110', '형이상학', '1');
insert into sub_class(s_id, s_name, m_id) values('120', '인식론,인과론,인간학', '1');
insert into sub_class(s_id, s_name, m_id) values('130', '철학의 체계', '1');
insert into sub_class(s_id, s_name, m_id) values('140', '경학', '1');
insert into sub_class(s_id, s_name, m_id) values('150', '동양철학,사상', '1');
insert into sub_class(s_id, s_name, m_id) values('160', '서양철학', '1');
insert into sub_class(s_id, s_name, m_id) values('170', '논리학', '1');
insert into sub_class(s_id, s_name, m_id) values('180', '심리학', '1');
insert into sub_class(s_id, s_name, m_id) values('190', '윤리학,도덕철학', '1');

insert into sub_class(s_id, s_name, m_id) values('210', '비교종교', '2');
insert into sub_class(s_id, s_name, m_id) values('220', '불교', '2');
insert into sub_class(s_id, s_name, m_id) values('230', '기독교', '2');
insert into sub_class(s_id, s_name, m_id) values('240', '도교', '2');
insert into sub_class(s_id, s_name, m_id) values('250', '천도교', '2');
insert into sub_class(s_id, s_name, m_id) values('260', '신도', '2');
insert into sub_class(s_id, s_name, m_id) values('270', '힌두교,브라만교', '2');
insert into sub_class(s_id, s_name, m_id) values('280', '이슬람교(회교)', '2');
insert into sub_class(s_id, s_name, m_id) values('290', '기타 제종교', '2');

insert into sub_class(s_id, s_name, m_id) values('310', '통계학', '3');
insert into sub_class(s_id, s_name, m_id) values('320', '경제학', '3');
insert into sub_class(s_id, s_name, m_id) values('330', '사회학,사회문제', '3');
insert into sub_class(s_id, s_name, m_id) values('340', '정치학', '3');
insert into sub_class(s_id, s_name, m_id) values('350', '행정학', '3');
insert into sub_class(s_id, s_name, m_id) values('360', '법학', '3');
insert into sub_class(s_id, s_name, m_id) values('370', '교육학', '3');
insert into sub_class(s_id, s_name, m_id) values('380', '풍석,예절,민속학', '3');
insert into sub_class(s_id, s_name, m_id) values('390', '국방,군사학', '3');

insert into sub_class(s_id, s_name, m_id) values('410', '수학', '4');
insert into sub_class(s_id, s_name, m_id) values('420', '물리학', '4');
insert into sub_class(s_id, s_name, m_id) values('430', '화학', '4');
insert into sub_class(s_id, s_name, m_id) values('440', '천문학', '4');
insert into sub_class(s_id, s_name, m_id) values('450', '지학', '4');
insert into sub_class(s_id, s_name, m_id) values('460', '광물학', '4');
insert into sub_class(s_id, s_name, m_id) values('470', '생명과학', '4');
insert into sub_class(s_id, s_name, m_id) values('480', '식물학', '4');
insert into sub_class(s_id, s_name, m_id) values('490', '동물학', '4');


insert into sub_class(s_id, s_name, m_id) values('510', '의학', '5');
insert into sub_class(s_id, s_name, m_id) values('520', '농업,농학', '5');
insert into sub_class(s_id, s_name, m_id) values('530', '공학,공업일반,토목공학,환경공학', '5');
insert into sub_class(s_id, s_name, m_id) values('540', '건축공학', '5');
insert into sub_class(s_id, s_name, m_id) values('550', '기계꽁학', '5');
insert into sub_class(s_id, s_name, m_id) values('560', '전기공학,전자공학', '5');
insert into sub_class(s_id, s_name, m_id) values('570', '화학공학', '5');
insert into sub_class(s_id, s_name, m_id) values('580', '제조업', '5');
insert into sub_class(s_id, s_name, m_id) values('590', '생활과학', '5');

insert into sub_class(s_id, s_name, m_id) values('610', '건축물', '6');
insert into sub_class(s_id, s_name, m_id) values('620', '조각,조형예술', '6');
insert into sub_class(s_id, s_name, m_id) values('630', '공예,장식미술', '6');
insert into sub_class(s_id, s_name, m_id) values('640', '서예', '6');
insert into sub_class(s_id, s_name, m_id) values('650', '회화,도화', '6');
insert into sub_class(s_id, s_name, m_id) values('660', '사진예술', '6');
insert into sub_class(s_id, s_name, m_id) values('670', '음악', '6');
insert into sub_class(s_id, s_name, m_id) values('680', '공연예술,매체예술', '6');
insert into sub_class(s_id, s_name, m_id) values('690', '오락,스포츠', '6');

insert into sub_class(s_id, s_name, m_id) values('710', '한국어', '7');
insert into sub_class(s_id, s_name, m_id) values('720', '중국어', '7');
insert into sub_class(s_id, s_name, m_id) values('730', '일본어,기타아시아제어', '7');
insert into sub_class(s_id, s_name, m_id) values('740', '영어', '7');
insert into sub_class(s_id, s_name, m_id) values('750', '독일어', '7');
insert into sub_class(s_id, s_name, m_id) values('760', '프랑스어', '7');
insert into sub_class(s_id, s_name, m_id) values('770', '스페인어,포루투칼어', '7');
insert into sub_class(s_id, s_name, m_id) values('780', '이탈리아어', '7');
insert into sub_class(s_id, s_name, m_id) values('790', '기타제어', '7');

insert into sub_class(s_id, s_name, m_id) values('810', '한국문학', '8');
insert into sub_class(s_id, s_name, m_id) values('820', '중국문학', '8');
insert into sub_class(s_id, s_name, m_id) values('830', '일본문학,기타아시아문학', '8');
insert into sub_class(s_id, s_name, m_id) values('840', '영미문학', '8');
insert into sub_class(s_id, s_name, m_id) values('850', '독일문학', '8');
insert into sub_class(s_id, s_name, m_id) values('860', '프랑스문학', '8');
insert into sub_class(s_id, s_name, m_id) values('870', '스페인,포르투칼문학', '8');
insert into sub_class(s_id, s_name, m_id) values('880', '이탈리아문학', '8');
insert into sub_class(s_id, s_name, m_id) values('890', '기타제문학', '8');

insert into sub_class(s_id, s_name, m_id) values('910', '아시아', '9');
insert into sub_class(s_id, s_name, m_id) values('920', '유럽', '9');
insert into sub_class(s_id, s_name, m_id) values('930', '아프리카', '9');
insert into sub_class(s_id, s_name, m_id) values('940', '북아메리카', '9');
insert into sub_class(s_id, s_name, m_id) values('950', '남아메리카', '9');
insert into sub_class(s_id, s_name, m_id) values('960', '오세아니아', '9');
insert into sub_class(s_id, s_name, m_id) values('970', '양극지방', '9');
insert into sub_class(s_id, s_name, m_id) values('980', '지리', '9');
insert into sub_class(s_id, s_name, m_id) values('990', '전기', '9');

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
    class_id char(3) not null,
    language varchar(10) not null,
    collector text not null,
    sign varchar(20) not null unique,
    status char(5) not null,
    image longblob,
    constraint fk_classid foreign key(class_id) references sub_class(s_id)
);


INSERT INTO book_info
VALUES ('EM207872', '단행본', '팩트풀니스 : 우리가 세상을 오해하는 10가지 이유와 세상이 생각보다 괜찮은 이유', '한스 로슬링 ; 올라 로슬링 ; 안나 로슬링 뢴룬드 [공]지음 ; 이창신 옮김.', '김영사', 
'파주 : 김영사, 2019.', '473 p. : 삽도, 도표 ; 22 cm.', '9788934985068','180', '한국어', '인문사회자료실', ' 182.3 로58ㅍ ', '대출가능', load_file('c:\\fact.jpg'));
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



