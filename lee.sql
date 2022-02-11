SELECT * FROM TAB;

--��� ������

SELECT * FROM CUSTOM;

SELECT * FROM COMPANY;

SELECT USERID,PAY, ROUND(PAY,-4) PAY  FROM COMPANY;

SELECT * FROM CUSTOM;

-- 770322-1******
SELECT RPAD(SUBSTR(JUMIN,1,8),14,'*') JUMIN FROM CUSTOM; -- SUBSTR�� �����ϰ� JUMIN�� �־ RPAD�� �Ѵ�

SELECT COUNT(*) INWON FROM CUSTOM
WHERE JOB = 'ȸ���';

SELECT COUNT(*) INWON FROM CUSTOM
WHERE ADDR1 LIKE '����%';


SELECT COUNT(*) INWON FROM CUSTOM
WHERE POINT>=200;

SELECT * FROM COMPANY;

SELECT SUM(PAY) FROM COMPANY
WHERE POSIT='�븮';

SELECT * FROM CUSTOM;

SELECT JOB,COUNT(*) INWON FROM CUSTOM
GROUP BY JOB;

SELECT SCHOL, ROUND(AVG(POINT)) FROM CUSTOM
GROUP BY SCHOL;

SELECT ADDR1,ROUND(SUM(POINT)) INWON, MAX(POINT) "MAX", MIN(POINT) "MIN" FROM CUSTOM
GROUP BY ADDR1;

SELECT
CASE SEX
WHEN '1' THEN '����'
WHEN '0' THEN '����'
END GENDER
, ROUND(AVG(AGE))"AVG",COUNT(*) "CNT"
FROM CUSTOM
GROUP BY SEX;

/*
SELECT 
CASE �÷���                         
	WHEN 1 THEN 100  ELSE 0, -- �ϳ��϶� ELSE ���� ��                         
	WHEN 2 THEN 200                         
	WHEN 3 THEN 300                         
	WHEN 4 THEN 400                          
	ELSE 500                        
END AS RESULT             
FROM DUAL;
*/

SELECT * FROM COMPANY;

-- ��å�� ������ ��, ���, MAX, MIN
SELECT POSIT, COUNT(*) CNT, ROUND(AVG(PAY)) ���, MAX(PAY) �ִ�, MIN(PAY) �ּ� 
FROM COMPANY GROUP BY POSIT
HAVING COUNT(*) > 60;

------------------------------------------------------------------1/25

-- JOIN (�����÷��� ���� �� ���̺��� ��ģ��)
/* 

��EQUI JOIN:����Ŭ���� ����ϴµ� ���� ���� (INNER JOIN: ANSI ���� ǥ��)
NON-EQUI JOIN (ORACLE���� ����)
OUTER JOIN
CROSS JOIN
��SELF JOIN

JOIN���� ���ǹ��� ON�� ���
SELECT���� WHERE
GROUP BY���� HAVING
*/


-- EQUI JOIN -------------------------------------------------------------------------------
SELECT * FROM CUSTOM;
SELECT * FROM COMPANY;

SELECT A.USERID,USERNAME, ADDR1, COMPANY, DEPT, POSIT, PAY
FROM CUSTOM A, COMPANY B -- ���̺��� ��Ī(AS�� ��� X) 
WHERE A.USERID = B.USERID;

-- INNER JOIN
SELECT A.USERID,USERNAME, ADDR1, COMPANY, DEPT, POSIT, PAY
FROM CUSTOM A INNER JOIN COMPANY B -- INNER ��������
ON A.USERID = B.USERID;

-- ���̺�'CUSTOM'���� USERID, USERNAME�� �˻��ϰ�
-- POINT ���̺��� ��ǰ ����, �α��ο� ����� POINT ����(PRODUCT, LOGIN)�� �˻�
SELECT * FROM POINT;

-- EQUI JOIN
SELECT A.USERID, USERNAME,PRODUCT,LOGIN
FROM CUSTOM A,POINT B
WHERE A.USERID = B.USERID AND B.LOGIN>=10;
-- INNER JOIN
SELECT A.USERID, USERNAME,PRODUCT,LOGIN
FROM CUSTOM A JOIN POINT B
ON A.USERID = B.USERID --AND B.LOGIN>=10;
WHERE B.LOGIN>=10;

