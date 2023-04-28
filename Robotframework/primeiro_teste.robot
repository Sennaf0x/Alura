
*** Settings ***
Library    SeleniumLibrary

*** Tasks ***
Abrir navegador e acessar o site do organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Preencher campos de formulários
    Input text    id:form-nome     Paulo
    Input text    id:form-cargo    Analista
    Input text    id:form-imagem   https://www.pexels.com/pt-br/foto/xicara-de-cha-de-vidro-transparente-com-bebida-de-cafe-2299028/
    Click Element    class: lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Sleep    10s
    Click Element    form-botao
    Element Should Be Visible    class:colaborador
    Sleep    5s