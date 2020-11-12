08 테이블 생성, 수정, 제거
/*DDL : data definition language)는 테이블 */

create table dept (
    dno  number(2),
    dname varchar2(14),
    loc varchar2(13) 
);

desc dept;

desc department;
create table dept2
as 
select * from department;

일부분만 가져올때, 
create table dept3 (dno, dname)
as 
select dno, dname from department;

desc dept3;
select*from dept3;

일부분만 가져올때, 
create table dept5 (dno, dname2)
as 
select dno, loc from department;

desc dept5;
select*from dept5;

08-2 테이블 구조 변경
ALTER TABLE; 

desc dept2;
select*from dept2;

alter table dept2
add(
    TelNumber varchar2(10),
    Address varchar2(30)
);
--null에 기준값들을 넣어주어 한다. 

컬럼 변경 (숫자를 글자로 못바꾼다, 데이터가 비어있으면 문제가 되지 않는다.) ;
alter table dept2
MODIFY(
    dno varchar2(10)
);

컬럼 제거;
alter table dept2
DROP COLUMN TelNumber;

없는 것처럼 처리하기
alter table dept2
set unused (address); /* 실제로 지우진 않고, 안쓰다고 처리되어 데이터 상으로 안보임*/ 

alter table dept2
drop unused columns;

 테이블명을 변경 RENAME 문;
 
 rename dept5 to emp5;
 drop table dept3;
 
 select*from dept2;
 테이블의 모든 데이터를 제거하는 문;
 truncate table dept2;

데이터 사전;
select table_name from user_tables;

desc user_tables;

select owner, table_name from dba_tables
where owner = 'SCOTT';