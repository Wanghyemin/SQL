-- 1/21 ----------------------------------------------------------------------------------------------------------------------------------
-- Data < Row, Record = 행 // Column, Field = 열 < Table = 표 < TableSpace < DB

/*
1. QUERY (data검색어)
   SELECT 

2. DML (Data Maipulation Language) : 데이터 조작어 - 정의된 데이터베이스에 입력된 레코드를 조회하거나 수정하거나 삭제
    INSERT, UPDATE, DELETE
    
3. DDL (Data Definition Language) : 데이터 정의어 - 테이블 자체 혹은 데이터를 생성, 수정, 삭제하는 등의 데이터의 전체의 골격을 결정
    CREATE, ALTER ( ADD, MODIFY, DROP ), DROP, RENAME : 자동으로 Commit이 되어서 Rollback도 불가능!
    
4. TCL (Transaction Control Language)
    COMMIT : 저장 , ROLLBACK : 취소
    
5. DCL (data control language)
    grant : 권한을 줄때 , revoke : 권한을 뺏을때

*/

SELECT * FROM TAB;

SELECT * FROM PERSONNEL;
SELECT * FROM DIVISION; 
SELECT * FROM PAYGRADE;
SELECT * FROM BONUS;

SELECT * FROM PERSONNEL;
SELECT PNO, PNAME, PAY, DNO FROM PERSONNEL;

SELECT JOB FROM PERSONNEL;

SELECT DISTINCT JOB FROM PERSONNEL; -- DISTINCT : 동일한 결과값이 있으면 하나로 보여줌

-- ORDER BY : 정렬 명령어 -------------------------------------------------------

SELECT PNO, PNAME, PAY FROM PERSONNEL 
ORDER BY PAY ASC; -- 오름차순	: 쓰지 않아도 기본값이 오름차순

SELECT PNO, PNAME, PAY FROM PERSONNEL
ORDER BY PNAME; 

SELECT PNO, PNAME, PAY FROM PERSONNEL
ORDER BY PAY DESC; -- 내림차순

SELECT * FROM PERSONNEL 
ORDER BY STARTDATE;

-- 사원번호가 높은 순서대로 정렬하시오 --
SELECT * FROM PERSONNEL 
ORDER BY PNO DESC;
 
--------------------------------------------------------------------------------- 

-- DESC : 테이블의 구조
DESC PERSONNEL;
DESCRIBE PERSONNEL;

-- AS "별칭" : 파생열, 연산 가능 ---------------------------------------------------------
SELECT PNO, PNAME, PAY, PAY+1000 AS "보너스" FROM PERSONNEL;

SELECT PNO,PNAME,PAY,PAY+1000 보너스 FROM PERSONNEL ORDER BY PAY+1000;

SELECT PNO,PNAME,PAY,PAY+1000 보너스 FROM PERSONNEL ORDER BY 보너스; -- 별칭으로 써도 된다

SELECT PNO,PNAME,PAY,PAY+1000 보너스 FROM PERSONNEL ORDER BY 4;

SELECT * FROM PERSONNEL ORDER BY 4;

SELECT DNO, PNO, PNAME FROM PERSONNEL ORDER BY DNO DESC,PNO; -- DNO별 내림차순 정렬 후, 그 안에서 PNO별로 오름차순 정렬

SELECT DNO, PNO, PNAME FROM PERSONNEL ORDER BY DNO,PNO DESC; -- DNO별 오름차순 정렬 후, 그 안에서 PNO별로 내림차순 정렬

SELECT * FROM PERSONNEL ORDER BY MANAGER ASC; -- NULL값은 오름차순 맨 마지막에 정렬된다.

-- 사원의 급여와 일년치 연봉(ANNUAL)을 구하시오 // NVL
SELECT DNO,PNO, PNAME, PAY, (PAY*12)+NVL(BONUS,0) AS "ANNUAL" FROM PERSONNEL;

SELECT PAY, PAY-500 FROM PERSONNEL;

SELECT PNAME ||' '|| PNO FROM PERSONNEL; -- ||는 +의 의미 (OR 아님!)

-- WHERE : SELECT의 조건문 -------------------------------------------------------

SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN';

SELECT * FROM PERSONNEL WHERE JOB = 'salesman'; -- X : 대소문자 구분

-- 연산자
-- =, <, >, <=, >=, <>

--급여가 1600인 사원을 검색하시오
SELECT * FROM PERSONNEL WHERE PAY = 1600;

SELECT * FROM  PERSONNEL WHERE PNO = 1116;

SELECT * FROM PERSONNEL WHERE PAY <= 2000;

-- 1990년 12월 17일에 입사한 사원
SELECT * FROM PERSONNEL WHERE STARTDATE='1990/12/17'; -- 날짜는 - 와 / 모두 인식
SELECT * FROM PERSONNEL WHERE STARTDATE='1990-12-17';

SELECT * FROM NLS_SESSION_PARAMETERS; -- RR/MM/DD

SELECT * FROM PERSONNEL WHERE JOB = 'CLERK';

SELECT * FROM PERSONNEL WHERE PNAME = 'JAMES';

-- 논리 연산자 : AND, OR, NOT(!) -------------------------------------------------------

-- AND
SELECT * FROM PERSONNEL WHERE DNO = 10 AND PAY>=3000;

SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN' AND STARTDATE>='1991-01-01';

SELECT * FROM PERSONNEL WHERE STARTDATE<'1991/10/01' AND STARTDATE>='1991/09/01';

-- OR
SELECT * FROM PERSONNEL WHERE DNO = 10 OR PAY>=3000;

SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER' OR STARTDATE<'1990/01/01';

--NOT
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN' OR JOB = 'CLERK';

SELECT * FROM PERSONNEL WHERE JOB IN ('SALESMAN','CLERK'); -- IN ( A, B ) : A OR B 

SELECT * FROM PERSONNEL WHERE JOB<>'SALESMAN' AND JOB<>'CLERK'; -- <> : 부정

SELECT * FROM PERSONNEL WHERE JOB NOT IN ('SALESMAN','CLERK'); -- NOT IN : 부정

SELECT * FROM PERSONNEL WHERE PAY >= 1000 AND PAY <= 2000;

SELECT * FROM PERSONNEL WHERE PAY BETWEEN 1000 AND 2000;

SELECT * FROM PERSONNEL WHERE STARTDATE BETWEEN '1991/09/01' AND '1991/09/30';

SELECT * FROM PERSONNEL WHERE DNO NOT IN (20,30);

SELECT * FROM PERSONNEL WHERE DNO NOT BETWEEN 20 AND 30; -- NOT BETWEEN : 부정 

SELECT * FROM PERSONNEL WHERE STARTDATE NOT BETWEEN '1991/05/01' AND '1992/02/24';

-- 정규화 표현식 : REGEXP_ -----------------------------------------------------------------------------

SELECT * FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE PNAME LIKE 'A%'; -- PNAME = 'A%' : 첫 글자가 'A'인 문자를 검색하게 된다.
-- %S 는 여러자리

SELECT * FROM PERSONNEL WHERE PNO LIKE '111_'; -- 4자리수 중 '111_' : _는 문자 제한 없음

