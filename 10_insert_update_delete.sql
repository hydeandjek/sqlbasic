
--insert
--테이블 구조 확인
DESC departments;

--INSERT의 첫 번째 방법(모든 컬럼 데이터를 한 번에 지정)
INSERT INTO departments
VALUES(290,'영업부',102,1800);

SELECT * FROM departments;
ROLLBACK; --실행시점을 다시 뒤로 되돌리는 키워드

--  INSERT의 두번째 방법( 직접 컬럼을 지정하라고 저장, NOT NULL확인)
INSERT INTO departments
    (department_id,department_name,manager_id,location_id)
VALUES
    (280,'개발부',103,1700);

--사본 테이블 생성
--사본 테이블을 생성할때 그냥 생성하면 -> 조회된 데이터 까지 모두 복사
--WHERE절에 FALSE 값(1=2)지정하면 -> 테이블의 구조만 복사되고 데이터는 복사X
CREATE TABLE emps AS 
(SELECT employee_id,first_name,job_id,hire_date
FROM employees WHERE 1=2);

SELECT * FROM emps;
DROP TABLE emps;

--INSERT (서브쿼리)
INSERT INTO emps
(SELECT employee_id,first_name,job_id,hire_date
FROM employees WHERE department_id=50);

--------------------------------------------------------------------------------

--UPDATE
CREATE TABLE emps AS
(SELECT *
FROM employees );

SELECT * FROM emps;

--UPDATE 를 진행할때는 누구를 수정할지 잘 지목해야합니다,
--그렇지 않으면 수정대상이 테이블 전체로 지목됩니다.
UPDATE emps SET salary=30000
WHERE employee_id = 100;

UPDATE emps
SET phone_number = '010.4742.8917' , manager_id=102
WHERE employee_id = 100;

--update (서브쿼리)
UPDATE emps
    SET (job_id ,salary,manager_id)=
        (
            SELECT job_id, salary,manager_id
            FROM emps
            WHERE employee_id=100
        )
WHERE employee_id =101;

--------------------------------------------------------------------------------

--DELETE
DELETE FROM emps
WHERE employee_id=103;

--DELETE (서브쿼리)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name ='IT');




































