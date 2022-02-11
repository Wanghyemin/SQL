-- 1/21 ----------------------------------------------------------------------------------------------------------------------------------
-- Data < Row, Record = �� // Column, Field = �� < Table = ǥ < TableSpace < DB

/*
1. QUERY (data�˻���)
   SELECT 

2. DML (Data Maipulation Language) : ������ ���۾� - ���ǵ� �����ͺ��̽��� �Էµ� ���ڵ带 ��ȸ�ϰų� �����ϰų� ����
    INSERT, UPDATE, DELETE
    
3. DDL (Data Definition Language) : ������ ���Ǿ� - ���̺� ��ü Ȥ�� �����͸� ����, ����, �����ϴ� ���� �������� ��ü�� ����� ����
    CREATE, ALTER ( ADD, MODIFY, DROP ), DROP, RENAME : �ڵ����� Commit�� �Ǿ Rollback�� �Ұ���!
    
4. TCL (Transaction Control Language)
    COMMIT : ���� , ROLLBACK : ���
    
5. DCL (data control language)
    grant : ������ �ٶ� , revoke : ������ ������

*/

SELECT * FROM TAB;

SELECT * FROM PERSONNEL;
SELECT * FROM DIVISION; 
SELECT * FROM PAYGRADE;
SELECT * FROM BONUS;

SELECT * FROM PERSONNEL;
SELECT PNO, PNAME, PAY, DNO FROM PERSONNEL;

SELECT JOB FROM PERSONNEL;

SELECT DISTINCT JOB FROM PERSONNEL; -- DISTINCT : ������ ������� ������ �ϳ��� ������

-- ORDER BY : ���� ��ɾ� -------------------------------------------------------

SELECT PNO, PNAME, PAY FROM PERSONNEL 
ORDER BY PAY ASC; -- ��������	: ���� �ʾƵ� �⺻���� ��������

SELECT PNO, PNAME, PAY FROM PERSONNEL
ORDER BY PNAME; 

SELECT PNO, PNAME, PAY FROM PERSONNEL
ORDER BY PAY DESC; -- ��������

SELECT * FROM PERSONNEL 
ORDER BY STARTDATE;

-- �����ȣ�� ���� ������� �����Ͻÿ� --
SELECT * FROM PERSONNEL 
ORDER BY PNO DESC;
 
--------------------------------------------------------------------------------- 

-- DESC : ���̺��� ����
DESC PERSONNEL;
DESCRIBE PERSONNEL;

-- AS "��Ī" : �Ļ���, ���� ���� ---------------------------------------------------------
SELECT PNO, PNAME, PAY, PAY+1000 AS "���ʽ�" FROM PERSONNEL;

SELECT PNO,PNAME,PAY,PAY+1000 ���ʽ� FROM PERSONNEL ORDER BY PAY+1000;

SELECT PNO,PNAME,PAY,PAY+1000 ���ʽ� FROM PERSONNEL ORDER BY ���ʽ�; -- ��Ī���� �ᵵ �ȴ�

SELECT PNO,PNAME,PAY,PAY+1000 ���ʽ� FROM PERSONNEL ORDER BY 4;

SELECT * FROM PERSONNEL ORDER BY 4;

SELECT DNO, PNO, PNAME FROM PERSONNEL ORDER BY DNO DESC,PNO; -- DNO�� �������� ���� ��, �� �ȿ��� PNO���� �������� ����

SELECT DNO, PNO, PNAME FROM PERSONNEL ORDER BY DNO,PNO DESC; -- DNO�� �������� ���� ��, �� �ȿ��� PNO���� �������� ����

SELECT * FROM PERSONNEL ORDER BY MANAGER ASC; -- NULL���� �������� �� �������� ���ĵȴ�.

-- ����� �޿��� �ϳ�ġ ����(ANNUAL)�� ���Ͻÿ� // NVL
SELECT DNO,PNO, PNAME, PAY, (PAY*12)+NVL(BONUS,0) AS "ANNUAL" FROM PERSONNEL;

SELECT PAY, PAY-500 FROM PERSONNEL;

SELECT PNAME ||' '|| PNO FROM PERSONNEL; -- ||�� +�� �ǹ� (OR �ƴ�!)

-- WHERE : SELECT�� ���ǹ� -------------------------------------------------------

SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN';

SELECT * FROM PERSONNEL WHERE JOB = 'salesman'; -- X : ��ҹ��� ����

-- ������
-- =, <, >, <=, >=, <>

--�޿��� 1600�� ����� �˻��Ͻÿ�
SELECT * FROM PERSONNEL WHERE PAY = 1600;

SELECT * FROM  PERSONNEL WHERE PNO = 1116;

SELECT * FROM PERSONNEL WHERE PAY <= 2000;

-- 1990�� 12�� 17�Ͽ� �Ի��� ���
SELECT * FROM PERSONNEL WHERE STARTDATE='1990/12/17'; -- ��¥�� - �� / ��� �ν�
SELECT * FROM PERSONNEL WHERE STARTDATE='1990-12-17';

SELECT * FROM NLS_SESSION_PARAMETERS; -- RR/MM/DD

SELECT * FROM PERSONNEL WHERE JOB = 'CLERK';

SELECT * FROM PERSONNEL WHERE PNAME = 'JAMES';

-- �� ������ : AND, OR, NOT(!) -------------------------------------------------------

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

SELECT * FROM PERSONNEL WHERE JOB<>'SALESMAN' AND JOB<>'CLERK'; -- <> : ����

SELECT * FROM PERSONNEL WHERE JOB NOT IN ('SALESMAN','CLERK'); -- NOT IN : ����

SELECT * FROM PERSONNEL WHERE PAY >= 1000 AND PAY <= 2000;

SELECT * FROM PERSONNEL WHERE PAY BETWEEN 1000 AND 2000;

SELECT * FROM PERSONNEL WHERE STARTDATE BETWEEN '1991/09/01' AND '1991/09/30';

SELECT * FROM PERSONNEL WHERE DNO NOT IN (20,30);

SELECT * FROM PERSONNEL WHERE DNO NOT BETWEEN 20 AND 30; -- NOT BETWEEN : ���� 

SELECT * FROM PERSONNEL WHERE STARTDATE NOT BETWEEN '1991/05/01' AND '1992/02/24';

-- ����ȭ ǥ���� : REGEXP_ -----------------------------------------------------------------------------

SELECT * FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE PNAME LIKE 'A%'; -- PNAME = 'A%' : ù ���ڰ� 'A'�� ���ڸ� �˻��ϰ� �ȴ�.
-- %S �� �����ڸ�

SELECT * FROM PERSONNEL WHERE PNO LIKE '111_'; -- 4�ڸ��� �� '111_' : _�� ���� ���� ����

