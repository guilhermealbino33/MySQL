DROP DATABASE IF EXISTS `desi_vendas`;
CREATE DATABASE `desi_vendas`; 
USE `desi_vendas`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `tipo_pagamento` (
  `id_tipo_pagamento` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `tipo_pagamento` VALUES (1,'Cartão de Crédito');
INSERT INTO `tipo_pagamento` VALUES (2,'Dinheiro');
INSERT INTO `tipo_pagamento` VALUES (3,'PayPal');
INSERT INTO `tipo_pagamento` VALUES (4,'Transferência Eletrônica');

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` char(2) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `cliente` VALUES (1,'Vicente','Rua Nevada, 3','Tubarão','SC','483252-7305');
INSERT INTO `cliente` VALUES (2,'Marcos','Avenida Ivo Silveira, 34267','Florianópolis','SC','483659-1170');
INSERT INTO `cliente` VALUES (3,'Yadel','Rua São Geraldo, 96 ','São Paulo','SP','115144-6037');
INSERT INTO `cliente` VALUES (4,'Kaio','Rua Patrício Lima, 81674','Rio de Janeiro','RJ','215750-0784');
INSERT INTO `cliente` VALUES (5,'Teresa','Avenida Mauro Ramos, 863','Porto Alegre','RS','114888-9129');

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total_compra` decimal(9,2) NOT NULL,
  `total_pagamento` decimal(9,2) NOT NULL DEFAULT '0.00',
  `data_compra` date NOT NULL,
  `data_limite` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `FK_id_cliente` (`id_cliente`),
  CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `compra` VALUES (1,'91-953-3396',2,101.79,0.00,'2019-03-09','2019-03-29',NULL);
INSERT INTO `compra` VALUES (2,'03-898-6735',5,175.32,8.18,'2019-06-11','2019-07-01','2019-02-12');
INSERT INTO `compra` VALUES (3,'20-228-0335',5,147.99,0.00,'2019-07-31','2019-08-20',NULL);
INSERT INTO `compra` VALUES (4,'56-934-0748',3,152.21,0.00,'2019-03-08','2019-03-28',NULL);
INSERT INTO `compra` VALUES (5,'87-052-3121',5,169.36,0.00,'2019-07-18','2019-08-07',NULL);
INSERT INTO `compra` VALUES (6,'75-587-6626',1,157.78,74.55,'2019-01-29','2019-02-18','2019-01-03');
INSERT INTO `compra` VALUES (7,'68-093-9863',3,133.87,0.00,'2019-09-04','2019-09-24',NULL);
INSERT INTO `compra` VALUES (8,'78-145-1093',1,189.12,0.00,'2019-05-20','2019-06-09',NULL);
INSERT INTO `compra` VALUES (9,'77-593-0081',5,172.17,0.00,'2019-07-09','2019-07-29',NULL);
INSERT INTO `compra` VALUES (10,'48-266-1517',1,159.50,0.00,'2019-06-30','2019-07-20',NULL);
INSERT INTO `compra` VALUES (11,'20-848-0181',3,126.15,0.03,'2019-01-07','2019-01-27','2019-01-11');
INSERT INTO `compra` VALUES (13,'41-666-1035',5,135.01,87.44,'2019-06-25','2019-07-15','2019-01-26');
INSERT INTO `compra` VALUES (15,'55-105-9605',3,167.29,80.31,'2019-11-25','2019-12-15','2019-01-15');
INSERT INTO `compra` VALUES (16,'10-451-8824',1,162.02,0.00,'2019-03-30','2019-04-19',NULL);
INSERT INTO `compra` VALUES (17,'33-615-4694',3,126.38,68.10,'2019-07-30','2019-08-19','2019-01-15');
INSERT INTO `compra` VALUES (18,'52-269-9803',5,180.17,42.77,'2019-05-23','2019-06-12','2019-01-08');
INSERT INTO `compra` VALUES (19,'83-559-4105',1,134.47,0.00,'2019-11-23','2019-12-13',NULL);

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `date` date NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `tipo_pagamento` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `fk_id_cliente_idx` (`id_cliente`),
  KEY `fk_id_compra_idx` (`id_compra`),
  KEY `fk_pagamento_tipo_pagamento_idx` (`tipo_pagamento`),
  CONSTRAINT `fk_pagamento_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pagamento_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pagamento_tipo_pagamento` FOREIGN KEY (`tipo_pagamento`) REFERENCES `tipo_pagamento` (`id_tipo_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `pagamento` VALUES (1,5,2,'2019-02-12',8.18,1);
INSERT INTO `pagamento` VALUES (2,1,6,'2019-01-03',74.55,1);
INSERT INTO `pagamento` VALUES (3,3,11,'2019-01-11',0.03,1);
INSERT INTO `pagamento` VALUES (4,5,13,'2019-01-26',87.44,1);
INSERT INTO `pagamento` VALUES (5,3,15,'2019-01-15',80.31,1);
INSERT INTO `pagamento` VALUES (6,3,17,'2019-01-15',68.10,1);
INSERT INTO `pagamento` VALUES (7,5,18,'2019-01-08',32.77,1);
INSERT INTO `pagamento` VALUES (8,5,18,'2019-01-08',10.00,2);
