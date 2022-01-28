SELECT * FROM TAB;
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

SELECT * FROM EMP;

-------------------------------22�� 01�� 24��

--1. ����.

--2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.

 SELECT EMPNO, ENAME, JOB, SAL 
 FROM EMP WHERE SAL>=3000;
 
 SELECT * FROM EMP;
 SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL >=3000;

--3. EMP ���̺��� �����ȣ�� 7782�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.

 SELECT EMPNO, ENAME, DEPTNO 
 FROM EMP WHERE EMPNO = '7782';
 

 
 SELECT ENAME,DEPTNO FROM EMP WHERE EMPNO = 7782;

--4. EMP ���̺��� �Ի����� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.

 SELECT ENAME, JOB, HIREDATE FROM EMP 
 WHERE HIREDATE > '1981/02/20' AND  HIREDATE <'1981/05/01' 
 ORDER BY HIREDATE DESC;

 SELECT ENAME,JOB,HIREDATE FROM EMP
 WHERE HIREDATE BETWEEN '1981/FEB/20' AND '1981/MAY/01'; 

--5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.

 SELECT * FROM EMP
 WHERE DEPTNO = 10 OR DEPTNO = 20
 ORDER BY ENAME;

 SELECT * FROM EMP
 WHERE DEPTNO IN(10,20)
 ORDER BY ENAME;
 
--6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.

 SELECT ENAME Employee, SAL Salary FROM EMP 
 WHERE SAL>=1500 AND (DEPTNO = 10 OR DEPTNO = 30);
 
 SELECT ENAME AS "Employee", SAL "Monthly Salary" FROM EMP
 WHERE SAL >=1500 AND DEPTNO IN(10,30);

--7. EMP ���̺��� 1982�⿡ �Ի��� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

 SELECT * FROM EMP 
 WHERE TO_CHAR(HIREDATE,'YYYY')='1982' ; 
 
 SELECT * FROM EMP
 WHERE HIREDATE LIKE '1982%';

--8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

 SELECT * FROM EMP WHERE COMM IS NOT NULL;
 
 SELECT * FROM EMP WHERE COMM IS NOT NULL;
 
--9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.

 SELECT ENAME, SAL, COMM FROM EMP
 WHERE COMM > SAL*1.1;
 
 SELECT * FROM EMP
 WHERE COMM >= SAL * 1.1;

--10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

 SELECT * FROM EMP 
 WHERE (JOB = 'CLERK' OR JOB = 'ANALYST') AND SAL NOT IN ('1000','3000','5000');
 
 SELECT * FROM EMP
 WHERE JOB IN('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000);
 
--11. EMP ���̺��� �̸��� L�� ���� �ڰ� �ְ�  �μ� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

 SELECT * FROM EMP 
 WHERE REGEXP_COUNT(ENAME,'L')=2 AND (DEPTNO = '30' OR MGR = '7782');
 
 SELECT * FROM EMP
 WHERE ENAME LIKE '%L%L%' AND (DEPTNO=30 OR MGR=7782);
 
-------------------------------22�� 01�� 25��
SELECT * FROM EMP;

--1. ���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') "CURRENT DATE" FROM DUAL;
 
 SELECT SYSDATE "Current Date" FROM DUAL;  

--2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "NEW SALARY",(SAL*0.15) "INCREASE" FROM EMP;
 
 SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "New Salary",(SAL*1.15-SAL) "Increase" FROM EMP;

--3. EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT ENAME "�̸�", TO_CHAR(HIREDATE,'YYYY-MM-DD') "�Ի���", TO_CHAR((NEXT_DAY(ADD_MONTHS(HIREDATE,6),'������')),'YYYY-MM-DD') "6���� �� ������" FROM EMP;     

SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'������') FROM EMP;

--4. EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT ENAME �̸�, TO_CHAR(HIREDATE,'YYYY-MM-DD') �Ի���, CEIL(MONTHS_BETWEEN(SYSDATE,HIREDATE)) ����,
SAL ����, SAL*FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)) ��������޿�  
FROM EMP;

SELECT ENAME,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),0)����,
SAL, SAL*ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),0) �޿��Ѱ� 
FROM EMP;

--5. EMP ���̺��� ������ ����� ��µǵ��� �ۼ��Ͻÿ�.

--Dream Salary

------------------------------------------------------------

--KING earns $5,000.00 monthly but wants $15,000.00

--BLAKE earns $2,850.00 monthly but wants $8,550.00

--CLARK earns $2,450.00 monthly but wants $7,350.00

--. . . . . . . . . .

--14 rows selected

SELECT TO_CHAR(SAL,'$9,999.00') FROM EMP;

SELECT (ENAME || 'EARNS' || TO_CHAR(SAL,'$99,999.99') || 
' MONTHLY BUT WANTS' || TO_CHAR(SAL*3,'$99,999.99')) "DREAM SALARY"
FROM EMP;
 
SELECT ENAME || ' earn ' || TO_CHAR(SAL,'$99,999.99') ||
' monthly but wants ' || TO_CHAR(SAL*3, '$99,999.99') "Dream Salary"
FROM EMP;
--6. EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ ����� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT ENAME �̸�, LPAD(SAL,15,'*') �޿� FROM EMP;
 
 SELECT LPAD(ENAME || SAL,15,'*') "�̸��� �޿�" FROM EMP;
 
 SELECT ENAME,LPAD(SAL,15,'*') FROM EMP;

--7. EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT ENAME �̸�,JOB ����,TO_CHAR(HIREDATE,'YYYY-MM-DD') �Ի���,TO_CHAR(HIREDATE,'DAY') "�Ի��� ����" 
 FROM EMP;
 
 SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') "�Ի����"
 FROM EMP; 

--8. EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT ENAME, LENGTH(ENAME) "�̸��� ���ڼ�", JOB FROM EMP 
 WHERE LENGTH(ENAME)>=6;
 
 SELECT ENAME,LENGTH(ENAME) ���ڼ�, JOB FROM EMP
WHERE LENGTH(ENAME) >=6; 

--9. EMP ���̺��� ��� ����� ������ �̸�,����,�޿�,���ʽ�,�޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT ENAME �̸�, JOB ����, SAL �޿�, NVL(COMM,0) ���ʽ�, SAL+NVL(COMM,0) "�޿�+���ʽ�" FROM EMP;

SELECT ENAME,JOB,SAL,COMM,SAL+NVL(COMM,0) ���޾�  FROM EMP;

-------------------------------22�� 01�� 26��


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



SELECT * FROM EMP;
--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT COUNT(*) �ο���, MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�, SUM(SAL) "�޿��� ��" FROM EMP;
 
SELECT COUNT(*) �ο���,MAX(SAL) �ִ�޿�,MIN(SAL) �ּұ޿�, SUM(SAL) �޿��հ� FROM EMP; 

--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT DEPTNO, MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�, SUM(SAL) "�޿��� ��" FROM EMP GROUP BY DEPTNO;
 
SELECT JOB, MAX(SAL) �ִ�޿�,MIN(SAL) �ּұ޿�, SUM(SAL) �޿��հ� FROM EMP GROUP BY JOB;

--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT DEPTNO, COUNT(*) || '��' "������ �ο���" FROM EMP GROUP BY DEPTNO;
 
SELECT JOB,COUNT(*) �ο��� FROM EMP GROUP BY JOB; 

--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT MAX(SAL) - MIN(SAL) "�ְ�, �ִ� �޿��� ��" FROM EMP;
 
SELECT MAX(SAL)-MIN(SAL) �޿����� FROM EMP; 

--5. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(group by)

/*H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)

------ --------- --------- --------- --------- ---------

    81       10       950      5000    2282.5	  22825

    82        1      1300      1300      1300      1300

    80        1       800       800       800       800
*/ 

SELECT TO_CHAR(HIREDATE,'YY') H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YY');

SELECT TO_CHAR(HIREDATE,'YY') H_YEAR,COUNT(*),MIN(SAL), MAX(SAL),AVG(SAL),SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YY');
--6. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum)
/*
    TOTAL      1980      1981      1982      1983

--------- --------- --------- --------- ---------

       12         1        10         1         0
*/ 


