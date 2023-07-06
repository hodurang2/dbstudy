-- 1. 대소문자 변환하기.
SELECT UPPER(EMAIL),        -- 모두 대문자
       LOWER(EMAIL),        -- 모두 소문자
       INITCAP(EMAIL)       -- 첫글자만 대문자
  FROM EMPLOYEES;
  
-- 2. 글자 수
SELECT FIRST_NAME,
       LENGTH(FIRST_NAME)
  FROM EMPLOYEES;
  
-- 3. BYTE수
SELECT FIRST_NAME,
        LENGTHB(FIRST_NAME)
  FROM EMPLOYEES;

-- 4. 연결하기
--    1) || 연산자 (오라클 전용이므로 다른DB에서는 오류가 난다.)
--    2) CONCAT 함수
--       CONCAT(A, B) : 인수 2개만 전달가능.
--       CONCAT(CONCAT(A, B), C) : 인수 3개 이상은  CONCAT여러개로 해결
SELECT *
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515' || '%';
 
SELECT * 
  FROM EMPLOYEES
  WHERE PHONE_NUMBER LIKE CONCAT('515', '%');
  
SELECT * 
  FROM EMPLOYEES
 WHERE EMAIL LIKE CONCAT(CONCAT('%', 'A'), '%'); -- A를 포함
 
-- 5. 일부만 변형하기.
SELECT SUBSTR(PHONE_NUMBER, 1, 3), -- 전화번호 1번째부터 3개 반환
       SUBSTR(PHONE_NUMBER, 5)     -- 전화번호 5번째부터 끝까지 반환 
  FROM EMPLOYEES;
  
-- 6. 특정 문자의 위치 반환하기.
SELECT EMAIL,
       INSTR(EMAIL, 'A')  -- EMAIL안에 A의 위치가 어디있는지 반환(첫번째로 찾은위치만)
  FROM EMPLOYEES;
  
-- 7. 바꾸기
SELECT EMAIL,
       REPLACE(EMAIL, 'A', '$') -- EMAIL안에 모든 A를 $로 변경
  FROM EMPLOYEES;
  
-- 8. 채우기
--    1) LPAD(표현식, 전체폭, 채울문자)
--    2) RPAD(표현식, 전체폭, 채울문자)
SELECT DEPARTMENT_ID,
       LPAD(DEPARTMENT_ID, 3, 0),
       EMAIL,
       RPAD(SUBSTR(EMAIL, 1, 2), 5, '*')
  FROM EMPLOYEES; 
  
-- 9. 공백 제거 (좌우 가능 중간 불가능)
SELECT CONCAT(CONCAT('[', LTRIM('      HELLO           WORLD           ')), ']'),
       CONCAT(CONCAT('[', RTRIM('      HELLO           WORLD           ')), ']'),
       CONCAT(CONCAT('[', TRIM('      HELLO           WORLD           ')), ']')
  FROM DUAL;
  
-- 실습.
-- 1. 사원 테이블의 JOB_ID에서 밑줄(_) 앞/뒷 부분만 조회하기.
SELECT JOB_ID,
       INSTR(JOB_ID, '_')                               ,
       SUBSTR(JOB_ID, 1, INSTR(JOB_ID, '_')-1) AS LAST_ ,
       SUBSTR(JOB_ID, INSTR(JOB_ID, '_')+1) AS FIRST_ 
  FROM EMPLOYEES;
  
-- 1-1) WHERE로 해보기
SELECT JOB_ID, SUBSTR(JOB_ID, 1, 2)
  FROM EMPLOYEES
 WHERE JOB_ID LIKE CONCAT(CONCAT('%', '_') ,'%');
-- 2. FIRST_NAME LAST_NAME을 연결해서 모두 대문자로 바꾼 FULL_NAME 조회하기
SELECT FIRST_NAME                                           ,
       LAST_NAME                                            ,
       UPPER(CONCAT(FIRST_NAME, LAST_NAME)) AS FULLNAME
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID;