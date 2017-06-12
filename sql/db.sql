DROP DATABASE IF EXISTS db_javaee;
CREATE DATABASE db_javaee;

DROP TABLE IF EXISTS db_javaee.user;
CREATE TABLE db_javaee.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(255) NOT NULL
  COMMENT 'email',
  password VARCHAR(255) NOT NULL
  COMMENT 'password',
  city     VARCHAR(255) COMMENT 'city',
  hobby    VARCHAR(255) COMMENT 'hobby'
)
  COMMENT '用户表' ;

SELECT *
FROM db_javaee.user;

show variables like 'char%';
show variables like 'coll%';
