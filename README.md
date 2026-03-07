# Sistema de Clínica

Este é um sistema web desenvolvido em Java para gerenciamento de uma clínica médica. Utiliza tecnologias Jakarta EE para implementar funcionalidades de CRUD (Create, Read, Update, Delete) para pacientes, médicos, consultas, medicamentos, indicadores de exames e prontuários.

## Funcionalidades

- **Gerenciamento de Pacientes**: Cadastro, listagem, edição e exclusão de pacientes com informações como CPF, nome, endereço, contato e plano de saúde.
- **Gerenciamento de Médicos**: Cadastro e gerenciamento de médicos.
- **Consultas**: Atribuição e gerenciamento de consultas médicas.
- **Medicamentos**: Cadastro e controle de medicamentos.
- **Indicadores de Exames**: Gerenciamento de indicadores relacionados a exames.
- **Prontuários**: Visualização e gerenciamento de prontuários médicos.
- **Interface Web**: Páginas JSP com Bootstrap para uma interface amigável.

## Tecnologias Utilizadas

- **Java 11**: Linguagem de programação principal.
- **Jakarta EE 10**: Plataforma para desenvolvimento de aplicações empresariais.
- **Servlets**: Para controle de requisições HTTP.
- **JSP (JavaServer Pages)**: Para geração de páginas web dinâmicas.
- **JSTL (JavaServer Pages Standard Tag Library)**: Para simplificar o desenvolvimento de JSP.
- **Maven**: Gerenciamento de dependências e build.
- **Bootstrap 5**: Framework CSS para estilização da interface.
- **Armazenamento em Memória**: Dados são armazenados temporariamente em listas estáticas (sem persistência em banco de dados).

## Pré-requisitos

- **Java 11** ou superior instalado.
- **Maven** instalado para gerenciamento de dependências e build.
- Um servidor de aplicações compatível com Jakarta EE 10, como:
  - Apache Tomcat 10+
  - Eclipse GlassFish
  - WildFly

## Como Executar

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/JoaoPedropb2005/SistemaClinica.git
   cd SistemaClinica
   ```

2. **Compile o projeto**:
   ```bash
   mvn clean compile
   ```

3. **Empacote a aplicação**:
   ```bash
   mvn package
   ```
   Isso gerará um arquivo `.war` em `target/`.

4. **Deploy no servidor**:
   - Copie o arquivo `.war` para o diretório de aplicações web do seu servidor (ex.: `webapps` no Tomcat).
   - Inicie o servidor.

5. **Acesse a aplicação**:
   - Abra um navegador e vá para `http://localhost:8080/SistemadeClinica-1.0-SNAPSHOT/` (ajuste a porta e o contexto conforme a configuração do servidor).

## Estrutura do Projeto

```
src/
├── main/
│   ├── java/
│   │   └── com/mycompany/sistemadeclinica/
│   │       ├── JakartaRestConfiguration.java
│   │       ├── controllers/          # Servlets para controle
│   │       │   ├── ConsultaServlet.java
│   │       │   ├── IndicadorExameServlet.java
│   │       │   ├── MedicamentoServlet.java
│   │       │   ├── MedicoServlet.java
│   │       │   └── PacienteServlet.java
│   │       ├── negocio/              # Classes de negócio (entidades)
│   │       │   ├── Consulta.java
│   │       │   ├── IndicadorExame.java
│   │       │   ├── Medicamento.java
│   │       │   ├── Medico.java
│   │       │   ├── Paciente.java
│   │       │   └── Prontuario.java
│   │       ├── repositorios/         # Repositórios para acesso a dados
│   │       │   ├── RepositorioConsultas.java
│   │       │   ├── RepositorioIndicadorExame.java
│   │       │   ├── RepositorioMedicamento.java
│   │       │   ├── RepositorioMedico.java
│   │       │   └── RepositorioPaciente.java
│   │       └── resources/
│   │           └── JakartaEE10Resource.java
│   ├── resources/
│   │   └── META-INF/
│   │       └── persistence.xml       # Configuração JPA (não utilizada)
│   └── webapp/                       # Recursos web
│       ├── *.jsp                     # Páginas JSP
│       ├── index.html
│       └── WEB-INF/
│           ├── beans.xml
│           └── web.xml               # Configuração web
```

## Notas de Desenvolvimento

- Os dados são armazenados em memória utilizando listas estáticas nos repositórios. Não há integração com banco de dados persistente.
- A aplicação utiliza sessões HTTP para passar mensagens e dados entre páginas.
- As páginas JSP incluem modais para formulários de cadastro e edição.
