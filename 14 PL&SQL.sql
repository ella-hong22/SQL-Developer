14. PL/SQL 

메시지 출력하기;

set SERVEROUTPUT on
begin 
    DBMS_OUTPUT.PUT_LINE('Welcome to Oracle');
end;
/

/*변수 선언 및 값 할당;*/
set SERVEROUTPUT ON
declare
        v_eno number(4);
        v_ename employee.ename%type;
begin
        v_eno:= 7788;
        v_ename := 'SCOTT';
        dbms_output.put_line('사원번호 사원이름 ');
        dbms_output.put_line('--------------- ');
        dbms_output.put_line(v_eno || '      '|| v_ename );
end;
/


사원번호와 사원이름 출력하기; 
set SERVEROUTPUT ON
declare
        v_eno number(4);
        v_ename employee.ename%type;
begin
 
        dbms_output.put_line('사원번호 사원이름 ');
        dbms_output.put_line('--------------- ');
        
        select eno, ename into v_eno,  v_ename
            from employee
            
        where ename = 'SCOTT';
        dbms_output.put_line(v_eno || '      '|| v_ename );
end;
/

/*제어문*/



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
        
        dbms_output.put_line('사원번호   사원이름    연봉');
        dbms_output.put_line('----------------------- ');
    
        dbms_output.put_line(v_employee.eno || '       '|| 
                                   v_employee.ename   || '       '|| 
                                   annsal);
end;
/
/*IF ~ ELSIF END IF  연봉 계산하기*/

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
        
       
        dbms_output.put_line('사원번호   사원이름    부서명ㅇ');
        dbms_output.put_line('----------------------- ');
    
        dbms_output.put_line(v_eno || '       '|| 
                                   v_ename   || '       '|| 
                                   v_dname);
end;
/

/*LOOP 문*/
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

/*for 문*/
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

/*whlie 문*/
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

