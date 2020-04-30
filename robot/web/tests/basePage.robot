*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}              http://165.227.93.41/lojinha-web

*** Keywords ***
Inicia sessão
    Open Browser                    ${url}      chrome

Encerra sessão
    Capture Page Screenshot
    Close Browser 