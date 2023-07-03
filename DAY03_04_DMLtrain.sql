-- 테이블 삭제
DROP TABLE ENROLL_TBL;
DROP TABLE COURSE_TBL;
DROP TABLE LECTURE_TBL;
DROP TABLE STUDENT_TBL;
DROP TABLE PROFESSOR_TBL;

-- 테이블 생성
CREATE TABLE STUDENT_TBL(
    SDT_NO          NUMBER              NOT NULL        ,
    SDT_NAME        VARCHAR2(20)        NOT NULL        ,
    SDT_ADDS        VARCHAR2(30)                        ,
    SDT_RANK        NUMBER(1)                           ,
    SDT_PRO         NUMBER              NOT NULL        
);

CREATE TABLE PROFESSOR_TBL(
    PRO_NO          NUMBER              NOT NULL        ,
    PRO_NAME        VARCHAR2(20)        NOT NULL        ,
    PRO_MAJOR       VARCHAR2(30)        NOT NULL        
);

CREATE TABLE LECTURE_TBL(
    LEC_NO          NUMBER              NOT NULL        ,
    PRO_NO          NUMBER              NOT NULL        ,
    ENR_NO          NUMBER              NOT NULL        ,
    LEC_NAME        VARCHAR2(20)                        ,
    LEC_PLCAE       VARCHAR2(20)        NOT NULL        
);

CREATE TABLE ENROLL_TBL(
    ENR_NO          NUMBER              NOT NULL        ,
    SDT_NO          NUMBER              NOT NULL        ,
    COR_NO          NUMBER              NOT NULL        ,
    ENR_APPLY       DATE                                
);

CREATE TABLE COURSE_TBL(
    COR_NO          NUMBER              NOT NULL        ,
    COR_NAME        VARCHAR2(20)        UNIQUE          ,
    COR_GRADE       NUMBER              NOT NULL        
);

-- 기본기 만들기
ALTER TABLE STUDENT_TBL ADD CONSTRAINT PK_SDT PRIMARY KEY(SDT_NO);
ALTER TABLE PROFESSOR_TBL ADD CONSTRAINT PK_PRO PRIMARY KEY(PRO_NO);
ALTER TABLE LECTURE_TBL ADD CONSTRAINT PK_LEC PRIMARY KEY(LEC_NO);
ALTER TABLE ENROLL_TBL ADD CONSTRAINT PK_ENR PRIMARY KEY(ENR_NO);
ALTER TABLE COURSE_TBL ADD CONSTRAINT PK_COR PRIMARY KEY(COR_NO);

-- 외래키 만들기
ALTER TABLE STUDENT_TBL ADD CONSTRAINT FK_PRO_SDT FOREIGN KEY(SDT_PRO) REFERENCES PROFESSOR_TBL(PRO_NO);
ALTER TABLE LECTURE_TBL ADD CONSTRAINT FK_PRO_LEC FOREIGN KEY(PRO_NO) REFERENCES PROFESSOR_TBL(PRO_NO);
ALTER TABLE LECTURE_TBL ADD CONSTRAINT FK_ENR_LEC FOREIGN KEY(ENR_NO) REFERENCES ENROLL_TBL(ENR_NO);
ALTER TABLE ENROLL_TBL ADD CONSTRAINT FK_SDT_ENR FOREIGN KEY(SDT_NO) REFERENCES STUDENT_TBL(SDT_NO);
ALTER TABLE ENROLL_TBL ADD CONSTRAINT FK_COR_ENR FOREIGN KEY(COR_NO) REFERENCES COURSE_TBL(COR_NO);

-- 데이터 삽입
-- 시퀀스 삭제
DROP SEQUENCE
DROP SEQUENCE
DROP SEQUENCE
DROP SEQUENCE SDT_SEQ;
DROP SEQUENCE PRO_SEQ;

-- 시퀀스 생성
CREATE SEQUENCE PRO_SEQ ORDER;
INSERT INTO PROFESSOR_TBL VALUES(1, '정진명', '유전공학');
INSERT INTO PROFESSOR_TBL VALUES(2, '안홍렬', '컴퓨터공학');
INSERT INTO PROFESSOR_TBL VALUES(3, '황용득', '생명공학');
COMMIT;

CREATE SEQUENCE SDT_SEQ ORDER;
INSERT INTO STUDENT_TBL VALUES (17009001, '강다혜', '동작구', 4, 1);
INSERT INTO STUDENT_TBL VALUES (17009036, '정찬호', '금천구', 4, 2);
INSERT INTO STUDENT_TBL VALUES (17009038, '황민영', '의왕시', 4, 3);
COMMIT;

CREATE SEQUENCE COR_SEQ ORDER;
INSERT INTO COURSE_TBL VALUES(101, '자연과학'  , 2);
INSERT INTO COURSE_TBL VALUES(102, '수학'  , 3);
INSERT INTO COURSE_TBL VALUES(103, '컴퓨터과학', 4);
INSERT INTO COURSE_TBL VALUES(104, 'ICT'  , 5);
COMMIT;

CREATE SEQUENCE ENR_SEQ
    START WITH 20000001
    ORDER;
INSERT INTO ENROLL_TBL VALUES(ENR_SEQ.NEXTVAL, 17009001, 101, '2023-07-03'); 
INSERT INTO ENROLL_TBL VALUES(ENR_SEQ.NEXTVAL, 17009036, 102, '2023-06-30');
INSERT INTO ENROLL_TBL VALUES(ENR_SEQ.NEXTVAL, 17009038, 103, '2023-07-01');
INSERT INTO ENROLL_TBL VALUES(ENR_SEQ.NEXTVAL, 17009036, 104, '2023-07-04');
COMMIT;

CREATE SEQUENCE LEC_SEQ 
    START WITH 10000001
    ORDER;
INSERT INTO LECTURE_TBL VALUES(LEC_SEQ.NEXTVAL, 1, 20000001, '통계학'  , '507호');
INSERT INTO LECTURE_TBL VALUES(LEC_SEQ.NEXTVAL, 1, 20000002, '해석학'  , '507호');
INSERT INTO LECTURE_TBL VALUES(LEC_SEQ.NEXTVAL, 1, 20000003, '딥러닝'  , '507호');
INSERT INTO LECTURE_TBL VALUES(LEC_SEQ.NEXTVAL, 1, 20000004, '머신러닝', '507호');
COMMIT;
ROLLBACK;













