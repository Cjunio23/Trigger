ALTER TABLE funcionario DISABLE ALL TRIGGERS;
DROP TRIGGER ALTERACAO_SALARIO;
DROP TRIGGER registra_salario_auditoria;
CREATE OR REPLACE TRIGGER registra_salario_auditoria
BEFORE DELETE OR INSERT OR UPDATE OF salario
ON funcionario
FOR EACH ROW
BEGIN
IF :NEW.salario < 20000 THEN
:NEW.salario := 20000;
ELSIF :NEW.salario > 50000 THEN
:NEW.salario := 50000;
END IF;
INSERT INTO auditoria VALUES
(sysdate, :OLD.CPF, :OLD.salario, :NEW.salario, user);
END;
--UPDATE
UPDATE funcionario SET salario = 5000
WHERE cpf = '45345345376';
UPDATE funcionario SET salario = 60000
WHERE cpf = '45345345376';
