DROP DATABASE IF EXISTS `recursos_humanos`;
CREATE DATABASE `recursos_humanos`;
USE `recursos_humanos`;


CREATE TABLE `escritorios` (
  `id_escritorio` int(11) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_escritorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `escritorios` VALUES (1,'Avenida Campeche, 2480','Florianópolis','SC');
INSERT INTO `escritorios` VALUES (2,'Rua Arno WaldemarDohler, 308','Joinville','SC');
INSERT INTO `escritorios` VALUES (3,'Rua Henry Pofhal, 111','Blumenau','SC');
INSERT INTO `escritorios` VALUES (4,'Avenida Cândido de Abreu,200','Curitiba','PR');
INSERT INTO `escritorios` VALUES (5,'Rua Belém, 844','Londrina','PR');
INSERT INTO `escritorios` VALUES (6,'Av. Paulista, 1313','São Paulo','SP');
INSERT INTO `escritorios` VALUES (7,'Rua Ari Barroso, 305','Osasco','SP');
INSERT INTO `escritorios` VALUES (8,'Praça Natividade Saldanha 19','Benfica','RJ');
INSERT INTO `escritorios` VALUES (9,'Rua dos Caetés, 741','Belo Horizonte','MG');
INSERT INTO `escritorios` VALUES (10,' Rua Ceará, 135 ','Naviraí','MS');



CREATE TABLE `colaboradores` (
  `id_colaborador` int(11) NOT NULL,
  `primeiro_nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `profissao` varchar(50) NOT NULL,
  `salario` int(11) NOT NULL,
  `gestor_direto` int(11) DEFAULT NULL,
  `id_escritorio` int(11) NOT NULL,
  PRIMARY KEY (`id_colaborador`),
  KEY `fk_colaboradores_escritorios_idx` (`id_escritorio`),
  KEY `fk_colaboradores_colaboradores_idx` (`gestor_direto`),
  CONSTRAINT `fk_colaboradores_gestores` FOREIGN KEY (`gestor_direto`) REFERENCES `colaboradores` (`id_colaborador`),
  CONSTRAINT `fk_colaboradores_escritorios` FOREIGN KEY (`id_escritorio`) REFERENCES `escritorios` (`id_escritorio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `colaboradores` VALUES (37270,'Joana','Magran','Secretária Executiva',63996,NULL,10);
INSERT INTO `colaboradores` VALUES (33391,'Décio','Nunes','Executivo de Contas',62871,37270,1);
INSERT INTO `colaboradores` VALUES (37851,'Saulo','Mattos','Estatístico III',98926,37270,1);
INSERT INTO `colaboradores` VALUES (40448,'Miriam','Criss','Cientista',94860,37270,1);
INSERT INTO `colaboradores` VALUES (56274,'Kevin','Hall','VP de Marketing',110150,37270,1);
INSERT INTO `colaboradores` VALUES (63196,'Alan','Schin','Professor Assistente',32179,37270,2);
INSERT INTO `colaboradores` VALUES (67009,'Norton','Claro','VP de Produtos',114257,37270,2);
INSERT INTO `colaboradores` VALUES (67370,'Elaine','Rigg','Assistente Social',96767,37270,2);
INSERT INTO `colaboradores` VALUES (68249,'Nildo','Vosey','Consultor Financeiro',52832,37270,2);
INSERT INTO `colaboradores` VALUES (72540,'Gustavo','Copetti','Auxiliar Administrativo I',117690,37270,3);
INSERT INTO `colaboradores` VALUES (72913,'Klauss','Hoffmann','Analista de Sistemas IV',96401,37270,3);
INSERT INTO `colaboradores` VALUES (75900,'Virgínia','Good','Gerente de TI',54578,37270,3);
INSERT INTO `colaboradores` VALUES (76196,'Márcia','Ianowski','Analista de Custo',119241,37270,3);
INSERT INTO `colaboradores` VALUES (80529,'Lídia','Alves','Executivo Junior',77182,37270,4);
INSERT INTO `colaboradores` VALUES (80679,'Milton','Silva','Geologista II',67987,37270,4);
INSERT INTO `colaboradores` VALUES (84791,'Humberto','Tarso','Gerente Geral',93760,37270,4);
INSERT INTO `colaboradores` VALUES (95213,'Carlos','Costa','Farmacéutico',86119,37270,4);
INSERT INTO `colaboradores` VALUES (96513,'Teresa','Bento','Químico de Alimentos',47354,37270,5);
INSERT INTO `colaboradores` VALUES (98374,'Estela','Dall','Contador IV',70187,37270,5);
INSERT INTO `colaboradores` VALUES (115357,'Ivo','Fernandes','Engenheiro Estrutural',92710,37270,5);
