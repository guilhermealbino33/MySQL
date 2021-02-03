DROP DATABASE IF EXISTS `desi_inventario`;
CREATE DATABASE `desi_inventario`;
USE `desi_inventario`;


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