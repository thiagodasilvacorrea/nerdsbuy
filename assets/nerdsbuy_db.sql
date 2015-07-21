-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 21/07/2015 às 11:00
-- Versão do servidor: 5.5.43-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `nerdsbuy_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE IF NOT EXISTS `item_pedido` (
  `id_item_de_pedido` int(10) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(10) NOT NULL,
  `id_produto` int(10) NOT NULL,
  `quantidade` int(10) NOT NULL,
  `preço` double NOT NULL,
  PRIMARY KEY (`id_item_de_pedido`),
  KEY `pedido_item_pedido_fk` (`id_pedido`),
  KEY `produto_item_pedido_fk` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_cliente` int(11) DEFAULT '0',
  `quantidade_produtos` int(11) DEFAULT '0',
  `status_pedido` int(11) DEFAULT '0',
  `valor_total` int(11) DEFAULT '0',
  `data_pedido` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_produto_pedido_fk` (`codigo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

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
  KEY `categoria_produto_fk` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

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
  `endereco` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `bairro` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `telefone_fixo` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_movel` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`Id`, `usuario`, `senha`, `nome`, `sobrenome`, `cpf`, `data_nascimento`, `email`, `cep`, `endereco`, `bairro`, `cidade`, `uf`, `telefone_fixo`, `telefone_movel`) VALUES
(3, 'aas', '7815696ecbf1c96e6894b779456d33', 'ba', 'as', '09864492616', '2015-06-30', 'teste@hotmaila', 37550, 'tbf', 'dff', 'ddd', 'PB', '1231', '12341'),
(4, 'asd', '0cc175b9c0f1b6a831c399e2697726', 'aasas', 's', '09864492616', '2015-07-04', 'asd@hotmail.com', 37550, 'tb', 'df', 'dd', 'DF', '357', '1234'),
(5, 'a', '03c7c0ace395d80182db07ae2c30f0', 'f', 'd', '09864492616', '2015-07-11', 'd@hotmail.com', 37550, 'tb', 'df', 'dd', 'AP', '123', '1234'),
(6, 'a', '0cc175b9c0f1b6a831c399e2697726', 'a', 'c', '09864492616', '2015-07-14', 'a@hotmail.com', 37550, 'a', 'df', 'dd', 'MG', '357', '123'),
(7, 'asdfa', '0cc175b9c0f1b6a831c399e2697726', 'bsf', 'dfg', '11112331', '2015-07-17', 'a@hotmail.coms', 37550, 'tba', 'df', 'dd', 'MG', '357', '1234');

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `pedido_item_pedido_fk` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `produto_item_pedido_fk` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `codigo_cliente_pedido_fk` FOREIGN KEY (`codigo_cliente`) REFERENCES `usuario` (`Id`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `categoria_produto_fk` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `marca_produto_fk` FOREIGN KEY (`marca`) REFERENCES `marca` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
