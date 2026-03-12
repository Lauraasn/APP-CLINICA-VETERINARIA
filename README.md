# APP-CLINICA-VETERINARIA
## Trabalho da disciplina de Introdução a Banco de Dados com o tema "Clínica Veterinária"
O objetivo, por enquanto, é criar a estrutura inicial de pastas e arquivos do projeto, uma versão inicial do banco de dados e o modelo de dados do projeto, utilizando o diagrama MERMAID para representar as tabelas e relações.

## Modelo de Dados

```mermaid
erDiagram
    SEXO ||--o{ PESSOA : categoriza
    SEXO ||--o{ ANIMAL : categoriza
    PESSOA ||--o{ CLIENTE : pode_ser
    PESSOA ||--o{ FUNCIONARIO : pode_ser
    CLIENTE ||--o{ PEDIDO : faz
    CLIENTE ||--o{ ANIMAL : dono_do
    ANIMAL ||--o{ ATENDIMENTO : participa_do
    VETERINARIO ||--o{ ATENDIMENTO : realiza
    ATENDENTE ||--o{ PEDIDO : faz
    ATENDENTE ||--o{ ATENDIMENTO : agenda
    FUNCIONARIO ||--o{ VETERINARIO : pode_ser
    FUNCIONARIO ||--o{ ATENDENTE : pode_ser
    PEDIDO ||--|{ PRODUTO_PEDIDO : contém
    PEDIDO ||--|{ NOTA_FISCAL : gera
    PRODUTO ||--o{ PRODUTO_PEDIDO : inclui

    SEXO {
        serial ID PK
        varchar DESCRICAO
    }
    ENDERECO {
        serial ID PK
        varchar RUA
        varchar NUMERO
        varchar BAIRRO
        varchar CIDADE
        varchar ESTADO
        varchar CEP
    }
    CLASSE {
        serial ID PK
        varchar ESPECIE
        varchar RACA
    }
    PESSOA {
        serial ID PK
        varchar NOME
        date DATA_NASCIMENTO
        int ID_SEXO FK
        varchar EMAIL
        bigint CPF
        integer TELEFONE
    }
    FUNCIONARIO {
        serial ID PK
        int ID_PESSOA FK
        numeric SALARIO
        date DATA_ADMISSAO
    }
    ATENDENTE {
        serial ID PK
        int ID_FUNCIONARIO FK
        integer QTD_ATENDIMENTOS
    }
    VETERINARIO {
        serial ID PK
        int ID_FUNCIONARIO FK
        varchar ESPECIALIDADE
        varchar CRMV
    }
    CLIENTE {
        serial ID PK
        int ID_PESSOA FK
        int ID_ENDERECO FK
    }
    ANIMAL {
        serial ID PK
        int ID_SEXO FK
        int ID_CLASSE FK
        int ID_CLIENTE FK
        varchar NOME
        date DATA_NASCIMENTO
        numeric PESO
    }
    ATENDIMENTO {
        serial ID PK
        int ID_ATENDENTE FK
        int ID_VETERINARIO FK
        int ID_ANIMAL FK
        varchar TIPO_ATENDIMENTO
        numeric VALOR
        date DATA_ATENDIMENTO
        text TEXTO_CONSULTA
    }
    PEDIDO {
        serial ID PK
        int ID_CLIENTE FK
        date DATA_PEDIDO
        varchar STATUS
    }
    PRODUTO {
        serial ID PK
        varchar NOME
        varchar MARCA
        numeric PRECO
        integer ESTOQUE
    }
    PRODUTO_PEDIDO {
        serial ID PK
        int ID_PEDIDO FK
        int ID_PRODUTO FK
        integer QUANTIDADE
        numeric VALOR_TOTAL
    }
    NOTA_FISCAL {
        serial ID PK
        int ID_PRODUTO_PEDIDO FK
        date DATA_EMISSAO
        varchar NUMERO_SERIE
    }
```