SELECT * FROM PERSONNEL WHERE PNO NOT LIKE '111%'; -- 4�ڸ��� �� '111%' : %�� ���� ���� ����

SELECT * FROM PERSONNEL WHERE PNO LIKE '1__1';

SELECT * FROM PERSONNEL WHERE STARTDATE LIKE '90%';

SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO,'11[^2]');

SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO,'1[1,2]');

SELECT REGEXP_SUBSTR('SUZI@NAVER.COM','[^$]+') ���̵� FROM DUAL; 

SELECT * FROM DUAL; -- DUMMY(������) ���� ��� ����

SELECT 100+300 FROM DUAL; -- �� �ϳ��� �����͸� ������

-- NULL --
SELECT MANAGER FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE MANAGER IS NULL;

SELECT * FROM PERSONNEL WHERE MANAGER IS NOT NULL;

-- ������ 'MANAGER'�̰� �޿��� 1500 �̻��� ��� �Ǵ� ������ 'SALESMAN'�� ����� ������ ã���ÿ�

SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER' AND PAY>= 1500 OR JOB = 'SALESMAN'; 

-- ������ 'PRESIDENT' �Ǵ� 'SALESMAN'�̰� �޿��� 1500�̻� ����� ������ ã���ÿ�

SELECT * FROM PERSONNEL WHERE JOB = 'PRESIDENT' OR JOB = 'SALESMAN' AND PAY >=1500;

SELECT * FROM PERSONNEL WHERE JOB IN ('PRESIDENT' , 'SALESMAN') AND PAY>=1500;

-- �Լ� ------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
-- ���� �Լ� -----------------------------------------------------------------------
------------------------------------------------------------------------------------

-- ROUND(�ݿø�) : ROUND(���ڳ� �÷���,�ݿø���ġ)----------------------

--  1  2  3  4  .  5  6  7
-- -4 -3 -2 -1  0  1  2  3

SELECT ROUND(45.275,1) FROM DUAL;--45.3
SELECT ROUND(45.275,-1) FROM DUAL;--50

SELECT PNO,PNAME,PAY,ROUND (PAY,-2) FROM PERSONNEL;

-- TRUNC(����) : 0�� ����� ������ ������ ���� -------------------------------

SELECT TRUNC(45.245,2)FROM DUAL;-- 45.24
SELECT TRUNC(45.245,-1)FROM DUAL;-- 40

SELECT PNO,PNAME,PAY, TRUNC(PAY,-2) FROM PERSONNEL;

-- CEIL/FLOOR(�ø�/����) : ������ ��ȯ ---------------------------------------

SELECT CEIL(461.21) FROM DUAL;
SELECT FLOOR(461.91) FROM DUAL;

-- MOD(������) ---------------------------------------------------------------
SELECT MOD(10,3)FROM DUAL;

-- ABS(���밪) ---------------------------------------------------------------
SELECT ABS(-123) FROM DUAL;

-- SIGN(��� 1, ���� -1, 0�� 0) ----------------------------------------------
SELECT SIGN(100), SIGN(-100), SIGN(0) FROM DUAL;

-- ���� / �� -----------------------------------------------------------------
SELECT POWER(2,4) FROM DUAL; 

-- ������ / ��Ʈ -------------------------------------------------------------
SELECT SQRT(9) FROM DUAL;

---------------------------------------------------------------------------------------------
-- �����Լ� ---------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

-- UPPER(�ҹ���-> �빮��) ---------------------------------------------------
SELECT UPPER ('oracle') FROM DUAL;

-- LOWER(�빮��-> �ҹ���) --------------------------------------------------- 
SELECT LOWER ('ORACLE') FROM DUAL;
 
--�Ʒ� ���� ���� ��� BUT 2��°�� �� ���� 
SELECT DNO, DNAME FROM DIVISION WHERE DNAME = UPPER('sales'); -- sales �� ���ڸ� �빮�ڷ� �ٲٰ� ��
SELECT DNO, DNAME FROM DIVISION WHERE LOWER(DNAME) = 'sales';  -- ��� DNAME�� �׸��� �ҹ��ڷ� �ٲٰ� ��

-- INITCAP ( ù ���ڸ� �빮�� ) ---------------------------------------------
SELECT INITCAP('korea fighting') FROM DUAL;

-- CONCAT ( �� ���� ���ڸ� ���� ����, �� �����ʹ� || ��� ) -----------------
SELECT PNAME || DNO FROM PERSONNEL;
SELECT CONCAT(PNAME,DNO) FROM PERSONNEL;

-- LENGTH -------------------------------------------------------------------
SELECT LENGTH('KOREA FIGHTING')FROM DUAL; -- 14

-- SUBSTR : SUBSTR( ����, �����ϴ� ��ġ, ���� ) -----------------------------
SELECT SUBSTR('ABCDEFG',1,3) FROM DUAL; --ABC
SELECT SUBSTR('ABCDEFG',3,2) FROM DUAL; --CD
SELECT SUBSTR('ABCDEFG',-3,2) FROM DUAL; --EF : -�� �ڿ������� 
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; --DEFG

-- INSTR : INSTR( ����, ã�����ϴ� ���� ) -----------------------------------
SELECT INSTR('ABCDEFG','C') FROM DUAL; -- 3

SELECT INSTR('AAAAAAA','A') FROM DUAL; -- 1 : ã���� �ϴ� ���ڰ� ���� �� �־ �� ù ��° ���ڿ��� ����
SELECT INSTR('AAAAAAA','a') FROM DUAL; -- 0 : ã�� �����Ͱ� ������ 0�� ���´� ( �ڹٴ� -1�̴� �򰥸��� ���� )

-- RPAD/LPAD : RPAD( ���ڳ� �÷���, ��ü ����, ���̰����ϴ� ����) ----------
SELECT RPAD(PNAME,15,'*') FROM PERSONNEL; -- �����ʿ� �ٿ��� �� 15�ڰ� �ǰ� ������

-- RTRIM/LTRIM -------------------------------------------------------------
SELECT RTRIM('ABBBB','B') FROM DUAL;
SELECT RTRIM('A    ',' ') FROM DUAL;

SELECT RTRIM ('ABBABB','B') FROM DUAL;

-----------------------------------------------------------------------------------------------
-- ��¥�Լ� -----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-- SYSDATE(GETDATE()) -------------------------------------------------------
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE +4 FROM DUAL; -- ���� ����

SELECT STARTDATE-1, STARTDATE, STARTDATE+1 FROM PERSONNEL;

-- KIM ����� ���ñ��� �ٹ��� ����� ���Ͻÿ�
SELECT SYSDATE, STARTDATE,CEIL((SYSDATE-STARTDATE)/365) || '��' YEARS  -- Į���� �� ���� ����
FROM PERSONNEL WHERE PNAME = 'KIM';

-- ROUND ---------------------------------------------------------------------

SELECT STARTDATE, ROUND(STARTDATE,'YEAR') FROM PERSONNEL; -- 6���� �������� �ݿø�
SELECT STARTDATE, ROUND(STARTDATE,'MONTH') FROM PERSONNEL; -- 15���� �������� �ݿø�
SELECT STARTDATE, ROUND(STARTDATE,'DAY') FROM PERSONNEL; -- �� ���ν� �������� �ݿø�

-- TRUNC ---------------------------------------------------------------------
SELECT STARTDATE, TRUNC(STARTDATE,'MONTH') FROM PERSONNEL;

-- MONTHS_BETWEEN ------------------------------------------------------------
SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'2002/06/01')) MONTH FROM DUAL;
SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'2002/06/01')/12) YEAR FROM DUAL;

-- LAST_DAY ------------------------------------------------------------------
SELECT STARTDATE,LAST_DAY(STARTDATE) FROM PERSONNEL;

-- NEXT_DAY ------------------------------------------------------------------
SELECT NEXT_DAY(SYSDATE,'�����') FROM DUAL;

-- ADD_MONTHS ----------------------------------------------------------------
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE,24) FROM DUAL;

-------------------------------------------------------------------------------------------
-- ��ȯ �Լ� ------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

-- TO_CHAR(���ڳ� ��¥�� ���ڷ� ����) ----------------------------------------

-- ��¥ ���� -----------------------------------------------
/*
 MM: �޼�(10)
 MON: 3���� ���̸�(MAR)
 MONTH: ���� Ǯ����(MARCH)
 DD : ���� ��¥��(22)
 D : ���� �ϼ�(2)
 DY: �����̸�(��)
 DAY : ���� Ǯ����(ȭ����)
 YYYY: 4�ڸ� ����
 YY: 2�ڸ� ����
 RM : �θ��� �޼�
*/

SELECT SYSDATE,TO_CHAR(SYSDATE,'D') FROM DUAL; -- ���Ǽ� : 1
SELECT SYSDATE,TO_CHAR(SYSDATE,'DY') FROM DUAL; -- ���� : ��
SELECT SYSDATE,TO_CHAR(SYSDATE,'RM') FROM DUAL; -- �� : 1
SELECT SYSDATE,TO_CHAR(SYSDATE,'MON') FROM DUAL; -- �� : 1��
SELECT SYSDATE,TO_CHAR(SYSDATE,'DAY') FROM DUAL; -- ���� : �Ͽ���
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'DD-MM-YY') FROM DUAL;

-- �ð����� -----------------------------------------------
/*
HH,HH12
HH24
MI: ��
SS: ��
SSSSS: ���� �ڸ���
AM,PM / A.M, P.M : ���� ����
*/

SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'AM HH:MI:SS') FROM DUAL;

-- ���� ���� -----------------------------------------------
/*
9 : �ڸ���(9999 -> 1218)
0 : �ڸ����� ��� 0���� ǥ��(09999 -> 01234)
PR: ����(9999,PR -> <1234>)
, : õ�ڸ���(9,999 -> 1,000)
*/

SELECT TO_CHAR(12506,'$099,999.99') FROM DUAL;

-- ���� --------------------------------------------
-- SP(SPELLING),TH
SELECT SYSDATE, TO_CHAR(SYSDATE,'DD')FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSP')FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDTH')FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'DDSPTH')FROM DUAL;

-- TO_DATE : ���ڸ� �ð����� ���� ��ȯ-------------
SELECT TO_DATE('22-1��-24','YY-MON-DD')+10 FROM DUAL;
SELECT TO_DATE('13:38','HH24:MI') FROM DUAL;

-- TO_NUMBER : ���� ������ ���ڷ� ��ȯ ------------
SELECT TO_NUMBER('123') + 100 FROM DUAL;
SELECT TO_NUMBER('ABC') FROM DUAL;-- X ���ڴ� ���ڷ� ���� �ȵȴ�

-- NVL : NULL���� Ư�� ���� �ο� ------------------
SELECT BONUS,NVL(BONUS,0)FROM PERSONNEL;

DESC PERSONNEL;
SELECT MANAGER,NVL(TO_CHAR(MANAGER), 'NON MANAGER') FROM PERSONNEL; -- MANAGER�� TYPE�� NUMBER������ NVL�� �Ļ����̱� ������ ���ڰ� �� �� ����


-- DECODE -------------------------------------------------------------------------------------
-- JAVA�� IF��ó�� ORACLE�� ���ǹ� : (�÷�,����1,����1,����2,����2,����������3)

-- �� ����� �޿��� �μ���ȣ�� 10�� ��� 10%, �μ���ȣ�� 20�� ��� 20% ������ �μ��� 30%�� ����
SELECT PNAME, BONUS, DNO, PAY, DECODE(DNO,10,PAY*1.1,20,PAY*1.2,PAY*1.3) "�λ��" FROM PERSONNEL;

-- �޿��� 3500 �̻��� ��쿡�� GRADE�� 'GOOD'�� �̸��� ��쿡�� 'POOR'�� ����Ͻÿ�(SIGN)
SELECT PNAME, PAY, DECODE (SIGN (PAY-3500),1,'GOOD','POOR') GRADE FROM PERSONNEL;

-- �׷� �Լ� : ������ �ϳ��� ������ ------------------------------------------------------------

-- COUNT ----------------------------------------
SELECT COUNT(*) FROM PERSONNEL;

-- �޿��� 3000�̻��� ����� ��
SELECT COUNT(*) FROM PERSONNEL WHERE PAY>=3000;

SELECT COUNT(MANAGER) FROM PERSONNEL;
SELECT COUNT(BONUS) FROM PERSONNEL;

-- AVG -----------------------------------------
SELECT AVG(PAY) FROM PERSONNEL;

-- SUM -----------------------------------------
SELECT SUM(PAY) FROM PERSONNEL;

-- MAX/MIN -------------------------------------
SELECT MAX(PAY),MIN(PAY) FROM PERSONNEL;

-- ����߿� �Ի����� ���� ������ ������ ã���ÿ�
SELECT MIN(STARTDATE) FROM PERSONNEL;

-- �Ի����� ���� ������ ����� ���Ի������ ������ ã���ÿ�
SELECT ROUND((MAX(STARTDATE)-MIN(STARTDATE))/365) AS �� FROM PERSONNEL;

-- �м� �Լ� -------------------------------------------------------------------------------------�� ������ �ٽ� ���ô� ��

-- DISTINCT, PARTITION --------------------------------------------
-- �� �μ��� ���
SELECT DISTINCT DNO, AVG(PAY) OVER(PARTITION BY DNO) FROM PERSONNEL;-- DISTINCT�� ���� ���� �ѹ��� ������

-- RANK -----------------------------------------------------------
-- ���� 1200�� �޴� ��� ����
SELECT * FROM PERSONNEL ORDER BY PAY DESC;

SELECT RANK(1200) WITHIN GROUP (ORDER BY PAY DESC) RANK FROM PERSONNEL;

SELECT PNAME,PAY,RANK() OVER (ORDER BY PAY DESC) RANK FROM PERSONNEL;

-- �� ������ �ٽ� ���ô� �� END

-- GROUP BY --------------------------------------------------------
SELECT PNAME FROM PERSONNEL; -- ���߰� ��ȯ ����

SELECT * FROM PERSONNEL WHERE PAY=1600; -- ���߰� ��ȯ ����

SELECT COUNT(*) FROM PERSONNEL; -- ���ϰ� ��ȯ ����

SELECT PNAME, MIN(STARTDATE) FROM PERSONNEL; --X : ���߰��� ���ϰ��� �� ���� ����� �� �� ����

-- ���� ���� --------------------------------------------------------
SELECT * FROM PERSONNEL WHERE STARTDATE=(SELECT MIN(STARTDATE) FROM PERSONNEL);

-- �μ��� ��� �޿��� ���Ͻÿ�
SELECT DNO, AVG(PAY) FROM PERSONNEL GROUP BY DNO;

-- EXTRANCT : ��¥���� ���� �κ� ���� -------------------------------
SELECT STARTDATE,
EXTRACT(YEAR FROM STARTDATE) ��, 
EXTRACT(MONTH FROM STARTDATE) ��, 
EXTRACT(DAY FROM STARTDATE) ��
FROM PERSONNEL;

-- �� �μ��� ��ձ޿��� ��ü ��ձ޿�(2972.5)���� ũ�� 'GOOD'
-- ������ 'POOR'�� ����Ͻÿ�

SELECT AVG(PAY) FROM PERSONNEL; -- ��ü ���

SELECT DNO, AVG(PAY), DECODE (SIGN(AVG(PAY)-(SELECT AVG(PAY) FROM PERSONNEL)),1,'GOOD','POOR') AS "GRADE"
FROM PERSONNEL
GROUP BY DNO HAVING DNO=20; -- GROUP BY�� ���ǹ��� HAVING / SELECT �϶��� WHERE

-- SELF JOIN -------------------------------------------------------
SELECT A.PNO �����ȣ, A.PNAME ����, CONCAT(B.PNO,B.PNAME) "������" -- CONCAT�� 2���� �÷��� ����
FROM PERSONNEL A, PERSONNEL B
WHERE A.MANAGER = B.PNO; 

-- NON EQUI JOIN (�� ���� ���̺��� Ư�� KEY�� ������ �� : PK, FK) -- ��
SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE;

SELECT PNAME, PAY, GRADE
FROM PERSONNEL, PAYGRADE
WHERE PAY BETWEEN LOWPAY AND HIGHPAY; 

-- ��Ÿ(OPERATION) -------------------------------------------------
/*
A = [1,2,5,6] B = [1,2,4]

A UNION ALL B = [1,2,5,6,1,2,4] : 
A UNION B = [1,2,4,5,6]			: AUB
A MINUS B = [5,6] 				: A-B
A INTERSECT B = [1,2]			: A������B
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
SELECT DNO FROM DIVISION -- (10,20,30,40) ������ (10,20,30) 
INTERSECT
SELECT DNO FROM PERSONNEL; -- 10,20,30

SELECT * FROM PERSONNEL;

-- PAREWISE(���ϴ� �÷��� ������ ���� �� ��) -------------------
SELECT PNAME,DNO,PAY,BONUS FROM PERSONNEL
WHERE (PAY,BONUS) IN (SELECT PAY, BONUS FROM PERSONNEL WHERE DNO = 30);

SELECT PNAME,DNO,PAY,NVL(BONUS,-1) FROM PERSONNEL -- NULL���� ó�� (������ -1�ƴϰ� 0�־���� ��)
WHERE (PAY,NVL(BONUS,-1)) IN (SELECT PAY, NVL(BONUS,-1) FROM PERSONNEL WHERE DNO = 30);

SELECT PNAME,DNO,PAY,BONUS FROM PERSONNEL
WHERE (PAY = 1600 AND BONUS = 500) OR (PAY = 1450 AND BONUS = 3000) 
OR (PAY = 1200 AND BONUS = 0) OR (PAY = 3550 AND BONUS IS NULL);


-- 1/26 --------------------------------------------------------------------------------------------------------------------------------------------------

/*
 2. DML(Data Maipulation Language) : ������ ���۾� - ���ǵ� �����ͺ��̽��� �Էµ� ���ڵ带 ��ȸ�ϰų� �����ϰų� ����
                                     Transaction �ϴ� �� :  INSERT, UPDATE, DELETE : ������ COMMIT����� �ϰ� ROLLBACK�� �����ϴ�.
                                     CRUD : CREATE, READ, UPDATE, DELETE
*/


-- INSERT -----------------------------------------------------------------------------------------------
SELECT * FROM DIVISION;
DESC DIVISION; -- DNO : NOT NULL : �ݵ�� ���� �Է��ؾ� �Ѵ�

INSERT INTO DIVISION VALUES (50, 'OPERAION','031-111-2222','DAEGU'); -- ��� �� �Է�
INSERT INTO DIVISION (DNO) VALUES (60); -- DNO�� 60�Է�, �������� �ڵ� NULL : �Ͻ��� NULL ���� 
INSERT INTO DIVISION (DNAME,POSITION) VALUES ('ACCOUNT','DAEJUN'); -- X : CANNOT INSERT NULL INTO 'DNO'

INSERT INTO PERSONNEL (PNO, PNAME, PAY, DNO) VALUES (7711,'YOUNG', 4000,20);
SELECT* FROM PERSONNEL;
DESC PERSONNEL;

INSERT INTO DIVISION VALUES (70,'PLANNING','012-333-4444',NULL); -- ����� NULL ���� : NULL = '' ���� ��� �ȴ�
SELECT * FROM DIVISION;

INSERT INTO PERSONNEL (PNO, PNAME, JOB, STARTDATE, DNO) VALUES (1300,'CHO','SALESMAN',SYSDATE,10);
SELECT * FROM PERSONNEL;

SELECT STARTDATE, TO_CHAR(STARTDATE,'YYYY-MM-DD') NALJJA FROM PERSONNEL;

-- ġȯ ���� ----------------------------------------------------
SELECT PNO , PNAME, JOB, STARTDATE, DNO FROM PERSONNEL WHERE DNO = &DIV_DNO; -- CMD���� Ȯ�ΰ���! Ư�� DNO�� ������� �� �Է�

-- TABLE ���� ��... ------------------------------------------------------------------------------------
SELECT * FROM MANAGER;
SELECT * FROM SALESMAN;
SELECT * FROM BUSEO;     --- 4���� ���ڵ� : DIVISION TABLE���� �����͵� 4���ۿ� ���� ����. WHY? DIVISION TABLE�� COMMIT���� �ʾұ� ����!
SELECT * FROM DIVISION;  --- 7���� ���ڵ� 

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

-- ������ SALESMAN�� ����� ��� ������ SALESMAN ���̺�� ����

SELECT * FROM SALESMAN;

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN';

COMMIT;

SELECT * FROM SALESMAN;

-- UPDATE ---------------------------------------------------------------------------------------------

--�����ȣ�� 1111�� ����� �μ��� 30���� ����
SELECT * FROM PERSONNEL WHERE PNO=1111;
UPDATE PERSONNEL SET DNO=30 WHERE PNO=1111;

UPDATE PERSONNEL SET JOB = 'SALESMAN',MANAGER = 1111, STARTDATE=SYSDATE, BONUS=200
WHERE PNO = 7711;

SELECT * FROM PERSONNEL;

COMMIT;

----------------------------------------------------------
SELECT * FROM SAWON;

UPDATE SAWON SET DNO=20;

ROLLBACK; -- ��� : �ٷ� �� COMMIT������ ���ư�

-- SUBQUERY�� ���� ---------------------------------------
SELECT * FROM DIVISION;

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');

UPDATE PERSONNEL SET JOB = 'SALESMAN'
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');

-- JOIN������ ���� : ORACLE(X), MS-SQL(O) -----------------
SELECT A.*
FROM PERSONNEL A,DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES'; 

UPDATE PERSONNEL SET JOB = 'SALESMAN'
FROM PERSONNEL A,DIVISION B
WHERE A.DNO = B.DNO AND DNAME = 'SALES'; 

DELETE PERSONNEL WHERE PNO = 7711; -- FROM ���� ����
DELETE FROM PERSONNEL WHERE PNO = 7711;

COMMIT;

-- DELETE ---------------------------------------------------------------------------------------------

-- �����ȣ�� 1300�� ����� �����Ͻÿ�
SELECT * FROM PERSONNEL WHERE PNO = 1300;

DELETE FROM PERSONNEL WHERE PNO = 1300;

SELECT * FROM PERSONNEL;
-------------------------------------

SELECT * FROM SAWON;

DELETE SAWON; -- ���̺� ������ ������ ���ڵ尡 ��� �����Ǿ���!

ROLLBACK;

-- �μ����� BUSAN�� �μ��� �μ���ȣ�� ã�� �� �μ��� �ش��ϴ� ������ �����Ͻÿ�

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION= 'BUSAN');

DELETE PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION= 'BUSAN');

COMMIT;

----------------------------------------------------------------------------------------------------
-- DML���� ����� ���� -----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

-- INSERT ���� -------------------------------------
SELECT * FROM PERSONNEL;
DESC PERSONNEL;

INSERT INTO PERSONNEL (PNO,PNAME,DNO) VALUES (1300,'SONG',99); -- X : PERSONNEL_PNO_PK ���� //  PK :  NULL �Ұ�, �ߺ� �Ұ�

SELECT * FROM USER_CONSTRAINTS; -- KEY�� ���õ� ������ ã�� �� �ִ� ��

-- UPDATE ���� -------------------------------------
SELECT * FROM PERSONNEL;
SELECT * FROM DIVISION;

SELECT * FROM USER_CONSTRAINTS; -- FK : �ٸ� ���̺��� �÷��� ���� / ������ ����

UPDATE PERSONNEL SET DNO = 90; -- X : �����޴� ���̺��� �÷��� 90 ���� ����

-- DELETE ���� -------------------------------------
DELETE DIVISION WHERE DNO = 30; -- X : PERSONNEL���� 30 ���� ���� �־ DIVISION�� DNO = 30�� ���� �� ����

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

/*
3. DDL (Data Definition Language) : ���������Ǿ� - �����͸� ����, ����, �����ϴ� ���� �������� ��ü�� ����� ����
                                    ���� : CREATE, ALTER, DROP, RENAME
                                    Ư¡ : AUTO COMMIT�̸� ROLLBACK �Ұ�

 OBJECT : TABLE, INDEX, SYNONYM, SEQUENCE, VIEW    

*/

/*

< TABLE�� DATA TYPE >

- CHAR : ���� (��������) : HEADER=5 ��� �����ϴ� ��Ÿ��.
  �ֹι�ȣ, �����ȣ ��� ���� ����� ������ ���� ���� / 
  ���� �������� �ϳ��� HEADER�� ���⶧���� �д� �ӵ��� ������

- VARCHAR2: ���� (��������) : ��ü HEADER=? ������ HEADER�� �а� �����͸� �а��� �ݺ�, �����Ͱ� ���� ������ OS�� �� ������ �ݳ�
  ���â, ���ڳ� ī��ó�� �������� Ŭ �� ��� / ���� �������� ����� ���� ���ϹǷ� ����

NUMBER(P,S) : ����

DATE : ��¥(��������)

LONG : ����(��������, 2GB)

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

1.������ ����(30��)
2.������,���� ��밡��(����������)
3.Ư�����ڴ� _,$,#�� ��밡��
4.�̸��� �ߺ�������
5.�÷����� Ʋ������
6.����� ������ : ���̺� �̸��� SELECT�� ���� ���� �� �� ����

--��밡���� �̸�
Sawon, P_NO, Division10, Name_Rule

--���Ұ����� �̸�
10division, $sal, p-no, Alter

*/

CREATE TABLE CUSTOM
(ID CHAR(5) CONSTRAINT CUSTOM_ID_PK PRIMARY KEY, -- PRIMARY KEY : ���̺� �ϳ��� ���� �� �ִ� ��! �ߺ� �Ұ�/NOT NULL
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

INSERT INTO CUSTOM VALUES ('A001','123','SUZI','����','12345','94-10-10','941010-2123456',29,'0101231234');

SELECT * FROM CUSTOM;

INSERT INTO CUSTOM VALUES ('','123','INNA','����','12345','94-10-10', -- NULL�� ����
'941010-2123456',29,'0101231234'); -- ���� �̸� �������� �ʾƼ� ORACLE�� �ڵ����� ������� : SYS_C007018

INSERT INTO CUSTOM VALUES ('A001','123','INA','����','12345',SYSDATE, -- �ߺ� ����
'941010-2123456',29,'0101231234');

-- CONSTRAINT_NAME ���� ��� : TABLE_CALUMN_PK

DROP TABLE CUSTOM; -- ���̺� ����

SELECT * FROM CUSTOM; -- �˻� �Ұ�

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

DROP TABLE MON4 PURGE; -- ���̺� ���� ����

CREATE TABLE ANALYST (NUM,NAME,JOB,DNUM) -- �÷��� ����
AS
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE JOB = 'ANALYST';

SELECT * FROM ANALYST;

-- �μ���ȣ�� 10�� �μ��� �ѱ޿��� ������ DIV10 ���̺�� ����ÿ�

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

DROP TABLE DIV11 PURGE; -- PURGE�� ���� ���� / ������ �������뿡 ��

SELECT * FROM PERSONNEL;

CREATE TABLE SAWON1
AS
SELECT * FROM PERSONNEL
WHERE 0=1; -- ������ ���� ������ �����Ͱ� ������ �ʴ´� : �÷��� ���� / 0=1000 ���� �ᵵ �������

SELECT * FROM SAWON1;

DESC PERSONNEL; 
DESC SAWON1; -- PK�� ������� �ʴ´�

SELECT * FROM SALESMAN1;
DESC SALESMAN1;

-- ALTER ( ADD, MODIFY, DROP ) --------------------------------------------

-- 1. ADD -------------------------------------------------------------
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2)); -- ALTER : ���̺��� ������ �� ���� ��ɾ�

SELECT * FROM SALESMAN1;

ALTER TABLE SALESMAN1
ADD (JUMIN CHAR(14), ZIP CHAR(7)); -- �÷��� �����ϸ鼭 �����͸� ������ L TABLE : �־�

ALTER TABLE SALESMAN1
ADD BIGI VARCHAR2(10) DEFAULT('AA'); -- AA�� �⺻������ ��

ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIAGE_CK
CHECK (MARRIAGE IN ('SINGLE','MARRIED'))); -- CHECK : Ư�� ���� �� �� ����

INSERT INTO SALESMAN1 VALUES 
(111,'CHO','SALESMAN',2000,10,'11111','123-123','BB','SINGLE'); 

INSERT INTO SALESMAN1 VALUES 
(111,'CHO','SALESMAN',2000,10,'11111','123-123','BB','SOLO'); -- SOLO��� ���� ���� �� ����

/*
-- ����Ŭ�� ��������
Primary Key (PK) :  �⺻Ű / �ߺ�X, �����̺� �ϳ�, NOT NULL
Unique Key (UK) : �ߺ�x / NULL�� ����Ŭ ��� ��� �����ϰ� MS�� �ѹ��� ����  
Check Key :  
Not null Key : �ݵ�� ���� �ϴ� �� EX) �̸�
Foreign Key (FK) : �ܺ� ����Ű

-- ���Ἲ? : �����ͺ��̽��� ����� ������ ���� �װ��� ǥ���ϴ� ���� ������ �������� ��ġ�ϴ� ��Ȯ���� �ǹ��Ѵ�.

-- ������ �����ͺ��̽� : ǥ ���·� �����͸� ����� �� / ���̺�ȭ

-- ����ȭ : ���̺��� ����ȭ��Ű�� �۾�
-- �� ����ȭ : ���̺��� ���̴� �۾�
-- ERD : ����ȭ �ڵ����� ��Ŵ

*/

SELECT * FROM SALESMAN1;
DESC SALESMAN1;

ALTER TABLE SALESMAN1 ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO); -- ����Ű�� PK �߰�

-- MANAGER1���̺� COMM�÷��� NUMBER(5)�� �߰�
SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1 ADD (COMM NUMBER(5));

-- MANAGER1 ���̺� PNO�÷��� PK�߰�

ALTER TABLE MANAGER1 ADD PRIMARY KEY(PNO);

SELECT * FROM USER_CONSTRAINTS;

-- 2. MODIFY (����) -------------------------------------------------------
SELECT * FROM MANAGER1;
DESC MANAGER1;

ALTER TABLE MANAGER1 MODIFY PNAME VARCHAR2(16); -- PNAME VACHAR(9->16)

ALTER TABLE MANAGER1 MODIFY PNAME VARCHAR2(7);

-- 3. DROP(�÷�, ��������) ------------------------------------------------

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE MANAGER1 DROP CONSTRAINT SYS_C007010;

ALTER TABLE SALESMAN1 DROP PRIMARY KEY;

ALTER TABLE DIVISION DROP PRIMARY KEY; --X  PERSONNEL�� ����(FK)�ϰ� �־ ���� �Ұ�

ALTER TABLE DIVISION DROP PRIMARY KEY CASCADE; --���� ����

SELECT * FROM USER_CONSTRAINTS;

DESC SALESMAN1;

SELECT * FROM SALESMAN1;

ALTER TABLE SALESMAN1 DROP COLUMN MARRIAGE;

--------------------------------------------------------------------------------------------------- �� ������ �ٽ� ���� ��
-- SET UNUSED : �����Ϸ��� �÷��� �Ⱥ��̰� �ϴ� �� / ��Ȱ��ȭ! : �÷��׸� �ȾƳ��� ----------------

ALTER TABLE SALESMAN1 SET UNUSED COLUMN DNO;

ALTER TABLE SALESMAN1 DROP UNUSED COLUMNS; -- ��¥ ���� : �ð� ���� �ɸ�

SELECT * FROM TAB;

DROP TABLE MANAGER1;-- MANAGER1�� �����Ǹ鼭 �̻��� �۾� �ϳ� �� ����

SELECT * FROM RECYCLEBIN;

SELECT OBJECT_NAME,ORIGINAL_NAME,DROPTIME FROM RECYCLEBIN;

-- FALSHBACK : ���� ------------------------------------

FLASHBACK TABLE MANAGER1 TO BEFORE DROP;
FLASHBACK TABLE "BIN$THB7UHv9T0C6mwsrYTIFPA==$0" TO BEFORE DROP; -- ���� ����

SELECT * FROM "BIN$qGMbOEClQMW9ziu0Ui7tCg==$0";

SELECT * FROM TAB;

DROP TABLE SALESMAN1 PURGE; -- ���� ����

SELECT * FROM RECYCLEBIN;

PURGE RECYCLEBIN; -- �������� ����

--�� ������ �ٽ� ���� �� ��

-- TRUNCATE/DELETE --------------------------------------

SELECT * FROM PERSONNEL;

DELETE PERSONNEL; -- ������ ����

SELECT * FROM PERSONNEL;

ROLLBACK; -- ���� ���

SELECT * FROM PERSONNEL;

---------------------------------------

TRUNCATE TABLE PERSONNEL;-- �����͸� ���� : ���̺��� ����� ���� �ƴ�!!!

SELECT * FROM PERSONNEL;

ROLLBACK; -- ���..?

SELECT * FROM PERSONNEL; -- ��� ��?! TRUNCATE�� ������ ����!

-- RENAME ---------------------------------------------

SELECT * FROM TAB;

SELECT * FROM PAY3000;

RENAME PAY3000 TO HIGHPAY; --���̺��� �̸� �ٲ�

SELECT * FROM HIGHPAY;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

/*
5. DCL ( Data Control LANGUAGE )
   - GRANT : USER�� OBJECT�� ������ �ο��� �� ���
   - REVOKE : USER�� OBJECT�� ������ ȸ���� ��
*/

-- CREATE ---------------------------

CREATE USER TEST 
IDENTIFIED BY TEST
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP; --������ ��� ���� �� ���� : SYSTEM�� ���� KIM���� CREATE ���� �ֱ�

CREATE USER SUZI
IDENTIFIED BY SUZI
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;

CREATE USER SUZI2
IDENTIFIED BY SUZI2
DEFAULT TABLESPACE USERS 
TEMPORARY TABLESPACE TEMP;


-- OBJECT ���� --------------------------------------------------------

GRANT SELECT ON PERSONNEL TO SUZI;
GRANT SELECT, INSERT,DELETE ON DIVISION TO SUZI;

SELECT * FROM PERSONNEL;

COMMIT;

SELECT * FROM USER_TAB_PRIVS_MADE; -- �������� ���� ������ ����� ���´�!

GRANT SELECT ON KIM.DIVISION TO PUBLIC;

-----------------------------------------------------------------------

REVOKE SELECT ON DIVISION FROM PUBLIC;

REVOKE SELECT ON PERSONNEL FROM SUZI;

REVOKE SELECT, INSERT,DELETE ON DIVISION FROM SUZI;

SELECT * FROM USER_TAB_PRIVS_MADE;

-- ROLE 

SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE = 'CONNECT' OR ROLE = 'RESOURCE';

-- 1/28 ------------------------------------------------------------------------------------------------------------------------------------------------

-- PRIMARY KEY �����

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
REFERENCES ORDERS(NO); -- CUSTOMER �� NO �� ORDERS�� NO�� �����Ѵ�!
 
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
INSERT INTO CUSTOMER VALUES(333,'INSUN',40); -- FK ����

SELECT * FROM CATALOGS;

INSERT INTO CATALOGS VALUES (777,'SUZI',20);
INSERT INTO CATALOGS VALUES (888,'INNA',30);
INSERT INTO CATALOGS VALUES (999,'INSUN',40); -- FK ����

DELETE ORDERS WHERE NO = 20; -- �����ϰ� �ִ� �����Ͱ� �����Ƿ� ���� �Ұ�

DELETE CATALOGS WHERE NO=20;

SELECT  * FROM CATALOGS;

COMMIT;

-- UNIQUE KEY ---------------------------------------------------------
-- ORACLE : NULL��� // MS-SQL : 1���� ���
-- PRIMARY KEY�� UNIQUE KEY�� �� ����

SELECT * FROM ORDERS;
DESC ORDERS;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_UK UNIQUE(SNO);

SELECT * FROM ORDERS;

INSERT INTO ORDERS VALUES(40,'','DDD',44);
INSERT INTO ORDERS VALUES(50,'','EEE',55);
INSERT INTO ORDERS VALUES(60,333,'FFF',66); --X : �ߺ��� ������� ����!!

-- CHECK KEY ------------------------------------------------------------

SELECT * FROM ORDERS;

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_CK CHECK(SNO BETWEEN 100 AND 500);

INSERT INTO ORDERS VALUES (60,501,'FFF',66); -- X : SNO �������� ���

-- NOT NULL -------------------------------------------------------------

ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_NAME_NN CHECK(NAME IS NOT NULL);

DESC ORDERS;

SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE TEST1 (NO NUMBER(4) CONSTRAINT TEST1_NO_NN NOT NULL);

ALTER TABLE TEST1 DROP CONSTRAINT TEST1_NO_NN;

ALTER TABLE ORDERS DROP CONSTRAINT ORDERS_NO_PK; -- � FK�� �����ǰ� �ִ� (CASCADE���� ���� ����)

-- DICTIONARY -----------------------------------------------------------

SELECT COUNT(*) FROM DICTIONARY;

SELECT * FROM USER_CONSTRAINTS; -- �������ǿ� ���� ������ ��� �ִ� DICTIONARY�� �ϳ�!

/*

ũ��  : USER_ < ALL_ < DBA_

USER_ : USER ������ OBJECT����
ALL_  : USER���� ACCESS�� ���� OBJECT ����
DBA_  : DBA ������ ���� USER�� ACCESS �� �� �ִ� ���� (�������̱� ������ �� ���� ����)
V$    : SERVER�� ���ɿ� ���� ����

*/

SELECT * FROM V$VERSION; 

SELECT * FROM ALL_CONSTRAINTS;
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'ORDERS';

SELECT * FROM DBA_CONS_COLUMNS; -- SYS, ������ �� ���
SELECT * FROM USER_TABLES;
SELECT * FROM USER_SYS_PRIVS;

-- VIEW : ������ ���� ���� ���̺�, ���̺��� Ư�� �����͸� �� �� �ֵ��� �ϱ� ���ؼ� ����

CREATE VIEW PER10_V
AS
SELECT * FROM PERSONNEL WHERE DNO=10;

SELECT * FROM USER_VIEWS;

SELECT * FROM PER10_V; -- ��� �������� �ʴ� ���� ���̺� 

SELECT * FROM PER10_V WHERE PNO=1111;

CREATE VIEW PER20_V
AS
SELECT PNO,PNAME,MANAGER,PAY,DNO FROM PERSONNEL;

SELECT * FROM PER20_V;

CREATE VIEW PER_AVG
AS 
SELECT DNO,AVG(PAY) ���, SUM(PAY) �հ�
FROM PERSONNEL
GROUP BY DNO;

SELECT * FROM PER_AVG;

SELECT * FROM PER_AVG WHERE DNO = 10;
SELECT * FROM PER_AVG WHERE �հ� > 8000;

INSERT INTO PER20_V VALUES (1234,'JJJ', 1001, 2000,20);

SELECT * FROM PER_AVG;

SELECT * FROM PERSONNEL;

UPDATE PER20_V SET PNAME = 'AAA' WHERE PNO = 1234;

DELETE PER20_V WHERE PNO = 1234;

-- SIMPLE VIEW --------------------------------------------------------------
-- �ϳ��� ���̺��� ���� VIEW : INSERT, UPDATE, DELETE�� ����
-----------------------------------------------------------------------------

SELECT * FROM PERSONNEL;
DESC PERSONNEL;

CREATE VIEW PER
AS
SELECT PNAME, JOB, PAY FROM PERSONNEL;

SELECT * FROM PER;

INSERT INTO PER VALUES ('BBB','ACCOUNT', 3000); -- �Ұ� : PERSONNEL�� PK�� PNO�� NULL���� ���� ������ �Ұ����ϴ�

SELECT * FROM PER_AVG;