SELECT * FROM PERSONNEL WHERE PNO NOT LIKE '111%'; -- 4자리수 중 '111%' : %는 문자 제한 없음

SELECT * FROM PERSONNEL WHERE PNO LIKE '1__1';

SELECT * FROM PERSONNEL WHERE STARTDATE LIKE '90%';

SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO,'11[^2]');

SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO,'1[1,2]');

SELECT REGEXP_SUBSTR('SUZI@NAVER.COM','[^$]+') 아이디 FROM DUAL; 

SELECT * FROM DUAL; -- DUMMY(쓰레기) 값이 들어 있음

SELECT 100+300 FROM DUAL; -- 단 하나의 데이터를 보여줌

-- NULL --
SELECT MANAGER FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE MANAGER IS NULL;

SELECT * FROM PERSONNEL WHERE MANAGER IS NOT NULL;

-- 업무가 'MANAGER'이고 급여가 1500 이상인 사원 또는 업무가 'SALESMAN'인 사원의 정보를 찾으시오

SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER' AND PAY>= 1500 OR JOB = 'SALESMAN'; 

-- 업무가 'PRESIDENT' 또는 'SALESMAN'이고 급여가 1500이상 사원의 정보를 찾으시오

SELECT * FROM PERSONNEL WHERE JOB = 'PRESIDENT' OR JOB = 'SALESMAN' AND PAY >=1500;

SELECT * FROM PERSONNEL WHERE JOB IN ('PRESIDENT' , 'SALESMAN') AND PAY>=1500;

-- 함수 ------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- 숫자 함수 -----------------------------------------------------------------------
------------------------------------------------------------------------------------

-- ROUND(반올림) : ROUND(숫자나 컬럼명,반올림위치)----------------------

--  1  2  3  4  .  5  6  7
-- -4 -3 -2 -1  0  1  2  3

SELECT ROUND(45.275,1) FROM DUAL;--45.3
SELECT ROUND(45.275,-1) FROM DUAL;--50

SELECT PNO,PNAME,PAY,ROUND (PAY,-2) FROM PERSONNEL;

-- TRUNC(절사) : 0에 가까운 값으로 가도록 버림 -------------------------------

SELECT TRUNC(45.245,2)FROM DUAL;-- 45.24
SELECT TRUNC(45.245,-1)FROM DUAL;-- 40

SELECT PNO,PNAME,PAY, TRUNC(PAY,-2) FROM PERSONNEL;

-- CEIL/FLOOR(올림/내림) : 정수만 반환 ---------------------------------------

SELECT CEIL(461.21) FROM DUAL;
SELECT FLOOR(461.91) FROM DUAL;

-- MOD(나머지) ---------------------------------------------------------------
SELECT MOD(10,3)FROM DUAL;

-- ABS(절대값) ---------------------------------------------------------------
SELECT ABS(-123) FROM DUAL;

-- SIGN(양수 1, 음수 -1, 0은 0) ----------------------------------------------
SELECT SIGN(100), SIGN(-100), SIGN(0) FROM DUAL;

-- 지수 / 승 -----------------------------------------------------------------
SELECT POWER(2,4) FROM DUAL; 

-- 제곱근 / 루트 -------------------------------------------------------------
SELECT SQRT(9) FROM DUAL;

---------------------------------------------------------------------------------------------
-- 문자함수 ---------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

-- UPPER(소문자-> 대문자) ---------------------------------------------------
SELECT UPPER ('oracle') FROM DUAL;

-- LOWER(대문자-> 소문자) --------------------------------------------------- 
SELECT LOWER ('ORACLE') FROM DUAL;
 
--아래 둘은 같은 결과 BUT 2번째가 더 느림 
SELECT DNO, DNAME FROM DIVISION WHERE DNAME = UPPER('sales'); -- sales 한 글자를 대문자로 바꾸고 비교
SELECT DNO, DNAME FROM DIVISION WHERE LOWER(DNAME) = 'sales';  -- 모든 DNAME의 항목을 소문자로 바꾸고 비교

-- INITCAP ( 첫 글자만 대문자 ) ---------------------------------------------
SELECT INITCAP('korea fighting') FROM DUAL;

-- CONCAT ( 두 개의 문자만 연결 가능, 세 개부터는 || 사용 ) -----------------
SELECT PNAME || DNO FROM PERSONNEL;
SELECT CONCAT(PNAME,DNO) FROM PERSONNEL;

-- LENGTH -------------------------------------------------------------------
SELECT LENGTH('KOREA FIGHTING')FROM DUAL; -- 14

-- SUBSTR : SUBSTR( 문자, 시작하는 위치, 개수 ) -----------------------------
SELECT SUBSTR('ABCDEFG',1,3) FROM DUAL; --ABC
SELECT SUBSTR('ABCDEFG',3,2) FROM DUAL; --CD
SELECT SUBSTR('ABCDEFG',-3,2) FROM DUAL; --EF : -는 뒤에서부터 
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; --DEFG

-- INSTR : INSTR( 문자, 찾고자하는 문자 ) -----------------------------------
SELECT INSTR('ABCDEFG','C') FROM DUAL; -- 3

SELECT INSTR('AAAAAAA','A') FROM DUAL; -- 1 : 찾고자 하는 문자가 여러 개 있어도 맨 첫 번째 문자에서 멈춤
SELECT INSTR('AAAAAAA','a') FROM DUAL; -- 0 : 찾는 데이터가 없으면 0이 나온다 ( 자바는 -1이니 헷갈리지 말자 )

-- RPAD/LPAD : RPAD( 문자나 컬럼명, 전체 길이, 붙이고자하는 문자) ----------
SELECT RPAD(PNAME,15,'*') FROM PERSONNEL; -- 오른쪽에 붙여서 총 15자가 되게 만들어라

-- RTRIM/LTRIM -------------------------------------------------------------
SELECT RTRIM('ABBBB','B') FROM DUAL;
SELECT RTRIM('A    ',' ') FROM DUAL;

SELECT RTRIM ('ABBABB','B') FROM DUAL;

-----------------------------------------------------------------------------------------------
-- 날짜함수 -----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- SYSDATE(GETDATE()) -------------------------------------------------------
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE +4 FROM DUAL; -- 연산 가능

SELECT STARTDATE-1, STARTDATE, STARTDATE+1 FROM PERSONNEL;

-- KIM 사원이 오늘까지 근무한 년수를 구하시오
SELECT SYSDATE, STARTDATE,CEIL((SYSDATE-STARTDATE)/365) || '년' YEARS  -- 칼럼의 두 값을 연결
FROM PERSONNEL WHERE PNAME = 'KIM';

-- ROUND ---------------------------------------------------------------------

SELECT STARTDATE, ROUND(STARTDATE,'YEAR') FROM PERSONNEL; -- 6월을 기준으로 반올림
SELECT STARTDATE, ROUND(STARTDATE,'MONTH') FROM PERSONNEL; -- 15일을 기준으로 반올림
SELECT STARTDATE, ROUND(STARTDATE,'DAY') FROM PERSONNEL; -- 낮 열두시 기준으로 반올림

-- TRUNC ---------------------------------------------------------------------
SELECT STARTDATE, TRUNC(STARTDATE,'MONTH') FROM PERSONNEL;

