# Locadora de Veículos - Web SA

Sistema web completo para gerenciamento de uma locadora de veículos, desenvolvido em Java com JSP e MySQL.

## 📋 Descrição

Aplicação web que permite gerenciar todas as operações de uma locadora de veículos, incluindo cadastro de clientes, veículos, tipos de pagamento e controle de locações.

## 🚀 Funcionalidades

### Clientes
- Cadastrar novos clientes
- Consultar clientes cadastrados
- Editar dados de clientes
- Excluir clientes
- Armazenar: CPF, Nome, Email, Número de Cartão

### Veículos
- Cadastrar novos veículos
- Consultar veículos disponíveis
- Editar informações de veículos
- Excluir veículos
- Controle de: Placa, Marca, Modelo, KM, Ar-condicionado, Direção Hidráulica, Status de Revisão

### Locações
- Registrar novas locações
- Consultar histórico de locações
- Editar dados de locações
- Excluir registros de locações

### Tipos de Pagamento
- Cadastrar tipos de pagamento
- Consultar tipos disponíveis
- Editar tipos de pagamento
- Excluir tipos de pagamento

## 🛠️ Tecnologias Utilizadas

- **Backend**: Java 8+
- **Frontend**: JSP (JavaServer Pages), HTML5, CSS
- **Banco de Dados**: MySQL
- **Build**: Apache Ant
- **IDE**: NetBeans (compatível com VS Code)

## 📁 Estrutura do Projeto

```
LocadoraWebSA/
├── src/
│   ├── java/
│   │   ├── Classes/          # Modelos de dados
│   │   │   ├── Cliente.java
│   │   │   ├── Veiculo.java
│   │   │   ├── Locacao.java
│   │   │   └── TipoPagamento.java
│   │   └── util/
│   │       └── Conexao.java  # Utilitário de conexão com BD
│   └── conf/
│       └── MANIFEST.MF
├── web/                      # Páginas JSP e recursos web
│   ├── cadastra*.jsp         # Páginas de cadastro
│   ├── consulta*.jsp         # Páginas de consulta
│   ├── editar*.jsp           # Páginas de edição
│   ├── exclui*.jsp           # Páginas de exclusão
│   ├── recebe*.jsp           # Páginas de recebimento de dados
│   ├── index.html            # Página inicial
│   ├── styles/               # Folhas de estilo CSS
│   │   ├── menustyle.css
│   │   ├── padraotelacadastro.css
│   │   └── padraotelagrid.css
│   ├── META-INF/
│   └── WEB-INF/
├── build.xml                 # Configuração Ant
└── nbproject/                # Configurações NetBeans
```

## 🔧 Configuração e Instalação

### Pré-requisitos

- JDK 8 ou superior instalado
- MySQL 5.7+ instalado e rodando
- Apache Tomcat 8+ (ou servidor web compatível)
- Apache Ant instalado

### Passos para Instalação

1. **Clonar o repositório**
   ```bash
   git clone <repositório>
   cd LocadoraWebSA_
   ```

2. **Configurar o Banco de Dados**
   - Criar banco de dados MySQL chamado `locacao`:
   ```sql
   CREATE DATABASE locacao;
   USE locacao;
   ```
   
   - Importar o script SQL (se disponível) ou criar as tabelas:
   ```sql
   CREATE TABLE cliente (
     codcliente INT PRIMARY KEY,
     cpfcliente VARCHAR(11),
     nomecliente VARCHAR(100),
     emailcliente VARCHAR(100),
     nrcartao VARCHAR(20)
   );

   CREATE TABLE veiculo (
     placaveiculo VARCHAR(10) PRIMARY KEY,
     marcaveiculo VARCHAR(50),
     modeloveiculo VARCHAR(50),
     kmveiculo DOUBLE,
     temarcondicionado BOOLEAN,
     temdirecaohidraulica BOOLEAN,
     veiculorevisado BOOLEAN
   );

   CREATE TABLE tipopagamento (
     codtipopagamento INT PRIMARY KEY,
     descricaotipopagamento VARCHAR(100)
   );

   CREATE TABLE locacao (
     codlocacao INT PRIMARY KEY,
     datainicio DATE,
     datafim DATE,
     codcliente INT,
     placaveiculo VARCHAR(10),
     codtipopagamento INT,
     FOREIGN KEY (codcliente) REFERENCES cliente(codcliente),
     FOREIGN KEY (placaveiculo) REFERENCES veiculo(placaveiculo),
     FOREIGN KEY (codtipopagamento) REFERENCES tipopagamento(codtipopagamento)
   );
   ```

3. **Configurar Credenciais do Banco**
   - Editar [src/java/util/Conexao.java](src/java/util/Conexao.java) se necessário:
     - `url`: ajustar host/porta/nome do banco
     - `user`: nome de usuário do MySQL
     - `password`: senha do MySQL

4. **Compilar o Projeto**
   ```bash
   ant build
   ```

5. **Deploy**
   - Copiar o arquivo `.war` gerado para a pasta `webapps` do Tomcat
   - Ou configurar o deploy direto via IDE

6. **Acessar a Aplicação**
   ```
   http://localhost:8080/LocadoraWebSA
   ```

## 📝 Uso

1. **Acessar a página inicial** - Menu com opções de cadastro e consulta
2. **Cadastrar dados** - Use o menu "Cadastrar" para adicionar novos registros
3. **Consultar registros** - Use o menu "Consultar" para visualizar dados existentes
4. **Editar/Excluir** - Selecione um registro e escolha a operação desejada

## 🗄️ Banco de Dados

**Servidor**: localhost:3306  
**Usuário**: locadora  
**Senha**: locadora  
**Banco**: locacao  

> ⚠️ **Nota**: Altere as credenciais padrão em ambiente de produção!

## 📊 Diagramas e Modelos

### Entidades Principais

- **Cliente**: Pessoa que aluga veículos
- **Veiculo**: Veículo disponível para locação
- **Locacao**: Registro de aluguel de um veículo
- **TipoPagamento**: Formas de pagamento disponíveis

## 🐛 Troubleshooting

### Erro de Conexão com Banco de Dados
- Verificar se MySQL está rodando
- Validar credenciais em `Conexao.java`
- Garantir que o banco `locacao` existe

### Páginas JSP não aparecem
- Verificar se o Tomcat está em execução
- Validar URL: `http://localhost:8080/LocadoraWebSA`
- Verificar logs do servidor

### Driver MySQL não encontrado
- Adicionar `mysql-connector-java.jar` à pasta `WEB-INF/lib`

## 📦 Dependências

- MySQL JDBC Driver (mysql-connector-java)

## ✏️ Autor

Desenvolvido como projeto acadêmico/profissional de gerenciamento web.

## 🤝 Contribuição

Para contribuir, por favor:
1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

**Última atualização**: 2026-06-12
