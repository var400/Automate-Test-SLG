*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/locators/channel_locators.robot

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    5s

Click Button Add
    Click Element   ${Button_Add_ConfigurationGroup}
    Sleep    5s

Click Dropdown And Select Option
    [Arguments]    ${dropdown_locator}    ${option_locator}
    Click Element    ${dropdown_locator}
    Wait Until Element Is Visible    ${option_locator}    timeout=5s
    Click Element    ${option_locator}

Input Data
    [Arguments]     ${channel_name}      ${channel_file_delimiter}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_NAME}      ${channel_name}
    Click Dropdown And Select Option    ${CLICK_DROPDOWN_CHANNEL_FILE_TYPE}    ${CHOOSE_CHANNEL_FILE_TYPE}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_DELIMITER}      ${channel_file_delimiter}
    Sleep    5s   
