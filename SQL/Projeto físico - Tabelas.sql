CREATE TABLE PERSONAGEM (
  ID VARCHAR(11) PRIMARY KEY,
  NOME VARCHAR(80) NOT NULL,
  ATR_FOR INTEGER NOT NULL,
  ATR_DES INTEGER NOT NULL,
  ATR_INT INTEGER NOT NULL,
  ATR_CON INTEGER NOT NULL,
  ATR_SAB INTEGER NOT NULL,
  ATR_CAR INTEGER NOT NULL,
  ID_LIDER VARCHAR(11) REFERENCES PERSONAGEM (ID)
);

CREATE TABLE PC (
  ID_PERSONAGEM VARCHAR(11) PRIMARY KEY REFERENCES PERSONAGEM (ID)
);
CREATE TABLE NPC (
  ID_PERSONAGEM VARCHAR(11) PRIMARY KEY REFERENCES PERSONAGEM (ID)
);

CREATE TABLE PROFICIENCIA_ARMA (
  ID_PERSONAGEM VARCHAR(11) REFERENCES PERSONAGEM (ID),
  ARMA VARCHAR(40) NOT NULL,
  CONSTRAINT PK_PROFICIENCIA_ARMA PRIMARY KEY (ID_PERSONAGEM, ARMA)
);
CREATE TABLE PROFICIENCIA_ARMADURA (
  ID_PERSONAGEM VARCHAR(11) REFERENCES PERSONAGEM (ID),
  ARMADURA VARCHAR(40) NOT NULL,
  CONSTRAINT PK_PROFICIENCIA_ARMADURA PRIMARY KEY (ID_PERSONAGEM, ARMADURA)
);
CREATE TABLE PROFICIENCIA_IDIOMA (
  ID_PERSONAGEM VARCHAR(11) REFERENCES PERSONAGEM (ID),
  IDIOMA VARCHAR(40) NOT NULL,
  CONSTRAINT PK_PROFICIENCIA_IDIOMA PRIMARY KEY (ID_PERSONAGEM, IDIOMA)
);

CREATE TABLE ITEM (
  ID VARCHAR(11) PRIMARY KEY,
  DESCRICAO VARCHAR(120),
  PESO NUMBER(10,2) NOT NULL
);

CREATE TABLE INVENTARIO_TEM (
  ID_PERSONAGEM VARCHAR(11) REFERENCES PERSONAGEM (ID)
  ID_ITEM VARCHAR(11) REFERENCES ITEM (ID)
  QTDE INTEGER DEFAULT 1 CHECK (QTDE > 0),
  CONSTRAINT PK_INVENTARIO_TEM PRIMARY KEY (ID_PERSONAGEM, ID_ITEM)
);

CREATE TABLE USUARIO (
  ID VARCHAR(11) PRIMARY KEY,
  EMAIL VARCHAR(40) UNIQUE NOT NULL,
  SENHA VARCHAR(20) NOT NULL
);
CREATE TABLE JOGADOR (
  ID_USUARIO VARCHAR(11) PRIMARY KEY REFERENCES USUARIO (ID)
);
CREATE TABLE MESTRE (
  ID_USUARIO VARCHAR(11) PRIMARY KEY REFERENCES USUARIO (ID)
);

CREATE TABLE JOGO (
  ID VARCHAR(11) PRIMARY KEY,
  DESCRICAO VARCHAR(120)
);

CREATE TABLE JOGA (
  ID_JOGO VARCHAR(11) REFERENCES JOGO (ID),
  ID_PERSONAGEM VARCHAR(11) REFERENCES PC (ID_PERSONAGEM),
  SESSAO INTEGER CHECK (SESSAO > -1),
  ID_JOGADOR VARCHAR(11) REFERENCES JOGADOR (ID_USUARIO),
  CONSTRAINT PK_JOGA PRIMARY KEY (ID_JOGO, ID_PERSONAGEM, SESSAO)
);

