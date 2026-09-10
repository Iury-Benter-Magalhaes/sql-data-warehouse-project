# 📐 Convenções de Nomenclatura

Este documento define os padrões de nomenclatura utilizados em todo o projeto, abrangendo schemas, tabelas, colunas e outros objetos do banco de dados.

<br>

## 🔤 Regras Gerais

- Todos os nomes utilizam **snake_case**, com letras minúsculas e palavras separadas por underscore (`_`).
- Os nomes são escritos em **inglês**, independentemente do idioma de origem do dado.
- Evitar nomes de palavras reservadas do SQL Server (ex.: `date`, `order`, `key` isolados).

<br>

## 🏗️ Convenções por Camada

### Camada Bronze
- As tabelas seguem o padrão: `<sistema_origem>_<entidade>`
- `<sistema_origem>`: nome do sistema de origem dos dados (ex.: `crm`, `erp`)
- `<entidade>`: nome da entidade conforme o sistema de origem, sem renomear

**Exemplo:** `crm_cust_info` → informações de clientes vindas do sistema CRM.

### Camada Silver
- Segue a mesma convenção da camada Bronze: `<sistema_origem>_<entidade>`
- Os nomes de tabela permanecem os mesmos da Bronze, porém os dados já estão limpos, tratados e padronizados.

**Exemplo:** `crm_cust_info` → mesma tabela da bronze, porém com dados tratados.

### Camada Gold
- As tabelas seguem nomes significativos e orientados ao negócio, iniciando com um prefixo indicando o tipo de tabela: `<categoria>_<entidade>`
- `<categoria>`: indica o propósito da tabela no modelo dimensional
  - `dim_` → tabela de **dimensão** (ex.: `dim_customers`, `dim_products`)
  - `fact_` → tabela de **fato** (ex.: `fact_sales`)
- `<entidade>`: nome descritivo alinhado à linguagem de negócio (em inglês)

**Exemplo:** `dim_customers` → tabela de dimensão contendo dados de clientes.  
**Exemplo:** `fact_sales` → tabela de fato contendo transações de vendas.

<br>

## 🔑 Convenções de Colunas

| Padrão | Uso | Exemplo |
|---|---|---|
| `<prefixo>_id` | Identificador único vindo do sistema de origem | `cst_id`, `prd_id` |
| `<sufixo>_key` | Chave substituta (surrogate key), gerada na camada Gold para uso interno do modelo dimensional | `customer_key`, `product_key` |
| `<prefixo>_dt` | Coluna de data | `cst_create_date`, `prd_start_dt` |
| `<prefixo>_` | Prefixo curto indicando a entidade de origem (usado nas camadas Bronze/Silver) | `cst_` (customer), `prd_` (product), `sls_` (sales) |

<br>

## 📌 Convenções de Stored Procedures

Stored procedures que carregam dados seguem o padrão: `load_<camada>`

**Exemplo:** `load_bronze` → carrega dados na camada Bronze.  
**Exemplo:** `load_silver` → carrega dados na camada Silver.

<br>

## ⚙️ Convenções de Metadados

Colunas técnicas adicionadas durante o processo de ETL (não vindas do sistema de origem) seguem o prefixo `dwh_`.

**Exemplo:** `dwh_create_date` → data em que o registro foi inserido no data warehouse.
