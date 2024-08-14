*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://www.python.org/downloads/
${BROWSER}  Chrome

*** Test Cases ***
Open Example Website
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Example Domain
    Close Browser