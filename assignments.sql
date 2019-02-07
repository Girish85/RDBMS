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

/*Assignments*/
select ENAME from emp where JOB in ('Salesman','Analyst');
select * from emp where HIREDATE < 19810930;
select * from emp where JOB not in ('Manager');
select ENAME from emp where EMPNO=7369 or EMPNO=7521 or EMPNO=7839;
select * from emp where DEPTNO not in (30,40,10);
select ENAME from emp where HIREDATE< 19811231 and HIREDATE>19810630;
select distinct JOB from emp;
select ENAME from emp where JOB not in ('Salesman');
select ENAME, JOB from emp where JOB=('President');
select * from emp where DEPTNO = null;
select * from emp where JOB in ('Salesman');
select * from emp where ENAME like 's%' or ENAME like '%s' ;
select ENAME from emp where ENAME like '_i%';
select count(*) from emp;
select count(distinct JOB) from emp;
select sum(SAL) from emp;
select max(SAL) as max,min(SAL) as min,avg(SAL) as avg from emp;
select max(SAL) from emp where JOB in ('Salesman');

select max(sal) from emp where DEPTNO in (20);
select ENAME, SAL, 0.1*SAL as 'PF Amt' from emp;
select * from emp order by SAL asc;
select ENAME,HIREDATE from emp order by HIREDATE desc;
select ENAME as 'Name', SAL as 'Salary', 0.1*SAL as 'PF', 0.3*SAL as 'DA',
0.5*SAL as 'HRA', SAL+ifnull(COMM,0) as 'Gross' from emp order by Gross;
select DEPTNO as 'Departments', count(*) as 'Total_Employees' from emp group by DEPTNO;
select DEPTNO as 'Departments', sum(SAL) as 'Total_Salary' from emp group by DEPTNO;
select JOB, count(*) as 'Employees' from emp group by JOB order by Employees desc;
select JOB as 'Job', max(SAL) as 'Max',min(SAL) as 'Min',avg(SAL) as 'Avg' from emp group by JOB;
select max(SAL) as 'Max',min(SAL) as 'Min',avg(SAL) as 'Avg' from emp where DEPTNO in (20); 
select JOB, avg(SAL) as 'Avg' from emp where DEPTNO in (20) group by JOB having avg(SAL)>1000;
select * from emp where DEPTNO in (20) group by JOB having avg(sal)>1000 order by JOB;

create table trainer(
		TID			INT UNSIGNED,
        TNAME		VARCHAR(30)			NOT NULL DEFAULT '',
        EMAILID		VARCHAR(15),
        PHONE		VARCHAR(15),
        primary key (TID)
);

create table coursedetails(
		CID			VARCHAR(10),
        CNAME		VARCHAR(50)
);

create table batchschedule(
		BATCHNAME	VARCHAR(10),
        CID			VARCHAR(50) references coursedetails(CID),
        SDATE		DATE,
        EDATE		DATE
);

create table feedback(
		TID			INT UNSIGNED references trainer(TID),
        CID			VARCHAR(50) references coursedetails(CID),
        BATCHNAME	VARCHAR(10) references batchschedule(BATCHNAME),
        FBRATE		FLOAT
);
show tables;
insert into trainer values
		(1,'Abraham','t1@i.com','9844499999');
		insert into trainer values(2,'Boyce','t2@i.com','9844499989');
        insert into trainer values(3,'Camilla','t3@i.com','9844499997');
        insert into trainer values(4,'Davis','t4@i.com','9844499996');
        insert into trainer values(5,'Elsa','t5@i.com','9844499499');
        insert into trainer values(6,'Ferguson','t6@i.com','9844459999');
        insert into trainer values(7,'Abraham','t7@i.com','9844996999');
        insert into trainer values(8,'Gordon','t8@i.com','9849955999');
        insert into trainer values(9,'Hilton','t9@i.com','9899677999');
        insert into trainer values(10,'Boyce','t10@i.com','9877788999');
        insert into trainer values(11,'Zenith','t11@i.com','9869977799');
        insert into trainer values(12,'Abraham','t12@i.com','null');

