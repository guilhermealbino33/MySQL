DROP DATABASE IF EXISTS `desi_loja`;
CREATE DATABASE `desi_loja`;
USE `desi_loja`;

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL,
  `preco_unitario` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `produto` VALUES (1,'Prato Plástico Refeição',70,1.21);
INSERT INTO `produto` VALUES (2,'Pernil Suíno',49,4.65);
INSERT INTO `produto` VALUES (3,'Alface Romana',38,3.35);
INSERT INTO `produto` VALUES (4,'Brócolis Chinês',90,4.53);
INSERT INTO `produto` VALUES (5,'Molho Ranch',94,1.63);
INSERT INTO `produto` VALUES (6,'Baguete Pequeno',14,2.39);
INSERT INTO `produto` VALUES (7,'Broto de ervilha',98,3.29);
INSERT INTO `produto` VALUES (8,'Sudo de Framboesa',26,0.74);
INSERT INTO `produto` VALUES (9,'Fruta Olho do Dragão - Longan',67,2.26);
INSERT INTO `produto` VALUES (10,'Vassoura Multiuso',6,1.09);


CREATE TABLE `fornecedor` (
  `id_fornecedor` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `fornecedor` VALUES (1,'Acme LLC');
INSERT INTO `fornecedor` VALUES (2,'Fastco');
INSERT INTO `fornecedor` VALUES (3,'Satturn LLC');
INSERT INTO `fornecedor` VALUES (4,'Bombom S/A');
INSERT INTO `fornecedor` VALUES (5,'WMP Ltda.');


CREATE TABLE `consumidor` (
  `id_consumidor` int(11) NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `data_aniversario` date DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` char(2) NOT NULL,
  `pontos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_consumidor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `consumidor` VALUES (1,'Barbara','Caffrey','1986-03-28','4781932-9754','Avenida Osvaldo Veiga','Blumenau','SC',2273);
INSERT INTO `consumidor` VALUES (2,'Ines','Ushfield','1986-04-13','4804427-9456','Rua Rui Barbosa','Capivari de Baixo','SC',947);
INSERT INTO `consumidor` VALUES (3,'Fred','Borges','1985-02-07','4719724-7869','Avenida Primavera, 251 ','Criciuma','SC',2967);
INSERT INTO `consumidor` VALUES (4,'Antonio','Rosa','1974-04-14','4407231-8017','Rua Arapongas, 5982','Ponta Grossa','PR',457);
INSERT INTO `consumidor` VALUES (5,'Clemente','Bento','1973-11-07',NULL,'Travessa Bom Jesus, 15','Manaus','AM',3675);
INSERT INTO `consumidor` VALUES (6,'Elke','Tancredo','1991-09-04','5312480-8498','Avenida Macau, 4219','Canoas','RS',3073);
INSERT INTO `consumidor` VALUES (7,'Irene','Dias','1964-08-30','8615641-4759','Rua Tiradentes, 50','Natal','RN',1672);
INSERT INTO `consumidor` VALUES (8,'Thalita','Nandi','1993-07-17','1941527-3977','Avenida Paulista, 538','São Paulo','SP',205);
INSERT INTO `consumidor` VALUES (9,'Romulo','Rios','1992-05-23','1559181-3744','Rua Chico Mendes, 4568','Bom Sucesso','RJ',1486);
INSERT INTO `consumidor` VALUES (10,'Levy','Mendes','1969-10-13','1404246-3370','Avenida Atlanta, 10','Maceio','AL',796);


CREATE TABLE `situacao_pedido` (
  `id_situacao_pedido` tinyint(4) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_situacao_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `situacao_pedido` VALUES (1,'Processado');
INSERT INTO `situacao_pedido` VALUES (2,'Transportado');
INSERT INTO `situacao_pedido` VALUES (3,'Entregue');


CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_consumidor` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `situacao` tinyint(4) NOT NULL DEFAULT '1',
  `comentarios` varchar(2000) DEFAULT NULL,
  `data_transporte` date DEFAULT NULL,
  `id_fornecedor` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_consumidor_idx` (`id_consumidor`),
  KEY `fk_pedido_fornecedor_idx` (`id_fornecedor`),
  KEY `fk_pedido_situacao_pedido_idx` (`situacao`),
  CONSTRAINT `fk_pedido_consumidor` FOREIGN KEY (`id_consumidor`) REFERENCES `consumidor` (`id_consumidor`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_situacao_pedido` FOREIGN KEY (`situacao`) REFERENCES `situacao_pedido` (`id_situacao_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `pedido` VALUES (1,6,'2019-01-30',1,NULL,NULL,NULL);
INSERT INTO `pedido` VALUES (2,7,'2018-08-02',2,NULL,'2018-08-03',4);
INSERT INTO `pedido` VALUES (3,8,'2017-12-01',1,NULL,NULL,NULL);
INSERT INTO `pedido` VALUES (4,2,'2017-01-22',1,NULL,NULL,NULL);
INSERT INTO `pedido` VALUES (5,5,'2017-08-25',2,'','2017-08-26',3);
INSERT INTO `pedido` VALUES (6,10,'2018-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL);
INSERT INTO `pedido` VALUES (7,2,'2018-09-22',2,NULL,'2018-09-23',4);
INSERT INTO `pedido` VALUES (8,5,'2018-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL);
INSERT INTO `pedido` VALUES (9,10,'2017-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1);
INSERT INTO `pedido` VALUES (10,6,'2018-04-22',2,NULL,'2018-04-23',2);


CREATE TABLE `pedido_item` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_pedido`,`id_produto`),
  KEY `fk_pedido_item_produto_idx` (`id_produto`),
  CONSTRAINT `fk_pedido_item_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_item_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `pedido_item` VALUES (1,4,4,3.74);
INSERT INTO `pedido_item` VALUES (2,1,2,9.10);
INSERT INTO `pedido_item` VALUES (2,4,4,1.66);
INSERT INTO `pedido_item` VALUES (2,6,2,2.94);
INSERT INTO `pedido_item` VALUES (3,3,10,9.12);
INSERT INTO `pedido_item` VALUES (4,3,7,6.99);
INSERT INTO `pedido_item` VALUES (4,10,7,6.40);
INSERT INTO `pedido_item` VALUES (5,2,3,9.89);
INSERT INTO `pedido_item` VALUES (6,1,4,8.65);
INSERT INTO `pedido_item` VALUES (6,2,4,3.28);
INSERT INTO `pedido_item` VALUES (6,3,4,7.46);
INSERT INTO `pedido_item` VALUES (6,5,1,3.45);
INSERT INTO `pedido_item` VALUES (7,3,7,9.17);
INSERT INTO `pedido_item` VALUES (8,5,2,6.94);
INSERT INTO `pedido_item` VALUES (8,8,2,8.59);
INSERT INTO `pedido_item` VALUES (9,6,5,7.28);
INSERT INTO `pedido_item` VALUES (10,1,10,6.01);
INSERT INTO `pedido_item` VALUES (10,9,9,4.28);

CREATE TABLE `desi_loja`.`observacao_pedido_item` (
  `id_observacao` INT NOT NULL,
  `id_pedido` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `observacao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_observacao`));

INSERT INTO `observacao_pedido_item` (`id_observacao`, `id_pedido`, `id_produto`, `observacao`) VALUES ('1', '1', '2', 'Primeira observação');
INSERT INTO `observacao_pedido_item` (`id_observacao`, `id_pedido`, `id_produto`, `observacao`) VALUES ('2', '1', '2', 'Segunda observação');


DROP DATABASE IF EXISTS `desi_recursos_humanos`;
CREATE DATABASE `desi_recursos_humanos`;
USE `desi_recursos_humanos`;


CREATE TABLE `escritorio` (
  `id_escritorio` int(11) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_escritorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `escritorio` VALUES (1,'Avenida Campeche, 2480','Florianópolis','SC');
INSERT INTO `escritorio` VALUES (2,'Rua Arno WaldemarDohler, 308','Joinville','SC');
INSERT INTO `escritorio` VALUES (3,'Rua Henry Pofhal, 111','Blumenau','SC');
INSERT INTO `escritorio` VALUES (4,'Avenida Cândido de Abreu,200','Curitiba','PR');
INSERT INTO `escritorio` VALUES (5,'Rua Belém, 844','Londrina','PR');
INSERT INTO `escritorio` VALUES (6,'Av. Paulista, 1313','São Paulo','SP');
INSERT INTO `escritorio` VALUES (7,'Rua Ari Barroso, 305','Osasco','SP');
INSERT INTO `escritorio` VALUES (8,'Praça Natividade Saldanha 19','Benfica','RJ');
INSERT INTO `escritorio` VALUES (9,'Rua dos Caetés, 741','Belo Horizonte','MG');
INSERT INTO `escritorio` VALUES (10,' Rua Ceará, 135 ','Naviraí','MS');



CREATE TABLE `colaborador` (
  `id_colaborador` int(11) NOT NULL,
  `primeiro_nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `profissao` varchar(50) NOT NULL,
  `salario` int(11) NOT NULL,
  `gestor_direto` int(11) DEFAULT NULL,
  `id_escritorio` int(11) NOT NULL,
  PRIMARY KEY (`id_colaborador`),
  KEY `fk_colaborador_escritorio_idx` (`id_escritorio`),
  KEY `fk_colaborador_gestor_idx` (`gestor_direto`),
  CONSTRAINT `fk_colaborador_gestor` FOREIGN KEY (`gestor_direto`) REFERENCES `colaborador` (`id_colaborador`),
  CONSTRAINT `fk_colaborador_escritorio` FOREIGN KEY (`id_escritorio`) REFERENCES `escritorio` (`id_escritorio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `colaborador` VALUES (37270,'Joana','Magran','Secretária Executiva',63996,NULL,10);
INSERT INTO `colaborador` VALUES (33391,'Décio','Nunes','Executivo de Contas',62871,37270,1);
INSERT INTO `colaborador` VALUES (37851,'Saulo','Mattos','Estatístico III',98926,37270,1);
INSERT INTO `colaborador` VALUES (40448,'Miriam','Criss','Cientista',94860,37270,1);
INSERT INTO `colaborador` VALUES (56274,'Kevin','Hall','VP de Marketing',110150,37270,1);
INSERT INTO `colaborador` VALUES (63196,'Alan','Schin','Professor Assistente',32179,37270,2);
INSERT INTO `colaborador` VALUES (67009,'Norton','Claro','VP de Produtos',114257,37270,2);
INSERT INTO `colaborador` VALUES (67370,'Elaine','Rigg','Assistente Social',96767,37270,2);
INSERT INTO `colaborador` VALUES (68249,'Nildo','Vosey','Consultor Financeiro',52832,37270,2);
INSERT INTO `colaborador` VALUES (72540,'Gustavo','Copetti','Auxiliar Administrativo I',117690,37270,3);
INSERT INTO `colaborador` VALUES (72913,'Klauss','Hoffmann','Analista de Sistemas IV',96401,37270,3);
INSERT INTO `colaborador` VALUES (75900,'Virgínia','Good','Gerente de TI',54578,37270,3);
INSERT INTO `colaborador` VALUES (76196,'Márcia','Ianowski','Analista de Custo',119241,37270,3);
INSERT INTO `colaborador` VALUES (80529,'Lídia','Alves','Executivo Junior',77182,37270,4);
INSERT INTO `colaborador` VALUES (80679,'Milton','Silva','Geologista II',67987,37270,4);
INSERT INTO `colaborador` VALUES (84791,'Humberto','Tarso','Gerente Geral',93760,37270,4);
INSERT INTO `colaborador` VALUES (95213,'Carlos','Costa','Farmacéutico',86119,37270,4);
INSERT INTO `colaborador` VALUES (96513,'Teresa','Bento','Químico de Alimentos',47354,37270,5);
INSERT INTO `colaborador` VALUES (98374,'Estela','Dall','Contador IV',70187,37270,5);
INSERT INTO `colaborador` VALUES (115357,'Ivo','Fernandes','Engenheiro Estrutural',92710,37270,5);
