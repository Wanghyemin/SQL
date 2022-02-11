/*2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.*/

 SELECT * FROM TAB;
 
 SELECT * FROM EMP;
 
SELECT EMPNO, ENAME, JOB, SAL FROM EMP
WHERE SAL >=3000;

/*3. EMP ���̺��� �����ȣ�� 7782�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.*/

 SELECT  EMPNO, ENAME, DEPTNO FROM EMP
 WHERE EMPNO = '7782'; 

/*4. EMP ���̺��� �Ի����� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.*/

SELECT ENAME,JOB, HIREDATE FROM EMP
WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY HIREDATE;
 
/*5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.*/

 SELECT * FROM EMP
 WHERE DEPTNO IN (10, 20)
 ORDER BY ENAME;

/*6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.*/

SELECT ENAME "Employee", SAL "Monthly Salary" FROM EMP
WHERE SAL>= 1500 AND DEPTNO IN (10, 30); 

/*7. EMP ���̺��� 1982�⿡ �Ի��� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.*/

SELECT * FROM EMP
WHERE TO_CHAR(HIREDATE,'YYYY') = '1982';

SELECT * FROM EMP
WHERE HIREDATE LIKE '1982%';

/*8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.*/

 SELECT * FROM EMP WHERE COMM IS NOT NULL;

/*9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.*/

 SELECT ENAME, SAL, COMM FROM EMP
 WHERE (SAL*1.1) <= COMM;

/*10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.*/

 SELECT * FROM EMP
 WHERE JOB IN ('CLERK','ANALYST') AND SAL NOT IN ('1000','3000','5000');

/*11. EMP ���̺��� �̸��� L�� �� �ڰ� �ְ�  �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.*/
SELECT * FROM EMP
WHERE REGEXP_COUNT(ENAME,'L') = 2 AND DEPTNO = 30 OR EMPNO = 7782;

SELECT * FROM EMP
WHERE ENAME LIKE '%L%L%' AND DEPTNO = 30 OR EMPNO = 7782;


-- 1/25 ------------------------------------------------------------------------------------------------------------------------------------

--1. ���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') "CURRENT DATE" FROM DUAL;

--2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT * FROM EMP;
 SELECT EMPNO,ENAME,JOB,SAL,SAL*1.15 "NEW SALARY",SAL*0.15 "INCREASE" FROM EMP;

--3. EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT * FROM EMP;
 SELECT ENAME,TO_CHAR(HIREDATE,'YYYY-MM-DD') "HIREDATE", TO_CHAR( NEXT_DAY (ADD_MONTHS(HIREDATE,6),'������'),'YYYY-MM-DD') "6MONTHS MON" FROM EMP;
 
 SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'������') FROM EMP;

--4. EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;
SELECT ENAME, HIREDATE,CEIL(MONTHS_BETWEEN(SYSDATE,HIREDATE)) "MONTHS",SAL, SAL*(FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))) "TOTAL" FROM EMP;
 

--5. EMP ���̺��� ������ ����� ��µǵ��� �ۼ��Ͻÿ�.

--Dream Salary

------------------------------------------------------------

--KING earns $5,000.00 monthly but wants $15,000.00

--BLAKE earns $2,850.00 monthly but wants $8,550.00

--CLARK earns $2,450.00 monthly but wants $7,350.00

--. . . . . . . . . .

--14 rows selected
 
SELECT * FROM EMP;
SELECT ENAME || ' earns' || TO_CHAR( SAL,'$99,999.99') || ' monthly but wants '|| TO_CHAR( SAL*3,'$99,999.99') "Dream Salary" FROM EMP;
SELECT CONCAT(ENAME, SAL,ENAME) FROM EMP;

--6. EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ ����� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;
SELECT ENAME, LPAD(SAL , 15, '*') FROM EMP;
 
--7. EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;
SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') "DAY" FROM EMP;

--8. EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT * FROM EMP;
 SELECT ENAME,LENGTH(ENAME) "LENGTH" ,JOB FROM EMP
 WHERE LENGTH(ENAME) >=6; 

--9. EMP ���̺��� ��� ����� ������ �̸�,����,�޿�,���ʽ�,�޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT * FROM EMP;
 SELECT ENAME,JOB,SAL,COMM,SAL+NVL(COMM,0) "PAY" FROM EMP;


-------------------------------22�� 01�� 26�� ----------------------------------------------------------------------------------------------

/*
SELECT 
case SEX 
when '1' then '����'
when '0' then '����'
end gender,
COUNT(*) �ο��� FROM CUSTOM
GROUP BY SEX;

WHEN '1' THEN '����' ELSE '����'

SELECT 
CASE �÷���                         
	WHEN 1 THEN 100                          
	WHEN 2 THEN 200                         
	WHEN 3 THEN 300                         
	WHEN 4 THEN 400                          
	ELSE 500                        
END AS RESULT             
FROM DUAL;
*/



--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;
 SELECT COUNT(*), MAX(SAL), MIN(SAL), SUM(SAL)  FROM EMP;
 
