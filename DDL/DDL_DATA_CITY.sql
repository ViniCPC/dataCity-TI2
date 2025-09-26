CREATE TABLE usuario (
    id_usuario      SERIAL PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    senha           VARCHAR(255) NOT NULL,
    tipo            VARCHAR(50),
    data_cadastro   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE problema (
    id_problema     SERIAL PRIMARY KEY,
    titulo          VARCHAR(200) NOT NULL,
    descricao       TEXT,
    status          VARCHAR(50),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario      INT NOT NULL,
    CONSTRAINT fk_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
        ON DELETE CASCADE
);

CREATE TABLE localizacao (
    id_localizacao  SERIAL PRIMARY KEY,
    endereco        VARCHAR(255),
    bairro          VARCHAR(100),
    cidade          VARCHAR(100),
    cep             VARCHAR(20),
    latitude        DECIMAL(10, 6),
    longitude       DECIMAL(10, 6)
);

CREATE TABLE problema_localizacao (
    id_problema     INT NOT NULL,
    id_localizacao  INT NOT NULL,
    PRIMARY KEY (id_problema, id_localizacao),
    CONSTRAINT fk_problema_localizacao_problema
        FOREIGN KEY (id_problema) REFERENCES problema(id_problema)
        ON DELETE CASCADE,
    CONSTRAINT fk_problema_localizacao_localizacao
        FOREIGN KEY (id_localizacao) REFERENCES localizacao(id_localizacao)
        ON DELETE CASCADE
);

CREATE TABLE anexo (
    id_anexo        SERIAL PRIMARY KEY,
    tipo_arquivo    VARCHAR(50),
    url_arquivo     VARCHAR(255) NOT NULL,
    data_upload     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PROBLEMA x ANEXO
CREATE TABLE problema_anexo (
    id_problema     INT NOT NULL,
    id_anexo        INT NOT NULL,
    PRIMARY KEY (id_problema, id_anexo),
    CONSTRAINT fk_problema_anexo_problema
        FOREIGN KEY (id_problema) REFERENCES problema(id_problema)
        ON DELETE CASCADE,
    CONSTRAINT fk_problema_anexo_anexo
        FOREIGN KEY (id_anexo) REFERENCES anexo(id_anexo)
        ON DELETE CASCADE
);
