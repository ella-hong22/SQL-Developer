우편번호 테이블 사용 ; 
CREATE TABLE "SCOTT"."ZIPCODE" 
   (	"우편번호" VARCHAR2(5 BYTE), 
	"시도" VARCHAR2(128 BYTE), 
	"시도영문" VARCHAR2(40 BYTE), 
	"시군구" VARCHAR2(128 BYTE), 
	"시군구영문" VARCHAR2(128 BYTE), 
	"읍면" VARCHAR2(128 BYTE), 
	"읍면영문" VARCHAR2(128 BYTE), 
	"도로명코드" VARCHAR2(14 BYTE), 
	"도로명" VARCHAR2(256 BYTE), 
	"도로명영문" VARCHAR2(128 BYTE), 
	"지하여부" NUMBER(3,0), 
	"건물번호본번" NUMBER(5,0), 
	"건물번호부번" NUMBER(4,0), 
	"건물관리번호" VARCHAR2(27 BYTE), 
	"다량배달처명" VARCHAR2(128 BYTE), 
	"시군구용건물명" VARCHAR2(128 BYTE), 
	"법정동코드" NUMBER(12,0), 
	"법정동명" VARCHAR2(128 BYTE), 
	"리명" VARCHAR2(128 BYTE), 
	"행정동명" VARCHAR2(128 BYTE), 
	"산여부" NUMBER(3,0), 
	"지번본번" NUMBER(6,0), 
	"읍면동일련번호" NUMBER(3,0), 
	"지번부번" NUMBER(4,0), 
	"구우편번호" VARCHAR2(128 BYTE), 
	"우편번호일련번호" VARCHAR2(128 BYTE)
   );




select count(*) from zipcode;

desc zipcode;
select* from zipcode
where rownum < 50;

[문제 1] 서울시의 모든 구의 이름을 구하시오
select distinct 시군구 from zipcode
where 시도 = '서울특별시';

[문제 2] 서울시안의 모든 중학교를 구하시오. /서울시안의 모든 성당을 구하시오. /서울시안의 모든 국민은행을 구하시오.
select distinct  시군구용건물명, 시군구 as "중학교 이름" 
from zipcode
    where 시군구용건물명 like '%중학교%'
    and 시도 = '서울특별시';
    
select 시군구, count(시군구용건물명)  as "중학교 수"
from zipcode
where 시군구용건물명 like '%중학교%'
    and 시도 = '서울특별시'
group by 시군구;

select 시군구, 시군구용건물명 as "성당이름" 
from zipcode
    where 시군구용건물명 like '%성당%'
    and 시도 = '서울특별시'
    and 시군구용건물명 not like '%빌딩%';
    
-%천주교회%;

select 시군구, 시군구용건물명 as "천주교회" 
    from zipcode
    where 시군구용건물명 like '%천주교회%'
    and 시도 = '서울특별시';
    
 select distinct  시군구용건물명, 시군구 as "국민은행" 
from zipcode
    where 시군구용건물명 like '%국민은행%'
    and 시도 = '서울특별시';

[문제 3] 서울시의 모든 구와 구별 법정 동을 다 구하시오.
select* from zipcode
where rownum < 50;

select  시군구, 법정동명  from zipcode
where 시도 = '서울특별시'
group by 시군구, 법정동명;

[문제 4] 서울시의 모든 구별 법정동안의 중학교 개수를 구하시오.
select  시군구, 법정동명, count(*)  as "중학교 수"  from zipcode
where 시도 = '서울특별시'
    and 시군구용건물명 like '%중학교%'
group by 시군구, 법정동명
order by 시군구, 법정동명 ;

[문제 5] 서울과 경기에서 같은 동이름을 다 찾으시오.;
create table 서울2 
as
select distinct 법정동명 from zipcode
where 시도 = '서울특별시';

select *from 서울1;

create table 경기1
as
select distinct 법정동명 from zipcode
where 시도 = '경기도';

select *from 경기;

INTERSECT  (교집합);
select 법정동명 from zipcode
    where 시도 = '서울특별시'
    and 법정동명 is not null
intersect 
    select 법정동명 from zipcode
    where 시도 = '경기도';
    
    
select *from 서울2
where 행정동명 is not null
intersect
select *from 경기1;


SELECT DISTINCT 시도, 시군구, 법정동명 FROM zipcode
    WHERE 시도 = '서울특별시'
    AND 법정동명 IN (SELECT 법정동명 FROM zipcode
                    WHERE 시도 = '경기도')
UNION
SELECT DISTINCT 시도, 시군구, 법정동명 FROM zipcode
    WHERE 시도 = '경기도'
    AND  법정동명 IN ( SELECT 법정동명 FROM zipcode
                                WHERE 시도 = '서울특별시');


teacher say;(서울시 안에서도 같은 동명을 찾고, 경기도 안에서 같은 동명 비교해서 총비교하기 ) 
select 시도, 시군구, 법정동명
    from zipcode
    where (시도 = '서울특별시' or 시도 = '경기도')
    and 법정동명 in (
                select 법정동명
                   from (
    
                            SELECT 시군구, 법정동명 FROM zipcode
                              WHERE 시도 = '서울특별시' or 시도 = '경기도'
                          and 법정동명 is not null
                            group by 시군구, 법정동명
                    )
              group by 법정동명
              having count(*) >1
) 
group by 시도, 시군구, 법정동명
order by 법정동명;
