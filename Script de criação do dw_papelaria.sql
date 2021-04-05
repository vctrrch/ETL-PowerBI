
CREATE TABLE public.dim_venda (
                sk_venda INTEGER NOT NULL,
                nk_venda INTEGER NOT NULL,
                compra VARCHAR(50) NOT NULL,
                fabricante VARCHAR(50) NOT NULL,
                qtd INTEGER NOT NULL,
                valor_compra VARCHAR(10) NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_venda PRIMARY KEY (sk_venda)
);


CREATE TABLE public.dim_regiao (
                sk_regiao INTEGER NOT NULL,
                nh_regiao INTEGER NOT NULL,
                cep VARCHAR(9) NOT NULL,
                uf CHAR(2) NOT NULL,
                regiao VARCHAR(12) NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_regiao PRIMARY KEY (sk_regiao)
);


CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL,
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(100) NOT NULL,
                genero CHAR(1) NOT NULL,
                telefone VARCHAR(15) NOT NULL,
                email VARCHAR(50) NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL,
                nk_data INTEGER NOT NULL,
                data DATE NOT NULL,
                hora TIME NOT NULL,
                etl_versao INTEGER NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                CONSTRAINT sk_data PRIMARY KEY (sk_data)
);


CREATE TABLE public.ft_pedido (
                sk_cliente INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                sk_regiao INTEGER NOT NULL,
                sk_venda INTEGER NOT NULL
);


ALTER TABLE public.ft_pedido ADD CONSTRAINT dim_venda_ft_pedido_fk
FOREIGN KEY (sk_venda)
REFERENCES public.dim_venda (sk_venda)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_pedido ADD CONSTRAINT dim_regiao_ft_pedido_fk
FOREIGN KEY (sk_regiao)
REFERENCES public.dim_regiao (sk_regiao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_pedido ADD CONSTRAINT dim_cliente_ft_pedido_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_pedido ADD CONSTRAINT dim_data_ft_pedido_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
