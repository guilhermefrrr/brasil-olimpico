# Brasil Olímpico 🇧🇷

Projeto de análise e visualização de dados sobre as medalhas conquistadas pelo Brasil nos Jogos Olímpicos de Verão e de Inverno, desenvolvido com **SQL, Power BI e modelagem de dados**.

O projeto reúne informações sobre as edições dos Jogos Olímpicos, as medalhas conquistadas pelo Brasil e os atletas brasileiros que subiram ao pódio. A partir desses dados, é possível explorar o desempenho do país ao longo da história e analisar os resultados por edição, modalidade e atleta.

## Objetivos

- Organizar dados históricos das medalhas olímpicas brasileiras em um banco de dados relacional.
- Analisar a evolução do desempenho do Brasil ao longo das edições dos Jogos Olímpicos.
- Comparar a distribuição de medalhas de ouro, prata e bronze entre modalidades e edições.
- Identificar os atletas brasileiros com maior número de medalhas.
- Desenvolver visualizações interativas para facilitar a análise e a interpretação dos dados.

## Tecnologias utilizadas

- **SQL:** consulta, organização e análise dos dados em um banco de dados relacional.
- **SQL Server:** armazenamento e gerenciamento dos dados.
- **Power BI:** modelagem analítica e desenvolvimento de relatórios interativos.
- **DAX:** criação de medidas e cálculos para as análises e visualizações do relatório.

## Análises desenvolvidas

### Medalhas por modalidade

Consolidação das medalhas de ouro, prata e bronze conquistadas pelo Brasil em cada modalidade olímpica, permitindo comparar os resultados e identificar as modalidades com maior número de pódios.

### Medalhas por edição olímpica

Análise do desempenho brasileiro ao longo da história dos Jogos, com a distribuição de medalhas por edição, cidade-sede e ano.

### Medalhas por atleta

Levantamento das medalhas conquistadas pelos atletas brasileiros, com separação por tipo de medalha e possibilidade de identificar os atletas com maior número de conquistas.

## Banco de dados e consultas SQL

O banco de dados foi estruturado para relacionar informações sobre as edições olímpicas, as medalhas e os atletas brasileiros medalhistas.

As tabelas são:

- `atleta`: informações cadastrais e biográficas dos atletas medalhistas.
- `edicao`: informações sobre as edições dos Jogos Olímpicos, incluindo cidade, país e ano.
- `medalha`: informações sobre as medalhas, como tipo, modalidade, evento e gênero.
- `medalhascomatletas`: tabela de relacionamento entre medalhas e atletas.

O projeto também inclui consultas SQL para exploração dos dados e criação de views analíticas. Essas consultas utilizam recursos como **CTEs (Common Table Expressions), funções de agregação, junções entre tabelas, e views** para consolidar os resultados por modalidade, edição olímpica e atleta.

## Dados e fontes

Os dados foram coletados e organizados de forma independente, com consulta a diferentes fontes para reunir e conferir informações históricas. Os dados biográficos dos atletas, incluindo datas de nascimento, foram verificados por meio do cruzamento de fontes sempre que necessário.

As principais referências utilizadas são:

- [Time Brasil](https://www.cob.org.br/time-brasil)
- [Olympedia](https://www.olympedia.org/)

## Acesse o projeto

**[Clique aqui para acessar o relatório interativo no Power BI](https://app.powerbi.com/view?r=eyJrIjoiYWJjMzM5NDctZTkwOC00Y2I5LTk4OWYtMmFhOTViY2JlNDlhIiwidCI6ImFmNmE0MmI1LWJkMGUtNDUwNS1iMDdmLWY5MTdiMGNlMmYzZCJ9)**

O relatório permite explorar os resultados brasileiros e analisar as medalhas por edição olímpica, modalidade e tipo de medalha, além de consultar informações sobre os atletas medalhistas.

## Estrutura do projeto

- `dump_jogosolimpicos.sql`: dump do banco de dados, contendo sua estrutura e os dados armazenados.
- `script_jogosolimpicos.sql`: consultas SQL exploratórias e criação de views para resumir as medalhas por modalidade, edição olímpica e atleta.
- `.pbip-files/`: arquivos do projeto Power BI, incluindo o relatório e o modelo semântico.

