
--insert
--���̺� ���� Ȯ��
DESC departments;

--INSERT�� ù ��° ���(��� �÷� �����͸� �� ���� ����)
INSERT INTO departments
VALUES(290,'������',102,1800);

SELECT * FROM departments;
ROLLBACK; --��������� �ٽ� �ڷ� �ǵ����� Ű����

--  INSERT�� �ι�° ���( ���� �÷��� �����϶�� ����, NOT NULLȮ��)
INSERT INTO departments
    (department_id,department_name,manager_id,location_id)
VALUES
    (280,'���ߺ�',103,1700);

--�纻 ���̺� ����
--�纻 ���̺��� �����Ҷ� �׳� �����ϸ� -> ��ȸ�� ������ ���� ��� ����
--WHERE���� FALSE ��(1=2)�����ϸ� -> ���̺��� ������ ����ǰ� �����ʹ� ����X
CREATE TABLE emps AS 
(SELECT employee_id,first_name,job_id,hire_date
FROM employees WHERE 1=2);

SELECT * FROM emps;
DROP TABLE emps;

--INSERT (��������)
INSERT INTO emps
(SELECT employee_id,first_name,job_id,hire_date
FROM employees WHERE department_id=50);

--------------------------------------------------------------------------------

--UPDATE
CREATE TABLE emps AS
(SELECT *
FROM employees );

SELECT * FROM emps;

--UPDATE �� �����Ҷ��� ������ �������� �� �����ؾ��մϴ�,
--�׷��� ������ ��������� ���̺� ��ü�� ����˴ϴ�.
UPDATE emps SET salary=30000
WHERE employee_id = 100;

UPDATE emps
SET phone_number = '010.4742.8917' , manager_id=102
WHERE employee_id = 100;

--update (��������)
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

--DELETE (��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name ='IT');




































