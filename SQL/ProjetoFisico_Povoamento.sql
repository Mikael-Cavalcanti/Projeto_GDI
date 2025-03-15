-- Inserindo usuários
INSERT INTO USUARIO (ID, EMAIL, SENHA) VALUES ('1', 'usuario1@email.com', 'senha123');
INSERT INTO USUARIO (ID, EMAIL, SENHA) VALUES ('2', 'usuario2@email.com', 'senha123');
INSERT INTO USUARIO (ID, EMAIL, SENHA) VALUES ('3', 'usuario3@email.com', 'senha123');
INSERT INTO USUARIO (ID, EMAIL, SENHA) VALUES ('4', 'usuario4@email.com', 'senha123');

-- Inserindo jogadores
INSERT INTO JOGADOR (ID_USUARIO) VALUES ('1');
INSERT INTO JOGADOR (ID_USUARIO) VALUES ('2');

-- Inserindo mestres
INSERT INTO MESTRE (ID_USUARIO) VALUES ('3');
INSERT INTO MESTRE (ID_USUARIO) VALUES ('4');

-- Inserindo personagens
INSERT INTO PERSONAGEM (ID, NOME, ATR_FOR, ATR_DES, ATR_INT, ATR_CON, ATR_SAB, ATR_CAR, ID_LIDER)
VALUES ('P1', 'Personagem1', 10, 12, 14, 16, 18, 20, NULL);

INSERT INTO PERSONAGEM (ID, NOME, ATR_FOR, ATR_DES, ATR_INT, ATR_CON, ATR_SAB, ATR_CAR, ID_LIDER)
VALUES ('P2', 'Personagem2', 9, 11, 13, 15, 17, 19, NULL);

INSERT INTO PERSONAGEM (ID, NOME, ATR_FOR, ATR_DES, ATR_INT, ATR_CON, ATR_SAB, ATR_CAR, ID_LIDER)
VALUES ('P3', 'Personagem3', 8, 10, 12, 14, 16, 18, 'P1');

-- Inserindo personagens PC
INSERT INTO PC (ID_PERSONAGEM) VALUES ('P1');
INSERT INTO PC (ID_PERSONAGEM) VALUES ('P2');

-- Inserindo personagens NPC
INSERT INTO NPC (ID_PERSONAGEM) VALUES ('P3');

-- Inserindo jogos
INSERT INTO JOGO (ID, DESCRICAO) VALUES ('J1', 'Jogo de Aventura');
INSERT INTO JOGO (ID, DESCRICAO) VALUES ('J2', 'Jogo de Mistério');

-- Inserindo participação de jogadores em jogos
INSERT INTO JOGA (ID_JOGO, ID_PERSONAGEM, SESSAO, ID_JOGADOR) 
VALUES ('J1', 'P1', 1, '1');

INSERT INTO JOGA (ID_JOGO, ID_PERSONAGEM, SESSAO, ID_JOGADOR) 
VALUES ('J1', 'P2', 1, '2');

-- Inserindo participação de mestres em jogos
INSERT INTO MESTRA (ID_JOGO, ID_MESTRE, SESSAO)
VALUES ('J1', '3', 1);

INSERT INTO MESTRA (ID_JOGO, ID_MESTRE, SESSAO)
VALUES ('J2', '4', 2);

-- Inserindo NPCs que participam com mestres nos jogos
INSERT INTO NPC_PARTICIPA (ID_JOGO, ID_MESTRE, SESSAO, ID_NPC) 
VALUES ('J1', '3', 1, 'P3');

-- Inserindo mapas
INSERT INTO MAPA (ID, IMAGEM) VALUES ('M1', 'mapa1.jpg');
INSERT INTO MAPA (ID, IMAGEM) VALUES ('M2', 'mapa2.jpg');

-- Associando mapas a jogos
INSERT INTO MAPA_APARECE (ID_MAPA, ID_JOGO) VALUES ('M1', 'J1');
INSERT INTO MAPA_APARECE (ID_MAPA, ID_JOGO) VALUES ('M2', 'J2');

