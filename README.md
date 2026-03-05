# APP-CLINICA-VETERINARIA
## Trabalho da disciplina de Introdução a Banco de Dados com o tema "Clínica Veterinária"
O objetivo, por enquanto, é criar a estrutura inicial de pastas e arquivos do projeto, uma versão inicial do banco de dados e o modelo de dados do projeto, utilizando o diagrama MERMAID para representar as tabelas e relações.

## Modelo de Dados

```mermaid
erDiagram
    SEXO || --o{ PESSOA : categoriza
    SEXO || --o{ ANIMAL : categoriza
    PESSOA || --o{ CLIENTE : pode_ser
    PESSOA || --o{ FUNCIONÁRIO : pode_ser
    CLIENTE ||--o{ PEDIDO : faz
    CLIENTE || --o{ ANIMAL : dono_do
    ANIMAL || --o{ ATENDIMENTO : participa_do
    VETERINÁRIO || --o{ ATENDIMENTO : realiza
    ATENDENTE || --o{ PEDIDO : faz
    ATENDENTE || --o{ ATENDIMENTO : agenda
    FUNCIONÁRIO || --o{ VETERINÁRIO : pode_ser
    FUNCIONÁRIO || --o{ ATENDENTE : pode_ser
    PEDIDO ||--|{ PRODUTO_PEDIDO : contém
    PEDIDO ||--|{ NOTA_FISCAL : gera
    PRODUTO ||--o{ PRODUTO_PEDIDO : inclui
    SEXO {
        serial id PK
        string descricao
    }
    PESSOA {
        serial id PK
        int id_sexo FK
        string nome
        string email
        int telefone
        int cpf
        date data_nasc
    }
    CLIENTE {
        string id PK
        int pessoa_id FK
        int id_endereco
    }
    FUNCIONÁRIO{
        serial id PK
        int pessoa_id FK
        date data_admissao
        float salario
    }
    VETERINÁRIO{
        serial id PK
        int funcionario_id FK
        string especialidade
        string crmv
        string cfmv
    }
    ATENDENTE {
        serial id PK
        int funcionario_id FK
        int qtd_atendimentos
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
        int animal_id FK
        string tipo_atendimento
        float valor
        string texto_consulta
    }
    PEDIDO {
        serial id PK
        int cliente_id FK
        int quantidade
        float preco
        date dataPedido
        string status
    }
    NOTA_FISCAL {
        serial id PK
        int id_pedido FK
        int numero_nf

    }
    PRODUTO {
        serial id PK
        string nome
        string marca
        float preco
        int estoque
    }
    PRODUTO_PEDIDO {
        serial id PK
        int pedido_id FK
        int produto_id FK
    }
```