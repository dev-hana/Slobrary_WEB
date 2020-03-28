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

create table book_class(
	class_id varchar(15) primary key,
    class_name varchar(15)
);

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




