
CREATE TABLE dw.cliente (
                id_cliente INTEGER NOT NULL,
                nome VARCHAR(50) NOT NULL,
                telefone VARCHAR(17) NOT NULL,
                email VARCHAR(50) NOT NULL,
                genero CHAR(1) NOT NULL,
                CONSTRAINT id_cliente PRIMARY KEY (id_cliente)
);


CREATE TABLE dw.regiao (
                id_localizacao INTEGER NOT NULL,
                cep VARCHAR(10) NOT NULL,
                uf CHAR(2) NOT NULL,
                CONSTRAINT id_regiao PRIMARY KEY (id_localizacao)
);


CREATE TABLE dw.venda (
                id_compra INTEGER NOT NULL,
                compra VARCHAR(50) NOT NULL,
                fabricante VARCHAR(50) NOT NULL,
                qtd INTEGER NOT NULL,
                valor_compra REAL NOT NULL,
                CONSTRAINT id_compra PRIMARY KEY (id_compra)
);


CREATE TABLE dw.data (
                id_data DATE NOT NULL,
                data DATE NOT NULL,
                hora VARCHAR(10) NOT NULL,
                CONSTRAINT id_data PRIMARY KEY (id_data)
);


CREATE TABLE dw.pedido (
                id_cliente INTEGER NOT NULL,
                id_data DATE NOT NULL,
                id_compra INTEGER NOT NULL,
                id_localizacao INTEGER NOT NULL
);


ALTER TABLE dw.pedido ADD CONSTRAINT dim_cliente_ft_pedido_fk
FOREIGN KEY (id_cliente)
REFERENCES dw.cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE dw.pedido ADD CONSTRAINT dim_fabricante_ft_pedido_fk
FOREIGN KEY (id_localizacao)
REFERENCES dw.regiao (id_localizacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE dw.pedido ADD CONSTRAINT dim_estoque_ft_pedido_fk
FOREIGN KEY (id_compra)
REFERENCES dw.venda (id_compra)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE dw.pedido ADD CONSTRAINT dim_data_ft_pedido_fk
FOREIGN KEY (id_data)
REFERENCES dw.data (id_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
