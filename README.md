# Projeto de Data Warehouse e Analytics

Bem-vindo ao repositório Projeto de Data Warehouse e Analytics! 🚀

Este projeto demonstra uma solução completa de data warehousing e analytics, desde a construção de um data warehouse até a geração de insights acionáveis. Desenvolvido como um projeto de portfólio, ele destaca as melhores práticas do mercado em engenharia de dados e analytics.

<br>

## 🚀 Requisitos do Projeto

### Construção do Data Warehouse (Engenharia de Dados)

**Objetivo**

Desenvolver um data warehouse moderno utilizando SQL Server para consolidar dados de vendas, possibilitando relatórios analíticos e tomada de decisão fundamentada.

**Especificações**

* Fontes de Dados: Importar dados de dois sistemas de origem (ERP e CRM) fornecidos em arquivos CSV.
* Qualidade dos Dados: Higienizar e resolver problemas de qualidade dos dados antes da análise.
* Integração: Combinar as duas fontes em um único modelo de dados, amigável e projetado para consultas analíticas.
* Escopo: Focar apenas no conjunto de dados mais recente; a historização dos dados não é necessária.
* Documentação: Fornecer documentação clara do modelo de dados para apoiar tanto as áreas de negócio quanto as equipes de analytics.

### BI: Analytics e Relatórios (Data Analytics)

**Objetivo**

Desenvolver análises baseadas em SQL para fornecer insights detalhados sobre:

* Comportamento do Cliente
* Desempenho de Produtos
* Tendências de Vendas

Esses insights fornecem aos stakeholders métricas de negócio essenciais, possibilitando decisões estratégicas.

<br>

## 🏛️ Arquitetura de Dados

Este projeto segue a **Arquitetura Medallion**, organizada em três camadas: **Bronze**, **Silver** e **Gold**.

1. **Bronze Layer** — Armazena os dados brutos exatamente como vêm da origem (arquivos CSV dos sistemas CRM e ERP), sem nenhuma transformação. Os dados são carregados via `BULK INSERT` para dentro do SQL Server.

2. **Silver Layer** — Aplica limpeza, padronização e tratamento de qualidade sobre os dados da Bronze: remoção de duplicatas, tratamento de valores nulos, padronização de texto, correção de tipos de dado e enriquecimento com colunas de metadado (`dwh_create_date`).

3. **Gold Layer** — Modela os dados em formato de negócio, seguindo o **Star Schema** (tabelas de dimensão e fato), pronto para consultas analíticas e ferramentas de BI. Implementada através de **views**, sem persistência física de dados.

<br>

## 📂 Estrutura do Repositório

sql-data-warehouse-project/
│
├── datasets/ # Dados brutos utilizados no projeto (arquivos CSV do ERP e CRM)
│
├── docs/ # Documentação e detalhes da arquitetura do projeto
│ ├── data_catalog.md # Catálogo de dados da camada Gold, com descrição de colunas e tipos
│ └── naming_conventions.md # Padrões de nomenclatura para tabelas, colunas e objetos do banco
│
├── scripts/ # Scripts SQL de ETL e transformação
│ ├── bronze/ # Scripts para extração e carga dos dados brutos
│ ├── silver/ # Scripts de limpeza e tratamento dos dados
│ └── gold/ # Scripts de criação das views analíticas (dimensão e fato)
│
├── tests/ # Scripts de teste e verificação de qualidade dos dados
│
├── README.md # Visão geral e instruções do projeto
└── LICENSE # Informações de licenciamento do repositório


<br>

## 🛠️ Ferramentas Utilizadas

- **SQL Server Express** — servidor leve para hospedar o banco de dados
- **SQL Server Management Studio (SSMS)** — interface gráfica para gerenciamento do banco
- **Git & GitHub** — versionamento e organização do código
- **Draw.io** *(em andamento)* — ferramenta utilizada para desenhar os diagramas de arquitetura do projeto

<br>

## 🛡 Licença

Este projeto está licenciado sob a [Licença MIT](https://github.com/Iury-Benter-Magalhaes/sql-data-warehouse-project/blob/main/LICENSE). Você é livre para usar, modificar e compartilhar este projeto, desde que dê a devida atribuição.
