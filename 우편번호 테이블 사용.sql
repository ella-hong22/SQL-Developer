�����ȣ ���̺� ��� ; 
CREATE TABLE "SCOTT"."ZIPCODE" 
   (	"�����ȣ" VARCHAR2(5 BYTE), 
	"�õ�" VARCHAR2(128 BYTE), 
	"�õ�����" VARCHAR2(40 BYTE), 
	"�ñ���" VARCHAR2(128 BYTE), 
	"�ñ�������" VARCHAR2(128 BYTE), 
	"����" VARCHAR2(128 BYTE), 
	"���鿵��" VARCHAR2(128 BYTE), 
	"���θ��ڵ�" VARCHAR2(14 BYTE), 
	"���θ�" VARCHAR2(256 BYTE), 
	"���θ���" VARCHAR2(128 BYTE), 
	"���Ͽ���" NUMBER(3,0), 
	"�ǹ���ȣ����" NUMBER(5,0), 
	"�ǹ���ȣ�ι�" NUMBER(4,0), 
	"�ǹ�������ȣ" VARCHAR2(27 BYTE), 
	"�ٷ����ó��" VARCHAR2(128 BYTE), 
	"�ñ�����ǹ���" VARCHAR2(128 BYTE), 
	"�������ڵ�" NUMBER(12,0), 
	"��������" VARCHAR2(128 BYTE), 
	"����" VARCHAR2(128 BYTE), 
	"��������" VARCHAR2(128 BYTE), 
	"�꿩��" NUMBER(3,0), 
	"��������" NUMBER(6,0), 
	"���鵿�Ϸù�ȣ" NUMBER(3,0), 
	"�����ι�" NUMBER(4,0), 
	"�������ȣ" VARCHAR2(128 BYTE), 
	"�����ȣ�Ϸù�ȣ" VARCHAR2(128 BYTE)
   );




select count(*) from zipcode;

desc zipcode;
select* from zipcode
where rownum < 50;

[���� 1] ������� ��� ���� �̸��� ���Ͻÿ�
select distinct �ñ��� from zipcode
where �õ� = '����Ư����';

[���� 2] ����þ��� ��� ���б��� ���Ͻÿ�. /����þ��� ��� ������ ���Ͻÿ�. /����þ��� ��� ���������� ���Ͻÿ�.
select distinct  �ñ�����ǹ���, �ñ��� as "���б� �̸�" 
from zipcode
    where �ñ�����ǹ��� like '%���б�%'
    and �õ� = '����Ư����';
    
select �ñ���, count(�ñ�����ǹ���)  as "���б� ��"
from zipcode
where �ñ�����ǹ��� like '%���б�%'
    and �õ� = '����Ư����'
group by �ñ���;

select �ñ���, �ñ�����ǹ��� as "�����̸�" 
from zipcode
    where �ñ�����ǹ��� like '%����%'
    and �õ� = '����Ư����'
    and �ñ�����ǹ��� not like '%����%';
    
-%õ�ֱ�ȸ%;

select �ñ���, �ñ�����ǹ��� as "õ�ֱ�ȸ" 
    from zipcode
    where �ñ�����ǹ��� like '%õ�ֱ�ȸ%'
    and �õ� = '����Ư����';
    
 select distinct  �ñ�����ǹ���, �ñ��� as "��������" 
from zipcode
    where �ñ�����ǹ��� like '%��������%'
    and �õ� = '����Ư����';

[���� 3] ������� ��� ���� ���� ���� ���� �� ���Ͻÿ�.
select* from zipcode
where rownum < 50;

select  �ñ���, ��������  from zipcode
where �õ� = '����Ư����'
group by �ñ���, ��������;

[���� 4] ������� ��� ���� ���������� ���б� ������ ���Ͻÿ�.
select  �ñ���, ��������, count(*)  as "���б� ��"  from zipcode
where �õ� = '����Ư����'
    and �ñ�����ǹ��� like '%���б�%'
group by �ñ���, ��������
order by �ñ���, �������� ;

[���� 5] ����� ��⿡�� ���� ���̸��� �� ã���ÿ�.;
create table ����2 
as
select distinct �������� from zipcode
where �õ� = '����Ư����';

select *from ����1;

create table ���1
as
select distinct �������� from zipcode
where �õ� = '��⵵';

select *from ���;

INTERSECT  (������);
select �������� from zipcode
    where �õ� = '����Ư����'
    and �������� is not null
intersect 
    select �������� from zipcode
    where �õ� = '��⵵';
    
    
select *from ����2
where �������� is not null
intersect
select *from ���1;


SELECT DISTINCT �õ�, �ñ���, �������� FROM zipcode
    WHERE �õ� = '����Ư����'
    AND �������� IN (SELECT �������� FROM zipcode
                    WHERE �õ� = '��⵵')
UNION
SELECT DISTINCT �õ�, �ñ���, �������� FROM zipcode
    WHERE �õ� = '��⵵'
    AND  �������� IN ( SELECT �������� FROM zipcode
                                WHERE �õ� = '����Ư����');


teacher say;(����� �ȿ����� ���� ������ ã��, ��⵵ �ȿ��� ���� ���� ���ؼ� �Ѻ��ϱ� ) 
select �õ�, �ñ���, ��������
    from zipcode
    where (�õ� = '����Ư����' or �õ� = '��⵵')
    and �������� in (
                select ��������
                   from (
    
                            SELECT �ñ���, �������� FROM zipcode
                              WHERE �õ� = '����Ư����' or �õ� = '��⵵'
                          and �������� is not null
                            group by �ñ���, ��������
                    )
              group by ��������
              having count(*) >1
) 
group by �õ�, �ñ���, ��������
order by ��������;
