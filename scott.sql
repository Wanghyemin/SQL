SELECT * FROM TAB;
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

SELECT * FROM EMP;

-------------------------------22년 01월 24일

--1. 없음.

--2. EMP 테이블에서 급여가 3000이상인 사원의 정보를 사원번호,이름,담당업무,급여를 출력하는 SELECT 문장을 작성하시오.

 SELECT EMPNO, ENAME, JOB, SAL 
 FROM EMP WHERE SAL>=3000;
 
 SELECT * FROM EMP;
 SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL >=3000;

--3. EMP 테이블에서 사원번호가 7782인 사원의 이름과 부서번호를 출력하는 SELECT 문장을 작성하시오.

 SELECT EMPNO, ENAME, DEPTNO 
 FROM EMP WHERE EMPNO = '7782';
 

 
 SELECT ENAME,DEPTNO FROM EMP WHERE EMPNO = 7782;

--4. EMP 테이블에서 입사일이 February 20, 1981과 May 1, 1981 사이에 입사한 사원의 이름,업무,입사일을 출력하는 SELECT 문장을 작성하시오. 단 입사일 순으로 출력하시오.

 SELECT ENAME, JOB, HIREDATE FROM EMP 
 WHERE HIREDATE > '1981/02/20' AND  HIREDATE <'1981/05/01' 
 ORDER BY HIREDATE DESC;

 SELECT ENAME,JOB,HIREDATE FROM EMP
 WHERE HIREDATE BETWEEN '1981/FEB/20' AND '1981/MAY/01'; 

--5. EMP 테이블에서 부서번호가 10,20인 사원의 모든 정보를 출력하는 SELECT 문장을 작성하시오. 단 이름순으로 정렬하여라.

 SELECT * FROM EMP
 WHERE DEPTNO = 10 OR DEPTNO = 20
 ORDER BY ENAME;

 SELECT * FROM EMP
 WHERE DEPTNO IN(10,20)
 ORDER BY ENAME;
 
--6. EMP 테이블에서 급여가 1500이상이고 부서번호가 10,30인 사원의 이름과 급여를 출력하는 SELECT 문장을 작성하여라. 단 HEADING을 Employee과 Monthly Salary로 출력하여라.

 SELECT ENAME Employee, SAL Salary FROM EMP 
 WHERE SAL>=1500 AND (DEPTNO = 10 OR DEPTNO = 30);
 
 SELECT ENAME AS "Employee", SAL "Monthly Salary" FROM EMP
 WHERE SAL >=1500 AND DEPTNO IN(10,30);

--7. EMP 테이블에서 1982년에 입사한 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.

 SELECT * FROM EMP 
 WHERE TO_CHAR(HIREDATE,'YYYY')='1982' ; 
 
 SELECT * FROM EMP
 WHERE HIREDATE LIKE '1982%';

--8. EMP 테이블에서 COMM에 NULL이 아닌 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.

 SELECT * FROM EMP WHERE COMM IS NOT NULL;
 
 SELECT * FROM EMP WHERE COMM IS NOT NULL;
 
--9. EMP 테이블에서 보너스가 급여보다 10%가 많은 모든 종업원에 대하여 이름,급여,보너스를 출력하는 SELECT 문을 작성하여라.

 SELECT ENAME, SAL, COMM FROM EMP
 WHERE COMM > SAL*1.1;
 
 SELECT * FROM EMP
 WHERE COMM >= SAL * 1.1;

