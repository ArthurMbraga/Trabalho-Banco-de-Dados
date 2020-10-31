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

SELECT sum(p.valor) AS gasto_total FROM clientes AS c JOIN propostas AS p ON p.cpf_cliente = c.cpf JOIN projetos as proj ON proj.codigo_proposta = p.codigo WHERE c.nome = "Maile Farmer";

SELECT sum(p.valor) AS gasto_total FROM clientes AS c, propostas AS p, projetos as proj WHERE p.cpf_cliente = c.cpf AND proj.codigo_proposta = p.codigo AND c.nome = "Maile Farmer";
