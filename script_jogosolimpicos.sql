-- Consultas breves

use jogosolimpicos;
select * from medalhascomatletas;
select * from medalha;
select * from atleta order by atletaid;
select * from atleta where Nome_Principal like '%ida%';

-- Quadro de medalhas por modalidade
CREATE OR REPLACE VIEW quadro_modalidades AS

-- CTE 1: Lista de modalidades que tiveram medalha
WITH tabela_modalidades AS (
    SELECT DISTINCT 
        modalidade AS modalidade_com_medalha
    FROM medalha
),

-- CTE 2: Contagem de ouros por modalidade
tabela_ouros AS (
    SELECT 
        modalidade, 
        COUNT(*) AS ouros
    FROM medalha
    WHERE Medalha = 'Ouro'
    GROUP BY modalidade
),

-- CTE 3: Contagem de pratas por modalidade
tabela_pratas AS (
    SELECT 
        modalidade, 
        COUNT(*) AS pratas
    FROM medalha
    WHERE Medalha = 'Prata'
    GROUP BY modalidade
),

-- CTE 4: Contagem de bronzes por modalidade
tabela_bronzes AS (
    SELECT 
        modalidade, 
        COUNT(*) AS bronzes
    FROM medalha
    WHERE Medalha = 'Bronze'
    GROUP BY modalidade
)

-- Consulta principal: resumo geral de medalhas por modalidade
SELECT 
    m.modalidade_com_medalha AS modalidade,
    COALESCE(o.ouros, 0)   AS ouros,
    COALESCE(p.pratas, 0)  AS pratas,
    COALESCE(b.bronzes, 0) AS bronzes,
    COALESCE(o.ouros, 0) 
        + COALESCE(p.pratas, 0) 
        + COALESCE(b.bronzes, 0) AS total
FROM tabela_modalidades AS m
LEFT JOIN tabela_ouros   AS o ON m.modalidade_com_medalha = o.modalidade
LEFT JOIN tabela_pratas  AS p ON m.modalidade_com_medalha = p.modalidade
LEFT JOIN tabela_bronzes AS b ON m.modalidade_com_medalha = b.modalidade
ORDER BY 
    ouros DESC,
    pratas DESC,
    bronzes DESC;


-- Quadro de medalhas por edição
CREATE OR REPLACE VIEW quadro_edicoes AS

-- CTE 1: Contagem de ouros por edição
WITH tabela_ouros AS (
    SELECT 
        EdicaoID, 
        COUNT(*) AS ouros
    FROM medalha 
    WHERE Medalha = 'Ouro'
    GROUP BY EdicaoID
),

-- CTE 2: Contagem de pratas por edição
tabela_pratas AS (
    SELECT 
        EdicaoID, 
        COUNT(*) AS pratas
    FROM medalha 
    WHERE Medalha = 'Prata'
    GROUP BY EdicaoID
),

-- CTE 3: Contagem de bronzes por edição
tabela_bronzes AS (
    SELECT 
        EdicaoID, 
        COUNT(*) AS bronzes
    FROM medalha 
    WHERE Medalha = 'Bronze'
    GROUP BY EdicaoID
)

-- Consulta principal: resumo geral de medalhas por edição
SELECT 
    e.Cidade,
    e.Ano,
    COALESCE(o.ouros, 0)   AS ouros,
    COALESCE(p.pratas, 0)  AS pratas,
    COALESCE(b.bronzes, 0) AS bronzes,
    COALESCE(o.ouros, 0) 
        + COALESCE(p.pratas, 0) 
        + COALESCE(b.bronzes, 0) AS total
FROM edicao AS e
LEFT JOIN tabela_ouros  AS o ON e.EdicaoID = o.EdicaoID
LEFT JOIN tabela_pratas AS p ON e.EdicaoID = p.EdicaoID
LEFT JOIN tabela_bronzes AS b ON e.EdicaoID = b.EdicaoID
ORDER BY 
    ouros DESC,
    pratas DESC,
    bronzes DESC,
    e.Ano DESC;

-- Quadro de medalhas por atleta
CREATE OR REPLACE VIEW quadro_atletas AS

    -- CTE 1: Resumo de medalhas com atletas
    WITH resumomedalhascomatletas AS (
        SELECT 
            ma.MedalhaID,
            a.Nome_Principal,
            m.Medalha
        FROM medalhascomatletas AS ma
        JOIN medalha AS m ON ma.MedalhaID = m.MedalhaID
        JOIN atleta AS a ON ma.AtletaID = a.AtletaID
    ),

    -- CTE 2: Contagem de ouros por atleta
    tabela_ouros AS (
        SELECT 
            Nome_Principal, 
            COUNT(*) AS ouros
        FROM resumomedalhascomatletas
        WHERE Medalha = 'Ouro'
        GROUP BY Nome_Principal
    ),

    -- CTE 3: Contagem de pratas por atleta
    tabela_pratas AS (
        SELECT 
            Nome_Principal, 
            COUNT(*) AS pratas
        FROM resumomedalhascomatletas
        WHERE Medalha = 'Prata'
        GROUP BY Nome_Principal
    ),

    -- CTE 4: Contagem de bronzes por atleta
    tabela_bronzes AS (
        SELECT 
            Nome_Principal, 
            COUNT(*) AS bronzes
        FROM resumomedalhascomatletas
        WHERE Medalha = 'Bronze'
        GROUP BY Nome_Principal
    )

    -- Consulta principal
    SELECT 
        DISTINCT r.Nome_Principal,
        COALESCE(o.ouros, 0)   AS ouros,
        COALESCE(p.pratas, 0)  AS pratas,
        COALESCE(b.bronzes, 0) AS bronzes,
        COALESCE(o.ouros, 0) + COALESCE(p.pratas, 0) + COALESCE(b.bronzes, 0) AS total
    FROM resumomedalhascomatletas AS r
    LEFT JOIN tabela_ouros   AS o ON r.Nome_Principal = o.Nome_Principal
    LEFT JOIN tabela_pratas  AS p ON r.Nome_Principal = p.Nome_Principal
    LEFT JOIN tabela_bronzes AS b ON r.Nome_Principal = b.Nome_Principal
    ORDER BY 
        ouros DESC, 
        pratas DESC, 
        bronzes DESC;
        
        
        
-- Views

SELECT
*
FROM quadro_modalidades;

SELECT
*
FROM quadro_edicoes;

SELECT
*
FROM quadro_atletas;
