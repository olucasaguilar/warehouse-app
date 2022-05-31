# Sistema de Galpões
## Sistema de galpões desenvolvido durante a 1ª etapa de treinamento do TreinaDev 8 da Campus Code.

Este projeto é de uma aplicação web responsável pela gestão de galpões. A idéia é que essa aplicação, após finalizada, se comunicaria com outras, no contexto de um e-commerces. O sistema foi desenvolvido em Ruby on Rails.

### Versões
- Ruby 3.0.0
- Rails 7.0.2.4

### Informações adicionais
- Utilizado gems [RSpec](https://github.com/rspec/rspec-rails) e [Capybara](https://github.com/teamcapybara/capybara) para realização de testes, e banco de dados SQLite.
- Utilizado a gem [Devise](https://github.com/heartcombo/devise) para autenticação.

## Executando o projeto
1. Clone o projeto
  ```
  git clone https://github.com/olucasaguilar/warehouse-app.git
  ```
2. Entre na pasta e instale as dependências
  ```
  bundle install
  ```
3. Execute as migrações
  ```
  rails db:migrate
  ```
4. Inicie o servidor web
  ```
  rails server
  ```

## Executando os testes
  ```
  rspec
  ```