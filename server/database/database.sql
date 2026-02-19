CREATE TABLE PESSOA (
    id       SERIAL PRIMARY KEY,
    nome     VARCHAR(255) NOT NULL,
    email    VARCHAR(255),
    telefone INTEGER,
    cpf      INTEGER UNIQUE NOT NULL,
    data_nasc DATE
);

CREATE TABLE CLIENTE (
    id       SERIAL PRIMARY KEY,
    pessoa_id INTEGER NOT NULL,
    name     VARCHAR(255),
    email    VARCHAR(255),
    CONSTRAINT fk_cliente_pessoa FOREIGN KEY (pessoa_id) REFERENCES PESSOA(id)
);

CREATE TABLE FUNCIONARIO (
    id        SERIAL PRIMARY KEY,
    pessoa_id INTEGER NOT NULL,
    salario   NUMERIC(10, 2),
    CONSTRAINT fk_funcionario_pessoa FOREIGN KEY (pessoa_id) REFERENCES PESSOA(id)
);

CREATE TABLE VETERINARIO (
    id            SERIAL PRIMARY KEY,
    pessoa_id     INTEGER NOT NULL,
    funcionario_id INTEGER,
    especialidade VARCHAR(255),
    crmv          VARCHAR(50),
    cfmv          VARCHAR(50),
    CONSTRAINT fk_veterinario_pessoa      FOREIGN KEY (pessoa_id)      REFERENCES PESSOA(id),
    CONSTRAINT fk_veterinario_funcionario FOREIGN KEY (funcionario_id) REFERENCES FUNCIONARIO(id)
);

CREATE TABLE VENDEDOR (
    id             SERIAL PRIMARY KEY,
    pessoa_id      INTEGER NOT NULL,
    funcionario_id INTEGER,
    CONSTRAINT fk_vendedor_pessoa      FOREIGN KEY (pessoa_id)      REFERENCES PESSOA(id),
    CONSTRAINT fk_vendedor_funcionario FOREIGN KEY (funcionario_id) REFERENCES FUNCIONARIO(id)
);

CREATE TABLE ANIMAL (
    id          SERIAL PRIMARY KEY,
    cliente_id  INTEGER NOT NULL,
    nome        VARCHAR(255),
    especie     VARCHAR(100),
    raca        VARCHAR(100),
    enfermidade VARCHAR(255),
    CONSTRAINT fk_animal_cliente FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id)
);

CREATE TABLE ATENDIMENTO (
    id               SERIAL PRIMARY KEY,
    veterinario_id   INTEGER NOT NULL,
    cliente_id       INTEGER NOT NULL,
    tipo_atendimento VARCHAR(100),
    valor            NUMERIC(10, 2),
    CONSTRAINT fk_atendimento_veterinario FOREIGN KEY (veterinario_id) REFERENCES VETERINARIO(id),
    CONSTRAINT fk_atendimento_cliente     FOREIGN KEY (cliente_id)     REFERENCES CLIENTE(id)
);

CREATE TABLE PEDIDO (
    id          SERIAL PRIMARY KEY,
    cliente_id  INTEGER NOT NULL,
    dataPedido  DATE,
    status      VARCHAR(50),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id)
);

CREATE TABLE PRODUTO (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255),
    preco   NUMERIC(10, 2),
    estoque INTEGER
);

CREATE TABLE PRODUTO_PEDIDO (
    pedido_id  INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER,
    preco      NUMERIC(10, 2),
    PRIMARY KEY (pedido_id, produto_id),
    CONSTRAINT fk_pp_pedido  FOREIGN KEY (pedido_id)  REFERENCES PEDIDO(id),
    CONSTRAINT fk_pp_produto FOREIGN KEY (produto_id) REFERENCES PRODUTO(id)
);

CREATE TABLE VENDEDOR_PRODUTO (
    vendedor_id INTEGER NOT NULL,
    produto_id  INTEGER NOT NULL,
    PRIMARY KEY (vendedor_id, produto_id),
    CONSTRAINT fk_vp_vendedor FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id),
    CONSTRAINT fk_vp_produto  FOREIGN KEY (produto_id)  REFERENCES PRODUTO(id)
);

CREATE TABLE VENDEDOR_CLIENTE (
    vendedor_id INTEGER NOT NULL,
    cliente_id  INTEGER NOT NULL,
    PRIMARY KEY (vendedor_id, cliente_id),
    CONSTRAINT fk_vc_vendedor FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id),
    CONSTRAINT fk_vc_cliente  FOREIGN KEY (cliente_id)  REFERENCES CLIENTE(id)
);