-- Projeto: Teste prático descrito Syntesis
-- Author: Otávio Henrique da Silva Ribeiro
-- Banco: MySql
-- Data Criação: 20-12-2019

/*
1) Criar uma estrutura em DB que comporte o seguinte cenário:
    - Um cadastro básico de cliente contendo Nome, CPF/CNPJ, RG, Inscrição Estadual, Telefone, E-mail e endereço.
    - Estes clientes terão N (N podendo ser ZERO) contratos associados a eles e conterão as seguintes informações (Descrição, Vigência, e Valor praticado)
    - Cada contrato terá N serviços prestados ao cliente.
    - Os serviços prestados ao cliente podem ser das mais diversas naturezas, sendo que uma delas pode ser um serviço de internet.
    - Para um serviço de internet são necessárias informações de conexão, tais como usuário e senha de autenticação.*/
    
    
CREATE DATABASE IF NOT EXISTS db_teste_syntesis
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE db_teste_syntesis;

CREATE TABLE IF NOT EXISTS clientes(
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL UNIQUE,
    rg VARCHAR(14),
    ie VARCHAR(14),
    telefone VARCHAR(14),
    cod_area VARCHAR(2),
    email VARCHAR(80),
    endereco VARCHAR(30) NOT NULL,
    end_numero VARCHAR(18) NOT NULL,
    end_bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    pais VARCHAR(10) NOT NULL,
    cep INT(8) NOT NULL,
    PRIMARY KEY (id)    
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS contratos(
    id BIGINT NOT NULL AUTO_INCREMENT,
    descricao TEXT,
    id_cliente BIGINT NOT NULL,
    validade_data DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS servicos(
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    natureza ENUM('internet', 'manutencao', 'desenvolvimento') NOT NULL,
    PRIMARY KEY (id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS contratos_servicos(
    id BIGINT NOT NULL AUTO_INCREMENT,
    id_contrato BIGINT NOT NULL,
    id_servico BIGINT NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_contrato) REFERENCES contratos(id),
    FOREIGN KEY (id_servico) REFERENCES servicos(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS servico_info(
    id BIGINT NOT NULL AUTO_INCREMENT,
    id_contrato_servico BIGINT NOT NULL,
    usuario VARCHAR(32),
    senha VARCHAR(15),
    PRIMARY KEY (id),
    FOREIGN KEY (id_contrato_servico) REFERENCES contratos_servicos(id)
)ENGINE = InnoDB DEFAULT CHARSET = utf8;
