-- 테이블 삭제
DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;

-- DEPARTMENT_T 테이블 생성
CREATE TABLE DEPARTMENT_T (
    DEPT_NO   NUMBER            NOT NULL
  , DEPT_NAME VARCHAR2(15 BYTE) NOT NULL
  , LOCATION  VARCHAR2(15 BYTE) NOT NULL
  , CONSTRAINT PK_DEPART PRIMARY KEY(DEPT_NO)
);

-- EMPLOYEE_T 테이블 생성
CREATE TABLE EMPLOYEE_T (
    EMP_NO    NUMBER            NOT NULL
  , NAME      VARCHAR2(20 BYTE) NOT NULL
  , DEPART    NUMBER            NULL
  , POSITION  VARCHAR2(20 BYTE) NULL
  , GENDER    CHAR(2 BYTE)      NULL
  , HIRE_DATE DATE              NULL
  , SALARY    NUMBER            NULL
  , CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_NO)
  , CONSTRAINT FK_DEPART_EMP FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL
);

DROP SEQUENCE DEPT_SEQ;
CREATE SEQUENCE DEPT_SEQ ORDER;

INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '영업부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '총무부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '기획부', '서울');
COMMIT;


-- 사원번호를 생성하는 시퀀스
DROP SEQUENCE EMP_SEQ;
CREATE SEQUENCE EMP_SEQ
    START WITH 1001
    ORDER;

-- 사원 데이터 입력
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95-05-01', 5000000);  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '김민서', 1, '사원', 'M', '17-09-01', 2500000);  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '이은영', 2, '부장', 'F', '90/09/01', 5500000);  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
INSERT INTO EMPLOYEE_T(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '한성일', 2, '과장', 'M', '93/04/01', 5000000);  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
COMMIT;

-- EMPLOYEE_T, DEPARTMENT_T 사용
-- 1. 사원번호가 1001인 사원과 동일한 직급(POSITION)을 가진 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_T
 WHERE POSITION = (SELECT POSITION
                     FROM EMPLOYEE_T
                    WHERE EMP_NO = 1001);
SELECT *
  FROM EMPLOYEE_T
 WHERE POSITION = '과장';

SELECT POSITION
  FROM EMPLOYEE_T
 WHERE EMP_NO = 1001;
-- 2. 부서번호가 2인 부서와 동일한 지역에 있는 부서를 조회하시오.
SELECT *
  FROM DEPARTMENT_T
 WHERE LOCATION = (SELECT LOCATION
                     FROM DEPARTMENT_T
                    WHERE DEPT_NO = 2);

-- 3. 가장 높은 급여를 받는 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEE_T);
 
-- 4. 평균 급여 이하를 받는 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY <= (SELECT AVG(SALARY)
                    FROM EMPLOYEE_T);

-- 5. 평균 근속 개월 수 이상을 근무한 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_T
 WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= (SELECT AVG(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
                       FROM EMPLOYEE_T); 
--EXTRACT(MONTH)써서 해보기
SELECT EXTRACT(MONTH FROM HIRE_DATE)
  FROM EMPLOYEE_T;

-- 6. 부서번호가 2인 부서에 근무하는 사원들의 직급과 일치하는 사원을 조회하시오.
/*
조인 안쓰고 풀기!!!!!
SELECT *
  FROM DEPARTMENT_T D INNER JOIN EMPLOYEE_T E
    ON DEPT_NO = DEPART
 WHERE POSITION IN (SELECT POSITION
                     FROM EMPLOYEE_T
                    WHERE DEPART = 2);  
*/
SELECT *
  FROM EMPLOYEE_T
 WHERE POSITION IN (SELECT POSITION
                     FROM EMPLOYEE_T
                    WHERE DEPART = 2);

-- 7. 부서명이 '영업부'인 부서에 근무하는 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_T
 WHERE DEPART = (SELECT DEPT_NO
                   FROM DEPARTMENT_T
                  WHERE DEPT_NAME = '영업부');

-- 8. 직급이 '과장'인 사원들이 근무하는 부서 정보를 조회하시오.
SELECT *
  FROM DEPARTMENT_T
 WHERE DEPT_NO IN (SELECT DEPART
                    FROM EMPLOYEE_T
                   WHERE POSITION = '과장'); 

-- 9. '영업부'에서 가장 높은 급여를 받는 사람보다 더 높은 급여를 받는 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY > (SELECT MAX(SALARY)
                   FROM EMPLOYEE_T 
                  WHERE DEPART = (SELECT DEPT_NO
                                     FROM DEPARTMENT_T
                                    WHERE DEPT_NAME = '영업부')); 

-- 10. 3 ~ 4번째로 입사한 사원을 조회하시오.
SELECT *
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE ASC) AS HIRE_RANK, HIRE_DATE, NAME, DEPART, SALARY
          FROM EMPLOYEE_T)
 WHERE HIRE_RANK BETWEEN 3 AND 4;