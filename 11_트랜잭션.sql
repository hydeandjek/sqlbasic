
--����Ŀ�� ���� Ȯ��
SHOW AUTOCOMMIT;

--����Ŀ�� ��
SET AUTOCOMMIT ON;

--����Ŀ�� ����
SET AUTOCOMMIT OFF;

SELECT * FROM emps;

DELETE FROM emps where employee_id = 304;

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (306, 'kim', 'kim1234@gmail.com', sysdate, 1800);

--�������� ��� ������ ��������� ���(���)
--���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����.
ROLLBACK;

--���̺� ����Ʈ ����.
--�ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����.
--ANSIǥ�� ������ �ƴϱ� ������ �׷��� ���������� ����.
ROLLBACK TO SAVEPOINT insert_park;
--�������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ����
--Ŀ�� �Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� �����ϴ�.
COMMIT;


SAVEPOINT insert_park;





























