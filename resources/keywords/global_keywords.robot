*** Settings ***
Library    SeleniumLibrary
Library    DatabaseLibrary
Library    OperatingSystem
Library    Collections
Library    BuiltIn
Library    ../../libs/yaml_helper.py
Resource   ../../resources/locators/global_locators.robot
Resource   ../../resources/variables/database_connection.robot

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
    Click Element   ${LOCATOR_BUTTON_ADD_CONFIGURATIONGROUP}
    Sleep    1s

Click Button Save
    Click Button    ${LOCATOR_SAVE_BUTTON}
    Sleep    1s

Click Button Cancel
    Click Button    ${LOCATOR_CANCEL_BUTTON}
    Sleep    5s 

Click Button Back
    Click Element    ${LOCATOR_BUTTON_BACK}

Click Edit Botton
    [Arguments]    ${data_id}
    Click Element    //div[@data-id="${data_id}"]//div[@data-field="Detail" ]

Click Delete Botton
    [Arguments]    ${data_id}
    Click Element    //div[@data-id="${data_id}"]//div[@data-field="Delete" ]

Alert Popup Message
    [Arguments]    ${expected_result}
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${expected_result}

Input Text Data
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT   ${LOCATOR_TEXT_INPUT_DATA}${key}    ${value}
    END

Input Check Box Data   #Work With Check Status Data Check Box
    [Arguments]    ${data}    ${choose_key}

    FOR    ${key}    ${value}   IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     Check Status Data Check Box    ${key}    ${value}
    END

Check Status Data Check Box   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${LOCATOR_CHECK_BOX_INPUT_DATA}${option_locator}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${LOCATOR_CHECK_BOX_INPUT_DATA}${option_locator}

Input Select Option Data
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Click Element    ${LOCATOR_DROPDOWN_INPUT_DATA}${key}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Element Is Visible    //li[@data-value="${value}"]    timeout=5s
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s    Click Element    //li[@data-value="${value}"]
    END
    
Get Data Id
    [Arguments]    ${column}    ${table}    ${condition}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${script_qry} =    Set Variable    SELECT ${column} FROM ${table} ${condition}
    ${queryResults} =    Query    ${script_qry}
    ${result} =    Set Variable    ${queryResults[0][0]}
    Disconnect From Database
    [Return]    ${result}

        