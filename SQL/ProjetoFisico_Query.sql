--Group by/Having
--SELECIONA O LIDER COM MAIOR CLAN, SENDO QUE O CLAN TEM QUE TER MAIS DE 1 MEMBRO
SELECT P.ID_LIDER AS LIDER_CLAN, COUNT(*) AS TOTAL_MEMBROS
FROM PERSONAGEM P
WHERE P.ID_LIDER IS NOT NULL  -- Ignora quem não tem clan
AND P.ID_LIDER != P.ID    -- Exclui o próprio líder da contagem
GROUP BY P.ID_LIDER
HAVING COUNT(*) >= 1
ORDER BY TOTAL_MEMBROS DESC;

--Anti-junção

--Junção interna
--Projete o ID dos personagens que têm uma espada curta.
SELECT ID_PERSONAGEM 
FROM INVENTARIO_TEM IT 
INNER JOIN ITEM I ON (IT.ID_ITEM = I.ID)
WHERE DESCRICAO = 'Espada Curta';

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

--subconsulta do tipo tabela
--Projete o nome dos personagens que possuem inteligência e sabedoria maior que o personagem de ID P3.
SELECT NOME
FROM PERSONAGEM 
WHERE (ATR_INT, ATR_SAB) > (
    SELECT ATR_INT, ATR_SAB
    FROM PERSONAGEM
    WHERE ID = 'P3');