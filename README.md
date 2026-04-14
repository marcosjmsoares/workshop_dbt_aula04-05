# northwind-dbt-cicd-aws-rds-postgres

![dbt](https://img.shields.io/badge/dbt--core-v1.9-orange?logo=dbt&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue?logo=postgresql&logoColor=white)
![AWS RDS](https://img.shields.io/badge/AWS-RDS-FF9900?logo=amazonaws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI%2FCD-2088FF?logo=githubactions&logoColor=white)

> Projeto de Data Lake com **arquitetura Medallion** (Bronze, Silver e Gold) usando **dbt Core**, **AWS RDS PostgreSQL** e automação com **GitHub Actions**.

---

## Arquitetura

Este projeto organiza os dados seguindo o padrão **Medallion Architecture**, separando as transformações em três camadas:

- **Bronze**: dados brutos, carregados sem transformação.
- **Silver**: dados tratados, padronizados e limpos.
- **Gold**: dados analíticos prontos para consumo.

```text
Fonte Northwind
      |
      v
+-------------+     +-------------+     +-------------+
|   BRONZE    | --> |   SILVER    | --> |    GOLD     |
|   raw_*     |     |   stg_*     |     | dim_* fct_* |
+-------------+     +-------------+     +-------------+
```

| Camada | Pasta | Objetivo |
|--------|-------|----------|
| Bronze | `models/raw` | Espelhar os dados de origem |
| Silver | `models/staging` | Padronizar, limpar e renomear colunas |
| Gold | `models/marts` | Disponibilizar dimensões e fatos analíticos |

---

## Estrutura do projeto

```text
northwind/
├── models/
│   ├── raw/
│   ├── staging/
│   └── marts/
├── tests/
├── macros/
├── seeds/
└── dbt_project.yml
```

---

## Tecnologias

- **dbt Core**
- **PostgreSQL**
- **AWS RDS**
- **GitHub Actions**
- **Poetry**

---

## Execução local

Instale as dependências:

```bash
poetry install
```

Acesse a pasta do projeto dbt:

```bash
cd northwind
```

Valide a configuração:

```bash
poetry run dbt debug
```

Execute os modelos:

```bash
poetry run dbt run
```

Execute os testes:

```bash
poetry run dbt test
```

Execute o pipeline completo:

```bash
poetry run dbt build
```

---

## CI/CD

O repositório utiliza **GitHub Actions** para automação:

- **Pull Request para `main`**: executa validações e testes
- **Merge na `main`**: executa deploy das transformações no ambiente configurado

---

## Configuração

Para execução local ou no CI/CD, configure as credenciais de conexão com o banco PostgreSQL no arquivo `profiles.yml` ou via variáveis de ambiente/secrets.

Exemplo de parâmetros esperados:

- `host`
- `port`
- `user`
- `password`
- `dbname`
- `schema`

---

## Objetivo

Este projeto tem como objetivo demonstrar uma implementação prática de **engenharia de dados com dbt**, aplicando:

- modelagem em camadas
- boas práticas de transformação
- padronização analítica
- automação de deploy
- organização baseada em arquitetura Medallion

---

## Autor

Marcos Soares