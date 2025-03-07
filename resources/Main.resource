*** Settings ***
Documentation    Hello Robot 

Library           Browser
Library           SeleniumLibrary
Library           selenium
Resource          ../resources/pages/Custodia.resource


# Arquivo para keywords genericas
*** Keywords ***

Abrir navegador   
    New Browser    browser=chromium    headless=False
    New Page    https://www.udemy.com/



