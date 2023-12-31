/*
    NULL 처리 함수
    1. NVL(표현식, 표현식의 결과가 NULL인 경우에 사용할 값)
    2. NVL(표현식, 표현식의 결과가 NULL이 아닌 경우에 사용할 값, 표현식의 결과가 NULL인 경우에 사용할 값)
*/
-- 1. 사원 테이블에서 사원번호와 부서번호 조회하기
-- 부서번호가 없는 경우에는 0으로 조회하기
SELECT EMPLOYEE_ID, NVL(DEPARTMENT_ID, 0)
  FROM EMPLOYEES;
  
-- 2. 사원 테이블에서 모든 사원들의 실제 커미션을 조회하기
-- 커미션 = 연봉 * 커미션 퍼센트
-- 커미션 받지 않는 경우 0으로 조회하기
SELECT EMPLOYEE_ID, NVL(COMMISSION_PCT, 0) * SALARY AS COMMISION1
  FROM EMPLOYEES;

SELECT EMPLOYEE_ID, NVL(COMMISSION_PCT * SALARY, 0) AS COMMISION1
  FROM EMPLOYEES;

