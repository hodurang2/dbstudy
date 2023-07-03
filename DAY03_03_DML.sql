/*
    DML
    1. Data Manipulation Language
    2. 데이터(행, Row)를 조작(삽입, 수정, 삭제)하는 언어이다.
    3. 트랜잭션 대상이다. (작업이 완료되면 COMMIT, 작업을 취소하려면 ROLLBACK이
        1) COMMIT   : COMMIT이 완료된 작업은 ROLLBACK으로 취소하지 못한다.
        2) ROLLBACK : 작업을 취소한다. COMMIT 이후 작업을 취소한다.
    4. 종류
        1) 삽입 : INSERT INTO VALUES
        2) 수정 : UPDATE SET WHERE
        3) 삭제 : DELETE FROM WHERE
*/

-- 생성전 테이블삭제 (생성의 역순)
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;


CREATE TABLE DEPARTMENT_TBL(
    DEPT_NO         NUMBER          NOT NULL        ,
    DEPT_NAME       VARCHAR2(15)    NOT NULL        ,
    LOCATION        VARCHAR2(15)    NOT NULL        ,
    CONSTRAINT  PK_DEPT PRIMARY KEY(DEPT_NO)
);

CREATE TABLE EMPLOYEE_TBL(
    EMP_NO          NUMBER          NOT NULL        ,
    NAME            VARCHAR2(20)    NOT NULL        ,
    DEPART          NUMBER                          ,
    POSITION        VARCHAR2(20)                     ,
    GENDER          CHAR(2)                         ,
    HIRE_DATE       DATE                            ,
    SALARY          NUMBER                          ,
    CONSTRAINT  PK_EMP PRIMARY KEY(EMP_NO)          ,
    CONSTRAINT  FK_DEPT_EMP FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_TBL(DEPT_NO)
);

-- 부서번호를 생성하는 시퀀스 만들기
/*
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1      -- 1씩 증가하는 번호를 만든다.      (디폴트)
    START WITH 1        -- 1부터 번호를 만든다.             (디폴트)
    NOMAXVALUE          -- 번호의 상한선이 없다.            (디폴트)
    NOMINVALUE          -- 번호의 하한선이 없다.            (디폴트)
    NOCYCLE             -- 번호 순환이 없다.                (디폴트)
    CACHE 20            -- 20개씩 번호를 만드렁둔다.        (디폴트)
    NOORDER             -- 번호를 순서대로 사용하지 않는다. (디폴트)
*/

-- 시퀀스 생성전 삭제먼저하기
DROP SEQUENCE DEOT_SEQ;
-- 시퀀스  생성
CREATE SEQUENCE DEPT_SEQ ORDER;

INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(1, '영업부', '대구'); 
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(2, '인사부', '서울');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(3, '총무부', '대구');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(4, '기획부', '서울');
COMMIT;

-- 시퀀스 생성전 삭제먼저하기
DROP SEQUENCE EMP_SEQ;
-- 시퀀스  생성
CREATE SEQUENCE EMP_SEQ 
    START WITH 1001
    ORDER;
    
INSERT INTO EMPLOYEE_TBL VALUES (EMP_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95-05-01', 5000000);  
INSERT INTO EMPLOYEE_TBL VALUES (EMP_SEQ.NEXTVAL, '김민서', 1, '사원', 'M', '17-09-01', 2500000);
INSERT INTO EMPLOYEE_TBL VALUES (EMP_SEQ.NEXTVAL, '이은영', 2, '부장', 'F', '90-09-01', 5500000);
INSERT INTO EMPLOYEE_TBL VALUES (EMP_SEQ.NEXTVAL, '한성일', 2, '과장', 'M', '93-04-01', 5000000);
COMMIT;

ROLLBACK;




