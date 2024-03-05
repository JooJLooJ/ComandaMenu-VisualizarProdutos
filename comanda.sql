    CREATE DATABASE IF NOT EXISTS comanda;

    USE comanda;

    CREATE TABLE IF NOT EXISTS statusmesa (
      idStatusMesa int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
      status varchar(255) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS statusPedido (
      idStatusPedido int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
      statusPedido varchar(255) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS categoriaalimento (
      idCatAlimento int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
      nomeCatAlimento varchar(255) NOT NULL,
      fotoCatAlimento varchar(255) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS alimento (
      idAlimento int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
      idCatAlimento int(11) NOT NULL,
      descAlimento varchar(255) NOT NULL,
      nomeAlimento varchar(255) NOT NULL,
      valorUnidade double NOT NULL,
      fotoAlimento varchar(255) NOT NULL,
      CONSTRAINT FK_AliCat FOREIGN KEY (idCatAlimento) REFERENCES categoriaalimento(idCatAlimento)
    );

    CREATE TABLE IF NOT EXISTS mesa (
      idMesa int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
      idStatusMesa int(11) NOT NULL,
      CONSTRAINT FK_MesStatus FOREIGN KEY (idStatusMesa) REFERENCES statusmesa(idStatusMesa)
    );

    CREATE TABLE IF NOT EXISTS pedido (
      idPedido int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
      nomePedido varchar(255) NOT NULL,
      nomeCliente varchar(255) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS pedidos (
      idPedido int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
      idMesa int(11) NOT NULL,
      idAlimento int(11) NOT NULL,
      idStatusPedido int(11) NOT NULL,
      pedido int(11) NOT NULL,
      CONSTRAINT FK_PedsPed FOREIGN KEY (pedido) REFERENCES pedido(idPedido),
      CONSTRAINT FK_PedsStatus FOREIGN KEY (idStatusPedido) REFERENCES statusPedido(idStatusPedido)
    );

    INSERT INTO statusMesa (status) VALUES
    ('Disponivel'),
    ('Ocupada');

    INSERT INTO mesa (idStatusMesa) VALUES (1);