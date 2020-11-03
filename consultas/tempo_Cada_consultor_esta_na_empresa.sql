USE consultoria

-- // Tempo que cada consultor está na empresa

SELECT nome, datediff(saida, entrada) as tempo_ativo_dias FROM consultores where saida is not null
union
SELECT nome, datediff(curdate(), entrada) as tempo_ativo_dias FROM consultores where saida is null
ORDER BY tempo_ativo_dias DESC;

SELECT t.nome,
CASE 
	WHEN t.dias1 is not null 
		THEN t.dias1
        ELSE t.dias2
	END AS tempo_ativo_dias FROM (
	SELECT nome, datediff(saida, entrada) AS dias1, datediff(curdate(), entrada) AS dias2  FROM consultores
) as t
ORDER BY tempo_ativo_dias DESC;