-- MONTHS_BETWEEN ------------------------------------------------------------
SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'2002/06/01')) MONTH FROM DUAL;
SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'2002/06/01')/12) YEAR FROM DUAL;

-- LAST_DAY ------------------------------------------------------------------
SELECT STARTDATE,LAST_DAY(STARTDATE) FROM PERSONNEL;

-- NEXT_DAY ------------------------------------------------------------------
SELECT NEXT_DAY(SYSDATE,'토요일') FROM DUAL;

-- ADD_MONTHS ----------------------------------------------------------------
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,24) FROM DUAL;

-------------------------------------------------------------------------------------------
-- 변환 함수 ------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- TO_CHAR(숫자나 날짜를 문자로 변경) ----------------------------------------

-- 날짜 형식 -----------------------------------------------
/*
 MM: 달수(10)
 MON: 3문자 달이름(MAR)
 MONTH: 달의 풀네임(MARCH)
 DD : 달의 날짜수(22)
 D : 주의 일수(2)
 DY: 요일이름(월)
 DAY : 일의 풀네임(화요일)
 YYYY: 4자리 연도
 YY: 2자리 연도
 RM : 로마식 달수
*/

SELECT SYSDATE,TO_CHAR(SYSDATE,'D') FROM DUAL; -- 주의수 : 1
SELECT SYSDATE,TO_CHAR(SYSDATE,'DY') FROM DUAL; -- 요일 : 일
SELECT SYSDATE,TO_CHAR(SYSDATE,'RM') FROM DUAL; -- 월 : 1
SELECT SYSDATE,TO_CHAR(SYSDATE,'MON') FROM DUAL; -- 월 : 1월
SELECT SYSDATE,TO_CHAR(SYSDATE,'DAY') FROM DUAL; -- 요일 : 일요일
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'DD-MM-YY') FROM DUAL;

-- 시간형식 -----------------------------------------------
/*
HH,HH12
HH24
MI: 분
SS: 초
SSSSS: 초의 자리수
AM,PM / A.M, P.M : 오전 오후
*/

SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'AM HH:MI:SS') FROM DUAL;

-- 숫자 형식 -----------------------------------------------
/*
9 : 자리수(9999 -> 1218)
0 : 자리수가 비면 0으로 표시(09999 -> 01234)
PR: 음수(9999,PR -> <1234>)
, : 천자리수(9,999 -> 1,000)
*/

SELECT TO_CHAR(12506,'$099,999.99') FROM DUAL;

-- 서수 --------------------------------------------
-- SP(SPELLING),TH
SELECT SYSDATE, TO_CHAR(SYSDATE,'DD')FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSP')FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDTH')FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSPTH')FROM DUAL;

-- TO_DATE : 문자를 시간으로 형식 변환-------------
SELECT TO_DATE('22-1월-24','YY-MON-DD')+10 FROM DUAL;
SELECT TO_DATE('13:38','HH24:MI') FROM DUAL;

-- TO_NUMBER : 문자 형식을 숫자로 변환 ------------
SELECT TO_NUMBER('123') + 100 FROM DUAL;
SELECT TO_NUMBER('ABC') FROM DUAL;-- X 문자는 숫자로 변형 안된다

-- NVL : NULL값에 특정 숫자 부여 ------------------
SELECT BONUS,NVL(BONUS,0)FROM PERSONNEL;

DESC PERSONNEL;
SELECT MANAGER,NVL(TO_CHAR(MANAGER), 'NON MANAGER') FROM PERSONNEL; -- MANAGER는 TYPE이 NUMBER이지만 NVL은 파생열이기 때문에 문자가 들어갈 수 있음


-- DECODE -------------------------------------------------------------------------------------
-- JAVA의 IF문처럼 ORACLE의 조건문 : (컬럼,조건1,실행1,조건2,실행2,나머지실행3)

-- 각 사원의 급여를 부서번호가 10인 경우 10%, 부서번호가 20인 경우 20% 나머지 부서는 30%를 증가
SELECT PNAME, BONUS, DNO, PAY, DECODE(DNO,10,PAY*1.1,20,PAY*1.2,PAY*1.3) "인상분" FROM PERSONNEL;

-- 급여가 3500 이상인 경우에는 GRADE를 'GOOD'를 미만인 경우에는 'POOR'를 출력하시오(SIGN)
SELECT PNAME, PAY, DECODE (SIGN (PAY-3500),1,'GOOD','POOR') GRADE FROM PERSONNEL;

-- 그룹 함수 : 무조건 하나만 보여줌 ------------------------------------------------------------

-- COUNT ----------------------------------------
SELECT COUNT(*) FROM PERSONNEL;

-- 급여가 3000이상인 사원의 수
SELECT COUNT(*) FROM PERSONNEL WHERE PAY>=3000;

SELECT COUNT(MANAGER) FROM PERSONNEL;
SELECT COUNT(BONUS) FROM PERSONNEL;

-- AVG -----------------------------------------
SELECT AVG(PAY) FROM PERSONNEL;

-- SUM -----------------------------------------
SELECT SUM(PAY) FROM PERSONNEL;

-- MAX/MIN -------------------------------------
SELECT MAX(PAY),MIN(PAY) FROM PERSONNEL;

-- 사원중에 입사한지 가장 오래된 직원을 찾으시오
SELECT MIN(STARTDATE) FROM PERSONNEL;

-- 입사한지 가장 오래된 사원과 신입사원과의 날수를 찾으시오
SELECT ROUND((MAX(STARTDATE)-MIN(STARTDATE))/365) AS 년 FROM PERSONNEL;

-- 분석 함수 -------------------------------------------------------------------------------------★ 다음에 다시 봅시당 ★

-- DISTINCT, PARTITION --------------------------------------------
-- 각 부서별 평균
SELECT DISTINCT DNO, AVG(PAY) OVER(PARTITION BY DNO) FROM PERSONNEL;-- DISTINCT가 같은 값은 한번만 보여줌

-- RANK -----------------------------------------------------------
-- 월급 1200을 받는 사람 순위
SELECT * FROM PERSONNEL ORDER BY PAY DESC;

SELECT RANK(1200) WITHIN GROUP (ORDER BY PAY DESC) RANK FROM PERSONNEL;

SELECT PNAME,PAY,RANK() OVER (ORDER BY PAY DESC) RANK FROM PERSONNEL;

-- ★ 다음에 다시 봅시당 ★ END

-- GROUP BY --------------------------------------------------------
SELECT PNAME FROM PERSONNEL; -- 다중값 반환 쿼리

SELECT * FROM PERSONNEL WHERE PAY=1600; -- 다중값 반환 쿼리

SELECT COUNT(*) FROM PERSONNEL; -- 단일값 반환 쿼리

SELECT PNAME, MIN(STARTDATE) FROM PERSONNEL; --X : 다중값과 단일값이 한 번에 출력이 될 수 없음

-- 하위 쿼리 --------------------------------------------------------
SELECT * FROM PERSONNEL WHERE STARTDATE=(SELECT MIN(STARTDATE) FROM PERSONNEL);

