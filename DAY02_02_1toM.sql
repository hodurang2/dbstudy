/*
    1:M 관계
    1. 2개의 테이블을 관계 짓는 가장 대표적인 관계.
    2. 1(PK)[부모] : M(FK)[자식] 방식으로 관계를 잡아주면됨
    3. 반드시 부모 테이블 먼저 만들기 -> 자식 테이블 만들기
    4. 삭제는 자식 테이블 먼저 지우기 -> 부모 테이블 지우기
*/
-- 자식 먼저지우기
DROP TABLE STUDENT_T;

-- 부모 먼저 지우기
DROP TABLE SCHOOL_T;

-- 부모TABLE만들기
CREATE TABLE SCHOOL_T (
     SCH_CODE NUMBER        NOT NULL PRIMARY KEY
    ,SCH_NAME VARCHAR2(10)  NOT NULL
);

-- 자식table만들기
CREATE TABLE STUDENT_T (
    SDT_NO   NUMBER         NOT NULL PRIMARY KEY
  , SCH_CODE NUMBER         REFERENCES SCHOOL_T(SCH_CODE) -- SCH_CODE는 SCHOOL_T테이블의 SCH_CODE참조.
  , SDT_NAME VARCHAR2(10)   NOT NULL
);


