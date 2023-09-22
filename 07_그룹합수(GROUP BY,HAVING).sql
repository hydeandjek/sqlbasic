
--�׷��Լ� AVG , MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; --�� �� �������� ��
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees;--null�� �ƴ� ���� ��
SELECT COUNT(manager_id) FROM employees; --null�� �ƴ� ���� ��

--�μ����� �׷�ȭ,�׷��Լ��� ���
SELECT 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

--�������� 
--�׷��Լ��� �Ϲ� Ŀ���� ���ÿ� �׳� ���X

SELECT 
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id,job_id
ORDER BY dapartment_id;

--GROUP BY �� ���� �׷�ȭ �Ҷ� ������ �� ��� HAVING �� ���.
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

--�μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� ���� ����� 5000 �̻� ��ȸ
SELECT
    department_id,
    AVG(salary) AS ���
FROM employees
WHERE department_id>=50
GROUP BY department_id
HAVING AVG(salary)>=5000
ORDER BY department_id DESC;

/*
���� 1.
1-1.��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
1-2.��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
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
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/

SELECT
    TO_CHAR(
        hire_date,'YYYY'
    )AS �Ի�⵵,
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY')
ORDER BY �Ի�⵵ ASC;

















