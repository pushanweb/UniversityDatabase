drop table secs;
drop table offers;
drop table course;
drop table teaches;
drop table takes;
drop table section;
drop table has;
drop table student;
drop table admins;
drop table employs;
drop table department;
drop table faculty;
drop table instructor;


create table instructor(
    id int not null primary key,
    iName varchar(20),
    iPhone varchar(20),
    iEmail varchar(20),
    rank varchar(20)
);

create table faculty(
    facultyName varchar(20) not null primary key,
    phone varchar(20),
    dean int,
    establishDate date,
    foreign key(dean) references instructor(id)
);

create table department(
    deptName varchar(20) not null primary key,
    deptEmail varchar(20),
    deptPhone varchar(20),
    deptHead int,
    foreign key(deptHead) references instructor(id)
);

create table admins(
    facName varchar(20),
    dName varchar(20),
    foreign key(facName) references faculty(facultyName),
    foreign key(dName) references department(deptName)
);

create table employs(
    insId int primary key,
    dName varchar(20),
    foreign key(insId) references instructor(id),
    foreign key(dName) references department(deptName)
);

create table student(
    sid int not null primary key,
    sName varchar(20),
    sPhone varchar(20),
    sEmail varchar(20),
    sDOB date,
    sAddress varchar(50)
);

create table has(
    sid int primary key,
    dName varchar(20),
    foreign key(sid) references student(sid),
    foreign key(dName) references department(deptName)
);

create table course(
    cCode varchar(20) not null primary key,
    cName varchar(20),
    year int,
    semester int,
    cCredit int,
    cLevel varchar(20)
);

create table offers(
    cCode varchar(20) primary key,
    dName varchar(20),
    foreign key(cCode) references course(cCode),
    foreign key(dName) references department(deptName)
);

create table section(
    secId number(2) not null primary key,
    year number(1),
    semester number(1),
    secRoom varchar(50)
);

create table teaches(
    secId int,
    insId int,
    foreign key(secId) references section(secId),
    foreign key(insId) references instructor(id)
);

create table takes(
    sid int,
    secId int,
    grade varchar(5),
    foreign key(sid) references student(sid),
    foreign key(secId) references section(secId)
);

create table secs(
    secId int,
    cCode varchar(20),
    foreign key(secId) references section(secId),
    foreign key(cCode) references course(cCode)
);