-- 부서별 평균 급여를 구하시오
SELECT DNO, AVG(PAY) FROM PERSONNEL GROUP BY DNO;

-- EXTRANCT : 날짜에서 일정 부분 추출 -------------------------------
SELECT STARTDATE,
EXTRACT(YEAR FROM STARTDATE) 년, 
EXTRACT(MONTH FROM STARTDATE) 월, 
EXTRACT(DAY FROM STARTDATE) 일
FROM PERSONNEL;

-- 각 부서의 평균급여가 전체 평균급여(2972.5)보다 크면 'GOOD'
-- 작으면 'POOR'를 출력하시오

SELECT AVG(PAY) FROM PERSONNEL; -- 전체 평균

SELECT DNO, AVG(PAY), DECODE (SIGN(AVG(PAY)-(SELECT AVG(PAY) FROM PERSONNEL)),1,'GOOD','POOR') AS "GRADE"
FROM PERSONNEL
GROUP BY DNO HAVING DNO=20; -- GROUP BY의 조건문은 HAVING / SELECT 일때는 WHERE

-- SELF JOIN -------------------------------------------------------
SELECT A.PNO 사원번호, A.PNAME 직원, CONCAT(B.PNO,B.PNAME) "관리자" -- CONCAT은 2개의 컬럼만 가능
FROM PERSONNEL A, PERSONNEL B
WHERE A.MANAGER = B.PNO; 

-- NON EQUI JOIN (두 개의 테이블이 특정 KEY로 연관된 것 : PK, FK) -- ★
SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE;

SELECT PNAME, PAY, GRADE
FROM PERSONNEL, PAYGRADE
WHERE PAY BETWEEN LOWPAY AND HIGHPAY; 

-- 기타(OPERATION) -------------------------------------------------
/*
A = [1,2,5,6] B = [1,2,4]

A UNION ALL B = [1,2,5,6,1,2,4] : 
A UNION B = [1,2,4,5,6]			: AUB
A MINUS B = [5,6] 				: A-B
A INTERSECT B = [1,2]			: A교집합B
*/

-- UNION ALL -------------------------------------------------------
SELECT * FROM PERSONNEL UNION ALL SELECT * FROM PERSONNEL;

-- UNION -----------------------------------------------------------
SELECT * FROM PERSONNEL UNION SELECT * FROM PERSONNEL;

-- MINUS -----------------------------------------------------------
SELECT DNO FROM DIVISION -- (10,20,30,40) - (10,20,30) 
MINUS
SELECT DNO FROM PERSONNEL; -- 40

-- INTERSECT -------------------------------------------------------
SELECT DNO FROM DIVISION -- (10,20,30,40) 교집합 (10,20,30) 
INTERSECT
SELECT DNO FROM PERSONNEL; -- 10,20,30

SELECT * FROM PERSONNEL;

-- PAREWISE(비교하는 컬럼을 쌍으로 묶은 후 비교) -------------------
SELECT PNAME,DNO,PAY,BONUS FROM PERSONNEL
WHERE (PAY,BONUS) IN (SELECT PAY, BONUS FROM PERSONNEL WHERE DNO = 30);

SELECT PNAME,DNO,PAY,NVL(BONUS,-1) FROM PERSONNEL -- NULL까지 처리 (원래는 -1아니고 0넣어줘야 함)
WHERE (PAY,NVL(BONUS,-1)) IN (SELECT PAY, NVL(BONUS,-1) FROM PERSONNEL WHERE DNO = 30);

SELECT PNAME,DNO,PAY,BONUS FROM PERSONNEL
WHERE (PAY = 1600 AND BONUS = 500) OR (PAY = 1450 AND BONUS = 3000) 
OR (PAY = 1200 AND BONUS = 0) OR (PAY = 3550 AND BONUS IS NULL);


-- 1/26 --------------------------------------------------------------------------------------------------------------------------------------------------

/*
 2. DML(Data Maipulation Language) : 데이터 조작어 - 정의된 데이터베이스에 입력된 레코드를 조회하거나 수정하거나 삭제
                                     Transaction 하는 것 :  INSERT, UPDATE, DELETE : 무조건 COMMIT해줘야 하고 ROLLBACK도 가능하다.
                                     CRUD : CREATE, READ, UPDATE, DELETE
*/


-- INSERT -----------------------------------------------------------------------------------------------
SELECT * FROM DIVISION;
DESC DIVISION; -- DNO : NOT NULL : 반드시 값을 입력해야 한다

INSERT INTO DIVISION VALUES (50, 'OPERAION','031-111-2222','DAEGU'); -- 모든 값 입력
INSERT INTO DIVISION (DNO) VALUES (60); -- DNO만 60입력, 나머지는 자동 NULL : 암시적 NULL 삽입 
INSERT INTO DIVISION (DNAME,POSITION) VALUES ('ACCOUNT','DAEJUN'); -- X : CANNOT INSERT NULL INTO 'DNO'

INSERT INTO PERSONNEL (PNO, PNAME, PAY, DNO) VALUES (7711,'YOUNG', 4000,20);
SELECT* FROM PERSONNEL;
DESC PERSONNEL;

INSERT INTO DIVISION VALUES (70,'PLANNING','012-333-4444',NULL); -- 명시적 NULL 삽입 : NULL = '' 으로 적어도 된다
SELECT * FROM DIVISION;

INSERT INTO PERSONNEL (PNO, PNAME, JOB, STARTDATE, DNO) VALUES (1300,'CHO','SALESMAN',SYSDATE,10);
SELECT * FROM PERSONNEL;

SELECT STARTDATE, TO_CHAR(STARTDATE,'YYYY-MM-DD') NALJJA FROM PERSONNEL;

-- 치환 변수 ----------------------------------------------------
SELECT PNO , PNAME, JOB, STARTDATE, DNO FROM PERSONNEL WHERE DNO = &DIV_DNO; -- CMD에서 확인가능! 특정 DNO를 보고싶을 때 입력

-- TABLE 생성 후... ------------------------------------------------------------------------------------
SELECT * FROM MANAGER;
SELECT * FROM SALESMAN;
SELECT * FROM BUSEO;     --- 4개의 레코드 : DIVISION TABLE에서 가져와도 4개밖에 되지 않음. WHY? DIVISION TABLE을 COMMIT하지 않았기 때문!
SELECT * FROM DIVISION;  --- 7개의 레코드 

COMMIT; -- SAVE

SELECT * FROM SAWON;
SELECT * FROM EXAM1;

SELECT * FROM TAB;

-- SUBQUERY -------------------------------------------------------

SELECT * FROM MANAGER;
DESC MANAGER;

SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER';

INSERT INTO MANAGER(PNO,PNAME,PAY,STARTDATE) 
SELECT PNO,PNAME,PAY,STARTDATE FROM PERSONNEL WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER;

-- 업무가 SALESMAN인 사원의 모든 정보를 SALESMAN 테이블로 복사

SELECT * FROM SALESMAN;

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN';

COMMIT;

SELECT * FROM SALESMAN;

-- UPDATE ---------------------------------------------------------------------------------------------

--사원번호가 1111인 사원의 부서를 30으로 수정
SELECT * FROM PERSONNEL WHERE PNO=1111;
UPDATE PERSONNEL SET DNO=30 WHERE PNO=1111;

