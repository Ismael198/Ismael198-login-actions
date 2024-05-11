*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${BASE_URL}             https://loginxp.vercel.app
${BROWSER}              chrome
${HEADLESS_OPTION}      True
${Button_Entrar}        //button[@class='btn btn-primary'][contains(.,'Entrar')]
${LOGIN_INVALIDO}       qa 
${SENHA_INVALIDA}       123456  
${LOGIN_VALIDO}         qa 
${SENHA_VALIDA}         xperience
${MENSAGEM_SUCESSO}     Tudo certo!

*** Keywords ***

Abrir o navegador
    ${options}=        Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Run Keyword If    '${HEADLESS_OPTION}'=='True'    Call Method    ${options}    add_argument    --headless
    Open Browser       ${BASE_URL}    browser=${BROWSER}    options=${options}

Fechar o navegador
    Capture Page Screenshot     
    Close Browser

Dado acessar a home page do site
    Go To       url=${BASE_URL} 

Quando digitar o login ou senha "incorreto"
    Input Text             //input[@name='user']   ${LOGIN_INVALIDO}
    Input Text             //input[@name='pass']   ${SENHA_INVALIDA} 
    Click Button           ${Button_Entrar}

Quando digitar somente a senha
    Input Text             //input[@name='user']   ${EMPTY}     
    Input Text             //input[@name='pass']   ${SENHA_INVALIDA}     
    Click Button           ${Button_Entrar}

Quando digitar somente login
    Input Text             //input[@name='user']   ${LOGIN_INVALIDO}  
    Input Text             //input[@name='pass']   ${EMPTY}    
    Click Button           ${Button_Entrar}

Quando digitar o login e senha "CORRETAMENTE"
    Input Text             //input[@name='user']   ${LOGIN_VALIDO}
    Input Text             //input[@name='pass']   ${SENHA_VALIDA} 
    Click Button           ${Button_Entrar} 

Então deverá retornar a mensagem "${FRASE}"  
    Wait Until Page Contains     text=${FRASE}
    
Então deverá retornar um modal com a mensagem "${MENSAGEM_SUCESSO}"
   Wait Until Page Contains    text=${MENSAGEM_SUCESSO}    timeout=10s    error=A mensagem "${MENSAGEM_SUCESSO}" não apareceu após 10 segundos.
   Log To Console    ${MENSAGEM_SUCESSO}
