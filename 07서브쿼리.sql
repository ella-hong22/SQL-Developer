07.���� ����

select ename, salary
    from employee
    where salary > (select salary
                    from employee
                    where ename = 'SCOTT');

������ ���� ����                
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
    
ANY ������ (���� ������ �ϳ� �̻� ��ġ�ϸ� ������ ������ ��ȯ)

 select eno, ename, job, salary
 from employee
 where salary < any (select salary
                                from employee
                                where job = 'SALESMAN')
    and job != 'SALESMAN' ;
    
ALL ������
 select eno, ename, job, salary
 from employee
 where salary < all (select salary
                                from employee
                                where job = 'SALESMAN')
    and job != 'SALESMAN' ;