# Use uma imagem base oficial do Ruby
FROM ruby:3.2 AS build
WORKDIR /app

# Instale as dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copie o Gemfile e o Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instale as gems
RUN bundle install

# Copie o restante do código
COPY . .

# Exponha a porta que a aplicação irá rodar
EXPOSE 3000

# Inicie a aplicação
CMD ["rails", "server", "-b", "0.0.0.0"]