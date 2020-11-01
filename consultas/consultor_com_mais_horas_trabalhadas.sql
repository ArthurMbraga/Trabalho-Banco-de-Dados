USE consultoria


SELECT nome, cpf, SUM(executam.horas_trabalhadas) FROM consultores, executam
    WHERE executam.cpf_consultor = consultores.cpf
    GROUP BY consultores.cpf
    ORDER BY SUM(executam.horas_trabalhadas) DESC LIMIT 1;

SELECT nome, cpf, SUM(executam.horas_trabalhadas) FROM consultores
    JOIN executam ON executam.cpf_consultor = consultores.cpf
    GROUP BY consultores.cpf
    ORDER BY SUM(executam.horas_trabalhadas) DESC LIMIT 1;

   