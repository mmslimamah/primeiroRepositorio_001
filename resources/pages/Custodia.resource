*** Settings ***
Documentation       Ações e elementos da página de boas vindas

Resource            ../../resources/Main.resource

*** Keywords *** 
Submit Signup Form
    [Arguments]    ${account}
    Fill Text    id=name         ${account}[name]
    Fill Text    id=email        ${account}[email]
    Fill Text    id=cpf          ${account}[cpf]
    Click    css=button[type="submit"] >> text=Enviar

Notice should be
    [Arguments]    ${message}
    Page Should Contain    ${message}


# Modelo de template
Attemp Signup    
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}
    ${account} =    Create Dictionary    
    ...    name=${name}     
    ...    email=${email}       
    ...    cpf=${cpf}    
    Submit Signup Form    ${account}
    Notice should be      ${output_message}