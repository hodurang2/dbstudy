/*
    테이블(table)
    1. 데이터베이스에서 데이터를 저장하는 객체.
    2. 표 형식을 가진다.
    3. 행(row)와 열(column)으로 구성.
*/
/*
    데이터 타입
    1. NUMBER(p, s) : p=정밀도, s=스케일, 숫자형식.
        1) 정밀도 p : 전체 유효 숫자의 갯수 ex) (1, 01, 001)의 p는 1
        2) 스케일 s : 소수부의 유효 숫자의 갯수
    2. CHAR(size) : 고정 문자(character)
        1) 글자 수가 고정된 타입(ex : 핸드폰번호, 주민번호 등 글자수가 동일한 type)
        2) size : 최대 2000 byte
    3. VARCHAR2(size) : 가변 문자
        1) 글자 수가 고정되지 않은 타입(ex : 이름, 이메일, 주소 등)
        2) size : 최대 4000
    4. CLOB : 큰 text type
    5. DATE : 날짜와 시간을 동시에 표현하는 타입(연, 월, 일, 시, 분, 초)
    6. TIMESTAMP : DATE와 비슷하나 좀더 정밀한시간나타냄(연, 월, 일, 시, 분, 초, 마이크로초) 
*/
/*
    제약조건 5가지
    1. NOT NULL : 필수
    2. UNIQUE : 중복 불가
    3. PRIMARY KEY : 기본키
    4. FOREIGN KEY : 외래키
    5. CHECK       : 값의 제한
*/
/*
    
*/
DROP TABLE CUSTOMER_T;
CREATE TABLE CUSTOMER_T (
    NO NUMBER           NOT NULL PRIMARY KEY,
    ID VARCHAR2(32)     NOT NULL,
    NAME VARCHAR2(32)   NOT NULL,
    JOB VARCHAR(32)     NULL,
    P_NUM CHAR(13)      NULL UNIQUE,
    AD_NUM CHAR(12)     NOT NULL UNIQUE
);




































