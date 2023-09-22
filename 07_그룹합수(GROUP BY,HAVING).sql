
--그룹함수 AVG , MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; --총 행 데이터의 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees;--null이 아닌 행의 수
SELECT COUNT(manager_id) FROM employees; --null이 아닌 행의 수

--부서별로 그룹화,그룹함수의 사용
SELECT 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

--주의할점 
--그룹함수는 일반 커럼과 동시에 그냥 출력X

SELECT 
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id,job_id
ORDER BY dapartment_id;

--GROUP BY 를 통해 그룹화 할때 조건을 걸 경우 HAVING 을 사용.
SELECT 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary)>100000;

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*)>=5;

--부서 아이디가 50 이상인 것들을 그룹화 시키고, 그룹 월급 평균이 5000 이상만 조회
SELECT
    department_id,
    AVG(salary) AS 평균
FROM employees
WHERE department_id>=50
GROUP BY department_id
HAVING AVG(salary)>=5000
ORDER BY department_id DESC;

/*
문제 1.
1-1.사원 테이블에서 JOB_ID별 사원 수를 구하세요.
1-2.사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요.
*/
SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id;


SELECT
    job_id,
    AVG(salary)    
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

/*
문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.
(TO_CHAR() 함수를 사용해서 연도만 변환합니다. 그리고 그것을 그룹화 합니다.)
*/

SELECT
    TO_CHAR(
        hire_date,'YYYY'
    )AS 입사년도,
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY')
ORDER BY 입사년도 ASC;

















