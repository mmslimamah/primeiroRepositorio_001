*** Settings ***
Documentation    Hello Robot

Resource         ../resources/Main.resource

Test Setup       Abrir navegador
Test Teardown    Take Screenshot

*** Test Cases ***

# Para executar via linha de comando: robot -d .logs test

# *** Keywords ***
# Submit Signup Form
#     [Arguments]    ${account}
#     Fill Text    id=name         ${account}[name]
#     Fill Text    id=email        ${account}[email]
#     Fill Text    id=cpf          ${account}[cpf]
#     Click    css=button[type="submit"] >> text=Enviar

# Passo a massa de teste validando o preenchimento de todos os campos 
Exemplo de dicionario
    Sleep    5s
    # ${account} =    Create Dictionary    
    # ...    name=John Doe    
    # ...    email=johndoe@example.com    
    # ...    cpf=12345678900

    # Submit Signup Form    ${account}

    # Log    ${account}
    Take Screenshot


Exemplo de dicionario sem campo name preenchido
    ${account} =    Create Dictionary    
    ...    name=${EMPTY}    
    ...    email=johndoe@example.com    
    ...    cpf=12345678900 

    Submit Signup Form    ${account}
    Notice should be      O campo nome é obrigatório

# Modelo de template - Realizando varias validações
Tentativa de pré-cadastro
    [Template]    Attemp Signup
    ${EMPTY}    marcelalima_@msn.comando     01234567890      Por favor informe o seu nome  
    Marcela    ${EMPTY}                      01234567890      Por favor informe o seu email      
    Marcela   marcelalima_@msn.comando       ${EMPTY}         Por favor informe o seu cpf      
