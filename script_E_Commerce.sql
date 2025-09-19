-- MySQL Workbench Synchronization
-- Generated: 2025-09-19 14:41
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Márcio

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `e_commerce`  DEFAULT COLLATE utf8_bin ;

ALTER TABLE `e_commerce`.`Endereco` 
DROP FOREIGN KEY `fk_Endereco_Cliente1`;

ALTER TABLE `e_commerce`.`Produto` 
DROP FOREIGN KEY `fk_Produto_Item_Pedido1`,
DROP FOREIGN KEY `fk_Produto_Oferta1`;

ALTER TABLE `e_commerce`.`Vendedor` 
DROP FOREIGN KEY `fk_Vendedor_Produto1`;

ALTER TABLE `e_commerce`.`Pedido` 
DROP FOREIGN KEY `fk_Pedido_Item_Pedido1`,
DROP FOREIGN KEY `fk_Pedido_Pagamento1`;

ALTER TABLE `e_commerce`.`Entrega` 
DROP FOREIGN KEY `fk_Entrega_Pagamento1`;

ALTER TABLE `e_commerce`.`Cliente` 
COLLATE = utf8_bin ,
CHANGE COLUMN `nome` `nome` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `tipo_cliente` `tipo_cliente` ENUM('pf', 'pj') NULL DEFAULT NULL ,
CHANGE COLUMN `cpf-cnpj` `cpf-cnpj` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `email` `email` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `telefone` `telefone` VARCHAR(20) NOT NULL ;

ALTER TABLE `e_commerce`.`Endereco` 
COLLATE = utf8_bin ,
CHANGE COLUMN `apelido_endereco(ex:"casa, "trabalho")` `apelido_endereco(ex:"casa, "trabalho")` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `rua` `rua` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `cidade` `cidade` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `estado` `estado` VARCHAR(2) NOT NULL ,
CHANGE COLUMN `cep` `cep` VARCHAR(10) NOT NULL ;

ALTER TABLE `e_commerce`.`Produto` 
COLLATE = utf8_bin ,
CHANGE COLUMN `nome` `nome` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `descricao` `descricao` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `categoria` `categoria` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `marca` `marca` VARCHAR(50) NULL DEFAULT NULL ;

ALTER TABLE `e_commerce`.`Vendedor` 
COLLATE = utf8_bin ,
CHANGE COLUMN `nome_fantasia` `nome_fantasia` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `cnpj` `cnpj` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `contato` `contato` VARCHAR(100) NULL DEFAULT NULL ;

ALTER TABLE `e_commerce`.`Oferta` 
COLLATE = utf8_bin ;

ALTER TABLE `e_commerce`.`Pedido` 
COLLATE = utf8_bin ,
CHANGE COLUMN `statusPedido` `statusPedido` ENUM('Pendente', 'Pago', 'Cancelado') NOT NULL ;

ALTER TABLE `e_commerce`.`Item_Pedido` 
COLLATE = utf8_bin ;

ALTER TABLE `e_commerce`.`Pagamento` 
COLLATE = utf8_bin ,
CHANGE COLUMN `formaDePagamento` `formaDePagamento` ENUM('Pix', 'Cartao', 'Boleto') NOT NULL ,
CHANGE COLUMN `statusPagamento` `statusPagamento` ENUM('Pendente', 'Confirmado', 'Cancelado') NOT NULL ;

ALTER TABLE `e_commerce`.`Entrega` 
COLLATE = utf8_bin ,
CHANGE COLUMN `statusEntrega` `statusEntrega` ENUM('Em transito', 'Entregue', 'Cancelada') NOT NULL ,
CHANGE COLUMN `codigoRastreamento` `codigoRastreamento` VARCHAR(50) NULL DEFAULT NULL ;

ALTER TABLE `e_commerce`.`Endereco` 
DROP FOREIGN KEY `fk_Endereco_Entrega1`;

ALTER TABLE `e_commerce`.`Endereco` ADD CONSTRAINT `fk_Endereco_Entrega1`
  FOREIGN KEY (`Entrega_idEntrega`)
  REFERENCES `e_commerce`.`Entrega` (`idEntrega`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Endereco_Cliente1`
  FOREIGN KEY (`Cliente_idCliente`)
  REFERENCES `e_commerce`.`Cliente` (`idCliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `e_commerce`.`Produto` 
ADD CONSTRAINT `fk_Produto_Item_Pedido1`
  FOREIGN KEY (`Item_Pedido_idItem`)
  REFERENCES `e_commerce`.`Item_Pedido` (`idItem`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Produto_Oferta1`
  FOREIGN KEY (`Oferta_idOferta`)
  REFERENCES `e_commerce`.`Oferta` (`idOferta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `e_commerce`.`Vendedor` 
ADD CONSTRAINT `fk_Vendedor_Produto1`
  FOREIGN KEY (`Produto_idProduto`)
  REFERENCES `e_commerce`.`Produto` (`idProduto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `e_commerce`.`Pedido` 
DROP FOREIGN KEY `fk_Pedido_Entrega1`,
DROP FOREIGN KEY `fk_Pedido_Cliente1`;

ALTER TABLE `e_commerce`.`Pedido` ADD CONSTRAINT `fk_Pedido_Item_Pedido1`
  FOREIGN KEY (`Item_Pedido_idItem`)
  REFERENCES `e_commerce`.`Item_Pedido` (`idItem`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Pedido_Pagamento1`
  FOREIGN KEY (`Pagamento_idPagamento`)
  REFERENCES `e_commerce`.`Pagamento` (`idPagamento`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Pedido_Entrega1`
  FOREIGN KEY (`Entrega_idEntrega`)
  REFERENCES `e_commerce`.`Entrega` (`idEntrega`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Pedido_Cliente1`
  FOREIGN KEY (`Cliente_idCliente`)
  REFERENCES `e_commerce`.`Cliente` (`idCliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `e_commerce`.`Entrega` 
ADD CONSTRAINT `fk_Entrega_Pagamento1`
  FOREIGN KEY (`Pagamento_idPagamento`)
  REFERENCES `e_commerce`.`Pagamento` (`idPagamento`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