CREATE TABLE MESTRA (
  ID_JOGO VARCHAR(11) REFERENCES JOGO (ID),
  ID_MESTRE VARCHAR(11) REFERENCES MESTRE (ID_USUARIO),
  SESSAO INTEGER CHECK (SESSAO > -1),
  CONSTRAINT PK_MESTRA PRIMARY KEY (ID_JOGO, ID_MESTRE, SESSAO)
);

CREATE TABLE NPC_PARTICIPA (
  ID_JOGO VARCHAR(11),
  ID_MESTRE VARCHAR(11),
  SESSAO INTEGER,
  ID_NPC VARCHAR(11) REFERENCES NPC (ID_PERSONAGEM),
  CONSTRAINT FK_NPC_PARTICIPA_MESTRA FOREIGN KEY (ID_JOGO, ID_MESTRE, SESSAO) REFERENCES MESTRA (ID_JOGO, ID_MESTRE, SESSAO),
  CONSTRAINT PK_NPC_PARTICIPA PRIMARY KEY (ID_JOGO, ID_MESTRE, SESSAO, ID_NPC)
);

CREATE TABLE MAPA (
  ID VARCHAR(11) PRIMARY KEY,
  IMAGEM VARCHAR(120)
)

CREATE TABLE MAPA_APARECE (
  ID_MAPA VARCHAR(11) REFERENCES MAPA (ID),
  ID_JOGO VARCHAR(11) REFERENCES JOGO (ID),
  CONSTRAINT PK_MAPA_APARECE PRIMARY KEY (ID_MAPA, ID_JOGO)
);

-- TRIGGER QUE VERIFICA SE O JOGADOR JÁ ESTA CADASTRADO COMO MESTRE NO MESMO JOGO E SESSÃO
CREATE OR REPLACE TRIGGER TRG_IMPEDIR_DUPLA_PARTICIPACAO_JOGADOR
BEFORE INSERT OR UPDATE ON JOGA
FOR EACH ROW
DECLARE
    v_conta INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_conta 
    FROM MESTRA 
    WHERE ID_JOGO = :NEW.ID_JOGO 
      AND SESSAO = :NEW.SESSAO 
      AND ID_MESTRE = :NEW.ID_JOGADOR;

    IF v_conta > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: O jogador já está cadastrado como mestre no mesmo jogo e sessão.');
    END IF;
END;

-- TRIGGER QUE VERIFICA SE O MESTRE JÁ ESTA CADASTRADO COMO JOGADOR NO MESMO JOGO E SESSÃO
CREATE OR REPLACE TRIGGER TRG_IMPEDIR_DUPLA_PARTICIPACAO_MESTRE
BEFORE INSERT OR UPDATE ON MESTRA
FOR EACH ROW
DECLARE
    v_conta INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_conta 
    FROM JOGA 
    WHERE ID_JOGO = :NEW.ID_JOGO 
      AND SESSAO = :NEW.SESSAO 
      AND ID_JOGADOR = :NEW.ID_MESTRE;

    IF v_conta > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro: O mestre já está cadastrado como jogador no mesmo jogo e sessão.');
    END IF;
END;

-- -- EXCLUI TODAS AS TABELAS 
-- DROP TABLE INVENTARIO_ITEM CASCADE CONSTRAINTS;
-- DROP TABLE ITEM CASCADE CONSTRAINTS;
-- DROP TABLE JOGADOR CASCADE CONSTRAINTS;
-- DROP TABLE JOGO CASCADE CONSTRAINTS;
-- DROP TABLE MAPA CASCADE CONSTRAINTS;
-- DROP TABLE MAPA_APARECE CASCADE CONSTRAINTS;
-- DROP TABLE MESTRE CASCADE CONSTRAINTS;
-- DROP TABLE NPC CASCADE CONSTRAINTS;
-- DROP TABLE PC CASCADE CONSTRAINTS;
-- DROP TABLE PERSONAGEM CASCADE CONSTRAINTS;
-- DROP TABLE PROFICIENCIA_ARMA CASCADE CONSTRAINTS;
-- DROP TABLE PROFICIENCIA_ARMADURA CASCADE CONSTRAINTS;
-- DROP TABLE USUARIO CASCADE CONSTRAINTS;