UPDATE PERSONNEL SET JOB = 'SALESMAN',MANAGER = 1111, STARTDATE=SYSDATE, BONUS=200
WHERE PNO = 7711;

SELECT * FROM PERSONNEL;

COMMIT;

----------------------------------------------------------
SELECT * FROM SAWON;

UPDATE SAWON SET DNO=20;

ROLLBACK; -- 취소 : 바로 전 COMMIT까지로 돌아감

-- SUBQUERY로 수정 ---------------------------------------
SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');

UPDATE PERSONNEL SET JOB = 'SALESMAN'
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');

-- JOIN문으로 수정 : ORACLE(X), MS-SQL(O) -----------------
SELECT A.*
FROM PERSONNEL A,DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES'; 

UPDATE PERSONNEL SET JOB = 'SALESMAN'
FROM PERSONNEL A,DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES'; 

DELETE PERSONNEL WHERE PNO = 7711; -- FROM 생략 가능
DELETE FROM PERSONNEL WHERE PNO = 7711;

COMMIT;

-- DELETE ---------------------------------------------------------------------------------------------

-- 사원번호가 1300인 사원을 삭제하시오
SELECT * FROM PERSONNEL WHERE PNO = 1300;

DELETE FROM PERSONNEL WHERE PNO = 1300;

SELECT * FROM PERSONNEL;
-------------------------------------

SELECT * FROM SAWON;

DELETE SAWON; -- 테이블 구조는 있으나 레코드가 모두 삭제되었음!

ROLLBACK;

-- 부서명이 BUSAN인 부서의 부서번호를 찾아 그 부서에 해당하는 직원을 삭제하시오

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION= 'BUSAN');

DELETE PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION= 'BUSAN');

COMMIT;

----------------------------------------------------------------------------------------------------
-- DML문장 실행시 에러 -----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- INSERT 에러 -------------------------------------
SELECT * FROM PERSONNEL;
DESC PERSONNEL;

INSERT INTO PERSONNEL (PNO,PNAME,DNO) VALUES (1300,'SONG',99); -- X : PERSONNEL_PNO_PK 에러 //  PK :  NULL 불가, 중복 불가

SELECT * FROM USER_CONSTRAINTS; -- KEY에 관련된 정보를 찾을 수 있는 곳

-- UPDATE 에러 -------------------------------------
SELECT * FROM PERSONNEL;
SELECT * FROM DIVISION;

SELECT * FROM USER_CONSTRAINTS; -- FK : 다른 테이블의 컬럼을 참조 / 영향을 받음

UPDATE PERSONNEL SET DNO = 90; -- X : 참조받는 테이블의 컬럼에 90 값이 없음

-- DELETE 에러 -------------------------------------
DELETE DIVISION WHERE DNO = 30; -- X : PERSONNEL에서 30 값을 쓰고 있어서 DIVISION의 DNO = 30을 지울 수 없다

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

/*
3. DDL (Data Definition Language) : 데이터정의어 - 데이터를 생성, 수정, 삭제하는 등의 데이터의 전체의 골격을 결정
                                    종류 : CREATE, ALTER, DROP, RENAME
                                    특징 : AUTO COMMIT이며 ROLLBACK 불가

 OBJECT : TABLE, INDEX, SYNONYM, SEQUENCE, VIEW    

*/

/*

< TABLE의 DATA TYPE >

- CHAR : 문자 (고정길이) : HEADER=5 라고 지정하는 스타일.
  주민번호, 우편번호 등과 같이 사이즈가 정해진 곳에 쓰임 / 
  낭비가 심하지만 하나의 HEADER를 쓰기때문에 읽는 속도가 빠르다

- VARCHAR2: 문자 (가변길이) : 전체 HEADER=? 각각의 HEADER를 읽고 데이터를 읽고의 반복, 데이터가 들어가지 않으면 OS에 빈 공간을 반납
  댓글창, 문자나 카톡처럼 변동성이 클 때 사용 / 낭비를 줄이지만 헤더를 각각 비교하므로 느림

NUMBER(P,S) : 숫자

DATE : 날짜(고정길이)

LONG : 문자(가변길이, 2GB)

*/

-- CREATE -----------------------------------------------------------------

CREATE TABLE BUSE01
(DNO NUMBER(2), 
DNAME VARCHAR(14),
ZIPCODE CHAR(7));

SELECT * FROM BUSE01;
DESC BUSE01;

INSERT INTO BUSE01 VALUES (10,'AAA','123-123');
INSERT INTO BUSE01 VALUES (20,'BBB','222-333');

/*

1.영문자 시작(30자)
2.영문자,숫자 사용가능(공백허용안함)
3.특수문자는 _,$,#만 사용가능
4.이름은 중복허용안함
5.컬럼명이 틀려야함
6.예약어 사용못함 : 테이블 이름을 SELECT와 같은 예약어를 쓸 수 없다

--사용가능한 이름
Sawon, P_NO, Division10, Name_Rule

--사용불가능한 이름
10division, $sal, p-no, Alter

*/

CREATE TABLE CUSTOM
(ID CHAR(5) CONSTRAINT CUSTOM_ID_PK PRIMARY KEY, -- PRIMARY KEY : 테이블에 하나만 넣을 수 있는 값! 중복 불가/NOT NULL
PWD CHAR(3),
NAME CHAR(6),
ADDR VARCHAR2(50),
ZIP CHAR(5),
BIRTH DATE,
JUMIN CHAR(14),
AGE NUMBER,
TEL CHAR(10));

DESC CUSTOM; 
SELECT * FROM USER_CONSTRAINTS;

INSERT INTO CUSTOM VALUES ('A001','123','SUZI','서울','12345','94-10-10','941010-2123456',29,'0101231234');

SELECT * FROM CUSTOM;

INSERT INTO CUSTOM VALUES ('','123','INNA','서울','12345','94-10-10', -- NULL값 에러
'941010-2123456',29,'0101231234'); -- 에러 이름 정해주지 않아서 ORACLE이 자동으로 만들어줌 : SYS_C007018

INSERT INTO CUSTOM VALUES ('A001','123','INA','서울','12345',SYSDATE, -- 중복 에러
'941010-2123456',29,'0101231234');

-- CONSTRAINT_NAME 쓰는 방법 : TABLE_CALUMN_PK

DROP TABLE CUSTOM; -- 테이블 삭제

SELECT * FROM CUSTOM; -- 검색 불가

SELECT * FROM USER_CONSTRAINTS;

COMMIT;

-----------1/27----------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE SALESMAN1
AS
SELECT PNO, PNAME, JOB, PAY FROM PERSONNEL
WHERE JOB = 'SALESMAN';

SELECT * FROM SALESMAN1;

CREATE TABLE MANAGER1
AS 
SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER1;

CREATE TABLE PAY3000
AS
SELECT * FROM PERSONNEL WHERE PAY>=3000;

SELECT * FROM PAY3000;

SELECT * FROM PERSONNEL;

CREATE TABLE MON12
AS 
SELECT * FROM PERSONNEL 
WHERE EXTRACT(MONTH FROM STARTDATE) = '12';

