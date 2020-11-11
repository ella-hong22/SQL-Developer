07.서브 쿼리

select ename, salary
    from employee
    where salary > (select salary
                    from employee
                    where ename = 'SCOTT');

다중행 서브 쿼리                
select ename, salary
    from employee
    where dno = (select dno
                    from employee
                    where ename = 'SCOTT');
 
 select eno, ename, salary, dno
 from employee
 where salary in (
 
select min(salary)
    from employee
    group by dno);
    
ANY 연산자 (서브 쿼리와 하나 이상만 일치하면 참으로 값으로 반환)

 select eno, ename, job, salary
 from employee
 where salary < any (select salary
                                from employee
                                where job = 'SALESMAN')
    and job != 'SALESMAN' ;
    
ALL 연산자
 select eno, ename, job, salary
 from employee
 where salary < all (select salary
                                from employee
                                where job = 'SALESMAN')
    and job != 'SALESMAN' ;