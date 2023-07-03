/*
    M:N 관계
    1. 현실 세계에서 빈번히 나타나지만 주의해야하는 관계.
    2. M:N 관계를 가진 2개의 테이블은 직접관계 불가능
    3. M:N 사이의 1:M 관계를 해주는 별도의 테이블이 추가로 필요.
    4. M:N 관계는 1:M 관계가 2개로 구현 가능.
*/
/*
ex)
노래  -   노래-해시태그   -   해시태그
A           A   NEW             NEW
B           A   HOT             HOT
            B   NEW             
*/
-- 생성전 삭제부터 (순서 꼭 생성 역순으로)
DROP TABLE ENROLL_T;
DROP TABLE SUBJECT_T;
DROP TABLE STUDENT_T;

CREATE TABLE STUDENT_T(
    SDT_NO      NUMBER        NOT NULL 
  , SDT_NAME    VARCHAR(10)   NOT NULL
  , SDT_AGE     NUMBER        NOT NULL
  , CONSTRAINT PK_SDT PRIMARY KEY(SDT_NO)
);

CREATE TABLE SUBJECT_T(
    SUBJ_CODE   VARCHAR(10)   NOT NULL 
  , SUBJ_NAME   VARCHAR(10)   NOT NULL UNIQUE
  , SUBJ_PROF   VARCHAR(10)   NOT NULL
  , CONSTRAINT PK_SUBJ PRIMARY KEY(SUBJ_CODE)
);

CREATE TABLE ENROLL_T(
    ENROLL_NO   NUMBER        NOT NULL 
  , SDT_NO      NUMBER        
  , SUBJ_CODE   VARCHAR(10)   
  , CONSTRAINT PK_ENR PRIMARY KEY(ENROLL_NO)
  , CONSTRAINT FK_SDT_ENR FOREIGN KEY(SDT_NO) REFERENCES STUDENT_T(SDT_NO)
  , CONSTRAINT FK_SUBJ_ENR FOREIGN KEY(SUBJ_CODE) REFERENCES SUBJECT_T(SUBJ_CODE)
);

















