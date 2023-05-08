*** Settings ***
Resource    ../resources/main.robot
Test Setup     Dado que eu acesse o site do organo
Test Teardown  Fechar no navegador    


*** Variables ***
${BOTAO_CARD}             id:form-botao

*** Test Cases ***
Verificar a mensagem de campo obrigatório quando o formulário não for preenchido corretamente
    Dado que eu clique no botao criar card
    Então sistema deve apresentar mensagem de campo obrigatório
