*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Login To Application
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_PAGE_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PAGE_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_PAGE_SUBMIT_BUTTON}
    Wait Until Page Contains Element    ${DASHBOARD_ELEMENT}