SELECT COUNT(*) TOTAL, 
SUM(CASE WHEN HIREDATE BETWEEN '1980/01/01' AND '1980/12/31' THEN '1' ELSE '0' END) "1980",
SUM(CASE WHEN HIREDATE BETWEEN '1981/01/01' AND '1981/12/31' THEN '1' ELSE '0' END) "1981",
SUM(CASE WHEN HIREDATE BETWEEN '1982/01/01' AND '1982/12/31' THEN '1' ELSE '0' END) "1982",
SUM(CASE WHEN HIREDATE BETWEEN '1983/01/01' AND '1983/12/31' THEN '1' ELSE '0' END) "1983" FROM EMP;

SELECT COUNT(*) "TOTAL",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1980 THEN 1 ELSE 0 END) "1980",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1981 THEN 1 ELSE 0 END) "1981",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1982 THEN 1 ELSE 0 END) "1982",
  SUM(case EXTRACT(year FROM hiredate) WHEN 1983 THEN 1 ELSE 0 END) "1983"        
FROM EMP
WHERE EXTRACT(year FROM hiredate) BETWEEN 1980 AND 1983;

/*SELECT CASE SEX 
WHEN '1' THEN '����' 
WHEN '0' THEN '����' 
END GENDER ,ROUND(AVG(AGE)) "AVG", COUNT(*) "CNT" FROM CUSTOM GROUP BY SEX;*/

--7. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
/*
    JOB      Deptno 10    Deptno 20     Deptno 30     Total

---------   ---------    ---------     ---------     ---------

CLERK          1300         1900           950          4150

SALESMAN                                  5600          5600

PRESIDENT	   5000                                     5000

MANAGER	       2450         2975          2850          8275

ANALYST	                    6000                        6000
*/ 
 
SELECT * FROM EMP;
SELECT JOB, SAL FROM EMP GROUP BY JOB;

SELECT job, 
            NVL(TO_CHAR( SUM(case deptno WHEN 10 then sal end) ), ' ') "Deptno 10",
            NVL(TO_CHAR( SUM(case deptno WHEN 20 then sal end) ), ' ') "Deptno 20",
            NVL(TO_CHAR( SUM(case deptno WHEN 30 then sal end) ), ' ') "Deptno 30",                        
            SUM(sal) "Total"
FROM EMP
GROUP BY job;
 
-----------------------------22/01/27-----------------------------

--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM TAB;
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT DEPTNO,DNAME FROM DEPT WHERE LOC = 'NEW YORK';

SELECT A.ENAME, A.DEPTNO, BUSEO FROM EMP A, (SELECT DEPTNO,DNAME BUSEO FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO ORDER BY DEPTNO;

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT A.ENAME, A.JOB, A.SAL, DNAME FROM EMP A, (SELECT DEPTNO, LOC, DNAME FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO AND B.LOC ='NEW YORK';
--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT A.ENAME, DNAME, LOC FROM EMP A, (SELECT DEPTNO, LOC, DNAME FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO AND A.COMM >0;  

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT A.ENAME, A.JOB, DNAME, LOC FROM EMP A, (SELECT DEPTNO, DNAME, LOC FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO AND A.ENAME LIKE '%L%';
 

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

SELECT * FROM TAB;
SELECT * FROM DEPT;
SELECT * FROM EMP;

SELECT A.ENAME "Employee", A.EMPNO "Emp#", B.ENAME "Manager", B.EMPNO "Mgr#" FROM EMP A, EMP B WHERE A.MGR = B.EMPNO(+) ORDER BY B.ENAME DESC,A.ENAME;


--6. EMP ���̺��� �׵��� ������ ���� ���� �Ի��� ����� ���Ͽ� �̸�,�Ի���,������ �̸�, ������ �Ի����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT A.ENAME �̸�, A.HIREDATE �Ի���, B.ENAME "������ �̸�", B.HIREDATE "������ �Ի���" FROM EMP A, EMP B WHERE A.HIREDATE < B.HIREDATE AND A.MGR = B.EMPNO;

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



SELECT ENAME||'	'||LPAD('*',CEIL(SAL/100),'*') "EMPLOYEE AND THEIR SALARY" FROM EMP;