# APP-CLINICA-VETERINARIA
## Trabalho da disciplina de Introdução a Banco de Dados com o tema "Clínica Veterinária"
O objetivo, por enquanto, é criar a estrutura inicial de pastas e arquivos do projeto, uma versão inicial do banco de dados e o modelo de dados do projeto, utilizando o diagrama MERMAID para representar as tabelas e relações.

## Modelo de Dados

```mermaid
erDiagram
    PESSOA || --o{ CLIENTE : pode_ser
    PESSOA || --o{ FUNCIONÁRIO : pode_ser
    PESSOA || --o{ VETERINÁRIO : pode_ser
    PESSOA || --o{ VENDEDOR : pode_ser
    CLIENTE ||--o{ PEDIDO : faz
    CLIENTE || --o{ ANIMAL : dono_do
    CLIENTE || --o{ ATENDIMENTO : requere
    VETERINÁRIO || --o{ ATENDIMENTO : realiza
    VENDEDOR || --o{ PRODUTO : vende
    VENDEDOR || --o{ CLIENTE : vende_para
    FUNCIONÁRIO || --o{ VETERINÁRIO : pode_ser
    FUNCIONÁRIO || --o{ VENDEDOR : pode_ser
    PEDIDO ||--|{ PRODUTO_PEDIDO : contém
    PRODUTO ||--o{ PRODUTO_PEDIDO : inclui
    ANIMAL ||--o{ CLIENTE : pertence
    PESSOA {
        serial id
        string nome
        string email
        int telefone
        int cpf
        date data_nasc
    }
    CLIENTE {
        string id PK
        string name
        string email
    }
    FUNCIONÁRIO{
        serial id PK
        float salario
    }
    VETERINÁRIO{
        serial id PK
        int pessoa_id FK
        string especialidade
        string crmv
        string cfmv
    }
    VENDEDOR {
        serial id PK
        int pessoa_id FK
    }
    ANIMAL {
        serial id PK
        int cliente_id FK
        string nome
        string especie
        string raca
        string enfermidade
    }
    ATENDIMENTO {
        serial id PK
        int veterinario_id FK
        int cliente_id FK
        string tipo_atendimento
        float valor
    }
    PEDIDO {
        serial id PK
        date dataPedido
        string status
    }
    PRODUTO {
        serial id PK
        string name
        float preco
        int estoque
    }
    PRODUTO_PEDIDO {
        int quantidade
        float preco
    }
```