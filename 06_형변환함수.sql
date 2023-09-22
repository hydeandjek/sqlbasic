
--�� ��ȯ �Լ� TO_CHAR, TO_NUMBER, TO DATE

--��¥�� ��¥�� TO_CHAR(��,����)
SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DY HH24:MI:SS') FROM dual;

--���� ���ڿ� �Բ� ����ϰ� ���� ���ڸ� ""�� ���� �����մϴ�.
SELECT
    first_name, to_char(hire_date,'YYYY"��" MM"��" DD"��"')
FROM employees;

--���ڸ� ���ڷ� to_char(���� ����)
--���Ŀ��� ����ϴ� '9'�� ���� ���� 9�� �ƴ϶� �ڸ����� ǥ���ϱ����� ��ȣ�Դϴ�.
SELECT to_char(20000,'99999') from dual;
--�־��� �ڸ����� ���ڸ� ��� ǥ���� �� ��� ��� #���� ǥ��˴ϴ�.
SELECT to_char(20000,'9999') from dual;
SELECT to_char(20000.29,'99999.9') from dual;
SELECT to_char(20000,'99999') from dual;

SELECT to_char(salary, 'L99,999') as salary
from employees;

--���ڸ� ���ڷ� TO_NUMBER (��, ����)
SELECT '2000'+2000 FROM dual; -- �ڵ� �� ��ȯ(���� -> ����)
SELECT to_NUMBER('2000')+2000 from dual; -- ����� �� ��ȯ
SELECT '$3,300'+2000 from dual; -- ����
SELECT TO_NUMBER('$3,300','$9,999')+2000 from dual;

--���ڸ� ��¥�� ��ȯ�ϴ��Լ� TO_DATE(��,����)
SELECT TO_DATE('2032-04-13') from dual;
SELECT sysdate - TO_DATE('2021-03-26') from dual;
SELECT TO_DATE('2020/12/25', 'YY-MM-DD') from dual;
--�־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�.
SELECT TO_DATE('2021-03-31 12:23:50','YY-MM-DD HH:MI:SS') from dual;

--XXXX�� XX�� XX�� ���ڿ� �������� ��ȯ�� ������.
--��ȸ �÷����� dateInfo��� �ϰٽ��ϴ�.
SELECT '20050102' FROM dual;
SELECT 
    TO_CHAR(
        to_date('20050102','YYYYMMDD'),
        'YYYY"��" MM"��" DD"��"'

    ) as dateInfo
from dual;

--NULL ���¸� ��ȯ�ϴ� �Լ� NVL(�÷�, ��ȯ�� Ÿ�ٰ�)
SELECT NULL FROM dual;
SELECT NVL(NULL,0) FROM dual;

SELECT 
    first_name,
    NVL(commission_pct,0)as comm_pct
FROM employees;

--NULL ��ȯ �Լ� NVL2(�÷�,null �� �ƴ� ����� ��, NULL�� ����� ��)
SELECT
    NVL2(NULL,'�ξƴ�','����')
FROM dual;

SELECT
    first_name,
    NVL2(commission_pct,'true','false')
FROM employees;

SELECT 
    first_name,
    commission_pct,
    NVL2(commission_pct,salary+(salary*commission_pct),salary)as real_salary
FROM employees;

--null�� ������ ���� �ʽ��ϴ�.
SELECT 
    first_name,
    salary,
    salary+(salary*commission_pct)
FROM employees;

--DECODE(�÷� Ȥ�� ǥ����,�׸�1,���1,�׸�2,���2, ..... default)
SELECT
    DECODE('C','A','A�Դϴ�.','B','B�Դϴ�.','C','C�Դϴ�.','���ϱ�?')
FROM dual;

SELECT
    job_id,
    salary,
    DECODE(
        job_id,
        'IT_PROG',salary*1.1,
        'FI_MGR',salary*1.2,
        'AD_VP',salary*1.3
    )as result
FROM employees;

--CASE WHEN THEN END
SELECT
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGR' THEN salary*1.2
        WHEN 'AD_VP' THEN salary*1.3
        WHEN 'FI_ACCOUNT' THEN salary*1.4
        ELSE salary
    END)as RESULT

FROM employees;

/*
���� 1.
�������ڸ� �������� employees���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�
*/

SELECT 
    employee_id as �����ȣ,
    CONCAT(first_name,last_name) AS �����,
    hire_date as �Ի�����,
    TRUNC((sysdate-hire_date)/365) AS �ټӳ��
FROM employees
where (sysdate-hire_date)/365 >=17
ORDER BY �ټӳ�� DESC;
/*
���� 2.
EMPLOYEES ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/
SELECT
    first_name,
    manager_id,
    (case manager_id
        WHEN 100 THEN '���'
        WHEN 120 THEN '����'
        WHEN 121 THEN '�븮'
        WHEN 122 THEN '����'
        ELSE '�ӿ�'
        END)as ����
FROM employees
WHERE department_id =50;

















