/*
    1:M 관계
    1. 2개의 테이블을 관계 짓는 가장 대표적인 관계.
    2. 1(PK)[부모] : M(FK)[자식] 방식으로 관계를 잡아주면됨
    3. 반드시 부모 테이블 먼저 만들기 -> 자식 테이블 만들기
    4. 삭제는 자식 테이블 먼저 지우기 -> 부모 테이블 지우기
*/
/*
    삭제 옵션 (CONSTRAINT ~~ )
    1. ON DELETE CASCADE : 외래키(FK)가 참조하는 기본키(PK) 값이 삭제되면 외래키도 함께 삭제
    2. ON DELETE SET NULL : 외래키(FK)가 참조하는 기본키(PK) 값이 삭제되면 외래키는 NULL 값으로 대체
*/
-- 자식 먼저지우기
DROP TABLE STUDENT_T;

-- 부모 먼저 지우기
DROP TABLE SCHOOL_T;

-- 부모TABLE만들기
CREATE TABLE SCHOOL_T (
     SCH_CODE   NUMBER        NOT NULL
   , SCH_NAME   VARCHAR2(10)  NOT NULL
   , CONSTRAINT PK_SCH PRIMARY KEY(SCH_CODE)  -- 제약조건의이름 PK_SCH, SCH_CODE에 PK지정
);

-- 자식table만들기
CREATE TABLE STUDENT_T (
     SDT_NO     NUMBER        NOT NULL 
   , SCH_CODE   NUMBER        
   , SDT_NAME   VARCHAR2(10)  NOT NULL
   , CONSTRAINT PK_SDT     PRIMARY KEY(SDT_NO)
   , CONSTRAINT FK_SCH_SDT FOREIGN KEY(SCH_CODE) REFERENCES SCHOOL_T(SCH_CODE) ON DELETE CASCADE
                                                 -- SCH_CODE는 SCHOOL_T테이블의 SCH_CODE참조. 
);

