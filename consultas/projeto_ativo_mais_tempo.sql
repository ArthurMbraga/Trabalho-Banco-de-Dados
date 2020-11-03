USE consultoria

-- ## O projeto que ainda não foi concluido e que foi iniciado e mais tempo.

-- 1
SELECT * FROM projetos WHERE termino is null order by inicio limit 1; 

-- 2
SELECT p.* FROM projetos AS p, (SELECT min(inicio) as min FROM projetos WHERE termino is null) as min WHERE p.inicio = min.min and p.termino is null limit 1;