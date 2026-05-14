

-- criando usuarios
CREATE USER 'py_user'@'localhost' 
IDENTIFIED BY '*Python159*';
Select user, host FROM mysql.user;
GRANT SELECT, INSERT, UPDATE, DELETE
ON alehdados.* TO 'py_user'@'localhost';
CREATE USER 'estagiario_lucas'@'192.168.1.%' IDENTIFIED BY 'estagio*Lucas112@1999*';
GRANT SELECT(id_cliente, nome_cliente) 
ON alehdados.cliente TO 'estagiario_lucas'@'192.168.1.%';
FLUSH privileges;
DROP USER 'estagiario_lucas'@'192.168.1.%';
SHOW GRANTS FOR 'py_user'@'localhost';

