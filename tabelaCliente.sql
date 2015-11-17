CREATE TABLE CLIENTE(
ID_Cliente BIGINT NOT NULL
GENERATED ALWAYS AS IDENTITY
(START WITH 1, INCREMENT BY 1)
CONSTRAINT PK_CLIENTE PRIMARY KEY,
first_Name VARCHAR(60),
last_Name VARCHAR(60),
email VARCHAR(80)UNIQUE,
telefone VARCHAR(64),
cpf VARCHAR(14)UNIQUE,
senha VARCHAR(64),
sexo VARCHAR(1),
Data_Nasci_Cliente DATE NOT NULL
);

CREATE TABLE ENDERECOS(
ID_Enderecos BIGINT NOT NULL
GENERATED ALWAYS AS IDENTITY
(START WITH 1, INCREMENT BY 1)
CONSTRAINT PK_ENDERECOS PRIMARY KEY,
cep VARCHAR(10),
logradouro VARCHAR(60),
tipo_logradouro VARCHAR(60),
logradouro_Numero VARCHAR(6),
bairro VARCHAR(60),
cidade VARCHAR(60),
estado VARCHAR(60),
cpf VARCHAR(14)
);


