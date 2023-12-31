-- 1. LOCATION_ID가 1700인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오.
-- 1) ANSI
SELECT L.LOCATION_ID,
       EMPLOYEE_ID,
       FIRST_NAME,
       D.DEPARTMENT_NAME
  FROM LOCATIONS L INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 WHERE L.LOCATION_ID = 1700;
 
-- 2) 오라클
SELECT L.LOCATION_ID,
       EMPLOYEE_ID,
       FIRST_NAME,
       D.DEPARTMENT_NAME
  FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
 WHERE L.LOCATION_ID = D.LOCATION_ID
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID
   AND L.LOCATION_ID = 1700;

-- 2. DEPARTMENT_NAME이 'Executive'인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME을 조회하시오.
-- 1) ANSI
SELECT EMPLOYEE_ID,
       FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 WHERE D.DEPARTMENT_NAME = 'Executive';

-- 2) 오라클
SELECT EMPLOYEE_ID,
       FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
   AND D.DEPARTMENT_NAME = 'Executive';


-- 3. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME, STREET_ADDRESS, CITY를 조회하시오.
-- 1) ANSI
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       DEPARTMENT_NAME,
       STREET_ADDRESS, 
       CITY
  FROM LOCATIONS L INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID RIGHT OUTER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 2) 오라클
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       DEPARTMENT_NAME,
       STREET_ADDRESS, 
       CITY
  FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
 WHERE L.LOCATION_ID = D.LOCATION_ID
   AND D.DEPARTMENT_ID (+) = E.DEPARTMENT_ID;


-- 4. 부서별 DEPARTMENT_NAME과 사원 수와 평균 연봉을 조회하시오.
-- 1) ANSI
SELECT D.DEPARTMENT_NAME,
       COUNT(D.DEPARTMENT_NAME), 
       FLOOR(AVG(E.SALARY)) 
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 GROUP BY D.DEPARTMENT_NAME;

-- 2) 오라클
SELECT D.DEPARTMENT_NAME,
       COUNT(D.DEPARTMENT_NAME), 
       FLOOR(AVG(E.SALARY)) 
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
 GROUP BY D.DEPARTMENT_NAME;


-- 5. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오. 부서가 없는 사원의 부서명은 'None'으로 조회되도록 처리하시오.
-- 1) ANSI
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       NVL(DEPARTMENT_NAME, 'None')
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
  
-- 2) 오라클
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       NVL(DEPARTMENT_NAME, 'None')
  FROM DEPARTMENTS D , EMPLOYEES E
 WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID;


-- 6. 모든 부서의 DEPARTMENT_NAME과 근무 중인 사원 수를 조회하시오. 근무하는 사원이 없으면 0으로 조회하시오.
-- 1) ANSI
SELECT DEPARTMENT_NAME,
       COUNT(E.DEPARTMENT_ID)
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
 GROUP BY DEPARTMENT_NAME;

-- 2) 오라클
SELECT DEPARTMENT_NAME,
       COUNT(E.DEPARTMENT_ID)
  FROM DEPARTMENTS D , EMPLOYEES E
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID(+)
 GROUP BY DEPARTMENT_NAME;


-- 7. 모든 부서의 DEPARTMENT_ID, DEPARTMENT_NAME, STATE_PROVINCE, COUNTRY_NAME, REGION_NAME을 조회하시오.
-- 1) ANSI
SELECT DEPARTMENT_ID,       -- DEPARTMENTS
       DEPARTMENT_NAME,     -- DEPARTMENTS
       STATE_PROVINCE,      -- LOCATIONS
       COUNTRY_NAME,        -- COUNTRYS
       REGION_NAME          -- REGION
  FROM REGIONS R INNER JOIN COUNTRIES C
    ON R.REGION_ID = C.REGION_ID INNER JOIN LOCATIONS L
    ON C.COUNTRY_ID = L.COUNTRY_ID RIGHT OUTER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID;

-- 2) 오라클
SELECT DEPARTMENT_ID,       -- DEPARTMENTS
       DEPARTMENT_NAME,     -- DEPARTMENTS
       STATE_PROVINCE,      -- LOCATIONS
       COUNTRY_NAME,        -- COUNTRYS
       REGION_NAME          -- REGION
  FROM REGIONS R, COUNTRIES C, LOCATIONS L, DEPARTMENTS D
 WHERE R.REGION_ID = C.REGION_ID
   AND C.COUNTRY_ID = L.COUNTRY_ID
   AND L.LOCATION_ID = D.LOCATION_ID;


-- 8. 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID의 FIRST_NAME을 조회하시오. (SELF JOIN)
-- 1) ANSI
SELECT E.EMPLOYEE_ID  ,
       M.FIRST_NAME   ,
       E.LAST_NAME    ,
       E.MANAGER_ID
  FROM EMPLOYEES M RIGHT OUTER JOIN EMPLOYEES E
    ON E.MANAGER_ID = M.EMPLOYEE_ID;
  
-- 2) 오라클
SELECT E.EMPLOYEE_ID  ,
       M.FIRST_NAME   ,
       E.LAST_NAME    ,
       E.MANAGER_ID
  FROM EMPLOYEES M, EMPLOYEES E
 WHERE E.MANAGER_ID = M.EMPLOYEE_ID(+);

-- 9. 각 사원 중에서 매니저보다 먼저 입사한 사원을 조회하시오. (SELF JOIN)
-- 1) ANSI
SELECT E1.FIRST_NAME,
       E1.LAST_NAME,
       E1.HIRE_DATE
  FROM EMPLOYEES E1 INNER JOIN EMPLOYEES E2
    ON E1.EMPLOYEE_ID = E2.MANAGER_ID
 WHERE E1.HIRE_DATE < E2.HIRE_DATE;
 
-- 2) 오라클
-- 1) ANSI
SELECT E1.FIRST_NAME,
       E1.LAST_NAME,
       E1.HIRE_DATE
  FROM EMPLOYEES E1, EMPLOYEES E2
 WHERE E1.EMPLOYEE_ID = E2.MANAGER_ID
   AND E1.HIRE_DATE < E2.HIRE_DATE;


-- 10. 같은 부서에 근무하는 사원 중에서 나보다 SALARY가 높은 사원 정보를 조회하시오. (SELF JOIN)
-- 1) ANSI
SELECT *
  FROM EMPLOYEES E1 INNER JOIN EMPLOYEES E2
    ON E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
 WHERE E1.SALARY < E2.SALARY;
 
-- 2) 오라클
SELECT *
  FROM EMPLOYEES E1, EMPLOYEES E2
 WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
   AND E1.SALARY < E2.SALARY;