--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;
 SELECT JOB, MAX(SAL), MIN(SAL), SUM(SAL) FROM EMP
 GROUP BY JOB;
 
--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;
 SELECT JOB, COUNT(*) FROM EMP
 GROUP BY JOB;

--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT MAX(SAL)-MIN(SAL) "SAL GAP" FROM EMP;
 

--5. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(group by)

SELECT * FROM EMP;
SELECT TO_CHAR(HIREDATE,'YY')"H_YEAR", COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YY');
 

--6. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum)
/*
    TOTAL      1980      1981      1982      1983

--------- --------- --------- --------- ---------

       12         1        10         1         0
*/ 

SELECT * FROM EMP;

SELECT COUNT(*) "TOTAL",
SUM(CASE EXTRACT(YEAR FROM HIREDATE) WHEN '1980' THEN '1' ELSE '0' END) "1980" ,
SUM(CASE EXTRACT(YEAR FROM HIREDATE) WHEN '1981' THEN '1' ELSE '0' END) "1981",
SUM(CASE EXTRACT(YEAR FROM HIREDATE) WHEN '1982' THEN '1' ELSE '0' END) "1982",
SUM(CASE EXTRACT(YEAR FROM HIREDATE) WHEN '1983' THEN '1' ELSE '0' END) "1983"
FROM EMP;

--7. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
/*
JOB         Deptno 10    Deptno 20     Deptno 30     Total

---------   ---------    ---------     ---------     ---------

CLERK            1300         1900           950          4150

SALESMAN                                    5600          5600

PRESIDENT	     5000                                     5000

MANAGER	         2450         2975          2850          8275

ANALYST	                      6000                        6000
*/


SELECT JOB,
SUM(CASE WHEN DEPTNO = 10 THEN SAL ELSE 0 END) "Deptno 10" ,
SUM(CASE WHEN DEPTNO = 20 THEN SAL ELSE 0 END) "Deptno 20" ,
SUM(CASE WHEN DEPTNO = 30 THEN SAL ELSE 0 END) "Deptno 30" ,
SUM(SAL) "TOTAL"
FROM EMP
GROUP BY JOB;








-----------------------------22/01/27-----------------------------

--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;
 SELECT * FROM DEPT;
 SELECT * FROM USER_CONSTRAINTS;
 
 SELECT ENAME, A.DEPTNO, DNAME
 FROM EMP A, DEPT B
 WHERE A.DEPTNO = B.DEPTNO;


--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;
 SELECT * FROM DEPT;
 
 SELECT ENAME,JOB,SAL,DNAME, LOC 
 FROM EMP A INNER JOIN DEPT B
 ON A.DEPTNO = B.DEPTNO
 WHERE B.LOC = 'NEW YORK';

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;
 SELECT * FROM DEPT;
 
 SELECT ENAME,A.DEPTNO, LOC
 FROM EMP A, DEPT B
 WHERE A.DEPTNO = B.DEPTNO AND COMM > 0 ;

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;
 SELECT * FROM DEPT;
 
 SELECT ENAME, JOB, DNAME, LOC 
 FROM EMP A, DEPT B
 WHERE A.ENAME LIKE '%L%';
 

--5. �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)
/*
Employee        Emp# Manager         Mgr#

---------- --------- ---------- ---------

KING            7839

BLAKE           7698 KING            7839

CLARK           7782 KING            7839

. . . . . . . . . .

14 rows selected.
*/
 SELECT * FROM EMP;
 SELECT * FROM DEPT;
 
SELECT A.ENAME "Employee", A.EMPNO "Emp#",B.ENAME "Manager", B.EMPNO "Mgr#"
FROM EMP A, EMP B 
WHERE A.MGR = B.EMPNO(+) 
ORDER BY B.ENAME DESC;


--6. EMP ���̺��� �׵��� ������ ���� ���� �Ի��� ����� ���Ͽ� �̸�,�Ի���,������ �̸�, ������ �Ի����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT A.ENAME, A.HIREDATE, B.ENAME, B.HIREDATE
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO AND A.HIREDATE < B.HIREDATE;
 
 

--7. EMP ���̺��� ����� �޿��� ����� �޿� �縸ŭ ��*���� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� ��*���� 100�� �ǹ��Ѵ�.

/*
Employee and their salary

-----------------------------------------------------------------

KING      **************************************************

BLAKE     ****************************

CLARK     ************************

JONES     *****************************

MARTIN    ************

ALLEN     ****************

TURNER    ***************

. . . . . . . . . .

14 rows selected.
*/

SELECT ENAME || '	' || LPAD('*',CEIL(SAL/100),'*') FROM EMP;

--1/28--------------------------------------------------------------------------


--1. EMP ���̺��� Blake�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
 SELECT ENAME, HIREDATE, DEPTNO FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE') ;

--2. EMP ���̺��� ��� �޿� �̻��� �޴� ��� �������� ���ؼ� ������ ��ȣ�� �̸��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �޿��� ���� ������ ����Ͽ���.

 SELECT * FROM EMP;
 SELECT EMPNO, ENAME FROM EMP WHERE SAL>(SELECT AVG(SAL) FROM EMP) ORDER BY SAL DESC;

