*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/variables/master_common_variables.robot

*** Test Cases ***
Test Opening Homepage
    Open Browser    ${HOME_URL}    ${BROWSER}
    Sleep    5s
    Maximize Browser Window
    #Page Should Contain Element    ${HOME_PAGE_TITLE}
    #Close Browser