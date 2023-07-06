-- 1. 절대값
SELECT ABS(-5)      -- -5의 절대값 5
  FROM DUAL;
  
-- 2. 제곱근(루트)
SELECT SQRT(25)     -- 루트 25
  FROM DUAL;

-- 3. 부호 판별
SELECT SIGN(5),     -- 양수는 1 
       SIGN(-5),    -- 음수는 -1
       SIGN(0)      -- 0은 0
  FROM DUAL;
  
-- 4. 제곱
SELECT POWER(2, 10)
  FROM DUAL;

-- 5. 나머지
SELECT MOD(5, 3) -- 5를 3으로 나눈 나머지 2
  FROM DUAL;
  
-- 6. 정수로 올림
SELECT CEIL(1.1)   --  2 
     , CEIL(-1.1)  -- -1
  FROM DUAL;

-- 7. 정수로 내림
SELECT FLOOR(1.9)  --  1
     , FLOOR(-1.9) -- -2
  FROM DUAL;
  
-- 8. 원하는 자릿수로 반올림
SELECT ROUND(123.456)     -- 123   (정수로 반올림)
     , ROUND(123.456, 1)  -- 123.5 (소수 첫번째 자리로 반올림)
     , ROUND(123.456, 2)  -- 123.46(소수 두번째 자리로 반올림)
     , ROUND(123.456, -1) -- 120   (일의 자리에서 반올림)
     , ROUND(123.456, -2) -- 100   (십의 자리에서 반올림)
  FROM DUAL;
  
-- 9. 원하는 자릿수로 절사
SELECT TRUNC(123.456)     -- 123      (정수로 절사)
     , TRUNC(123.456, 1)  -- 123.4    (소수 첫번째 자리로 절사)
     , TRUNC(123.456, 2)  -- 123.45   (소수 두번째 자리로 절사)
     , TRUNC(123.456, -1) -- 120      (일의 자리에서 절사)
     , TRUNC(123.456, -3) -- 100      (십의 자리에서 절사)
  FROM DUAL;
  
  