INSERT INTO PER_AVG VALUES(40,1234,5000); -- DNO��ü 40�� ���� �����Ͱ� ����, AVG�� ����Ǽ� ���� ������ �� / ���� �����Ͱ� ���� ��

-- VIEW ���� ----------------------------------------
-- CREATE -> ALTER (X)

SELECT * FROM USER_VIEWS; -- VIEW�� ��� ���� DICTIONARY

SELECT * FROM PER20_V;

CREATE OR REPLACE VIEW PER20_V --������ REPLACE ������ CREATE �ض�
(��ȣ, �̸�, ����, �μ���ȣ)
AS 
SELECT PNO,PNAME,JOB,DNO FROM PERSONNEL
WHERE DNO=20;

SELECT * FROM PER20_V;

-- VIEW ���� ---------------------------------------

DROP VIEW PER_AVG;

SELECT * FROM PER_AVG;

-- COMPLEX VIEW --------------------------------------------------------------
-- JOIN���� 2�� �̻��� ���̺�� ���� VIEW�� INSERT, UPDATE, DELETE�� �Ұ���
------------------------------------------------------------------------------

CREATE TABLE ������
(����ȣ CHAR(10),
�̸� CHAR(10));

CREATE TABLE ȸ������
(����ȣ CHAR(10),
ȸ��� CHAR(10));

INSERT INTO ������ VALUES ('A001', 'ȫ�浿');
INSERT INTO ������ VALUES ('A002', '�̼���');
INSERT INTO ȸ������ VALUES ('A001', 'LG');
INSERT INTO ȸ������ VALUES ('A002', 'KAKAO');
COMMIT;

SELECT * FROM ������;
SELECT * FROM ȸ������;

CREATE OR REPLACE VIEW ����
AS 
SELECT K.����ȣ, �̸�,ȸ���
FROM ������ K, ȸ������ H
WHERE K.����ȣ = H.����ȣ;

SELECT * FROM ����;

INSERT INTO ���� VALUES ('A003', '�����', 'SAMSUNG'); -- X

UPDATE ���� SET �̸� = '�����' WHERE ����ȣ = 'A001'; -- X

DELETE ���� WHERE ����ȣ = 'A001'; -- X

-- TOP-N : ���� ���ۼ�Ʈ�� ���ϴ� ���� -----------------------------
-- ROWNUM : SELECT�ϴ� ������ �ٷ� ���̴� �ѹ� ---------------------

-- ���� �ֱٿ� �Ի��� 5���� ����� �̸��� �Ի� ��¥�� ����Ͻÿ�

SELECT ROWNUM, PNAME, STARTDATE 
FROM (SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC) 
WHERE ROWNUM <= 5;

SELECT ROWNUM,PNAME FROM PERSONNEL;

-- SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1 = '��⵵') A 

-- ������ ���ϱ� ------------------------------------------------------------

SELECT ROWNUM, PNAME, STARTDATE 
FROM (SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC) 
WHERE ROWNUM BETWEEN 3 AND 6 ; -- �ȳ����°� ����

SELECT RNUM,PNAME,STARTDATE FROM 
(SELECT ROWNUM RNUM,PNAME,STARTDATE FROM 
(SELECT PNAME,STARTDATE FROM PERSONNEL 
ORDER BY STARTDATE DESC)) 
WHERE RNUM>=3 AND RNUM<=6; --������ ���ϴ°Ŵ� �ѹ� �� ��������� �С�

-- MS-SQL�� ����
-- SELECT TOP 5 PNAME, STARTDATAE FROM PERSONNEL ORDER BY STARTDATE DESC;
-- SELECT TOP 5 PERCENT PNAME, STARTDATAE FROM PERSONNEL ORDER BY STARTDATE DESC;-- ���� 5%

-- SYNONYM(���Ǿ�) -----------------------------------------------------------

CREATE OR REPLACE SYNONYM INSA FOR KIM.PERSONNEL; -- �ڿ־�????
-- ��Ű�� : ������ ����ڰ� ������ ��� �����ͺ��̽� ��ü(object))���� ���ϸ�, ��Ű�� �̸��� �� �����(user)�� �̸��� ���� 

SELECT * FROM INSA;
SELECT * FROM KIM.PERSONNEL;
SELECT * FROM PERSONNEL;

SELECT ROWID,PNAME FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE PNO = 1111;

SELECT * FROM PERSONNEL;

CREATE INDEX PER_PAY_IDX ON PERSONNEL(PAY);

SELECT * FROM USER_INDEXES; -- �ε��� 

CREATE TABLE AAA
(ID NUMBER CONSTRAINT AAA_ID_IDX PRIMARY KEY,
NAME CHAR(10));

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;

-- SEQUENCE (�ϷĹ�ȣ) -------------------------------------------------------
-- �ڵ����� ���������� �����ϴ� ������ ��ȯ�ϴ� �����ͺ��̽� ��ü ------------
-- ex ) �Խ��ǿ� ���� �ϳ� �߰��ɶ����� �۹�ȣ(PK)�� �ڵ� �����Ǵ� ��� ------
/*

CREATE SEQUENCE DIV_NO
INCREMENT BY 1                : �����ϴ� ���� �� ( ���⼱ 1�� )
START WITH 1                  : �����ϴ� ���� ( ���⼱ 1���� )
MAXVALUE 100 || NOMAXVALUE    : ������ ���� ( 100 ) / ������ ���� ����
CYCLE || NOCYCLE              : �ֱ� ���� ��, �ݺ� / ����
CACHE 20 || NOCACHE           : �޸𸮻� �ø� / �ȿø�

*/

CREATE SEQUENCE PER_PNO
START WITH 90 -- 90����
INCREMENT BY 1
MAXVALUE 99 -- 99����
NOCYCLE  -- �ֱⰡ ������ �� �ݺ����� ����
NOCACHE; -- �޸𸮻� �ø��� ����
 
SELECT * FROM USER_SEQUENCES;

-- NEXTVAL : SEQUENCE�� ��� ��ȣ(SEQUECE�̸�.NEXTVAL)
-- CURRVAL : SEQUENCE�� ���� ��ȣ(SEQUECE�̸�.CURRVAL)

SELECT PER_PNO.NEXTVAL FROM DUAL; -- ��� �����Ҽ��� 1�� ����

INSERT INTO DIVISION (DNO,DNAME,POSITION) VALUES (PER_PNO.NEXTVAL,'DEV','KOREA'); -- ���� ������ ���γѹ� 

SELECT * FROM DIVISION;

SELECT PER_PNO.CURRVAL FROM DUAL;

ALTER SEQUENCE PER_PNO 
INCREMENT BY 1
MAXVALUE 999
CACHE 10 -- �޸𸮻� �÷���
NOCYCLE;

SELECT * FROM USER_SEQUENCES;