--3. EMP ���̺��� �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� �������� ���� ��� ��ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �����ȣ ������ ����Ͽ���.

 SELECT * FROM EMP;
 SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME LIKE '%T%';
 

--4. EMP ���̺��� �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
 SELECT * FROM DEPT;
 SELECT ENAME, JOB, SAL FROM EMP A,DEPT B
 WHERE A.DEPTNO = B.DEPTNO AND LOC = 'DALLAS';
 
 SELECT * FROM EMP
 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
 
--5. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
 SELECT ENAME, SAL FROM EMP 
 WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME = 'KING'); 

SELECT E.ENAME,D.ENAME FROM EMP E, EMP D
WHERE D.EMPNO=E.MGR
AND D.ENAME='KING';

--6. EMP ���̺��� SALES�μ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT ENAME, JOB FROM EMP
 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

--7. EMP ���̺��� ������ �μ� 30�� ���� ���޺��� ���� ����� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
 SELECT * FROM EMP
 WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);

SELECT * FROM EMP
WHERE SAL >ANY (SELECT SAL FROM EMP WHERE DEPTNO=30);

--8. EMP ���̺��� �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
 SELECT * FROM EMP ORDER BY DEPTNO;
  
 SELECT A.ENAME, A.JOB
 FROM (SELECT ENAME,JOB FROM EMP WHERE DEPTNO = 10) A,
 (SELECT ENAME,JOB FROM EMP WHERE DEPTNO = 30) B
 WHERE A.JOB = B.JOB;
 
SELECT * FROM EMP
WHERE JOB IN 
(SELECT DISTINCT JOB FROM EMP WHERE DEPTNO=30) and DEPTNO=10;

--9. EMP ���̺��� FORD�� ������ ���޵� ���� ����� ��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'FORD') AND SAL = (SELECT SAL FROM EMP WHERE ENAME = 'FORD');

SELECT * FROM EMP
WHERE (JOB,SAL) IN (SELECT JOB,SAL FROM EMP WHERE ENAME='FORD') AND ENAME <>'FORD';

--10. EMP ���̺��� ������ JONES�� ���ų� ������ FORD�̻��� ����� ������ �̸�,����,�μ���ȣ,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
--�� ������, ������ ���� ������ ����Ͽ���.
SELECT * FROM EMP;

 SELECT ENAME, JOB, DEPTNO, SAL FROM EMP
 WHERE JOB =  (SELECT JOB FROM EMP WHERE ENAME = 'JONES') OR SAL > (SELECT SAL FROM EMP WHERE ENAME = 'FORD')
 ORDER BY JOB,SAL DESC;

--11. EMP ���̺��� SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP;
SELECT ENAME, JOB, SAL FROM EMP
WHERE SAL = (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT' OR ENAME = 'WARD');
 
SELECT * FROM EMP
WHERE SAL IN 
(SELECT SAL FROM EMP WHERE ENAME='SCOTT' OR ENAME='WARD')
AND ENAME NOT IN('SCOTT','WARD');

--12. EMP ���̺��� CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
 SELECT * FROM DEPT;
 SELECT ENAME, JOB FROM EMP
 WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO'); -- X
 
 SELECT * FROM EMP
WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO'));

--13. EMP ���̺��� �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
  
 SELECT A.DEPTNO,A.ENAME,A.SAL FROM EMP A, (SELECT AVG(SAL) AAA,DEPTNO BBB FROM EMP GROUP BY DEPTNO) B 
WHERE A.SAL> B.AAA AND A.DEPTNO = B.BBB;

SELECT E.* FROM EMP E, (SELECT DEPTNO,AVG(SAL) A_PAY FROM EMP GROUP BY DEPTNO) D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL > D.A_PAY

--14. EMP ���̺��� �������� ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
 
 SELECT A.DEPTNO,A.ENAME,A.SAL FROM EMP A,
(SELECT AVG(SAL) AAA, JOB BBB FROM EMP GROUP BY JOB) B 
WHERE A.SAL> B.AAA AND A.JOB = B.BBB;

SELECT E.DEPTNO,ENAME,SAL FROM EMP E, 
(SELECT JOB,AVG(SAL) A_PAY FROM EMP GROUP BY JOB) D
WHERE E.JOB=D.JOB
AND E.SAL < D.A_PAY

--15. EMP ���̺��� ��� �Ѹ� �̻����κ��� ���� ���� �� �ִ� ����� ����,�̸�,�����ȣ,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

  SELECT * FROM EMP;
 SELECT DISTINCT A.JOB,A.ENAME, A.EMPNO,A.DEPTNO
 FROM EMP A , EMP B
 WHERE A.EMPNO = B.MGR; 

--16. EMP ���̺��� ���� ����� �����ȣ,�̸�,����,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.  -��
 
 SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL; 
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE EMPNO NOT IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

SELECT * FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);