describe coursedetails;
insert into coursedetails values
		('GPF','Programming Fundamentals');
        insert into coursedetails values('GDB','RDBMS');
        insert into coursedetails values('ODB','Oracle 8i');
        insert into coursedetails values('OVB','Visual Basic');
        insert into coursedetails values('JJA','JAVA');
        insert into coursedetails values('JAJ','Advanced Java');
        insert into coursedetails values('DNT','Introduction to .NET');
        insert into coursedetails values('DCS','Programming in C#');
        insert into coursedetails values('DDB','SQL Server 2000');
        insert into coursedetails values('MDB','DB2');
        insert into coursedetails values('MCS','CICS');
select * from coursedetails;
describe batchschedule;
			insert into batchschedule values('Batch1','GPF','07-01-10','07-01-20');
            insert into batchschedule values('Batch1','GDB','07-01-21','07-01-31');
			insert into batchschedule values('Batch1','ODB','07-02-01','07-02-20');
            insert into batchschedule values('Batch1','OVB','07-02-21','07-02-28');
            insert into batchschedule values('Batch2','GPF','07-01-10','07-01-20');
            insert into batchschedule values('Batch2','GDB','07-01-21','07-01-31');
            insert into batchschedule values('Batch3','GDB','07-01-25','07-02-02');
            insert into batchschedule values('Batch3','JJA','07-02-03','07-02-20');
            insert into batchschedule values('Batch4','GPF','07-02-01','07-02-10');
            insert into batchschedule values('Batch4','GDB','07-02-12','07-02-22');
select * from batchschedule;
describe feedback;
			insert into feedback values('12','GPF','Batch1','4.18');
            insert into feedback values('11','GDB','Batch1','4.65');
            insert into feedback values('2','GPF','Batch2','4.28');
            insert into feedback values('12','GDB','Batch1','4.68');
            insert into feedback values('12','GPF','Batch2','4.28');
            insert into feedback values('1','GPF','Batch2','4.08');
            insert into feedback values('12','ODB','Batch4','4.12');
            insert into feedback values('1','MCS','Batch3','4.67');
            insert into feedback values('2','JAJ','Batch4','4.61');
			insert into feedback values('1','GPF','Batch3','4.28');
            insert into feedback values('12','DNT','Batch2','4.52');
select * from feedback;

select trainer.TNAME,coursedetails.CNAME
	from trainer,coursedetails,feedback where feedback.TID=trainer.TID ;

select trainer.TID as 'TrainerID',trainer.TNAME as 'Trainer',count(*) as 'CourseCount' from trainer,coursedetails,feedback
where feedback.TID=trainer.TID and feedback.CID=coursedetails.CID group by TrainerID having CourseCount>1;

select trainer.TID as 'TrainerID',trainer.TNAME as 'Trainer',count(*) as 'CourseCount' 
from trainer,coursedetails,feedback where feedback.TID=trainer.TID and feedback.CID=coursedetails.CID group by TrainerID;

select trainer.TID,trainer.TNAME,coursedetails.CNAME as NameOfCourse,count(*) as numberOf from trainer,coursedetails,feedback where feedback.TID=trainer.TID and feedback.CID=coursedetails.CID group by NameOfCourse;

select feedback.TID as 'TrainerName', coursedetails.CNAME as 'CourseName' 
from trainer, coursedetails, batchschedule, feedback where batchschedule.EDATE=20070220 and  batchschedule.BATCHNAME=feedback.BATCHNAME and batchschedule.CID=coursedetails.CID;

select TID,BATCHNAME from feedback f1 where exists (select TID,BATCHNAME from feedback f2 
where f1.BATCHNAME=f2.BATCHNAME and f1.TID = f2.TID and f1.CID <> f2.CID);

select TID,count(distinct feedback.CID) from feedback,coursedetails group by TID having count(distinct feedback.CID)=count(coursedetails.CID);

