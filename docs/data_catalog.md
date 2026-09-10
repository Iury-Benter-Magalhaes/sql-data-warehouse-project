# 📖 Catálogo de Dados da Camada Gold

## Visão Geral
A Camada Gold é a representação dos dados em nível de negócio, estruturada para suportar casos de uso analíticos e de relatórios. É composta por tabelas de dimensão e tabelas de fato para métricas de negócio específicas.

<br>

## 1️⃣ `gold.dim_customers`

**Propósito:** Armazena detalhes dos clientes enriquecidos com dados demográficos e geográficos.

<table>
<tr>
<th>Nome da Coluna</th>
<th>Tipo de Dado</th>
<th>Descrição</th>
</tr>
<tr>
<td><code>customer_key</code></td>
<td>INT</td>
<td>Chave substituta (surrogate key) que identifica de forma única cada registro de cliente na tabela de dimensão.</td>
</tr>
<tr>
<td><code>customer_id</code></td>
<td>INT</td>
<td>Identificador numérico único atribuído a cada cliente.</td>
</tr>
<tr>
<td><code>customer_number</code></td>
<td>NVARCHAR(50)</td>
<td>Identificador alfanumérico que representa o cliente, usado para rastreamento e referência.</td>
</tr>
<tr>
<td><code>first_name</code></td>
<td>NVARCHAR(50)</td>
<td>Primeiro nome do cliente, conforme registrado no sistema.</td>
</tr>
<tr>
<td><code>last_name</code></td>
<td>NVARCHAR(50)</td>
<td>Sobrenome ou nome de família do cliente.</td>
</tr>
<tr>
<td><code>country</code></td>
<td>NVARCHAR(50)</td>
<td>País de residência do cliente (ex.: 'Australia').</td>
</tr>
<tr>
<td><code>marital_status</code></td>
<td>NVARCHAR(50)</td>
<td>Estado civil do cliente (ex.: 'Married', 'Single').</td>
</tr>
<tr>
<td><code>gender</code></td>
<td>NVARCHAR(50)</td>
<td>Gênero do cliente (ex.: 'Male', 'Female', 'n/a').</td>
</tr>
<tr>
<td><code>birthdate</code></td>
<td>DATE</td>
<td>Data de nascimento do cliente, no formato YYYY-MM-DD (ex.: 1971-10-06).</td>
</tr>
<tr>
<td><code>create_date</code></td>
<td>DATE</td>
<td>Data e hora em que o registro do cliente foi criado no sistema.</td>
</tr>
</table>

<br>

## 2️⃣ `gold.dim_products`

**Propósito:** Fornece informações sobre os produtos e seus atributos.

<table>
<tr>
<th>Nome da Coluna</th>
<th>Tipo de Dado</th>
<th>Descrição</th>
</tr>
<tr>
<td><code>product_key</code></td>
<td>INT</td>
<td>Chave substituta (surrogate key) que identifica de forma única cada registro de produto na tabela de dimensão.</td>
</tr>
<tr>
<td><code>product_id</code></td>
<td>INT</td>
<td>Identificador único atribuído ao produto para rastreamento e referência interna.</td>
</tr>
<tr>
<td><code>product_number</code></td>
<td>NVARCHAR(50)</td>
<td>Código alfanumérico estruturado que representa o produto, geralmente usado para categorização ou controle de estoque.</td>
</tr>
<tr>
<td><code>product_name</code></td>
<td>NVARCHAR(50)</td>
<td>Nome descritivo do produto, incluindo detalhes-chave como tipo, cor e tamanho.</td>
</tr>
<tr>
<td><code>category_id</code></td>
<td>NVARCHAR(50)</td>
<td>Identificador único da categoria do produto, vinculado à sua classificação de alto nível.</td>
</tr>
<tr>
<td><code>category</code></td>
<td>NVARCHAR(50)</td>
<td>Classificação mais ampla do produto (ex.: Bikes, Components), usada para agrupar itens relacionados.</td>
</tr>
<tr>
<td><code>subcategory</code></td>
<td>NVARCHAR(50)</td>
<td>Classificação mais detalhada do produto dentro da categoria, como o tipo específico de produto.</td>
</tr>
<tr>
<td><code>maintenance_required</code></td>
<td>NVARCHAR(50)</td>
<td>Indica se o produto requer manutenção (ex.: 'Yes', 'No').</td>
</tr>
<tr>
<td><code>cost</code></td>
<td>INT</td>
<td>Custo ou preço base do produto, medido em unidades monetárias.</td>
</tr>
<tr>
<td><code>product_line</code></td>
<td>NVARCHAR(50)</td>
<td>Linha ou série específica à qual o produto pertence (ex.: Road, Mountain).</td>
</tr>
<tr>
<td><code>start_date</code></td>
<td>DATE</td>
<td>Data em que o produto passou a estar disponível para venda ou uso.</td>
</tr>
</table>

<br>

## 3️⃣ `gold.fact_sales`

**Propósito:** Armazena dados transacionais de vendas para fins analíticos.

<table>
<tr>
<th>Nome da Coluna</th>
<th>Tipo de Dado</th>
<th>Descrição</th>
</tr>
<tr>
<td><code>order_number</code></td>
<td>NVARCHAR(50)</td>
<td>Identificador alfanumérico único para cada pedido de venda (ex.: 'SO54496').</td>
</tr>
<tr>
<td><code>product_key</code></td>
<td>INT</td>
<td>Chave substituta (surrogate key) que liga o pedido à tabela de dimensão de produtos.</td>
</tr>
<tr>
<td><code>customer_key</code></td>
<td>INT</td>
<td>Chave substituta (surrogate key) que liga o pedido à tabela de dimensão de clientes.</td>
</tr>
<tr>
<td><code>order_date</code></td>
<td>DATE</td>
<td>Data em que o pedido foi realizado.</td>
</tr>
<tr>
<td><code>shipping_date</code></td>
<td>DATE</td>
<td>Data em que o pedido foi enviado ao cliente.</td>
</tr>
<tr>
<td><code>due_date</code></td>
<td>DATE</td>
<td>Data de vencimento do pagamento do pedido.</td>
</tr>
<tr>
<td><code>sales_amount</code></td>
<td>INT</td>
<td>Valor monetário total da venda para o item, em unidades monetárias inteiras (ex.: 25).</td>
</tr>
<tr>
<td><code>quantity</code></td>
<td>INT</td>
<td>Quantidade de unidades do produto pedidas para o item (ex.: 1).</td>
</tr>
<tr>
<td><code>price</code></td>
<td>INT</td>
<td>Preço unitário do produto para o item, em unidades monetárias inteiras (ex.: 25).</td>
</tr>
</table>
