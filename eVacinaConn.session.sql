-- @block 
CREATE TABLE cidadao(
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    municipio VARCHAR(30) NOT NULL,
    data_nasc DATE NOT NULL,

    PRIMARY KEY (cpf)
);

-- @block 
CREATE TABLE contato(
    cpf VARCHAR(11) NOT NULL UNIQUE,
    tel_celular VARCHAR(11) NOT NULL UNIQUE,
    tel_fixo VARCHAR(10),
    email VARCHAR(35),

    PRIMARY KEY (cpf, tel_celular)
);

-- @block 
CREATE TABLE historico_vac(
    cpf_cidadao VARCHAR(11) NOT NULL,
    cod_frasco VARCHAR(6) NOT NULL,
    cod_func VARCHAR(6) NOT NULL,
    prim_dose BOOLEAN NOT NULL,
    seg_dose BOOLEAN,
    data_aplicacao DATE,


    PRIMARY KEY (cpf_cidadao, cod_frasco)
);

-- @block 
CREATE TABLE frasco(
    cod_frasco VARCHAR(8),
    cod_vacina VARCHAR(6),
    lote VARCHAR(4) NOT NULL,

    PRIMARY KEY (cod_frasco)
);

-- @BLOCK
CREATE TABLE vacina(
    cod_vacina VARCHAR(6),
    nome VARCHAR(20) NOT NULL,
    produtor VARCHAR(40) NOT NULL,
    trata_doenca VARCHAR(30) NOT NULL,

    PRIMARY KEY (cod_vacina)
);

-- @BLOCK
CREATE TABLE armazena(
    cod_posto VARCHAR(6),
    cod_vacina VARCHAR(6),
    estoque BIGINT NOT NULL,

    PRIMARY KEY (cod_posto, cod_vacina)
);

-- @BLOCK
CREATE TABLE posto(
    cod_posto VARCHAR(6),
    nome VARCHAR(40) NOT NULL,
    municipio VARCHAR(30) NOT NULL,

    PRIMARY KEY (cod_posto)
);

-- @BLOCK
CREATE TABLE funcionario(
    cod_func VARCHAR(6),
    nome VARCHAR(50) NOT NULL,
    cod_posto VARCHAR(6) NOT NULL,

    PRIMARY KEY (cod_func)
);