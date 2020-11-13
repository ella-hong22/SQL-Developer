create user test1 identified by 1234 default tablespace LECTURE;

grant unlimited tablespace to test1;


create role role1;
grant create session, create table, create view to role1;
grant role1 to test1;
select * from user_role_privs;

select* from role_sys_privs
    where role = 'ROLE1';
    
    
    drop user test1 ;

동의어
create user test2 identified by 1234 default tablespace LECTURE;

grant unlimited tablespace to test2;
grant select on employee to test2;

create public synonym mytable1 for scott.employee;
select *from mytable;

drop public synonym mytable1;

시퀀스 생성 ;
create sequence seq1
    increment by 10
    start with 10;

select*from seq1;
select seq2, 1,100,
    increment_by, cycle_flag
    from user_sequences;
    
create sequence dno_seq
    increment by 10
    start with 10;
insert into dept_second
    values(dno_seq.nextval, 'ACCOUNTING','NEW YORK');
