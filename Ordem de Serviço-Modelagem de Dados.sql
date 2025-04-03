CREATE TABLE IF NOT EXISTS `Cliente` (
	`id_Cliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_Cliente` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL UNIQUE,
	`senha_Acesso` varchar(255) NOT NULL,
	`telefone` varchar(20) NOT NULL,
	`endereco` text NOT NULL,
	`data_Cadastro` date NOT NULL,
	PRIMARY KEY (`id_Cliente`)
);

CREATE TABLE IF NOT EXISTS `Produto` (
	`id_Produto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_Produto` varchar(255) NOT NULL,
	`descricao` text,
	`preco` decimal(10,2) NOT NULL,
	`estoque` int NOT NULL,
	`id_Categoria` varchar(255) NOT NULL,
	PRIMARY KEY (`id_Produto`)
);

CREATE TABLE IF NOT EXISTS `Pedido` (
	`id_Pedido` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_Cliente` int NOT NULL,
	`data_pedido` date NOT NULL,
	`id_StatusPedido` varchar(255) NOT NULL,
	`total` decimal(10,2) NOT NULL,
	PRIMARY KEY (`id_Pedido`)
);

CREATE TABLE IF NOT EXISTS `ItemPedido` (
	`id_Item` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_Pedido` int NOT NULL,
	`id_Produto` int NOT NULL,
	`quantidade` int NOT NULL,
	`preco_Unitario` decimal(10,2) NOT NULL,
	PRIMARY KEY (`id_Item`)
);

CREATE TABLE IF NOT EXISTS `Pagamento` (
	`id_Pagamento` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_Pedido` int NOT NULL,
	`data_Pagamento` date NOT NULL,
	`valor` decimal(10,2) NOT NULL,
	`id_MetodoPagamento` varchar(255) NOT NULL,
	`id_StatusPagamento` varchar(255) NOT NULL,
	PRIMARY KEY (`id_Pagamento`)
);

CREATE TABLE IF NOT EXISTS `Categoria` (
	`id_Categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_Categoria` varchar(15) NOT NULL,
	`descricao` text,
	PRIMARY KEY (`id_Categoria`)
);

CREATE TABLE IF NOT EXISTS `StatusPedido` (
	`id_StatusPedido` int AUTO_INCREMENT NOT NULL,
	`nome_Status` varchar(10) NOT NULL,
	`descricao` text,
	PRIMARY KEY (`id_StatusPedido`)
);

CREATE TABLE IF NOT EXISTS `MetodoPagamento` (
	`id_MetodoPagamento` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_Metodo` varchar(255) NOT NULL,
	`descricao` text,
	PRIMARY KEY (`id_MetodoPagamento`)
);

CREATE TABLE IF NOT EXISTS `StatusPagamento` (
	`id_StatusPagamento` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_StatusPagamento` varchar(50) NOT NULL,
	`descricao` varchar(50),
	PRIMARY KEY (`id_StatusPagamento`)
);

ALTER TABLE `Cliente` ADD CONSTRAINT `Cliente_fk0` FOREIGN KEY (`id_Cliente`) REFERENCES `Pedido`(`id_Pedido`);
ALTER TABLE `Produto` ADD CONSTRAINT `Produto_fk5` FOREIGN KEY (`id_Categoria`) REFERENCES `Categoria`(`id_Categoria`);
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk0` FOREIGN KEY (`id_Pedido`) REFERENCES `ItemPedido`(`id_Pedido`);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk1` FOREIGN KEY (`id_Cliente`) REFERENCES `Cliente`(`id_Cliente`);

ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk3` FOREIGN KEY (`id_StatusPedido`) REFERENCES `StatusPedido`(`id_StatusPedido`);
ALTER TABLE `ItemPedido` ADD CONSTRAINT `ItemPedido_fk1` FOREIGN KEY (`id_Pedido`) REFERENCES `Pedido`(`id_Pedido`);

ALTER TABLE `ItemPedido` ADD CONSTRAINT `ItemPedido_fk2` FOREIGN KEY (`id_Produto`) REFERENCES `Produto`(`id_Produto`);
ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk1` FOREIGN KEY (`id_Pedido`) REFERENCES `Pedido`(`id_Pedido`);

ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk4` FOREIGN KEY (`id_MetodoPagamento`) REFERENCES `MetodoPagamento`(`id_MetodoPagamento`);

ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk5` FOREIGN KEY (`id_StatusPagamento`) REFERENCES `StatusPagamento`(`id_StatusPagamento`);



