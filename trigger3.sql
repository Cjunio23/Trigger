Alter table DEPARTAMENTO add QUANTIDADE_FUNCIONARIOS number(5);
UPDATE departamento d SET quantidade_funcionarios = (SELECT count(*)
FROM funcionario f WHERE d.numero_departamento = f.numero_departamento);
SELECT * FROM departamento;
CREATE OR REPLACE TRIGGER manter_quantidade_departamento
BEFORE DELETE OR INSERT OR UPDATE OF cpf
ON funcionario
FOR EACH ROW
BEGIN
IF DELETING THEN
Raise_Application_Error(-20001, 'Não é permitido demetir
funcionarios!');
ELSIF INSERTING THEN
Raise_Application_Error(-20001, 'Não é permitido inserir novos
funcionarios!');
END IF;
END;
INSERT INTO funcionario VALUES
('Renan', 'U', 'Cruz', '00000000000', '23/11/2001', 'Rua Cefet Mg, BDI,
BH', 'M', '3000', '33344555587', 5);
