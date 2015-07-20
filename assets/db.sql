-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.43-0ubuntu0.14.04.1 - (Ubuntu)
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para nerdsbuy_db
CREATE DATABASE IF NOT EXISTS `nerdsbuy_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `nerdsbuy_db`;


-- Copiando estrutura para tabela nerdsbuy_db.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela nerdsbuy_db.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


-- Copiando estrutura para tabela nerdsbuy_db.item_pedido
CREATE TABLE IF NOT EXISTS `item_pedido` (
  `id_item_de_pedido` int(10) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(10) NOT NULL,
  `id_produto` int(10) NOT NULL,
  `quantidade` int(10) NOT NULL,
  `preço` double NOT NULL,
  PRIMARY KEY (`id_item_de_pedido`),
  KEY `pedido_item_pedido_fk` (`id_pedido`),
  KEY `produto_item_pedido_fk` (`id_produto`),
  CONSTRAINT `pedido_item_pedido_fk` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `produto_item_pedido_fk` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela nerdsbuy_db.item_pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;


-- Copiando estrutura para tabela nerdsbuy_db.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela nerdsbuy_db.marca: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;


-- Copiando estrutura para tabela nerdsbuy_db.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_cliente` int(11) DEFAULT '0',
  `quantidade_produtos` int(11) DEFAULT '0',
  `status_pedido` int(11) DEFAULT '0',
  `valor_total` int(11) DEFAULT '0',
  `data_pedido` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_produto_pedido_fk` (`codigo_cliente`),
  CONSTRAINT `codigo_cliente_pedido_fk` FOREIGN KEY (`codigo_cliente`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela nerdsbuy_db.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;


-- Copiando estrutura para tabela nerdsbuy_db.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `marca` int(11) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `descricao` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco` double DEFAULT '0',
  `caminho_imagem` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `marca_produto_fk` (`marca`),
  KEY `categoria_produto_fk` (`categoria`),
  CONSTRAINT `categoria_produto_fk` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `marca_produto_fk` FOREIGN KEY (`marca`) REFERENCES `marca` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela nerdsbuy_db.produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


-- Copiando estrutura para tabela nerdsbuy_db.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `senha` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sobrenome` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `cep` int(8) NOT NULL DEFAULT '0',
  `endereço` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `bairro` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `pais` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `telefone_fixo` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_movel` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela nerdsbuy_db.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
