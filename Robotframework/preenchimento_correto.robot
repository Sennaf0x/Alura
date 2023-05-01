
*** Settings ***
Library          SeleniumLibrary
Resource         setup_teardown.robot
Test Setup       Dado que eu acesse o site do organo
Test Teardown    Fechar no navegador

*** Variables ***

${URL}                    http://localhost:3000/
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
${BOTAO_CARD}             id:form-botao
${OPCAO_PROGRAMACAO}      //option[contains(.,'Programação')]
${OPCAO_FRONT}            //option[contains(.,'Front-End')]
${OPCAO_DADOS}            //option[contains(.,'Data Science')]
${OPCAO_DEVOPS}           //option[contains(.,'Devops')] 
${OPCAO_UX}               //option[contains(.,'UX e Design')]
${OPCAO_MOBILE}           //option[contains(.,'Mobile')]
${OPCAO_INOVACAO}         //option[contains(.,'Inovação e Gestão')]  

*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos

    Dado que eu preencha os campos para a criação de card
    E clique no botão de criar card
    Então identificar o card no time esperado

Verificar a criação de 3 cards no mesmo time
    Dado que eu preencha os campos para a criação de card
    E clique no botão de criar card
    Então identificar os 3 cards criados no mesmo time

*** Keywords ***

Dado que eu preencha os campos para a criação de card
    Input text    ${CAMPO_NOME}     Paulo
    Input text    ${CAMPO_CARGO}   Analista
    Input text    ${CAMPO_IMAGEM}   https://www.pexels.com/pt-br/foto/xicara-de-cha-de-vidro-transparente-com-bebida-de-cafe-2299028/
    Click Element    ${CAMPO_TIME}
    Click Element    ${OPCAO_PROGRAMACAO}
E clique no botão de criar card
    Click Element    ${BOTAO_CARD}  
Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
Então identificar os 3 cards criados no mesmo time
    FOR    ${i}    IN RANGE    1    3
        Dado que eu preencha os campos para a criação de card
            E clique no botão de criar card
    END
    Sleep    10s