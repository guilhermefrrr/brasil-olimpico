use jogosolimpicos;

select * from medalhascomatletas;
select * from medalha;
select * from atleta order by atletaid;
select * from atleta where Nome_Principal like '%ida%';

# Quadro de medalhas por modalidade

create view quadro_modalidades as
with tabela_modalidades as 
(select distinct modalidade as modalidade_com_medalha from medalha),
tabela_ouros as 
(select modalidade, count(*) as ouros from medalha where Medalha = 'Ouro' group by modalidade),
tabela_pratas as
(select modalidade, count(*) as pratas from medalha where Medalha = 'Prata' group by modalidade),
tabela_bronzes as
(select modalidade, count(*) as bronzes from medalha where Medalha = 'Bronze' group by modalidade)
select modalidade_com_medalha as modalidade, ouros, pratas, bronzes from tabela_modalidades m 
left join tabela_ouros o on m.modalidade_com_medalha = o.modalidade
left join tabela_pratas p on m.modalidade_com_medalha = p.modalidade
left join tabela_bronzes b on m.modalidade_com_medalha = b.modalidade
order by ouros desc, pratas desc, bronzes desc;

select * from quadro_modalidades;