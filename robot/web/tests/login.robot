*** Settings ***
Resource        basePage.robot

Test Setup      Inicia sessão 
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    [tags]                          login_sucesso
    Go To                           ${url}
    Preencher Login                 rafael       123456

    Pagina Secreta                  Rafael de Sousa

Login invalido
    Go To                           ${url}
    Preencher Login                 teste        102030

    Mensagem alerta Login           Falha ao fazer o login


*** Keywords ***
Preencher Login
    [Arguments]                     ${uname}       ${pass}

    Input Text                      css:input[name=usuario]        ${uname}
    Input Text                      css:input[name=senha]          ${pass}
    Click Element                   css:button[name='action']

Mensagem alerta Login
    [Arguments]                     ${mensagem_esperada}

    ${mensagem}=                     Get webElement          id:toast-container
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Pagina Secreta
    [Arguments]                     ${full_name}
     Page Should Contain            Boas vindas, ${full_name}!
