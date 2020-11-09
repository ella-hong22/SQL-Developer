테이블 구조 
desc department;

데이터 조회 =  Select
select * from employee;
select eno, ename from employee;
select salary, salary + 300 from employee;
select ename, salary, salary *12 from employee;

select ename, salary, job, salary* 12, salary*12+nvl(commission,0) 
from employee;

select ename, salary, salary*12+ nvl(commission, 0) 연봉 
from employee; 
select ename, salary, salary*12+ nvl(commission, 0)  as 연 봉 
from employee; 

select ename, salary, salary*12+ nvl(commission, 0) as "연 봉" 
from employee;

중복된 데이터 한번씩 출력 
select eno, ename from employee;
select distinct dno from employee;

select distinct job rom employee;

DUAL 테이블
decs dual;
select * from dual;
select sysdate from dual;

select*from employee;
select ename, salary
from employee;

조건 검색
select ename, salary
from employee
where  salary > 1500;
select ename, job, salary
from employee
where job = 'SALESMAN';

select ename, salary from employee where dno = 10;

문자 데이터 조회 (대문자와 소문자가 다름으로 반드시 대문자로 찾기! )
select eno, ename, dno, salary
from employee where ename = 'SCOTT'; 

desc employee;
select *from employee
where hiredate <= '1981/01/01';

논리 연산자
select* from employee
where dno = 10 and job = 'MANAGER';
select* from employee
where dno = 10 or job = 'MANAGER';
select* from employee
where dno != 10  job = 'MANAGER';

-BETWEEN AND(포함해서) 
select* from employee
where salary between 1000 and 1500;

select *from employee
where commission in(300,500,1400);
와이들카드 (%) 사용 (F로 시작하는 모든것)
select*from employee
where ename like'F%';

select*from employee
where ename like '%A%';
select*from employee
where commission is null;
select*from employee
where job!='SALESMAN';

---연습
select * from employee
where 'HIREDATE' > '80/00/00';

오름차순을 정렬 ASC
select*from employee
order by salary asc;
select*from employee
order by hiredate;
이중 정렬 
select*from employee
order by salary, ename;
내림차순
select*from employee
order by salary desc;

select*from employee
order by salary desc, ename asc;