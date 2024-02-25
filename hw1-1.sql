drop database hw1;
create database hw1;
use hw1;
create table students (
	sid varchar(10),
    Name varchar(10),
    birthday varchar(10),
    GPA varchar(10),
    tel varchar(10),
	primary key (sid)
);
create table Courses(
	c_no varchar(10),
    title varchar(10),
    credits varchar(10),
    primary key (c_no)
);

create table Instructors(
	eid varchar(10),
    department varchar(10),
    rand varchar(10),
    SSN varchar(10),
    primary key (eid)
);
create table Classes(
	sid varchar(10),
    c_no varchar(10),
	eid varchar(10),
    room varchar(10),
    time varchar(10),
    foreign key (sid) references students(sid),
    primary key (sid),
    foreign key (c_no) references Courses(c_no),
    foreign key (eid) references Instructors(eid)
);