-- OUTERJOIN (�ܺ�����) ---------------------------------------------------------------------
-- Ư�� ���̺��� ������ �Ǽ� �����͸� ã�ƿ� ( ������ �Ǵ� ���̺� A�� �Ϻκ��� B(+)�� ���� ) 
SELECT COUNT(*) FROM CUSTOM; -- 459
SELECT COUNT(*) FROM COMPANY; -- 464
-- CUSTOM ����
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B
WHERE A.USERID = B.USERID(+); -- 459��
-- COMPANY ����
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A, COMPANY B
WHERE A.USERID (+) = B.USERID ; -- 464�� 

-- INNER JOIN : ANSI ǥ�� -----------------------------------------------------------------------------
-- CUSTOM ����
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A LEFT OUTER JOIN COMPANY B
ON A.USERID = B.USERID;
-- COMPANY ����
SELECT A.USERID, USERNAME, ADDR1, COMPANY, DEPT
FROM CUSTOM A RIGHT OUTER JOIN COMPANY B
ON A.USERID = B.USERID;

-- EXAMPLE

SELECT * FROM RESEARCH;
SELECT COUNT(*) FROM RESEARCH;

SELECT A.USERID,USERNAME,ANSWER
FROM CUSTOM A, RESEARCH B
WHERE A.USERID = B.USERID(+) AND ANSWER IS NULL;

SELECT A.USERID,USERNAME,ANSWER
FROM CUSTOM A LEFT OUTER JOIN RESEARCH B
ON A.USERID = B.USERID
WHERE ANSWER IS NULL;


-- CROSS JOIN (��ȣ����) : A(a1,a2) B(b1,b2,b3) -> 2*3 = 6 -------------------------------
SELECT COUNT(*) FROM CUSTOM; -- 459
SELECT COUNT(*) FROM COMPANY; -- 464

SELECT A.USERID,USERNAME,ADDR1,COMPANY,DEPT
FROM CUSTOM A, COMPANY B;  -- 459 * 464 = 21����
-- WHERE A.USERID = B.USERID;

-- ������� ������������ �����͸� ���� �׽�Ʈ �� Ȱ���Ҷ� ���

-- SELF JOIN : �ߺ��� ���� ã��---------------------------------------------------------------------
SELECT * FROM CUSTOM;
DESC CUSTOM;

-- �ϱ� --
SELECT DISTINCT A.*
FROM CUSTOM A, CUSTOM B
WHERE A.USERNAME = B.USERNAME
AND A.USERID<>B.USERID
ORDER BY A.USERNAME;

-- 'CUSTOM'���̺��� '���ֵ�'�� ��� �ִ� ��� �߿� ������ �̸��� ���� ���� �˻�
SELECT * FROM CUSTOM
WHERE ADDR1 = '���ֵ�';

SELECT DISTINCT A.*
FROM CUSTOM A INNER JOIN CUSTOM B
ON A.USERNAME = B.USERNAME
WHERE A.JUMIN<>B.JUMIN AND A.ADDR1 = '���ֵ�' AND B.ADDR1 = '���ֵ�'
ORDER BY A.USERNAME;

-- �� ���� ���̺� ��ġ��
SELECT A.USERID, USERNAME, COMPANY, DEPT, PRODUCT, LOGIN
FROM CUSTOM A, COMPANY B, POINT C
WHERE A.USERID = B.USERID AND A.USERID = C.USERID;

SELECT A.USERID, USERNAME, COMPANY, DEPT, PRODUCT, LOGIN
FROM CUSTOM A INNER JOIN COMPANY B
ON A.USERID = B.USERID INNER JOIN POINT C
ON A.USERID = C.USERID;


-- UNION/ALL--------------------------------------------------------------------------------------
SELECT * FROM CUSTOM;

CREATE TABLE JEJU
AS
SELECT * FROM CUSTOM WHERE ADDR1 = '���ֵ�';
SELECT * FROM JEJU;