-- Inserindo itens
INSERT INTO ITEM (ID, DESCRICAO, PESO) VALUES ('I1', 'Espada Curta', 2.5);
INSERT INTO ITEM (ID, DESCRICAO, PESO) VALUES ('I2', 'Armadura de Couro', 5.0);
INSERT INTO ITEM (ID, DESCRICAO, PESO) VALUES ('I3', 'Poção de Cura', 0.5);
INSERT INTO ITEM (ID, DESCRICAO, PESO) VALUES ('I4', 'Arco Longo', 3.0);
INSERT INTO ITEM (ID, DESCRICAO, PESO) VALUES ('I5', 'Escudo', 4.5);

-- Inserindo itens nos inventários dos personagens
INSERT INTO INVENTARIO_TEM (ID_PERSONAGEM, ID_ITEM, QTDE) VALUES ('P1', 'I1', 1);  -- Personagem P1 tem 1 Espada Curta
INSERT INTO INVENTARIO_TEM (ID_PERSONAGEM, ID_ITEM, QTDE) VALUES ('P1', 'I2', 1);  -- Personagem P1 tem 1 Armadura de Couro
INSERT INTO INVENTARIO_TEM (ID_PERSONAGEM, ID_ITEM, QTDE) VALUES ('P2', 'I3', 2);  -- Personagem P2 tem 2 Poções de Cura
INSERT INTO INVENTARIO_TEM (ID_PERSONAGEM, ID_ITEM, QTDE) VALUES ('P2', 'I4', 1);  -- Personagem P2 tem 1 Arco Longo
INSERT INTO INVENTARIO_TEM (ID_PERSONAGEM, ID_ITEM, QTDE) VALUES ('P3', 'I5', 1);  -- Personagem P3 tem 1 Escudo

-- Inserindo proficiências em armas
INSERT INTO PROFICIENCIA_ARMA (ID_PERSONAGEM, ARMA) VALUES ('P1', 'Espada Curta');  -- Personagem P1 é proficiente em Espada Curta
INSERT INTO PROFICIENCIA_ARMA (ID_PERSONAGEM, ARMA) VALUES ('P2', 'Arco Longo');   -- Personagem P2 é proficiente em Arco Longo
INSERT INTO PROFICIENCIA_ARMA (ID_PERSONAGEM, ARMA) VALUES ('P3', 'Espada Curta');  -- Personagem P3 é proficiente em Espada Curta

-- Inserindo proficiências em armaduras
INSERT INTO PROFICIENCIA_ARMADURA (ID_PERSONAGEM, ARMADURA) VALUES ('P1', 'Armadura de Couro');  -- Personagem P1 é proficiente em Armadura de Couro
INSERT INTO PROFICIENCIA_ARMADURA (ID_PERSONAGEM, ARMADURA) VALUES ('P2', 'Armadura de Couro');  -- Personagem P2 é proficiente em Armadura de Couro
INSERT INTO PROFICIENCIA_ARMADURA (ID_PERSONAGEM, ARMADURA) VALUES ('P3', 'Armadura de Couro');  -- Personagem P3 é proficiente em Armadura de Couro

-- Inserindo proficiências em idiomas
INSERT INTO PROFICIENCIA_IDIOMA (ID_PERSONAGEM, IDIOMA) VALUES ('P1', 'Comum');   -- Personagem P1 é proficiente em Comum
INSERT INTO PROFICIENCIA_IDIOMA (ID_PERSONAGEM, IDIOMA) VALUES ('P1', 'Dracônico');   -- Personagem P1 é proficiente em Comum
INSERT INTO PROFICIENCIA_IDIOMA (ID_PERSONAGEM, IDIOMA) VALUES ('P2', 'Comum');   -- Personagem P1 é proficiente em Comum
INSERT INTO PROFICIENCIA_IDIOMA (ID_PERSONAGEM, IDIOMA) VALUES ('P2', 'Élfico');  -- Personagem P2 é proficiente em Élfico
INSERT INTO PROFICIENCIA_IDIOMA (ID_PERSONAGEM, IDIOMA) VALUES ('P2', 'Drow');    -- Personagem P3 é proficiente em Drow
INSERT INTO PROFICIENCIA_IDIOMA (ID_PERSONAGEM, IDIOMA) VALUES ('P3', 'Comum');   -- Personagem P1 é proficiente em Comum
