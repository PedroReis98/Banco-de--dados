insert into Professor ( nome, cpf, titulacao, email) values 
('prof teste', '98534557829', 'doutorado', 'helton.prof@gmail.com'),
('prof Pedro', '17397178734', 'mestre' , 'pedroreis@gmail.com' ),
('prof Su', '10390344435','mestre','susu23@gmail.com'),
('prof heltin','90987654432','','heltin@professor.com'),
('prof goku','19831134540','','goku22@professor.com');

SELECT
* from professor 


insert INTO Aluno (ra, nome, cpf, email, sexo, data_matricula) VALUES
('2023001', 'Ana Souza', '12345678901', 'ana.souza@exemplo.com', 'F', '2023-02-15'),
('2023002', 'Beatriz Silva', '98765432100', 'beatriz.silva@exemplo.com', 'F', '2023-02-20'),
('2023003', 'Carlos Moura', '11111111111', 'carlos.moura@exemplo.com', 'M', '2023-02-25'
('2023005', 'Maria Jose ', '10990199990', 'mariazinha@aluno.com', 'F', '2023-02-20');

SELECT  
* from aluno 

INSERT INTO curso (nome, carga_horaria, valor, professor_id, periodo_oferta) VALUES
('Engenharia de Software', 360, 1500.00, 1, '2023-01-15'),
('Administração', 320, 1200.00, 2, '2023-01-15');

 SELECT 
 * from curso

INSERT INTO matricula (ra, id_curso, data_matricula, nota1, nota2, nota_final, resultado_final) VALUES
('2023001', 1, '2023-02-15',9 ,9, 9,'aprovado'),  -- Ana Souza matriculada em Engenharia de Software
('2023002', 2, '2023-02-20',7, 8, 7.5,'aprovado'),  -- Beatriz Silva matriculada em Administração
('2023003', 2, '2023-02-25', 5, 4, 4.5,'reprovado');  -- Carlos Moura matriculado em Engenharia de Software

SELECT 
* from matricula

INSERT INTO periodo (data_inicio, data_fim) VALUES 
('2023-01-01','2023-06-30'),
('2023-07-01','2023-12-31'),
('2024-01-01','2024-06-30');

SELECT 
* from matricula 

UPDATE professor
SET titulacao = 'Mestrado'
WHERE titulacao = 'mestre';

DELETE FROM periodo
WHERE EXTRACT(YEAR FROM data_inicio) < 2023;


SELECT ra, nome, email, sexo 
FROM aluno
WHERE sexo = 'F'
ORDER BY nome ASC;



SELECT *
FROM professor
WHERE titulacao = '';


SELECT aluno.ra, aluno.nome, aluno.cpf, matricula.data_matricula, curso.nome 
	AS curso_nome, curso.carga_horaria
FROM matricula
JOIN aluno ON matricula.ra = aluno.ra
JOIN curso ON matricula.id_curso = curso.id
WHERE curso.nome = 'Engenharia de Software';

SELECT 
    curso.nome AS nome_curso,curso.carga_horaria,curso.valor,
    professor.nome AS nome_professor,professor.titulacao
FROM curso
JOIN professor ON curso.professor_id = professor.id
WHERE curso.periodo_oferta BETWEEN '2023-01-15' AND '2023-06-30';


SELECT 
    aluno.nome AS nome_aluno,
    aluno.email AS email_aluno
FROM aluno
JOIN matricula ON aluno.ra = matricula.ra
JOIN curso ON matricula.id_curso = curso.id
JOIN professor ON curso.professor_id = professor.id
WHERE professor.nome = 'prof teste'; 

SELECT 
    aluno.ra,
    aluno.nome AS nome_aluno,
    aluno.cpf,
    curso.nome AS nome_curso,
    matricula.nota_final,
    matricula.resultado_final
FROM aluno
JOIN matricula ON aluno.ra = matricula.ra
JOIN curso ON matricula.id_curso = curso.id
WHERE matricula.resultado_final = 'aprovado';

 SELECT 
    curso.nome AS nome_curso,
    COUNT(matricula.ra) AS quantidade_alunos
FROM matricula
JOIN curso ON matricula.id_curso = curso.id
WHERE curso.periodo_oferta BETWEEN '2023-01-15' AND '2023-06-30'
GROUP BY curso.nome;

SELECT 
    MAX(valor) AS curso_mais_caro,
    MIN(valor) AS curso_mais_barato,
    AVG(valor) AS valor_medio_cursos
FROM curso;

SELECT 
    AVG(valor) AS ticket_medio
FROM curso
WHERE periodo_oferta BETWEEN '2023-01-15' AND '2024-01-30';

SELECT 
    professor.nome,
    professor.cpf
FROM professor
LEFT JOIN aluno ON professor.cpf = aluno.cpf
WHERE aluno.cpf IS NULL;

SELECT  
    COUNT(CASE WHEN aluno.sexo = 'M' THEN 1 END) AS quantidade_masculino,
    COUNT(CASE WHEN aluno.sexo = 'F' THEN 1 END) AS quantidade_feminino
FROM aluno
JOIN matricula ON aluno.ra = matricula.ra
JOIN curso ON matricula.id_curso = curso.id
WHERE curso.valor > (
    SELECT AVG(valor) FROM curso
);



