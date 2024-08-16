*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/locators/global_locators.robot

#Open Browser To URL
#Click Button Add
#Click Dropdown And Select Option
#CHECK IS ACTIVE
#Click Button Save
#Click Button Cancel
#Alert Message Success
#Alert Message Error
#Input Text Data
#Input Check Box Data
#Input Select Option Data

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    5s

Click Button Add
    Click Element   ${Button_Add_ConfigurationGroup}
    Sleep    1s

Click Button Save
    Click Button    ${SAVE_BUTTON}
    Sleep    1s

Click Button Cancel
    Click Button    ${CANCEL_BUTTON}
    Sleep    5s 

Alert Popup Message
    [Arguments]    ${expected_result}
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${expected_result}

Input Text Data
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT   ${TEXT_INPUT_DATA}${key}    ${value}
    END

Input Check Box Data   #Work With Check Status Data Check Box
    [Arguments]    ${data}    ${choose_key}

    FOR    ${key}    ${value}   IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     Check Status Data Check Box    ${key}    ${value}
    END

Check Status Data Check Box   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${CHECK_BOX_INPUT_DATA}${option_locator}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${CHECK_BOX_INPUT_DATA}${option_locator}

Input Select Option Data
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Click Element    ${DROPDOWN_INPUT_DATA}${key}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Element Is Visible    //li[@data-value="${value}"]    timeout=5s
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s    Click Element    //li[@data-value="${value}"]
    END