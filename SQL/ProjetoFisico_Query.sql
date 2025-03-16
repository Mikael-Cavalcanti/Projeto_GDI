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
