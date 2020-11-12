09 내용 추가 INSERT 문

데이터를 제외한 구조만 복사할때;
create table dept2
as 
select *from department where 0=1;

desc dept2;
select *from dept2;


내용을 추가할때;
insert into dept2
values ( 10, 'ACCOUNTING', 'NEW YORK');

insert into dept2 (dno, dname)
values ( 20, '총무부');

insert into dept2 (dno, loc)
values ( 30, 'seoul');

insert into dept2 (dname, loc) /*특정 컬럼을 정하고 싶을때, (컬럼명) 을 적어준다, 넣지 않은 값음 null이다. */ 
values ( '영업', 'busan');

insert into dept2
values ( 40, '마케팅', '대전');




NULL 값을 갖는 로우 삽입;

insert into dept2
values ( 60, '비서실', '전주',to_date('2020/11/12'));
--values ( 60, '비서실', '전주',to_date('11/12/2020 ', 'MM,DD,YYYY')); 위와 동일 
alter table dept2
add(
    birth date
);

select *from dept2;

create table dept3
as 
select *from department where 0=1;

insert into dept
select*from department;

drop table dept2;

데이터를 수정할때, (UPDATE, SET) 
create table dept2
as 
select*from department;

select *from dept2;


update dept2
    set dname = '전산부'
where dno = 10;

update dept2
    set dname = '전산부2',
    loc = '서울'
where dno = 10; /*where 조건이 없으면 모든 행이 바뀜*/

alter table dept2
add(tel varchar2(11) ); /*11개 글자까지만 생성가능하다*/

select *from dept2;

update dept2
set tel = '010-';

update dept2
    set dname = (select dname from department  where dno = 10),
         loc = (select loc from department where dno =10)
    where dno = 10;


테이블 내용을 삭제하는 DELETE 문 ;
delete from dept2
    where loc= '서울';
select*from dept2;

delete from dept2;


트랜잭션 관리 (commit, rollback
delete from dept2;
commit; /*여기까지 데이터 삭제를 인정한다는 의미*/ 

insert into dept2
values (20,'영업','인천', null);
savepoint a1;
insert into dept2
values (10,'영업','부산', null);
savepoint a2;
delete from dept2
where dno = 20;

rollback to a2; /*커밋 전까지 되돌린다. */ 
commit;
select*from dept2;