SELECT * FROM MON12;

CREATE TABLE MON4
AS 
SELECT * FROM PERSONNEL 
WHERE TO_CHAR(STARTDATE,'MM') = '04';

DROP TABLE MON4 PURGE; -- 테이블 완전 삭제

CREATE TABLE ANALYST (NUM,NAME,JOB,DNUM) -- 컬럼명 변경
AS
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE JOB = 'ANALYST';

SELECT * FROM ANALYST;

-- 부서번호가 10인 부서의 총급여의 정보를 DIV10 테이블로 만드시오

CREATE TABLE DIV10
AS
SELECT DNO, SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO = 10;

SELECT * FROM DIV10;

CREATE TABLE DIV11
AS
SELECT DNO, SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO;

SELECT * FROM DIV11;

DROP TABLE DIV11 PURGE; -- PURGE는 완전 삭제 / 없으면 쓰레기통에 들어감

SELECT * FROM PERSONNEL;

CREATE TABLE SAWON1
AS
SELECT * FROM PERSONNEL
WHERE 0=1; -- 조건이 맞지 않으니 데이터가 나오지 않는다 : 컬럼명만 나옴 / 0=1000 으로 써도 상관없음

SELECT * FROM SAWON1;

DESC PERSONNEL; 
DESC SAWON1; -- PK는 복사되지 않는다

SELECT * FROM SALESMAN1;
DESC SALESMAN1;

-- ALTER ( ADD, MODIFY, DROP ) --------------------------------------------

-- 1. ADD -------------------------------------------------------------
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2)); -- ALTER : 테이블을 수정할 때 쓰는 명령어

SELECT * FROM SALESMAN1;

ALTER TABLE SALESMAN1
ADD (JUMIN CHAR(14), ZIP CHAR(7)); -- 컬럼을 생성하면서 데이터를 넣으면 L TABLE : 최악

ALTER TABLE SALESMAN1
ADD BIGI VARCHAR2(10) DEFAULT('AA'); -- AA가 기본값으로 들어감

ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIAGE_CK
CHECK (MARRIAGE IN ('SINGLE','MARRIED'))); -- CHECK : 특정 값만 들어갈 수 있음

INSERT INTO SALESMAN1 VALUES 
(111,'CHO','SALESMAN',2000,10,'11111','123-123','BB','SINGLE'); 

INSERT INTO SALESMAN1 VALUES 
(111,'CHO','SALESMAN',2000,10,'11111','123-123','BB','SOLO'); -- SOLO라는 값을 넣을 수 없음

/*
-- 오라클의 제약조건
Primary Key (PK) :  기본키 / 중복X, 한테이블에 하나, NOT NULL
Unique Key (UK) : 중복x / NULL은 오라클 계속 사용 가능하고 MS는 한번만 가능  
Check Key :  
Not null Key : 반드시 들어가야 하는 값 EX) 이름
Foreign Key (FK) : 외부 참조키

-- 무결성? : 데이터베이스에 저장된 데이터 값과 그것이 표현하는 현실 세계의 실제값이 일치하는 정확성을 의미한다.

-- 관계형 데이터베이스 : 표 형태로 데이터를 만드는 것 / 테이블화

-- 정규화 : 테이블을 세분화시키는 작업
-- 역 정규화 : 테이블을 붙이는 작업
-- ERD : 정규화 자동으로 시킴

*/

SELECT * FROM SALESMAN1;
DESC SALESMAN1;

ALTER TABLE SALESMAN1 ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO); -- 기존키에 PK 추가

-- MANAGER1테이블에 COMM컬럼을 NUMBER(5)로 추가
SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1 ADD (COMM NUMBER(5));

-- MANAGER1 테이블에 PNO컬럼에 PK추가

ALTER TABLE MANAGER1 ADD PRIMARY KEY(PNO);

SELECT * FROM USER_CONSTRAINTS;

-- 2. MODIFY (수정) -------------------------------------------------------
SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1 MODIFY PNAME VARCHAR2(16); -- PNAME VACHAR(9->16)

ALTER TABLE MANAGER1 MODIFY PNAME VARCHAR2(7);

-- 3. DROP(컬럼, 제약조건) ------------------------------------------------

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE MANAGER1 DROP CONSTRAINT SYS_C007010;

ALTER TABLE SALESMAN1 DROP PRIMARY KEY;

ALTER TABLE DIVISION DROP PRIMARY KEY; --X  PERSONNEL가 참조(FK)하고 있어서 삭제 불가

ALTER TABLE DIVISION DROP PRIMARY KEY CASCADE; --강제 삭제

SELECT * FROM USER_CONSTRAINTS;

DESC SALESMAN1;

SELECT * FROM SALESMAN1;

ALTER TABLE SALESMAN1 DROP COLUMN MARRIAGE;

--------------------------------------------------------------------------------------------------- ★ 다음에 다시 보기 ★
-- SET UNUSED : 삭제하려는 컬럼을 안보이게 하는 것 / 비활성화! : 플래그를 꽂아놓다 ----------------

ALTER TABLE SALESMAN1 SET UNUSED COLUMN DNO;

ALTER TABLE SALESMAN1 DROP UNUSED COLUMNS; -- 진짜 삭제 : 시간 오래 걸림

SELECT * FROM TAB;

DROP TABLE MANAGER1;-- MANAGER1이 삭제되면서 이상한 글씨 하나 더 생성

SELECT * FROM RECYCLEBIN;

SELECT OBJECT_NAME,ORIGINAL_NAME,DROPTIME FROM RECYCLEBIN;

-- FALSHBACK : 복원 ------------------------------------

FLASHBACK TABLE MANAGER1 TO BEFORE DROP;
FLASHBACK TABLE "BIN$THB7UHv9T0C6mwsrYTIFPA==$0" TO BEFORE DROP; -- 위와 동일

SELECT * FROM "BIN$qGMbOEClQMW9ziu0Ui7tCg==$0";

SELECT * FROM TAB;

DROP TABLE SALESMAN1 PURGE; -- 영구 삭제

SELECT * FROM RECYCLEBIN;

PURGE RECYCLEBIN; -- 쓰레기통 비우기

--★ 다음에 다시 보기 끝 ★

-- TRUNCATE/DELETE --------------------------------------

SELECT * FROM PERSONNEL;

DELETE PERSONNEL; -- 데이터 삭제

SELECT * FROM PERSONNEL;

ROLLBACK; -- 삭제 취소

SELECT * FROM PERSONNEL;

---------------------------------------

TRUNCATE TABLE PERSONNEL;-- 데이터를 지움 : 테이블을 지우는 것이 아님!!!

SELECT * FROM PERSONNEL;

ROLLBACK; -- 취소..?

SELECT * FROM PERSONNEL; -- 취소 안?! TRUNCATE는 무조건 삭제!

-- RENAME ---------------------------------------------

SELECT * FROM TAB;

SELECT * FROM PAY3000;

RENAME PAY3000 TO HIGHPAY; --테이블의 이름 바꿈

SELECT * FROM HIGHPAY;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

/*
5. DCL ( Data Control LANGUAGE )
   - GRANT : USER나 OBJECT에 권한을 부여할 때 사용
   - REVOKE : USER나 OBJECT에 권한을 회수할 때
*/

