-- 1. 순위 구하기
-- RANK() OVER(ORDER BY COLUMN ASC) : 오름차순
-- RANK() OVER(ORDER BY COLUMN DESC) : 내림차순
SELECT EMPLOYEE_ID,
       SALARY,
       RANK() OVER(ORDER BY SALARY DESC) AS 연봉순위, -- 연봉 내림차순 정렬 후 순위 매기기 -> 동점자 처리 있음
       HIRE_DATE,
       RANK() OVER(ORDER BY HIRE_DATE) AS 입사순위    -- 고용일 오름차순 정렬 후 순위 매기기
  FROM EMPLOYEES;
  
-- 2. 행 번호 구하기
SELECT EMPLOYEE_ID,
       SALARY,
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) -- 연봉 내림차순 후 번호매기기 -> 동점자처리 없음
  FROM EMPLOYEES;

-- 3. 암호화 함수
SELECT STANDARD_HASH('1111', 'SHA1'),           -- 암호화 알고리즘 SHA1
       STANDARD_HASH('1111', 'SHA256'),         -- 암호화 알고리즘 SHA256  
       STANDARD_HASH('1111', 'SHA384'),         -- 암호화 알고리즘 SHA384
       STANDARD_HASH('1111', 'SHA512'),         -- 암호화 알고리즘 SHA512
       STANDARD_HASH('1111', 'MD5')             -- 암호화 알고리즘 MD5
  FROM DUAL; 

-- 4. 분기 처리 함수
SELECT EMPLOYEE_ID,
       DEPARTMENT_ID,
       DECODE(DEPARTMENT_ID,
       10, 'Administration',
       20, 'Marketing',
       30, 'Purchasing',
       40, 'Human Resources',
       50, 'Shippung',
       60, 'IT') AS DEPARTMENT_NAME
  FROM EMPLOYEES;

-- 5. 분기 처리 표현식
SELECT EMPLOYEE_ID,
       DEPARTMENT_ID,
       CASE
        WHEN DEPARTMENT_ID = 10 THEN 'ADMINISTRATION'
        WHEN DEPARTMENT_ID = 20 THEN 'Marketing'
        WHEN DEPARTMENT_ID = 30 THEN 'Purchasing'
        WHEN DEPARTMENT_ID = 40 THEN 'Human Resources'
        WHEN DEPARTMENT_ID = 50 THEN 'Shippung'
        WHEN DEPARTMENT_ID = 60 THEN 'IT'
        WHEN DEPARTMENT_ID = 70 THEN 'PM'
        ELSE 'UNKNOWN'
       END AS DEPARTMENT_NAME
  FROM EMPLOYEES;

