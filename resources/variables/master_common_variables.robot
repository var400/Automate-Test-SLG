*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/variables/global_variables.robot

*** Variables ***
${HOME_URL}    ${BASE_URL}config/CommonCriteriaList
${BROWSER}    ${BASE_BROWSER}
${USER_NAME}    testuser
${PASSWORD}    password123