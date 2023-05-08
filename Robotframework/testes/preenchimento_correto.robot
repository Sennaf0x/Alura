
*** Settings ***
Resource    ../resources/main.robot
Test Setup       Dado que eu acesse o site do organo
Test Teardown    Fechar no navegador

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos

    Dado que eu preencha os campos para a criação de card
    E clique no botão de criar card
    Então identificar o card no time esperado

Verificar a criação de 3 cards no mesmo time
    Dado que eu preencha os campos para a criação de card
    E clique no botão de criar card
    Então identificar os 3 cards criados no mesmo time
    
Verificar se é possível criar um card para cada time disponível preenchento o formulário corretamente
    Dado que eu preencha os campos para a criação de card
    Então identificar o card no time disponível
