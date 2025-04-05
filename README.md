# DynaTeam

Aplicação Ruby on Rails 8 para gestão de times e tarefas — criada como parte de um teste prático.

---

## 🚀 Tecnologias Utilizadas

- Ruby on Rails 8
- PostgreSQL 15 (via Docker)
- Bootstrap 5 (via `cssbundling-rails`)
- Yarn & Node.js
- Docker e Docker Compose
- Sidekiq (opcional, para background jobs)

---

## ⚙️ Pré-requisitos

Certifique-se de ter instalado:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Make](https://www.gnu.org/software/make/) *(opcional, mas recomendado)*

---

## 📁 Clonando o projeto

```bash
git clone git@github.com:seu-usuario/dynateam.git
cd dynateam
```


## 🔐 Configuração de ambiente
1. Copie o arquivo de exemplo:
```bash
cp sample.env .env
```
2. Edite o `.env` conforme necessário, por exemplo:
```bash
DATABASE_HOST=localhost
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=password
```

## 🐳 Subindo com Docker
1. Esse comando cria as imagens dos serviços web, `db e sidekiq definidos no docker-compose.yml`
```bash
docker-compose build
```
2. Subir a aplicação
```bash
docker-compose up
```
3. Criar a base de dados

```bash
rails db:setup
```

