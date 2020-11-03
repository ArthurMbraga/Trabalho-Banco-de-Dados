USE consultoria;

-- / O gasto de um certo cliente

SELECT sum(p.valor) AS gasto_total FROM clientes AS c JOIN propostas AS p ON p.cpf_cliente = c.cpf JOIN projetos as proj ON proj.codigo_proposta = p.codigo WHERE c.nome = "Maile Farmer";

SELECT sum(p.valor) AS gasto_total FROM clientes AS c, propostas AS p, projetos as proj WHERE p.cpf_cliente = c.cpf AND proj.codigo_proposta = p.codigo AND c.nome = "Maile Farmer";