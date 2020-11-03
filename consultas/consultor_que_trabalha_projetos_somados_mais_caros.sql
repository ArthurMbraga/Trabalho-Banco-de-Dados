USE consultoria

SELECT nome, cpf, SUM(projetos.custo) FROM consultores, executam, projetos
WHERE consultores.cpf = executam.cpf_consultor AND executam.sigla_projeto = projetos.sigla
GROUP BY executam.cpf_consultor
ORDER BY SUM(projetos.custo) DESC LIMIT 1;

SELECT nome, cpf, SUM(projetos.custo) FROM consultores
JOIN executam ON consultores.cpf = executam.cpf_consultor
JOIN projetos ON executam.sigla_projeto = projetos.sigla
GROUP BY consultores.cpf 
ORDER BY SUM(projetos.custo) DESC LIMIT 1;
