*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***

Dado que eu acesse o site do organo
    Open Browser    url=http://localhost:3000/    browser=Chrome

Fechar no navegador
    Close Browser