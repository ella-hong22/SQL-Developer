Chapter 05 그룹함수 사용하기;

01.모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 
칼럼의 별칭은 결과 화면과 동일하게 지정 하고 평균에 대해서는 정수로 반올림하시오.
[Maximum]	[Minimum]	[Sum]		[Average]

select*from employee;
select*from department;

select dno, max(salary) as "Maximun" , min(salary) as "Minimum", sum(salary) as "Sum", round(avg(salary)) as "Average"
from employee
group by dno
order by dno;
    
02.각 담당
 업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하고 평균에 대해서는 정수로 반올림하시오.
[Job]	[Maximum]	[Minimum]	[Sum]		[Average]

select job, max(salary) as "Maximun" , min(salary) as "Minimum", sum(salary) as "Sum", round(avg(salary)) as "Average"
from employee
group by job
order by job;

03.count(*) 함수를 이용하여 담당 업무가 동일한 사원 수를 출력하시오.
select  job, count(*) 
from employee
group by job
order by job;

04.관리자수를 구하시오.
select job, count(*)
from employee
group by job
having job= 'MANAGER';

select count(distinct manager)
from employee;

05.급여 최고액, 급여 최저액의 차액을 출력하시오. 칼럼의 별칭은 결과 화연과 동일하게 지정하시오.
[DIFFERENCE]
select max(salary) -  min(salary) as DIFFERENCE
from employee; 

06.직급별 사원의 최저 급여를 출력하시오. 관리자를 알 수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select job, min(salary)
from employee
where manager is not null
group by job
having min(salary) >= 2000
order by min(salary) desc;


07.각 부서에 대해 부서 이름, 사원수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하고 평균 급여는 소수점 둘째 자리로 반올림하시오.
[DNO]		[Number of People]		[Salary]

select decode(dno, 10, '회계',
                            20, '리서치',
                            30 , '세일즈',
                            40, '오퍼레이드',
                            '기타') as "부서 이름",
        count(*) as "Number of People" , round( avg(salary),2)  as  "Salary"
from employee
group by "부서 이름";


08.각 부서에 대해 부서 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하고 평균 급여는 정수로 반올림하시오.
[dname]	[Location]	[Number of People]		[Salary]

select decode(dno, 10, '회계',
                            20, '리서치',
                            30 , '세일즈',
                            40, '오퍼레이드',
                            '기타') as "부서 이름",
       decode(dno,10, '회계',
                            20, '리서치',
                            30 , '세일즈',
                            40, '오퍼레이드')
group by "부서 이름";

