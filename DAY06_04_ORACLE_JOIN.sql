-- 내부 조인

-- 1. 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       D.DEPARTMENT_ID,  -- 2개의 네이블에 모두있는 COLUMN은 반드시 테이블(오너)을 명시해야 한다.
       DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
-- 2. 사원번호, 사원명, 직업, 연봉, 직업별 최대연봉, 직업별 최소연봉을 조회하시오.
SELECT EMPLOYEE_ID, 
       CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) AS FULLNAME,
       J.JOB_ID,
       SALARY,
       MAX_SALARY,
       MIN_SALARY
  FROM JOBS J, EMPLOYEES E
 WHERE J.JOB_ID = E.JOB_ID;
    
-- 외부 조인

-- 3. 모든사원번호, 사원명, 부서번호, 부서명을 조회하시오. (부서 번호가 없는 사원도 조회)
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       D.DEPARTMENT_ID,  -- 2개의 네이블에 모두있는 COLUMN은 반드시 테이블(오너)을 명시해야 한다.
       DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E  -- 오른쪽 테이블(EMPLOYEES)의 모든 데이터를 조회하시오.
-- FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D -- 왼쪽 테이블(EMPLOYEES)의 모든 데이터를 조회하시오. 
 WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID;
 
-- 4. 모든사원번호, 사원명, 부서번호, 부서명을 조회하시오. (사원이 없는 부서도 조회)
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       D.DEPARTMENT_ID,  -- 2개의 네이블에 모두있는 COLUMN은 반드시 테이블(오너)을 명시해야 한다.
       DEPARTMENT_NAME
--FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E  -- 왼쪽 테이블(DEPARTMENTS)의 모든 데이터를 조회하시오.
  FROM EMPLOYEES E, DEPARTMENTS D -- 오른쪽 테이블(DEPARTMENTS)의 모든 데이터를 조회하시오.
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID (+);
    
-- 3개 이상 테이블 조인하기

-- 5. 사원번호, 사원명, 부서번호, 부서명, 근무지역을 조회하시오
SELECT EMPLOYEE_ID                                      ,
       CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)       ,
       D.DEPARTMENT_ID                                  ,
       DEPARTMENT_NAME                                  ,
       L.LOCATION_ID                                    ,
       CITY
  FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E 
 WHERE L.LOCATION_ID = D.LOCATION_ID
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
    
    
-- 6. 부서번호, 부서이름, 근무도시, 근무국가
SELECT DEPARTMENT_ID                                    ,
       DEPARTMENT_NAME                                  ,
       CITY                                             ,
       C.COUNTRY_NAME                                                                                  
  FROM COUNTRIES C, LOCATIONS L, DEPARTMENTS D
 WHERE C.COUNTRY_ID = L.COUNTRY_ID
   AND L.LOCATION_ID = D.LOCATION_ID;