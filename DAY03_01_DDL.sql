/*
    DDL
    1. DATA Definition Language
    2. 데이터베이스 객체를 다루는 언어이다.
    3. 트랜잭션 대상이 아니다.(작업을 취소 할 수 없다.)
    4. 종류
        1) CREATE   : 생성
        2) ALTER    : 수정
        3) DROP     : 삭제
        4) TRUNCATE : 삭제(내용만 삭제)
*/
-- 삭제는 생성의 역순
DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;

CREATE TABLE BANK_TBL(
    BANK_CODE   VARCHAR2(20)    NOT NULL,
    BANK_NAME   VARCHAR2(30),
    CONSTRAINT  PK_BANK PRIMARY KEY(BANK_CODE)
);

CREATE TABLE CUSTOMER_TBL(
    NO          NUMBER          NOT NULL,
    NAME        VARCHAR(20)     NOT NULL,
    PHONE       VARCHAR(30)     UNIQUE,
    AGE         NUMBER          CHECK(AGE BETWEEN 0 AND 100),
    BANK_CODE   VARCHAR2(20)    ,
    CONSTRAINT  NO PRIMARY KEY(NO),
    CONSTRAINT  FK_BANK_CST FOREIGN KEY(BANK_CODE) REFERENCES BANK_TBL(BANK_CODE)
);

/*
    테이블 수정하기
    1. 열(COLUMN) 추가 : ALTER TABLE 테이블명 ADD COLUMN명 데이터타입 [제약조건]
    2. 열(COLUMN) 수정 : ALTER TABLE 테이블명 MODIFY COLUMN명 데이터타입 [제약조건]
    3. 열(COLUMN) 삭제 : ALTER TABLE 테이블명 DROP COLUMN COLUMN명
    4. 열(COLUMN) 이름 : ALTER TABLE 테이블명 RENAME COLUMN 기존COLUMN명 TO 신규COLUMN명
    5. 테이블     이름 : ALTER TABLE 테이블명 RENAME TO 신규테이블명
    6. PK, FK 제약조건 : 
        1) PK
            (1) 추가
                ALTER TABLE 테이블명 ADD  CONSTRAINT 제약조건명 PRIMARY KEY(COLUMN)
            (2) 삭제
                ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명 
                ALTER TABLE 테이블명 DROP PRIMARY KEY
        2) FK
            (1) 추가
                ALTER TABLE 자식테이블명 ADD CONSTRAINT 제약조건명 FOREIGN KEY(COLUMN) REFERENCES 부모테이블(참조할칼럼)
            (2) 삭제
                ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명
*/

-- 실습.
-- 1. 은행 테이블에 연락처(BANK_TEL) 칼럼추가
ALTER TABLE BANK_TBL ADD BANK_TEL VARCHAR2(11) NOT NULL;

-- 2. 은행 테이블의 은행명(BANK_NAME) 칼럼의 데이터타입을 VARCHAR2(15)로 변경
ALTER TABLE BANK_TBL MODIFY BANK_NAME VARCHAR(15);

-- 3. 고객 테이블의 나이(AGE) 삭제.
ALTER TABLE CUSTOMER_TBL DROP COLUMN AGE;

-- 4. 고객 테이블의 고객번호(NO) 칼럼명을 (CUST_NO)로 변경.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NO TO CUST_NO;

-- 5. 고객 테이블에 GRADE 칼럼을 추가하시오. ('VIP', 'GOLD', 'SILVER', 'BRONZE' 하나의 값만 가짐)
-- ALTER TABLE CUSTOMER_TBL ADD GRADE VARCHAR2(10) CHECK(GRADE = 'VIP' OR GRADE = 'GOLD' OR GRADE ='SILVER' OR GRADE ='BRONZE'); 이 방식 사용하면 for문을 못돌림
ALTER TABLE CUSTOMER_TBL ADD GRADE VARCHAR2(10) CHECK(GRADE IN ('VIP', 'GOLD', 'SILVER', 'BRONZE'));

-- 6. 고객테이블의 고객명(NAME)과 연락처(PHONE) 칼럼이름에 CUST_를 붙인다.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NAME TO CUST_NAME;
ALTER TABLE CUSTOMER_TBL RENAME COLUMN PHONE TO CUST_PHONE;

-- 7. 고객 테이블의 연락처(CUST_PHONE) 칼럼을 필수 칼럼으로 변경
ALTER TABLE CUSTOMER_TBL MODIFY CUST_PHONE VARCHAR2(30) NOT NULL;

-- 8. 고객 테이블의 고객명(CUST_NAME) 칼럼의 필수 제약조건을 없애기.
ALTER TABLE CUSTOMER_TBL MODIFY CUST_NAME VARCHAR2(20) NULL; -- NULL 반드시 명시

-- 테이블 구조 확인
DESCRIBE BANK_TBL;
DESC     CUSTOMER_TBL;









