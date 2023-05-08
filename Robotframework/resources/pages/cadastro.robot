*** Settings ***
Resource    ../main.robot
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
Dado que eu clique no botao criar card
    Click Element    ${BOTAO_CARD}

Então sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
