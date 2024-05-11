*** Settings ***
Documentation     Suíte de testes de login
Resource          ../resources/base_resource.robot
Test Setup        Abrir o navegador 



*** Test Cases ***

Casos de Testes 01 - Acesso login e senha
    [Documentation]  Este teste verifica acessos da page loginxp.vercel.app
    [Tags]           login e senha inválidas
    Dado acessar a home page do site 
    Quando digitar o login ou senha "incorreto"
    Então deverá retornar a mensagem "Oops! Credenciais inválidas :("

Casos de Testes 02 - Usuário deve ser obrigatório
    [Documentation]  Este teste verifica usuário loginxp.vercel.app
    [Tags]           Usuário Obrigatório
    Dado acessar a home page do site 
    Quando digitar somente a senha
    Então deverá retornar a mensagem "Informe o seu nome de usuário!"

Casos de Testes 03 - Senha deve ser obrigatória
    [Documentation]  Este teste verifica a senha loginxp.vercel.app
    [Tags]           Senha Obrigatóro
    Dado acessar a home page do site 
    Quando digitar somente login 
    Então deverá retornar a mensagem "Informe a sua senha secreta!"

Casos de Testes 04 - Login com sucesso
    [Documentation]  Este teste verifica acesso com suceso loginxp.vercel.app
    [Tags]           Login com sucesso
    Dado acessar a home page do site 
    Quando digitar o login e senha "CORRETAMENTE"
    Então deverá retornar um modal com a mensagem "Tudo certo!"