--@block
CREATE TABLE cidadao(
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    municipio VARCHAR(30) NOT NULL,
    data_nasc DATE NOT NULL,
    cod_contato VARCHAR(6) NOT NULL,
    cod_historico VARCHAR(6) NOT NULL,

    PRIMARY KEY (cpf),

    CONSTRAINT FK_CidadaoContato 
    FOREIGN KEY (cod_contato) 
    REFERENCES contato(cod_contato)
    ON DELETE CASCADE,

    CONSTRAINT FK_CidadaoHistorico 
    FOREIGN KEY (cod_historico) 
    REFERENCES historico_vac(cod_historico)
);

--@block
CREATE TABLE contato(
    cod_contato VARCHAR(6),
    tel_celular VARCHAR(11) NOT NULL UNIQUE,
    tel_fixo VARCHAR(10),
    email VARCHAR(35),

    PRIMARY KEY (cod_contato)
);

-- @BLOCK
CREATE TABLE historico_vac(
    cod_historico VARCHAR(6),
    cod_frasco VARCHAR(6) NOT NULL,
    cod_func VARCHAR(6) NOT NULL,
    prim_dose BOOLEAN NOT NULL,
    seg_dose BOOLEAN,
    data_aplicacao DATE NOT NULL,

    PRIMARY KEY (cod_historico), 

    CONSTRAINT FK_HistFrasco
    FOREIGN KEY (cod_frasco)
    REFERENCES frasco(cod_frasco)
    ON DELETE RESTRICT,

    CONSTRAINT FK_HistFunc
    FOREIGN KEY (cod_func)
    REFERENCES funcionario(cod_func)
    
);

-- @block
CREATE TABLE frasco(
    cod_frasco VARCHAR(8),
    cod_vacina VARCHAR(6),
    lote VARCHAR(4) NOT NULL,

    PRIMARY KEY (cod_frasco),

    CONSTRAINT FK_FrascoVac
    FOREIGN KEY (cod_vacina)
    REFERENCES vacina(cod_vacina)
);

-- @block
CREATE TABLE vacina(
    cod_vacina VARCHAR(6),
    nome VARCHAR(20) NOT NULL,
    produtor VARCHAR(40) NOT NULL,
    trata_doenca VARCHAR(30) NOT NULL,

    PRIMARY KEY (cod_vacina)
);

-- @block
CREATE TABLE armazena(
    cod_posto VARCHAR(6),
    cod_vacina VARCHAR(6),
    estoque BIGINT NOT NULL,

    PRIMARY KEY (cod_posto, cod_vacina),

    CONSTRAINT FK_ArmazenaVac
    FOREIGN KEY (cod_vacina)
    REFERENCES vacina(cod_vacina),

    CONSTRAINT FK_ArmazenaPosto
    FOREIGN KEY (cod_posto)
    REFERENCES posto(cod_posto)

);

-- @block
CREATE TABLE posto(
    cod_posto VARCHAR(6),
    nome VARCHAR(40) NOT NULL,
    municipio VARCHAR(30) NOT NULL,

    PRIMARY KEY (cod_posto)

);

-- @block
CREATE TABLE funcionario(
    cod_func VARCHAR(6),
    nome VARCHAR(50) NOT NULL,
    cod_posto VARCHAR(6),

    PRIMARY KEY (cod_func),

    CONSTRAINT FK_FuncPosto
    FOREIGN KEY (cod_posto)
    REFERENCES posto(cod_posto)
    ON DELETE SET NULL
    
);

--@block
drop table vacina;