-- CREATE ---------------------------

CREATE USER TEST 
IDENTIFIED BY TEST
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP; --권한이 없어서 만들 수 없음 : SYSTEM에 가서 KIM에게 CREATE 권한 주기

CREATE USER SUZI
IDENTIFIED BY SUZI
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;

CREATE USER SUZI2
IDENTIFIED BY SUZI2
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;


-- OBJECT 권한 --------------------------------------------------------

GRANT SELECT ON PERSONNEL TO SUZI;
GRANT SELECT, INSERT,DELETE ON DIVISION TO SUZI;

SELECT * FROM PERSONNEL;

COMMIT;

SELECT * FROM USER_TAB_PRIVS_MADE; -- 누구에게 무슨 권한을 줬는지 나온다!

GRANT SELECT ON KIM.DIVISION TO PUBLIC;

-----------------------------------------------------------------------

REVOKE SELECT ON DIVISION FROM PUBLIC;

REVOKE SELECT ON PERSONNEL FROM SUZI;

REVOKE SELECT, INSERT,DELETE ON DIVISION FROM SUZI;

SELECT * FROM USER_TAB_PRIVS_MADE;

-- ROLE 

SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE = 'CONNECT' OR ROLE = 'RESOURCE';

-- 1/28 ------------------------------------------------------------------------------------------------------------------------------------------------

-- PRIMARY KEY 만들기

CREATE TABLE CUSTOMER 
(ID NUMBER(4) CONSTRAINT CUSTOMER_ID_PK PRIMARY KEY,
NAME VARCHAR2(10),
NO NUMBER(4));

SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE ORDERS
(NO NUMBER(4),
SNO NUMBER(4), 
NAME VARCHAR2(10),
COUNT NUMBER(7),
CONSTRAINT ORDERS_NO_PK PRIMARY KEY(NO)); -- TABLE LEVEL

-- FOREIGN KEY --------------------------------------------------------

SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

ALTER TABLE CUSTOMER
ADD CONSTRAINT CUSTOMER_NO_FK FOREIGN KEY(NO)
REFERENCES ORDERS(NO); -- CUSTOMER 의 NO 가 ORDERS의 NO를 참조한다!
 
SELECT * FROM USER_CONSTRAINTS;
 
CREATE TABLE CATALOGS
(CATALOGNO NUMBER(4) CONSTRAINT CATALOGS_CATALOGNO_PK PRIMARY KEY,
NAME VARCHAR2(10),
NO NUMBER(4) CONSTRAINT CATALOGS_NO_FK REFERENCES ORDERS(NO));

SELECT * FROM ORDERS;

INSERT INTO ORDERS VALUES (10,111,'AAA',11);
INSERT INTO ORDERS VALUES (20,222,'BBB',22);
INSERT INTO ORDERS VALUES (30,333,'CCC',33);
COMMIT;

SELECT * FROM CUSTOMER;

INSERT INTO CUSTOMER VALUES(111,'SUZI',10);
INSERT INTO CUSTOMER VALUES(222,'INNA',30);
INSERT INTO CUSTOMER VALUES(333,'INSUN',40); -- FK 에러

SELECT * FROM CATALOGS;

INSERT INTO CATALOGS VALUES (777,'SUZI',20);
INSERT INTO CATALOGS VALUES (888,'INNA',30);
INSERT INTO CATALOGS VALUES (999,'INSUN',40); -- FK 에러

DELETE ORDERS WHERE NO = 20; -- 참조하고 있는 데이터가 있으므로 삭제 불가

DELETE CATALOGS WHERE NO=20;

SELECT  * FROM CATALOGS;

COMMIT;

-- UNIQUE KEY ---------------------------------------------------------
-- ORACLE : NULL허용 // MS-SQL : 1번만 허용
-- PRIMARY KEY도 UNIQUE KEY의 한 종류

SELECT * FROM ORDERS;
DESC ORDERS;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_UK UNIQUE(SNO);

SELECT * FROM ORDERS;

INSERT INTO ORDERS VALUES(40,'','DDD',44);
INSERT INTO ORDERS VALUES(50,'','EEE',55);
INSERT INTO ORDERS VALUES(60,333,'FFF',66); --X : 중복을 허락하지 않음!!

-- CHECK KEY ------------------------------------------------------------

SELECT * FROM ORDERS;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_CK CHECK(SNO BETWEEN 100 AND 500);

INSERT INTO ORDERS VALUES (60,501,'FFF',66); -- X : SNO 범위값을 벗어남

-- NOT NULL -------------------------------------------------------------

ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_NAME_NN CHECK(NAME IS NOT NULL);

DESC ORDERS;

SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE TEST1 (NO NUMBER(4) CONSTRAINT TEST1_NO_NN NOT NULL);

ALTER TABLE TEST1 DROP CONSTRAINT TEST1_NO_NN;

ALTER TABLE ORDERS DROP CONSTRAINT ORDERS_NO_PK; -- 어떤 FK가 참조되고 있다 (CASCADE쓰면 완전 삭제)

-- DICTIONARY -----------------------------------------------------------

SELECT COUNT(*) FROM DICTIONARY;

SELECT * FROM USER_CONSTRAINTS; -- 제약조건에 대한 정보를 담고 있는 DICTIONARY중 하나!

/*

크기  : USER_ < ALL_ < DBA_

USER_ : USER 소유의 OBJECT정보
ALL_  : USER에게 ACCESS가 허용된 OBJECT 정보
DBA_  : DBA 권한을 가진 USER가 ACCESS 할 수 있는 정보 (관리자이기 때문에 다 볼수 있음)
V$    : SERVER의 성능에 관한 정보

*/

SELECT * FROM V$VERSION; 

SELECT * FROM ALL_CONSTRAINTS;
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'ORDERS';

SELECT * FROM DBA_CONS_COLUMNS; -- SYS, 관리자 만 사용
SELECT * FROM USER_TABLES;
SELECT * FROM USER_SYS_PRIVS;

-- VIEW : 보안을 위한 가상 테이블, 테이블의 특정 데이터만 볼 수 있도록 하기 위해서 만듬

CREATE VIEW PER10_V
AS
SELECT * FROM PERSONNEL WHERE DNO=10;

SELECT * FROM USER_VIEWS;

SELECT * FROM PER10_V; -- 얘는 존재하지 않는 가상 테이블 

SELECT * FROM PER10_V WHERE PNO=1111;

CREATE VIEW PER20_V
AS
SELECT PNO,PNAME,MANAGER,PAY,DNO FROM PERSONNEL;

SELECT * FROM PER20_V;

CREATE VIEW PER_AVG
AS 
SELECT DNO,AVG(PAY) 평균, SUM(PAY) 합계
FROM PERSONNEL
GROUP BY DNO;

SELECT * FROM PER_AVG;

SELECT * FROM PER_AVG WHERE DNO = 10;
SELECT * FROM PER_AVG WHERE 합계 > 8000;

INSERT INTO PER20_V VALUES (1234,'JJJ', 1001, 2000,20);

SELECT * FROM PER_AVG;

SELECT * FROM PERSONNEL;

UPDATE PER20_V SET PNAME = 'AAA' WHERE PNO = 1234;

