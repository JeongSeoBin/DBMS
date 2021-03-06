--윈도우 함수
--SELECT 컬럼1,컬럼2,,,,, 그룹함수(컬럼) OVER (PARTITION BY 컬럼명) FROM 테이블
--그룹함수 데이터와 그냥 데이터를 함께 출력할때 그룹을 사용하면 그냥 데이터들로도 그룹으로 묶어줘야한다
SELECT * FROM EMPLOYEES;
SELECT
   FIRST_NAME || LAST_NAME
   DEPARTMENT_ID,
   SUM(SALARY) 
FROM EMPLOYEES GROUP BY DEPARTMENT_ID,FIRST_NAME,LAST_NAME;

SELECT
   FIRST_NAME || LAST_NAME,
   DEPARTMENT_ID 부서번호,
   SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID) 
FROM EMPLOYEES;

SELECT
   ENAME,
   SAL,
   RANK() OVER (ORDER BY SAL) 부서별총급여
FROM EMP;

SELECT
   ENAME,
   SAL,
   JOB,
   RANK() OVER (PARTITION BY JOB ORDER BY SAL) 직무별순위,
   ROW_NUMBER() OVER (PARTITION BY JOB ORDER BY SAL) 행번호
FROM EMP;

SELECT 
   ENAME,
   SAL,
   FIRST_VALUE(ENAME) OVER (PARTITION BY DEPTNO)
FROM EMP;

--LAG:이전 행 LEAD:따라오는 다음행
--2번째 인수 : 2번째 행 이전 다음
--3번째 인수 :NULL인 경우 대체 문자
SELECT 
   ENAME,
   SAL,
   LAG(ENAME,2,'X') OVER (ORDER BY DEPTNO) 이전행,
   LEAD(ENAME,2,'X') OVER (ORDER BY DEPTNO) 다음행
FROM EMP;








