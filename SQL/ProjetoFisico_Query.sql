--Group by/Having
--SELECIONA O LIDER COM MAIOR CLAN, SENDO QUE O CLAN TEM QUE TER MAIS DE 1 MEMBRO
SELECT ID_LIDER, COUNT(*) AS TOTAL_PERSONAGENS
FROM PERSONAGEM P
WHERE P.ID_LIDER IS NOT NULL
GROUP BY ID_LIDER
HAVING COUNT (*) > 1
ORDER BY COUNT(*) DESC;

--Anti-junção
--SELECIONA OS PERSONAGENS QUE NÃO ESTÃO EM NENHUMA SESSÃO
SELECT P.ID, P.NOME
FROM PERSONAGEM P
WHERE P.ID NOT IN (SELECT JP.ID_PERSONAGEM FROM JOGA JP)
AND P.ID NOT IN (SELECT JM.ID_PERSONAGEM FROM MESTRA JM);
