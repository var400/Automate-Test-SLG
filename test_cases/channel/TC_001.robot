*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/channel_variables.robot

*** Test Cases ***
Open Browser SLG
    Open Browser To URL    ${HOME_URL}     ${BROWSER}
    Click Button Add
    INPUT DATA      sssss        aaaasss