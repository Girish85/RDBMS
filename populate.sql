create table EMP (EMPNO numeric primary key,ENAME varchar(20),JOB char(20),
MGR numeric,HIREDATE date,SAL numeric,COMM numeric,
DEPTNO numeric references DEPT(DEPTNO));
drop table EMP;
create table DEPT (DEPTNO numeric primary key,DNAME varchar(20),
LOC varchar(20));
insert into DEPT values(10,"Accounting","NewYork");
insert into DEPT values(20,"Research","Dallas");
insert into DEPT values(30,"Sales","Chicago");
insert into DEPT values(40,"Operations","Boston");
select * from DEPT;
select * from EMP;


delete from EMP where EMPNO=7369;
insert into EMP values(7369,"Smith","Clerk",7902,'1980-12-17',800,null,20);
commit;
