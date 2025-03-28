--Group by/Having
--SELECIONA O LIDER COM MAIOR CLAN, SENDO QUE O CLAN TEM QUE TER MAIS DE 1 MEMBRO
SELECT P.ID_LIDER AS LIDER_CLAN, COUNT(*) AS TOTAL_MEMBROS
FROM PERSONAGEM P
WHERE P.ID_LIDER IS NOT NULL  -- Ignora quem não tem clan
AND P.ID_LIDER != P.ID    -- Exclui o próprio líder da contagem
GROUP BY P.ID_LIDER
HAVING COUNT(*) >= 1
ORDER BY TOTAL_MEMBROS DESC;

--Anti-junção (Usando NOT EXISTS)
-- Exibir nome e Id do personagens que não são NPCs
SELECT P.NOME, P.ID
FROM PERSONAGEM P
WHERE NOT EXISTS (
  SELECT *
  FROM NPC N
  WHERE N.ID_PERSONAGEM = P.ID
);

-- SEMI-JUNÇÃO
-- Verifica e, caso tenha, projeta ID dos personagens com ao menos um tipo de item com peso menor que 3,5
SELECT T.ID_PERSONAGEM 
FROM INVENTARIO_TEM T 
WHERE EXISTS (
    SELECT *
    FROM ITEM I 
    WHERE 
        I.ID_ITEM = T.ID_ITEM AND
        I.PESO < 3.5
);

--Junção interna
--Projetar o nome dos personagens que jogam no jogo J1.
SELECT NOME
FROM PERSONAGEM
WHERE ID IN (SELECT PC.ID_PERSONAGEM
			 FROM PC 
			 INNER JOIN JOGA J ON (PC.ID_PERSONAGEM = J.ID_PERSONAGEM)
			 WHERE ID_JOGO = 'J1');

-- JUNÇÃO EXTERNA
-- Projeta ID de usuário dos mestres atualmente ativos, que não estão controlando quaisquer NPCs 

SELECT  M.ID_MESTRE
FROM  MESTRA M  LEFT OUTER JOIN
      NPC_PARTICIPA P  ON  (M.SESSAO = P.SESSAO)
WHERE  P.SESSAO  IS NULL;

--subconsulta do tipo escalar
--Projete o ID dos personagens que tem a quantidade de proficiências de idioma igual ou maior que a média de proficiências.
SELECT ID_PERSONAGEM, COUNT(*) AS QUANTIDADE
FROM PROFICIENCIA_IDIOMA
GROUP BY ID_PERSONAGEM
HAVING COUNT(*) >= (
SELECT AVG(QTD)
    FROM (
        SELECT ID_PERSONAGEM, COUNT(*) AS QTD
        FROM PROFICIENCIA_IDIOMA
        GROUP BY ID_PERSONAGEM
    )
);

-- SUBCONSULTA DO TIPO LINHA 
-- Identifica os personagens que fazem parte do mesmo clã (têm o mesmo líder) e falam o mesmo idioma que um personagem específico
SELECT P.ID
FROM PERSONAGEM P
INNER JOIN PROFICIENCIA_IDIOMA PI 
    ON PI.ID_PERSONAGEM = P.ID 
WHERE 
    P.ID_LIDER IS NOT NULL AND 
    (P.ID_LIDER, PI.IDIOMA) = (
        SELECT P1.ID_LIDER, PI1.IDIOMA 
        FROM PERSONAGEM P1 
        INNER JOIN PROFICIENCIA_IDIOMA PI1 
            ON PI1.ID_PERSONAGEM = P1.ID 
        WHERE P1.ID = 'P3'
    );

--SUBCONSULTA DO TIPO TABELA
--Projete o nome dos personagens que jogam no jogo J1.
SELECT NOME
FROM PERSONAGEM
WHERE ID IN (
    SELECT PC.ID_PERSONAGEM
    FROM PC INNER JOIN JOGA J ON (PC.ID_PERSONAGEM = J.ID_PERSONAGEM)
    WHERE ID_JOGO = 'J1');

-- OPERAÇÃO DE CONJUNTO 
-- Obter todos os personagens que falam um idioma específico
SELECT P.ID, P.NOME
FROM PERSONAGEM P

INTERSECT 

SELECT P.ID, P.NOME 
FROM PERSONAGEM P
INNER JOIN PROFICIENCIA_IDIOMA PI 
    ON PI.ID_PERSONAGEM = P.ID 
WHERE PI.IDIOMA = 'Comum';
