# Trigger
A partir do esquema de banco de dados,no consulta sql, implemente e teste
os seguintes triggers de banco de dados. Inclua, na solução, os comandos realizados e os seus resultados, 
inclusive os testes.
1) Crie um trigger que registre na seguinte tabela de auditoria qualquer alteração de salário na tabela 
FUNCIONARIO. Nessa tabela, DATA deve ser alimentada com a função SYSDATE que retorna data 
e hora e USUARIO com a função USER, que retorna o usuário do banco de dados que fez a alteração.
CREATE TABLE AUDITORIA (
DATA DATE, 
CPF VARCHAR2(11), 
SALARIO_ANTERIOR NUMBER (10,2), 
SALARIO_ATUAL NUMBER (10,2),
USUARIO VARCHAR2(40),
PRIMARY KEY (CPF, DATA));
2) Crie um trigger que limite a alteração de salário empregado entre 20.000 e 50.000. Caso fique fora 
desses limites, o novo salário deve ser limitado ao mínimo de 20.000, se a alteração for para um salário 
seja menor do que 20.000, ou ao máximo de 50.000, se maior do que este valor. O gatilho deve ser
disparado a cada linha atualizada. Utilize o registro :NEW para obter os novos valores de salário. Esse 
registro permite inclusive sobreposição de valores dentro do trigger, antes que a atualização seja 
efetivada no banco de dados.
3) Criar trigger para manter a quantidade de empregados em DEPARTAMENTO. Inicialmente, inclua,
na tabela, a coluna QUANTIDADE_FUNCIONARIOS para armazenar a quantidade de funcionários na 
empresa. Para isso use o seguinte comando DDL: 
Alter table DEPARTAMENTO add QUANTIDADE_FUNCIONARIOS number(5);
Em seguida, essa coluna deve ser inicializada para todos os departamentos com a contagem de todos os 
funcionários em cada departamento. Faça isso com o comando UPDATE, apresentado a seguir, o qual 
correlaciona cada tupla de DEPARTAMENTO com a sua contagem de funcionários.
update DEPARTAMENTO D set QUANTIDADE_FUNCIONARIOS = 
 (select count(*) from FUNCIONARIO F
 where D.NUMERO_DEPARTAMENTO = F.NUMERO_DEPARTAMENTO);
Finalmente, crie um trigger para refletir na coluna QUANTIDADE_FUNCIONARIOS qualquer
inclusão ou exclusão na tabela FUNCIONARIO.
