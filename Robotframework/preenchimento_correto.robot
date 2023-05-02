
*** Settings ***
Library          SeleniumLibrary
Library          FakerLibrary    locale=pt_BR
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
@{SELECIONAR_TIMES}
...    //option[contains(.,'Programação')]
...    //option[contains(.,'Front-End')]
...    //option[contains(.,'Data Science')]
...    //option[contains(.,'Devops')] 
...    //option[contains(.,'UX e Design')]
...    //option[contains(.,'Mobile')]
...    //option[contains(.,'Inovação e Gestão')]  

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

*** Keywords ***

Dado que eu preencha os campos para a criação de card
    ${NOME}       FakerLibrary.First Name
    Input text    ${CAMPO_NOME}     ${NOME}
    ${CARGO}      FakerLibrary.Job
    Input text    ${CAMPO_CARGO}    ${CARGO}
    ${IMAGEM}     FakerLibrary.Image Url    width=100    height=100
    Input text    ${CAMPO_IMAGEM}   ${IMAGEM}
    Click Element    ${CAMPO_TIME}
    Click Element    ${SELECIONAR_TIMES}[0]
E clique no botão de criar card
    Click Element    ${BOTAO_CARD}  
Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador
Então identificar os 3 cards criados no mesmo time
    FOR    ${i}    IN RANGE    1    3
        Dado que eu preencha os campos para a criação de card
            E clique no botão de criar card
    END
Então identificar o card no time disponível
    FOR    ${index}    ${TIME}    IN ENUMERATE    @{SELECIONAR_TIMES}
        Dado que eu preencha os campos para a criação de card
        Click Element    ${TIME}
        E clique no botão de criar card        
    END
    Sleep    10s