*** Settings ***
Library    SeleniumLibrary
Library    DatabaseLibrary
Library    OperatingSystem
Library    Collections
Library    BuiltIn
Library    DateTime
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
Auto Insert Data
    [Arguments]    ${data}    ${text_choose_key}    ${check_box_choose_key}    ${select_option_choose_key}
    Input Text Data    ${data}    ${text_choose_key}
    Input Check Box Data    ${data}    ${check_box_choose_key}
    Input Select Option Data    ${data}    ${select_option_choose_key}
    
Get Data Id
    [Arguments]    ${column}    ${table}    ${condition}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${script_qry} =    Set Variable    SELECT ${column} FROM ${table} ${condition}
    Log To Console    message
    ${queryResults} =    Query    ${script_qry}
    ${result} =    Set Variable    ${queryResults[0][0]}
    Disconnect From Database
    [RETURN]    ${result}

Auto Check List Data 
    [Arguments]    ${data_id}    ${data}    ${choose_key_text}    ${choose_key_boolean}
        IF    '${data['is_active']}' == 'true'
            Element Should Be Visible    //div[@data-id="${data_id}"]
			FOR    ${key}    ${value}    IN    &{data}
				Run Keyword If    '${key}' in '${choose_key_text}'    Scroll Until Find Element    100    //div[@data-id="${data_id}"]//div[@data-field="${key}"]
				Run Keyword If    '${key}' in '${choose_key_text}'    Wait Until Keyword Succeeds   5x    5s    Element Text Should Be   //div[@data-id="${data_id}"]//div[@data-field="${key}"]      ${value}
				Run Keyword If    '${key}' in '${choose_key_boolean}'    Scroll Until Find Element    100    //div[@data-id="${data_id}"]//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall MuiDataGrid-booleanCell css-ptiqhd-MuiSvgIcon-root" and @data-value="true"]
				Run Keyword If    '${key}' in '${choose_key_boolean}'   Wait Until Keyword Succeeds    5x    5s    Wait Until Element Is Visible    //div[@data-id="${data_id}"]//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall MuiDataGrid-booleanCell css-ptiqhd-MuiSvgIcon-root" and @data-value="true"]
			END
        ELSE IF    '${data['is_active']}' == 'false'
            Element Should Not Be Visible    //div[@data-id="${data_id}"]
			Click Show All Status    any
			FOR    ${key}    ${value}    IN    &{data}
				Run Keyword If    '${key}' in '${choose_key_text}'    Scroll Until Find Element    100    //div[@data-id="${data_id}"]//div[@data-field="${key}"]
				Run Keyword If    '${key}' in '${choose_key_text}'    Wait Until Keyword Succeeds   5x    5s    Element Text Should Be   //div[@data-id="${data_id}"]//div[@data-field="${key}"]      ${value}
				Run Keyword If    '${key}' in '${choose_key_boolean}'    Scroll Until Find Element    100    //div[@data-id="${data_id}"]//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall MuiDataGrid-booleanCell css-ptiqhd-MuiSvgIcon-root" and @data-value="false"]
				Run Keyword If    '${key}' in '${choose_key_boolean}'    Wait Until Keyword Succeeds    5x    5s    Wait Until Element Is Visible    //div[@data-id="${data_id}"]//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall MuiDataGrid-booleanCell css-ptiqhd-MuiSvgIcon-root" and @data-value="false"]
			END
        END

Click Show All Status
    [Arguments]    ${status}
    Scroll Until Find Element    100    ${LOCATOR_GROUP_TITLE_LIST}${LOCATOR_TITLE_NAME_LIST}
    Mouse Over    ${LOCATOR_GROUP_TITLE_LIST}${LOCATOR_TITLE_NAME_LIST}
    Wait Until Element Is Visible    ${LOCATOR_GROUP_TITLE_LIST}${LOCATOR_TITLE_NAME_LIST}//div[@class="MuiDataGrid-menuIcon"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    ${LOCATOR_GROUP_TITLE_LIST}${LOCATOR_TITLE_NAME_LIST}//div[@class="MuiDataGrid-menuIcon"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    //ul[@class="MuiList-root MuiList-padding MuiDataGrid-menuList css-fsg6gs-MuiList-root"]//li[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-kk1bwy-MuiButtonBase-root-MuiMenuItem-root"]//*[text()="Filter"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    //div[@class="MuiDataGrid-panelWrapper css-1miuj5f-MuiDataGrid-panelWrapper"]//div[@class="MuiFormControl-root MuiDataGrid-filterFormValueInput css-1h08ml-MuiFormControl-root-MuiDataGrid-filterFormValueInput"]//div[@role="combobox"]
    Sleep     1s
    Wait Until Keyword Succeeds    5x    5s    Click Element   //div[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation8 MuiPopover-paper MuiMenu-paper MuiMenu-paper css-3dzjca-MuiPaper-root-MuiPopover-paper-MuiMenu-paper"]//ul[@role="listbox"]//li[text()="${status}"]
    Wait Until Keyword Succeeds    5x    5s    Click Element   //div[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-7kmsou-MuiPaper-root-MuiCard-root"]//div[@class="MuiBox-root css-i9gxme"]
    Sleep     1s
    Execute JavaScript  window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft -= 1000

Scroll Until Find Element
    [Arguments]    ${length}    ${locator_option}
    ${found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_option}    2
    WHILE    '${found}' == 'False'
        Execute JavaScript    window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft += ${length}
        Sleep    1s    # รอให้การ scroll มีผล
        ${found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_option}    2
    END