DELETE PER20_V WHERE PNO = 1234;

-- SIMPLE VIEW --------------------------------------------------------------
-- 하나의 테이블에서 만든 VIEW : INSERT, UPDATE, DELETE가 가능
-----------------------------------------------------------------------------

SELECT * FROM PERSONNEL;
DESC PERSONNEL;

CREATE VIEW PER
AS
SELECT PNAME, JOB, PAY FROM PERSONNEL;

SELECT * FROM PER;

INSERT INTO PER VALUES ('BBB','ACCOUNT', 3000); -- 불가 : PERSONNEL의 PK인 PNO에 NULL값이 들어가기 때문에 불가능하다

SELECT * FROM PER_AVG;

INSERT INTO PER_AVG VALUES(40,1234,5000); -- DNO자체 40에 대한 데이터가 없고, AVG는 산술되서 나온 데이터 뷰 / 실제 데이터가 들어가야 함

-- VIEW 수정 ----------------------------------------
-- CREATE -> ALTER (X)

SELECT * FROM USER_VIEWS; -- VIEW를 묶어서 보는 DICTIONARY

SELECT * FROM PER20_V;

CREATE OR REPLACE VIEW PER20_V --있으면 REPLACE 없으면 CREATE 해라
(번호, 이름, 직업, 부서번호)
AS 
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE DNO=20;

SELECT * FROM PER20_V;

-- VIEW 삭제 ---------------------------------------

DROP VIEW PER_AVG;

SELECT * FROM PER_AVG;

-- COMPLEX VIEW --------------------------------------------------------------
-- JOIN으로 2개 이상의 테이블로 만든 VIEW는 INSERT, UPDATE, DELETE가 불가능
------------------------------------------------------------------------------

CREATE TABLE 고객정보
(고객번호 CHAR(10),
이름 CHAR(10));

CREATE TABLE 회사정보
(고객번호 CHAR(10),
회사명 CHAR(10));

INSERT INTO 고객정보 VALUES ('A001', '홍길동');
INSERT INTO 고객정보 VALUES ('A002', '이순신');
INSERT INTO 회사정보 VALUES ('A001', 'LG');
INSERT INTO 회사정보 VALUES ('A002', 'KAKAO');
COMMIT;

SELECT * FROM 고객정보;
SELECT * FROM 회사정보;

CREATE OR REPLACE VIEW 정보
AS 
SELECT K.고객번호, 이름,회사명
FROM 고객정보 K, 회사정보 H
WHERE K.고객번호 = H.고객번호;

SELECT * FROM 정보;

INSERT INTO 정보 VALUES ('A003', '배수지', 'SAMSUNG'); -- X

UPDATE 정보 SET 이름 = '배수지' WHERE 고객번호 = 'A001'; -- X

DELETE 정보 WHERE 고객번호 = 'A001'; -- X

-- TOP-N : 상위 몇퍼센트를 구하는 쿼리 -----------------------------
-- ROWNUM : SELECT하는 순간에 바로 붙이는 넘버 ---------------------

-- 가장 최근에 입사한 5명의 사원의 이름과 입사 날짜를 출력하시오

SELECT ROWNUM, PNAME, STARTDATE 
FROM (SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC) 
WHERE ROWNUM <= 5;

SELECT ROWNUM,PNAME FROM PERSONNEL;

-- SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1 = '경기도') A 

-- 범위값 구하기 ------------------------------------------------------------

SELECT ROWNUM, PNAME, STARTDATE 
FROM (SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC) 
WHERE ROWNUM BETWEEN 3 AND 6 ; -- 안나오는게 정상

SELECT RNUM,PNAME,STARTDATE FROM 
(SELECT ROWNUM RNUM,PNAME,STARTDATE FROM 
(SELECT PNAME,STARTDATE FROM PERSONNEL 
ORDER BY STARTDATE DESC)) 
WHERE RNUM>=3 AND RNUM<=6; --범위값 구하는거는 한번 더 감싸줘야함 ㅠ★

-- MS-SQL만 가능
-- SELECT TOP 5 PNAME, STARTDATAE FROM PERSONNEL ORDER BY STARTDATE DESC;
-- SELECT TOP 5 PERCENT PNAME, STARTDATAE FROM PERSONNEL ORDER BY STARTDATE DESC;-- 상위 5%

-- SYNONYM(동의어) -----------------------------------------------------------

CREATE OR REPLACE SYNONYM INSA FOR KIM.PERSONNEL; -- ★왜안????
-- 스키마 : 임의의 사용자가 생성한 모든 데이터베이스 객체(object))들을 말하며, 스키마 이름은 그 사용자(user)의 이름과 같음 

SELECT * FROM INSA;
SELECT * FROM KIM.PERSONNEL;
SELECT * FROM PERSONNEL;

SELECT ROWID,PNAME FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE PNO = 1111;

SELECT * FROM PERSONNEL;

CREATE INDEX PER_PAY_IDX ON PERSONNEL(PAY);

SELECT * FROM USER_INDEXES; -- 인덱스 

CREATE TABLE AAA
(ID NUMBER CONSTRAINT AAA_ID_IDX PRIMARY KEY,
NAME CHAR(10));

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;

-- SEQUENCE (일렬번호) -------------------------------------------------------
-- 자동으로 순차적으로 증가하는 순번을 반환하는 데이터베이스 객체 ------------
-- ex ) 게시판에 글이 하나 추가될때마다 글번호(PK)가 자동 생성되는 경우 ------
/*

CREATE SEQUENCE DIV_NO
INCREMENT BY 1                : 증가하는 숫자 폭 ( 여기선 1씩 )
START WITH 1                  : 시작하는 숫자 ( 여기선 1부터 )
MAXVALUE 100 || NOMAXVALUE    : 끝나는 숫자 ( 100 ) / 끝나는 지점 없음
CYCLE || NOCYCLE              : 주기 끝난 후, 반복 / 종료
CACHE 20 || NOCACHE           : 메모리상에 올림 / 안올림

*/

CREATE SEQUENCE PER_PNO
START WITH 90 -- 90부터
INCREMENT BY 1
MAXVALUE 99 -- 99까지
NOCYCLE  -- 주기가 끝났을 때 반복하지 마라
NOCACHE; -- 메모리상에 올리지 마라
 
SELECT * FROM USER_SEQUENCES;

-- NEXTVAL : SEQUENCE의 사용 번호(SEQUECE이름.NEXTVAL)
-- CURRVAL : SEQUENCE의 현재 번호(SEQUECE이름.CURRVAL)

SELECT PER_PNO.NEXTVAL FROM DUAL; -- 계속 실행할수록 1씩 증가

INSERT INTO DIVISION (DNO,DNAME,POSITION) VALUES (PER_PNO.NEXTVAL,'DEV','KOREA'); -- 임의 생성된 개인넘버 

SELECT * FROM DIVISION;

SELECT PER_PNO.CURRVAL FROM DUAL;

ALTER SEQUENCE PER_PNO 
INCREMENT BY 1
MAXVALUE 999
CACHE 10 -- 메모리상에 올려라
NOCYCLE;

SELECT * FROM USER_SEQUENCES;