CREATE TABLE KYUNG
AS
SELECT * FROM CUSTOM WHERE ADDR1 = '��⵵';
SELECT * FROM KYUNG;

CREATE TABLE SEOUL
AS
SELECT * FROM CUSTOM WHERE ADDR1 = '����Ư����';
SELECT * FROM SEOUL;

-----------------------------\
SELECT * FROM JEJU
UNION
SELECT * FROM KYUNG
UNION
SELECT * FROM SEOUL;


-- SUB-QUERY(��������)------------------------------------------------------

-- 'COMPANY' ���̺��� USERID, COMPANY, DEPT, PAY�� ��� ������ �˻�
SELECT USERID, COMPANY, DEPT, PAY, AVG(PAY) FROM COMPANY; --X ���� & ����

SELECT ROUND(AVG(PAY)) FROM COMPANY; -- A

SELECT USERID,COMPANY,DEPT,PAY,1782888 AVG_PAY FROM COMPANY; --B

SELECT USERID,COMPANY,DEPT,PAY,
(SELECT ROUND(AVG(PAY)) FROM COMPANY) AVG_PAY FROM COMPANY; --B(A) ��ü

SELECT USERID,COMPANY,DEPT,PAY,
(SELECT ROUND(AVG(PAY)) FROM COMPANY) AVG_PAY,
PAY-(SELECT ROUND(AVG(PAY)) FROM COMPANY) ����
FROM COMPANY;

--'CUSTOM'���̺��� ��� ���� �̻��� ����� �˻�
SELECT AVG(AGE) FROM CUSTOM;

SELECT * FROM CUSTOM 
WHERE AGE>=(SELECT AVG(AGE) FROM CUSTOM);

-- 'COMPANY' ���̺��� ��տ��޺��� ���� ������ �޴� ���� �˻�
SELECT AVG(PAY) FROM COMPANY;

SELECT * FROM COMPANY 
WHERE PAY<(SELECT AVG(PAY) FROM COMPANY);

--'�����ڵ���' ȸ�翡 �ٹ��ϴ� ���� USERID, USERNAME, ADDR1, SCHOL���� �˻�--------------------------------------------
-- CASE 1 : �������� --
SELECT * FROM CUSTOM;
SELECT * FROM COMPANY;

SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%'; ------------?

SELECT * FROM CUSTOM
WHERE USERID IN ('EE9224','el3409');

SELECT * FROM CUSTOM
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%') ;

-- CASE 2 : JOIN --
SELECT A.* 
FROM CUSTOM A, COMPANY B
WHERE A.USERID = B.USERID 
AND COMPANY LIKE '�����ڵ���%';

-- SALES���̺��� 4ȸ �̻� �Ǹ� ����� �ִ� ������ �⺻ ������ �˻�--------------------------------------
SELECT * FROM CUSTOM;
SELECT * FROM SALES;

-- CASE 1: ���� ����--

--SELECT USERID FROM SALES WHERE COUNT(USERID) >= '4';��������..
SELECT USERID, COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*) >=4;

SELECT * FROM CUSTOM 
WHERE USERID IN 
(SELECT USERID FROM SALES
GROUP BY USERID
HAVING COUNT(*) >=4);

-- CASE 2 : INLINE VIEW (JOIN���� ���� ����! ���� ���� ��� �ڵ�) --
SELECT A.*, CNT 
FROM CUSTOM A, (SELECT USERID, COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING COUNT(*) >=4) B
WHERE A.USERID = B.USERID;

-- �� �Ǹűݾ��� 100���� �̻��� 'CUSTOM' ���̺� �ִ� ���� �⺻ ����---------------------
SELECT * FROM CUSTOM;
SELECT * FROM SALES ORDER BY USERID;

SELECT USERID, SUM(PRICE), COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING SUM(PRICE)>=1000000;

-- CASE 1 : �������� --
SELECT * FROM CUSTOM
WHERE USERID IN 
(SELECT USERID FROM SALES
GROUP BY USERID
HAVING SUM(PRICE)>=1000000);