--10. EMP 테이블에서 업무가 Clerk이거나 Analyst이고 급여가 1000,3000,5000이 아닌 모든 사원의 정보를 출력하는 SELECT 문을 작성하여라.

 SELECT * FROM EMP 
 WHERE (JOB = 'CLERK' OR JOB = 'ANALYST') AND SAL NOT IN ('1000','3000','5000');
 
 SELECT * FROM EMP
 WHERE JOB IN('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000);
 
--11. EMP 테이블에서 이름에 L이 가두 자가 있고  부서 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.

 SELECT * FROM EMP 
 WHERE REGEXP_COUNT(ENAME,'L')=2 AND (DEPTNO = '30' OR MGR = '7782');
 
 SELECT * FROM EMP
 WHERE ENAME LIKE '%L%L%' AND (DEPTNO=30 OR MGR=7782);
 
-------------------------------22년 01월 25일
SELECT * FROM EMP;

--1. 현재 날짜를 출력하고 열 레이블은 Current Date로 출력하는 SELECT 문장을 기술하시오.

 SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') "CURRENT DATE" FROM DUAL;
 
 SELECT SYSDATE "Current Date" FROM DUAL;  

--2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.

 SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "NEW SALARY",(SAL*0.15) "INCREASE" FROM EMP;
 
 SELECT EMPNO,ENAME,JOB,SAL,(SAL*1.15) "New Salary",(SAL*1.15-SAL) "Increase" FROM EMP;

--3. EMP 테이블에서 이름,입사일,입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.

SELECT ENAME "이름", TO_CHAR(HIREDATE,'YYYY-MM-DD') "입사일", TO_CHAR((NEXT_DAY(ADD_MONTHS(HIREDATE,6),'월요일')),'YYYY-MM-DD') "6개월 후 월요일" FROM EMP;     

SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE, 6),'월요일') FROM EMP;

--4. EMP 테이블에서 이름,입사일, 입사일로부터 현재까지의 월수,급여, 입사일부터 현재까지의 급여의 총계를 출력하는 SELECT 문장을 기술하시오.

SELECT ENAME 이름, TO_CHAR(HIREDATE,'YYYY-MM-DD') 입사일, CEIL(MONTHS_BETWEEN(SYSDATE,HIREDATE)) 월차,
SAL 월급, SAL*FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)) 현재까지급여  
FROM EMP;

SELECT ENAME,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),0)월수,
SAL, SAL*ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE),0) 급여총계 
FROM EMP;

--5. EMP 테이블에서 다음의 결과가 출력되도록 작성하시오.

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
--6. EMP 테이블에서 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈곳은 “*”로 대치)를 출력하는 SELECT 문장을 기술하시오.

 SELECT ENAME 이름, LPAD(SAL,15,'*') 급여 FROM EMP;
 
 SELECT LPAD(ENAME || SAL,15,'*') "이름과 급여" FROM EMP;
 
 SELECT ENAME,LPAD(SAL,15,'*') FROM EMP;

--7. EMP 테이블에서 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.

 SELECT ENAME 이름,JOB 업무,TO_CHAR(HIREDATE,'YYYY-MM-DD') 입사일,TO_CHAR(HIREDATE,'DAY') "입사한 요일" 
 FROM EMP;
 
 SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') "입사요일"
 FROM EMP; 

--8. EMP 테이블에서 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력하는 SELECT 문장을 기술하시오.

 SELECT ENAME, LENGTH(ENAME) "이름의 글자수", JOB FROM EMP 
 WHERE LENGTH(ENAME)>=6;
 
 SELECT ENAME,LENGTH(ENAME) 글자수, JOB FROM EMP
WHERE LENGTH(ENAME) >=6; 

--9. EMP 테이블에서 모든 사원의 정보를 이름,업무,급여,보너스,급여+보너스를 출력하는 SELECT 문장을 기술하시오.

SELECT ENAME 이름, JOB 업무, SAL 급여, NVL(COMM,0) 보너스, SAL+NVL(COMM,0) "급여+보너스" FROM EMP;

SELECT ENAME,JOB,SAL,COMM,SAL+NVL(COMM,0) 지급액  FROM EMP;

-------------------------------22년 01월 26일


SELECT 
case SEX 
when '1' then '남자'
when '0' then '여자'
end gender,
COUNT(*) 인원수 FROM CUSTOM
GROUP BY SEX;

WHEN '1' THEN '남자' ELSE '여자'

SELECT 
CASE 컬럼명                         
	WHEN 1 THEN 100                          
	WHEN 2 THEN 200                         
	WHEN 3 THEN 300                         
	WHEN 4 THEN 400                          
	ELSE 500                        
END AS RESULT             
FROM DUAL;



