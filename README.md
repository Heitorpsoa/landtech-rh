# README

## Execução 
    - ruby 2.7.2
    - rails 6.0.0
    - acesse a raiz do projeto
    - bundle install
    - rake db:create
    - rake db:migrate
    - rails s

## API para RH

Importar postman.json para abrir a collection no postman.

## Recruiters
    - CRUD 
    - Rota de login

## Autenticação
    Utilizar a rota de login e colocar o token de resposta no header "Authorization" para todos os outros requests

## Restrições
    Candidato é identificado pelo e-mail e não pode realizar mais de uma submissão no mesmo job.

## Status do job
    A unica forma de alterar o status é pelo edit, porém se o sistema fosse expandido, a rota de "fechar contrato " faria a mudança de estado