-- CASE 2 : JOIN / INLINE VIEW --
SELECT A.*,CNT,HAP
FROM CUSTOM A, (SELECT USERID, SUM(PRICE) HAP, COUNT(*) CNT FROM SALES
GROUP BY USERID
HAVING SUM(PRICE)>=1000000) B
WHERE A.USERID = B.USERID; 

-- ANY, ALL -------------------------------------------------------------------------------------------------------

SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�' ORDER BY POINT;

/*
-- 132 ~ 269
>ANY : 132���� ū ������
<ANY : 269���� ���� ������
>ALL : 269���� ū ������
<ALL : 132���� ���� ������
*/

-- >ANY : �ξ� ����
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT >ANY (SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');
-- MIN() : ���� ���� 
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT > (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');

------------------------------------------------------------------------
-- <ANY
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT < ANY (SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');
-- MAX()
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT < (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');

------------------------------------------------------------------------
-- >ALL
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT > ALL (SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');
--  
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT > (SELECT MAX(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');
------------------------------------------------------------------------
-- <ALL
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT < ALL (SELECT POINT FROM CUSTOM WHERE ADDR1 = '���ֵ�');
--  
SELECT USERID, USERNAME, POINT FROM CUSTOM
WHERE POINT < (SELECT MIN(POINT) FROM CUSTOM WHERE ADDR1 = '���ֵ�');
------------------------------------------------------------------------??
SELECT * FROM CUSTOM WHERE POINT = 131;

UPDATE CUSTOM SET POINT = 131 WHERE USERID = 'nn4942';
------------------------------------------------------------------------??

SELECT USERID, USERNAME,ADDR1, SCHOL FROM CUSTOM
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

SELECT USERID, USERNAME,ADDR1, SCHOL FROM CUSTOM
WHERE USERID =ANY (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');
------------------------------------------------------------------------

SELECT USERID, USERNAME,ADDR1, SCHOL FROM CUSTOM
WHERE USERID NOT IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

SELECT USERID, USERNAME,ADDR1, SCHOL FROM CUSTOM
WHERE USERID <>ALL (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');
----------------------------------------------------------------------

SELECT USERID, USERNAME,ADDR1, SCHOL FROM CUSTOM
WHERE USERID IN (SELECT USERID FROM COMPANY WHERE COMPANY LIKE '�����ڵ���%');

-- ��� ���� 
SELECT USERID, USERNAME,ADDR1, SCHOL FROM CUSTOM
WHERE EXISTS (SELECT * FROM COMPANY WHERE USERID=CUSTOM.USERID AND COMPANY LIKE '�����ڵ���%');

SELECT USERID, USERNAME,ADDR1, SCHOL FROM CUSTOM
WHERE NOT EXISTS (SELECT * FROM COMPANY WHERE USERID=CUSTOM.USERID AND COMPANY LIKE '�����ڵ���%');

----------------------------------------------------------------------

SELECT * FROM CUSTOM WHERE ADDR1='��⵵' AND AGE <= 20;

SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1 = '��⵵') A;

SELECT * FROM (SELECT * FROM CUSTOM WHERE ADDR1 = '��⵵') A
WHERE A.AGE <=20;



-- 2/3 -----------------------------------------------------------------------------------------------------

create table ���
(�����ȣ number(10),
����� varchar2(10),
�μ���ȣ number(2),
���� varchar2(10),
�����ȣ char(7),
�ּ� varchar2(50),
��ȭ��ȣ char(15),
�޿� number(5),
Ŀ�̼� number(5),
�Ի��� date,
���� char(6),
�����ȣ number(10)
);

insert into ��� values(2001,'�̼���',10,'����','125-365','���� ��걸','02-985-1254',3500,100,'1980-12-01','����',null);
insert into ��� values(2002,'ȫ�浿',10,'�븮','354-865','���� ������','02-865-1254',4000,'','2000-01-25','����',2004);
insert into ��� values(2003,'������',20,'���','587-456','�λ� �ؿ�뱸','051-256-9874',2500,100,'2002-05-24','����',2002);
insert into ��� values(2004,'������',30,'����','987-452','���� ������','02-33-6589',5000,'','1997-03-22','����',2001);
insert into ��� values(2005,'���',10,'�븮','123-322','���� ������','02-888-9564',3000,100,'1999-07-15','����',2004);
insert into ��� values(2006,'������',20,'���','154-762','���� ���ı�','02-3369-9874',2000,'','2003-05-22','����',2005);
insert into ��� values(2007,'�ڼֹ�',30,'�븮','367-985','���� ��������','02-451-2563',3000,100,'2006-01-25','����',2004);
insert into ��� values(2008,'��ȿ��',40,'���','552-126','���� �߱�','02-447-3256',2000,'','2001-02-02','����',2007);

SELECT * FROM ���;
DESC ���;
COMMIT;

-- PL/SQL ---------------------------------------------------
-- CMD���� /�� ����, ������ �����ϰ� �ɸ��� �ʰ�, ��Ʈ��ũ�� Ʈ������ ����
DECLARE 
TYPE FIRSTTYPE IS RECORD 
(A ���.�����%TYPE, B ���.����%TYPE, C ���.�޿�%TYPE); -- �ڷ����� DESC�� Ȯ������ �ʰ� �ٷ� �����´�

CUS FIRSTTYPE; --CUS��� ���� 3��

BEGIN -- ����
SELECT �����, ����, �޿� INTO CUS FROM ��� WHERE �����ȣ = 2001;

DBMS_OUTPUT.PUT_LINE(' �����  ����  �޿� ');
DBMS_OUTPUT.PUT_LINE('--------------------');
DBMS_OUTPUT.PUT_LINE(CUS.A||'  '||CUS.B||'  '||TO_CHAR(CUS.C)); -- �ڷ����� CHARACTER�� ��ȯ
DBMS_OUTPUT.PUT_LINE('���� ������ ������ '||USER||'�Դϴ�'); -- USER ����Ǿ��ִ� ����
DBMS_OUTPUT.PUT_LINE('���� ������ �ð��� '||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MM:SS'));
END; -- ��

--SET SERVEROUTPUT ON;
--DECLARE���� END���� �ٽ� ���

SELECT * FROM ���;

SELECT �����ȣ, �����, ����, �޿�, Ŀ�̼�, F_TAX(2001) TAX FROM ���
WHERE �����ȣ = 2001;

--------------------------------------------------
ACCEPT ID PROMTPT '�˻��� ���̵� �Է��ϼ���: ';

DECLARE

TYPE GOGAK IS RECORD
(A CUSTOM.USERID%TYPE,
B CUSTOM.USERNAME%TYPE,
C NUMBER(12,2),
D NUMBER(5));

CUS GOGAK;

BEGIN
SELECT C.USERID, C.USERNAME, S.�հ�, S.����Ƚ�� INTO CUS
FROM CUSTOM C, 
(SELECT USERID, SUM(PRICE) �հ�, COUNT(*) ����Ƚ��
FROM SALES GROUP BY USERID) S
WHERE C.USERID = S.USERID AND C.USERID = '&ID'; -- ID���� ġȯ����

DBMS_OUTPUT.PUT_LINE('���̵�: '||CUS.A);
DBMS_OUTPUT.PUT_LINE('��  ��: '||CUS.B);
DBMS_OUTPUT.PUT_LINE('�Ǹž�: '||CUS.C);
DBMS_OUTPUT.PUT_LINE('��  ��: '||CUS.D);

END;

--------------------------------------------------------------

-- ��å�� �Է¹޾� �� ��å�� �޿��� �Ѿ�, ��տ���, �ο����� ã���ÿ�

CREATE OR REPLACE PROCEDURE SEARCHJIK
(JIK IN VARCHAR2)
IS
A NUMBER:=0;
B NUMBER(12,2):=0;
C NUMBER:=0;
BEGIN
SELECT SUM(PAY),ROUND(AVG(PAY)), COUNT(*) INTO A,B,C
FROM COMPANY WHERE POSIT=JIK;


DBMS_OUTPUT.PUT_LINE('�޿��Ѿ�: '||A||'��');
DBMS_OUTPUT.PUT_LINE('��տ���: '||B||'��');
DBMS_OUTPUT.PUT_LINE('�ο���: '||C||'��');
END SEARCHJIK;

---------------------------------------------------------------

SELECT * FROM CUSTOM;
DESC CUSTOM;

-- CUSTOM ���̺� INSERT ��Ű�� ���ν���(CUS_IN) -----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE CUS_IN
(A VARCHAR2, B VARCHAR2, C VARCHAR2, D VARCHAR2, E VARCHAR2, F VARCHAR2, G VARCHAR2, 
H VARCHAR2, I VARCHAR2, J VARCHAR2, K VARCHAR2, L VARCHAR2, M NUMBER, N DATE)
IS
BEGIN
INSERT INTO CUSTOM VALUES (A,B,C,D,E,F,G,H,I,J,K,L,M,N);
COMMIT;
END;

EXEC CUS_IN('A001','SUZI','123',27,'0','123-123','����','������','���ﵿ','010-123-1234','����','����',123,SYSDATE);

SELECT * FROM CUSTOM WHERE USERID = 'A001';


-- CUSTOM ���̺� UPDATE ��Ű�� ���ν���(CUS_UP) ------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE CUS_UP
(A VARCHAR2, B VARCHAR2, C VARCHAR2, D VARCHAR2, E VARCHAR2, F VARCHAR2, G VARCHAR2, 
H VARCHAR2, I VARCHAR2, J VARCHAR2, K VARCHAR2, L VARCHAR2, M NUMBER, N DATE)
IS
BEGIN
UPDATE CUSTOM SET USERNAME=B, JUMIN=C, AGE=D, SEX=E, ZIP=F, 
ADDR1=G, ADDR2=H, ADDR3=I, TEL=J, JOB=K, SCHOL = L, POINT = M, REGDATE =N
WHERE USERID = A;
COMMIT;
END;

EXEC CUS_IN('A002','HYEMIN','123',27,'0','123-123','����','������','���ﵿ','010-123-1234','����','����',123,SYSDATE);

SELECT * FROM CUSTOM WHERE USERID = 'A002';

-- CUSTOM ���̺� DELETE ��Ű�� ���ν���(CUS_DEL)

CREATE OR REPLACE PROCEDURE CUS_DEL
(A VARCHAR2)
IS BEGIN
DELETE CUSTOM WHERE USERID= 'A002';
COMMIT;
END;

-- ������ �Է¹޾� �̸��� ���

LEE@XE> CREATE OR REPLACE FUNCTION F_SDAY(V_DATE IN DATE)
  2  RETURN VARCHAR2
  3  IS
  4  GUNDATE VARCHAR2(20);
  5  BEGIN
  6  GUNDATE :=
  7  FLOOR(MONTHS_BETWEEN(SYSDATE,V_DATE)/12)||'��'||
  8  FLOOR(MOD(MONTHS_BETWEEN(SYSDATE,V_DATE),12))||'����';
  9  RETURN GUNDATE;
 10  END;
 11  /


LEE@XE> --�ֹι�ȣ�� �Է������� ������ ��ȯ���ִ� �Լ�
LEE@XE> CREATE OR REPLACE FUNCTION F_GENDER
  2  (V_JUMIN IN VARCHAR2)
  3  RETURN VARCHAR2
  4  IS
  5  GENDER VARCHAR2(2);
  6  BEGIN
  7  GENDER:=SUBSTR(V_JUMIN,8,1);
  8  IF
  9  GENDER IN ('1','3') THEN
 10  GENDER:='��';
 11  ELSE
 12  GENDER:='��';
 13  END IF;
 14  RETURN GENDER;
 15  END;
 16  /

-- ���� ��ȯ
CREATE OR REPLACE FUNCTION F_GENDER
(V_JUMIN IN VARCHAR2)
RETURN VARCHAR2
IS
GENDER VARCHAR2(2);
BEGIN
GENDER:=SUBSTR(V_JUMIN,8,1);
IF
GENDER IN ('1','3') THEN
GENDER:='��';
ELSE
GENDER:='��';
END IF;
RETURN GENDER;
END;
/



