-- 테이블 생성전 무조건 삭제부터 (이미존재하는 테이블이 있을수도 있기때문)
DROP TABLE DEPARTMENT_TBL;
DROP TABLE EMPLOYEE_TBL;
DROP TABLE PROJECT_TBL;
DROP TABLE PROCEEDING_TBL;

CREATE TABLE DEPARTMENT_TBL(
    DEPT_NO         VARCHAR2(15)     NOT NULL PRIMARY KEY
  , DEPT_NAME       VARCHAR2(30)
  , DEPT_LOCATION   VARCHAR2(50)
);

CREATE TABLE EMPLOYEE_TBL(
    EMP_NO          NUMBER          NOT NULL PRIMARY KEY
  , DEPT_NO         VARCHAR2(15)    REFERENCES DEPARTMENT_TBL(DEPT_NO)
  , POSITION        CHAR(10)    
  , NAME            VARCHAR2(15)
  , HIRE_DATE       DATE
  , SALARY          NUMBER
);

CREATE TABLE PROJECT_TBL(
    PJT_NO          NUMBER          NOT NULL PRIMARY KEY
  , PJT_NAME        VARCHAR2(30)    
  , BEGIN_DATE      DATE
  , END_DATE        DATE
);

CREATE TABLE PROCEEDING_TBL(
    PCD_NO          NUMBER          NOT NULL PRIMARY KEY
  , EMP_NO          NUMBER          REFERENCES EMPLOYEE_TBL(EMP_NO)
  , PJT_NO          NUMBER          REFERENCES PROJECT_TBL(PJT_NO)
  , PJT_STATE       NUMBER          NOT NULL
);