SELECT * FROM EMP;
--1. EMP 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력하는 SELECT 문장을 작성하여라.
SELECT COUNT(*) 인원수, MAX(SAL) 최대급여, MIN(SAL) 최소급여, SUM(SAL) "급여의 합" FROM EMP;
 
SELECT COUNT(*) 인원수,MAX(SAL) 최대급여,MIN(SAL) 최소급여, SUM(SAL) 급여합계 FROM EMP; 

--2. EMP 테이블에서 각 업무별로 최대 급여,최소 급여,급여의 합을 출력하는 SELECT 문장을 작성하여라.
SELECT DEPTNO, MAX(SAL) 최대급여, MIN(SAL) 최소급여, SUM(SAL) "급여의 합" FROM EMP GROUP BY DEPTNO;
 
SELECT JOB, MAX(SAL) 최대급여,MIN(SAL) 최소급여, SUM(SAL) 급여합계 FROM EMP GROUP BY JOB;

--3. EMP 테이블에서 업무별 인원수를 구하여 출력하는 SELECT 문장을 작성하여라.
SELECT DEPTNO, COUNT(*) || '명' "업무별 인원수" FROM EMP GROUP BY DEPTNO;
 
SELECT JOB,COUNT(*) 인원수 FROM EMP GROUP BY JOB; 

--4. EMP 테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력하는 SELECT 문장을 작성하여라.
SELECT MAX(SAL) - MIN(SAL) "최고, 최대 급여의 차" FROM EMP;
 
SELECT MAX(SAL)-MIN(SAL) 급여차액 FROM EMP; 

--5. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(group by)

/*H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)

------ --------- --------- --------- --------- ---------

    81       10       950      5000    2282.5	  22825

    82        1      1300      1300      1300      1300

    80        1       800       800       800       800
*/ 

SELECT TO_CHAR(HIREDATE,'YY') H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YY');

SELECT TO_CHAR(HIREDATE,'YY') H_YEAR,COUNT(*),MIN(SAL), MAX(SAL),AVG(SAL),SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YY');
--6. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(case,sum)
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
WHEN '1' THEN '남자' 
WHEN '0' THEN '여자' 
END GENDER ,ROUND(AVG(AGE)) "AVG", COUNT(*) "CNT" FROM CUSTOM GROUP BY SEX;*/

--7. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.
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

--1. EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT * FROM TAB;
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT DEPTNO,DNAME FROM DEPT WHERE LOC = 'NEW YORK';

SELECT A.ENAME, A.DEPTNO, BUSEO FROM EMP A, (SELECT DEPTNO,DNAME BUSEO FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO ORDER BY DEPTNO;

--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력하는 SELECT 문장을 작성하여라.

 SELECT A.ENAME, A.JOB, A.SAL, DNAME FROM EMP A, (SELECT DEPTNO, LOC, DNAME FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO AND B.LOC ='NEW YORK';
--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력하는 SELECT 문장을 작성하여라.

SELECT A.ENAME, DNAME, LOC FROM EMP A, (SELECT DEPTNO, LOC, DNAME FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO AND A.COMM >0;  

--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력하는 SELECT 문장을 작성하여라.
SELECT A.ENAME, A.JOB, DNAME, LOC FROM EMP A, (SELECT DEPTNO, DNAME, LOC FROM DEPT) B WHERE A.DEPTNO=B.DEPTNO AND A.ENAME LIKE '%L%';
 

--5. 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(관리자가 없는 King을 포함하여 모든 사원을 출력)
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


--6. EMP 테이블에서 그들의 관리자 보다 먼저 입사한 사원에 대하여 이름,입사일,관리자 이름, 관리자 입사일을 출력하는 SELECT 문장을 작성하여라.

SELECT A.ENAME 이름, A.HIREDATE 입사일, B.ENAME "관리자 이름", B.HIREDATE "관리자 입사일" FROM EMP A, EMP B WHERE A.HIREDATE < B.HIREDATE AND A.MGR = B.EMPNO;

--7. EMP 테이블에서 사원의 급여와 사원의 급여 양만큼 “*”를 출력하는 SELECT 문장을 작성하여라. 단 “*”는 100을 의미한다.

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