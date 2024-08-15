*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/locators/common_locators.robot

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    5s

Click Button Add
    Click Element   ${Button_Add_ConfigurationGroup}
    Sleep    1s

Click Dropdown And Select Option
    [Arguments]    ${dropdown_locator}    ${option_value}
    Click Element    ${dropdown_locator}
    Wait Until Element Is Visible    //li[@data-value="${option_value}"]    timeout=5s
    Click Element    //li[@data-value="${option_value}"]

CHECK IS ACTIVE
    [Arguments]    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${CHECK_IS_ACTIVE}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${CHECK_IS_ACTIVE}

Click Button Save
    Click Button    ${SAVE_BUTTON}
    Sleep    1s

Click Button Cancel
    Click Button    ${CANCEL_BUTTON}
    Sleep    5s 

Alert Message Success
    [Arguments]    ${expected_result}
    Wait Until Element Is Visible    ${ALERT_MESSAGE_SUCCESS}    timeout=10s
    Element Text Should Be    ${ALERT_MESSAGE_SUCCESS}    ${expected_result}

Alert Message Error
    [Arguments]    ${expected_result}
    Wait Until Element Is Visible    ${ALERT_MESSAGE_ERROR}    timeout=10s
    Element Text Should Be    ${ALERT_MESSAGE_ERROR}    ${expected_result}

Auto Input Data
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT   name=${key}    ${value}
    END