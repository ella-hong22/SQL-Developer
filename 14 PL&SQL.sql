14. PL/SQL 

�޽��� ����ϱ�;

set SERVEROUTPUT on
begin 
    DBMS_OUTPUT.PUT_LINE('Welcome to Oracle');
end;
/

/*���� ���� �� �� �Ҵ�;*/
set SERVEROUTPUT ON
declare
        v_eno number(4);
        v_ename employee.ename%type;
begin
        v_eno:= 7788;
        v_ename := 'SCOTT';
        dbms_output.put_line('�����ȣ ����̸� ');
        dbms_output.put_line('--------------- ');
        dbms_output.put_line(v_eno || '      '|| v_ename );
end;
/


�����ȣ�� ����̸� ����ϱ�; 
set SERVEROUTPUT ON
declare
        v_eno number(4);
        v_ename employee.ename%type;
begin
 
        dbms_output.put_line('�����ȣ ����̸� ');
        dbms_output.put_line('--------------- ');
        
        select eno, ename into v_eno,  v_ename
            from employee
            
        where ename = 'SCOTT';
        dbms_output.put_line(v_eno || '      '|| v_ename );
end;
/

/*���*/



set SERVEROUTPUT ON
declare
        v_employee employee%rowtype;
        temp number(4) := 1;
        annsal number(7, 2);
begin
        select * into v_employee
        from employee
        where ename = 'SCOTT' ;
        
        if(v_employee.commission is null) then
                v_employee.commission := 0;
        end if; 
        
        annsal := v_employee.salary*12 + v_employee.commission;
        
        dbms_output.put_line('�����ȣ   ����̸�    ����');
        dbms_output.put_line('----------------------- ');
    
        dbms_output.put_line(v_employee.eno || '       '|| 
                                   v_employee.ename   || '       '|| 
                                   annsal);
end;
/
/*IF ~ ELSIF END IF  ���� ����ϱ�*/

set SERVEROUTPUT ON
declare
        v_eno employee.eno%type;
        v_ename employee.ename%type;
        v_dno employee.dno%type;
        v_dname varchar2(20) := null;
begin
        select eno, ename, dno
        into v_eno,v_ename, v_dno
        from employee
        where ename = 'SCOTT' ;
        
        if(v_dno = 10) then
               v_dname := 'ACCOUNTING';
        elsif(v_dno = 20) then
              v_dname := 'RESEARCH';
        elsif(v_dno = 30) then
              v_dname := 'SALES';
        elsif(v_dno = 40) then
             v_dname := 'OPERATIONS';
        end if; 
        
       
        dbms_output.put_line('�����ȣ   ����̸�    �μ���');
        dbms_output.put_line('----------------------- ');
    
        dbms_output.put_line(v_eno || '       '|| 
                                   v_ename   || '       '|| 
                                   v_dname);
end;
/

/*LOOP ��*/
set SERVEROUTPUT ON
declare
        dan number := 2;
        i number := 1;
begin
        loop
            DBMS_OUTPUT.PUT_LINE (dan || ' * ' || i || ' = ' || (dan * i)  ); 
                i := i + 1;
                IF i > 9 THEN
                  EXIT;
                END IF;
              END LOOP;
              
end;
/

/*for ��*/
set SERVEROUTPUT ON
declare
        dan number := 2;
        i number := 1;
begin
        for i in 1..9 loop
            DBMS_OUTPUT.PUT_LINE (dan || ' * ' || i || ' = ' || (dan * i)  );
         END LOOP;
              
end;
/

/*whlie ��*/
set SERVEROUTPUT ON
declare
        dan number := 2;
        i number := 1;
begin
        while i <=9 loop
            DBMS_OUTPUT.PUT_LINE (dan || ' * ' || i || ' = ' || (dan * i)  );
            i := i+1;
         END LOOP;
              
end;
/

