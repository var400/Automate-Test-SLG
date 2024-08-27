*** Settings ***
Library    SeleniumLibrary
Library    DatabaseLibrary
Library    OperatingSystem
Library    Collections
Library    BuiltIn
Library    DateTime
Library    String
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

    Open Browser    http://localhost:3000/login    ${browser}
    Wait Until Keyword Succeeds        5x    5s    Input Text    //input[@name="Username"]    admin
    Wait Until Keyword Succeeds        5x    5s    Input Password    //input[@name="Password"]    admin
    Wait Until Keyword Succeeds        5x    5s    Click Element    //button[text()="Sign In"]
    Sleep    5s
    Wait Until Keyword Succeeds        5x    5s    Go To    ${url}
    Maximize Browser Window
    # Set Window Size    1024    768
    # Execute JavaScript    document.body.style.zoom = "80%";
    # Resize Browser Window To 80 Percent
    Sleep    5s

Resize Browser Window To 80 Percent
    Execute javascript       document.body.style.zoom="80%"

Click Button Add
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_BUTTON_ADD_CONFIGURATIONGROUP}
    Click Element   ${LOCATOR_BUTTON_ADD_CONFIGURATIONGROUP}
    Sleep    1s

Click Button Save
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_SAVE_BUTTON}
    Click Button    ${LOCATOR_SAVE_BUTTON}
    Sleep    1s

Click Button Cancel
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_CANCEL_BUTTON}
    Click Button    ${LOCATOR_CANCEL_BUTTON}
    Sleep    5s 

Click Button Back
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    //div[@class="MuiBox-root css-1pgize9"]
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    //div[@class="MuiBox-root css-1pgize9"]
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_BUTTON_BACK}
    Wait Until Keyword Succeeds    5x    5s    Click Button    ${LOCATOR_BUTTON_BACK}

Click Edit Botton
    [Arguments]    ${data_id}
    Click Element    //div[@data-id="${data_id}"]//div[@data-field="Detail"]

Click Delete Botton
    [Arguments]    ${data_id}
    Click Element    //div[@data-id="${data_id}"]//div[@data-field="Delete"]

Click Dupplicate Button Group Detail
    [Arguments]    ${key}
    Click Element    //div[@data-id="${key}"]//div[@data-field="Dupplicate"]
    
Alert Popup Message
    [Arguments]    ${expected_result}
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${expected_result}

Input Text Data
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Scroll Element Into View    ${LOCATOR_TEXT_INPUT_DATA}${key}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT   ${LOCATOR_TEXT_INPUT_DATA}${key}    ${value}
    END

Input Check Box Data   #Work With Check Status Data Check Box
    [Arguments]    ${data}    ${choose_key}

    FOR    ${key}    ${value}   IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     Check Status Data Check Box    ${key}    ${value}
    END

Check Status Data Check Box   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Scroll Element Into View    ${LOCATOR_CHECK_BOX_INPUT_DATA}${option_locator}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${LOCATOR_CHECK_BOX_INPUT_DATA}${option_locator}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${LOCATOR_CHECK_BOX_INPUT_DATA}${option_locator}

Input Select Option Data
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Scroll Element Into View    //div[@id="mui-component-select-${key}"]
        Run Keyword If    '${key}' in '${choose_key}'    Click Element    //div[@id="mui-component-select-${key}"]
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Element Is Visible    //li[@data-value="${value}"]    timeout=5s
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s    Click Element    //li[@data-value="${value}"]
    END
    
Get Data Id
    [Arguments]    ${column}    ${table}    ${condition}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${script_qry} =    Set Variable    SELECT ${column} FROM ${table} ${condition}
    Log To Console    message
    ${queryResults} =    Query    ${script_qry}
    ${result} =    Set Variable    ${queryResults[0][0]}
    Disconnect From Database
    Return From Keyword    ${result}

Check List Data Is Visible
    [Arguments]    ${data_id}
    ${found_scroll_bar}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class="MuiDataGrid-scrollbar MuiDataGrid-scrollbar--vertical css-1b9e9gy"]
    IF    '${found_scroll_bar}' == 'True'
        Scroll Until Find Data    100    //div[@data-id="${data_id}"]
    END
    Element Should Be Visible    //div[@data-id="${data_id}"]

Scroll Until Find Data
    [Arguments]    ${length}    ${locator_option}
    # Scroll Element Into View    //div[@class="MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1"]
    ${found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_option}    2
    WHILE    '${found}' == 'False'
        Scroll Page    down    ${length}
        # Sleep    1s    # รอให้การ scroll มีผล
        ${found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_option}    2
    END

Check List Data Is Not Visible
    [Arguments]    ${data_id}
    # Scroll Until Find Data    100    //div[@data-id="${data_id}"]
    Element Should Not Be Visible    //div[@data-id="${data_id}"]

Auto Check List Data 
    [Arguments]    ${data_id}    ${data}    ${choose_key_text}    ${choose_key_boolean}
    IF    '${data['is_active']}' == 'true'
        Check List Data Is Visible    ${data_id}
        Check List Text Data    ${data_id}      ${data}     ${choose_key_text}
        Check List Status Data      ${data_id}      ${data}     ${choose_key_boolean}
    ELSE IF    '${data['is_active']}' == 'false'
        Check List Data Is Not Visible    ${data_id}
		Click Show Status    any
        Check List Data Is Visible    ${data_id}
        Check List Text Data    ${data_id}      ${data}     ${choose_key_text}
        Check List Status Data      ${data_id}      ${data}     ${choose_key_boolean}
    END
    ${found_scroll_bar}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class="MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1"]
    IF    '${found_scroll_bar}' == 'True'
        Scroll Page    left    1500
    END

Check List Text Data
    [Arguments]    ${data_id}    ${data}    ${choose_key_text}
    ${found_scroll_bar}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class="MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1"]
	FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key_text}'    Log To Console    Checking field: ${key} -> value must be ${value}    no_newline=false
        IF    '${found_scroll_bar}' == 'True'
            Run Keyword If    '${key}' in '${choose_key_text}'    Scroll Until Find Element    100    //div[@data-id="${data_id}"]//div[@data-field="${key}"]
        END
		Run Keyword If    '${key}' in '${choose_key_text}'    Wait Until Keyword Succeeds   5x    1s    SeleniumLibrary.Element Text Should Be   //div[@data-id="${data_id}"]//div[@data-field="${key}"]      ${value}
	END

Check List Status Data
    [Arguments]    ${data_id}    ${data}    ${choose_key_boolean}
    ${found_scroll_bar}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class="MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1"]
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key_boolean}'    Log To Console    Checking field: ${key} -> value must be ${value}    no_newline=false
        IF    '${found_scroll_bar}' == 'True'
            Run Keyword If    '${key}' in '${choose_key_boolean}'    Scroll Until Find Element    100    //div[@data-id="${data_id}"]//div[@data-field="${key}"]//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall MuiDataGrid-booleanCell css-ptiqhd-MuiSvgIcon-root" and @data-value="${value}"]
        END
        Run Keyword If    '${key}' in '${choose_key_boolean}'    Wait Until Keyword Succeeds    5x    1s    Wait Until Element Is Visible    //div[@data-id="${data_id}"]//div[@data-field="${key}"]//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall MuiDataGrid-booleanCell css-ptiqhd-MuiSvgIcon-root" and @data-value="${value}"]
    END

Click Show Status
    [Arguments]    ${status}
    ${found_scroll_bar}=    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class="MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1"]
    IF    '${found_scroll_bar}' == 'True'
        Scroll Until Find Element    100    ${LOCATOR_GROUP_TITLE_ACTIVE_LIST}
    END
    Wait Until Keyword Succeeds    5x    5s    Click Element    ${LOCATOR_GROUP_TITLE_ACTIVE_LIST}
    Wait Until Element Is Visible    ${LOCATOR_GROUP_TITLE_ACTIVE_LIST}//div[@class="MuiDataGrid-menuIcon"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    ${LOCATOR_GROUP_TITLE_ACTIVE_LIST}//div[@class="MuiDataGrid-menuIcon"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    //ul[@class="MuiList-root MuiList-padding MuiDataGrid-menuList css-fsg6gs-MuiList-root"]//li[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-kk1bwy-MuiButtonBase-root-MuiMenuItem-root"]//*[text()="Filter"]
    # Scroll Element Into View    //div[@class="MuiDataGrid-panelWrapper css-1miuj5f-MuiDataGrid-panelWrapper"]//div[@class="MuiFormControl-root MuiDataGrid-filterFormValueInput css-1h08ml-MuiFormControl-root-MuiDataGrid-filterFormValueInput"]//div[@role="combobox"]
    Wait Until Element Is Visible    //div[@role="combobox" and text()="true"]
    # Wait Until Keyword Succeeds    5x    5s    Click Element    //div[@class="MuiDataGrid-panelWrapper css-1miuj5f-MuiDataGrid-panelWrapper"]//div[@class="MuiFormControl-root MuiDataGrid-filterFormValueInput css-1h08ml-MuiFormControl-root-MuiDataGrid-filterFormValueInput"]//div[@role="combobox"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    //div[@role="combobox" and text()="true"]
    Wait Until Keyword Succeeds    5x    5s    Click Element   //div[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation8 MuiPopover-paper MuiMenu-paper MuiMenu-paper css-3dzjca-MuiPaper-root-MuiPopover-paper-MuiMenu-paper"]//ul[@role="listbox"]//li[text()="${status}"]
    Scroll Element Into View    //div[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-7kmsou-MuiPaper-root-MuiCard-root"]//div[@class="MuiBox-root css-i9gxme"]
    Wait Until Keyword Succeeds    5x    5s    Click Element   //div[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-7kmsou-MuiPaper-root-MuiCard-root"]//div[@class="MuiBox-root css-i9gxme"]
    Sleep     1s
    IF    '${found_scroll_bar}' == 'True'
        Scroll Page    left    1500
    END

Scroll Page    
    [Arguments]    ${control}    ${length}
    Run Keyword If    '${control}' == 'right'    Execute JavaScript    window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft += ${length}
    Run Keyword If    '${control}' == 'left'    Execute JavaScript    window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft -= ${length}
    Run Keyword If    '${control}' == 'up'    Execute JavaScript    window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--vertical css-1b9e9gy')[0].scrollTop -= ${length}
    Run Keyword If    '${control}' == 'down'    Execute JavaScript    window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--vertical css-1b9e9gy')[0].scrollTop += ${length}

Scroll Until Find Element
    [Arguments]    ${length}    ${locator_option}
    # Scroll Element Into View    //div[@class="MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1"]
    ${found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_option}    2
    WHILE    '${found}' == 'False'
        Scroll Page    right    100
        # Sleep    1s    # รอให้การ scroll มีผล
        ${found}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_option}    2
    END

Auto Insert Data
    [Arguments]    ${data}    ${text_choose_key}    ${check_box_choose_key}    ${select_option_choose_key}
    Input Text Data    ${data}    ${text_choose_key}
    Input Check Box Data    ${data}    ${check_box_choose_key}
    Input Select Option Data    ${data}    ${select_option_choose_key}

####CHECK EDIT PAGE####
Auto Check Text Data Edit Page
    [Arguments]    ${data}    ${choose_key_text}    ${choose_key_select_option}    ${choose_key_check_box}
    Check Text Data Edit Page    ${data}    ${choose_key_text}
    Check Select Option Data Edit Page    ${data}    ${choose_key_select_option}
    Check Check Box Data Edit Page    ${data}    ${choose_key_check_box}

Check Text Data Edit Page
    [Arguments]    ${data}   ${choose_key_text}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_text}'
            Scroll Element Into View    name=${key}
            ${tag_name}=    Check Element Type    name=${key}
            IF    '${tag_name}' == 'TEXTAREA'
                Wait Until Keyword Succeeds   5x    5s     Textarea Value Should Be   name=${key}    ${value}
            ELSE IF    '${tag_name}' == 'INPUT'
                Wait Until Keyword Succeeds   5x    5s     Textfield Value Should Be   name=${key}    ${value}
            END
        END
    END

Check Element Type
    [Arguments]    ${locator_option}
    ${tag_name}=    SeleniumLibrary.Get Element Attribute    ${locator_option}    tagName
    RETURN    ${tag_name}


Check Select Option Data Edit Page
    [Arguments]    ${data}   ${choose_key_select_option}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key_select_option}'    Scroll Element Into View    name=${key}
        Run Keyword If    '${key}' in '${choose_key_select_option}'    Wait Until Keyword Succeeds   5x    5s     Textfield Value Should Be   name=${key}    ${value}
    END

Check Check Box Data Edit Page   #Work With Check Status Data Check Box
    [Arguments]    ${data}    ${choose_key_check_box}

    FOR    ${key}    ${value}   IN    &{data}
        Run Keyword If    '${key}' in '${choose_key_check_box}'    Wait Until Keyword Succeeds   5x    5s     Check Status Data Check Box Edit Page    name=${key}    ${value}
    END

Check Status Data Check Box Edit Page   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Scroll Element Into View    ${option_locator}
    Run Keyword If    '${option_value}' == 'true'    Checkbox Should Be Selected    ${option_locator}
    Run Keyword If    '${option_value}' == 'false'   Checkbox Should Not Be Selected    ${option_locator}


####CHANGE DATA EDIT PAGE####
Auto Update Data
    [Arguments]    ${data}   ${choose_key_text}    ${choose_key_select_option}    ${choose_key_check_box}
    Update Text Data    ${data}    ${choose_key_text}
    Update Select Option Data    ${data}    ${choose_key_select_option}
    Update Check Box Data    ${data}    ${choose_key_check_box}
    Sleep    5s


Update Text Data
    [Arguments]    ${data}   ${choose_key_text}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_text}'
            Wait Until Keyword Succeeds   5x    2s    Scroll Element Into View    name=${key}
            ${tag_name}=    Check Element Type    name=${key}
            IF    '${tag_name}' == 'TEXTAREA'
                ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status    Textarea Value Should Be   name=${key}    ${value}
                IF    '${data_has_change}' == 'False'
                    Wait Until Keyword Succeeds   5x    2s    Input Text    name=${key}    ${value}
                END
            ELSE IF    '${tag_name}' == 'INPUT'
                ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status    Textfield Value Should Be   name=${key}    ${value}
                IF    '${data_has_change}' == 'False'
                    Wait Until Keyword Succeeds   5x    2s     Input Text    name=${key}    ${value}
                END
            END
        END
    END

Update Select Option Data
    [Arguments]    ${data}   ${choose_key_select_option}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_select_option}'
            Wait Until Keyword Succeeds   5x    2s    Scroll Element Into View    name=${key}
            ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status     Textfield Value Should Be   name=${key}    ${value}
            IF    '${data_has_change}' == 'False'
                Scroll Element Into View    //div[@id="mui-component-select-${key}"]
                Click Element    //div[@id="mui-component-select-${key}"]
                Wait Until Element Is Visible    //li[@data-value="${value}"]    timeout=5s
                Wait Until Keyword Succeeds   5x    2s    Click Element    //li[@data-value="${value}"]
            END
        END
    END

Update Check Box Data
    [Arguments]    ${data}   ${choose_key_check_box}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_check_box}'
            Wait Until Keyword Succeeds   5x    2s    Scroll Element Into View    name=${key}
            ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status    Textfield Value Should Be   name=${key}    ${value}
            IF    '${data_has_change}' == 'False'
                Wait Until Keyword Succeeds   5x    2s    Check Status Update Check Box Data   name=${key}    ${value}
            END
        END
    END

Check Status Update Check Box Data
    [Arguments]    ${option_locator}    ${option_value}
    Scroll Element Into View    ${option_locator}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${option_locator}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${option_locator}

###CHECK VALIDATE DATA#####
Check Validate Edit Page
    [Arguments]    ${data}    ${choose_key_validate}    ${text_validate}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_validate}' 
            Check Text Alert Validate    ${key}    ${value}    ${text_validate}
        END    
    END

Check Text Alert Validate
    [Arguments]    ${key}    ${value}    ${text_validate}
    IF    '${value}' == ''
        Wait Until Keyword Succeeds   5x    5s    Scroll Element Into View    //div[div[*[@name="${key}"]]]//*[text()="${text_validate}"]
        Wait Until Keyword Succeeds   5x    5s    Element Should Be Visible    //div[div[*[@name="${key}"]]]//*[text()="${text_validate}"]
    END

Clear Database
    [Arguments]    ${script_sql}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    Wait Until Keyword Succeeds   5x    5s    Execute SQL String    ${script_sql}
    Disconnect From Database

Check Screen
    [Arguments]    ${screen_name}
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain    ${screen_name}

###Keyword With Common Exclude Specific
Click Button Add Detail
    Scroll Element Into View     //*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1hk7bbc-MuiSvgIcon-root" and @data-testid="AddCircleIcon"]
    Click Element    //*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1hk7bbc-MuiSvgIcon-root" and @data-testid="AddCircleIcon"]

Auto Insert Data Detail
    [Arguments]    ${data}    ${auto_complete_choose_key}    ${text_choose_key}    ${check_box_choose_key}    ${select_option_choose_key}
        Input Auto Complete Data Detail    ${data}    ${auto_complete_choose_key}
        Input Text Data   ${data}    ${text_choose_key}
        Input Check Box Data Detail    ${data}    ${check_box_choose_key}
        Input Select Option Data    ${data}    ${select_option_choose_key}
Input Auto Complete Data Detail
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key}'
            ${title}=    Mapping Key Title Name    ${key}
            Wait Until Keyword Succeeds    5x    5s    Press Key    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input    ${value}
            Sleep    1s
            Wait Until Keyword Succeeds    5x    5s    Press Keys    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input    ARROW_DOWN    ENTER
            # Log To Console    ${title}
        END
    END
    
Mapping Key Title Name
    [Arguments]    ${key}
    ${title}=    Set Variable    Not Found
    IF    '${key}' == 'schema_name'
        ${title}    Set Variable    Schema Name
    ELSE IF    '${key}' == 'table_name'
        ${title}    Set Variable    Table Name
    ELSE IF    '${key}' == 'field_name'   
        ${title}    Set Variable    Field Name  
    END
    Return From Keyword    ${title}
Input Check Box Data Detail   #Work With Check Status Data Check Box
    [Arguments]    ${data}    ${choose_key}

    FOR    ${key}    ${value}   IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     Check Status Data Check Box Detail    ${key}    ${value}
    END

Check Status Data Check Box Detail   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'true'    Wait Until Keyword Succeeds    5x    5s    Select Checkbox    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'false'   Wait Until Keyword Succeeds    5x    5s    Unselect Checkbox    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    
Click Button Save Detail
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_SAVE_BUTTON}
    Wait Until Keyword Succeeds    5x    5s    Click Button    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_SAVE_BUTTON}
    Sleep    1s

Click Button Close Detail
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_CLOSE_BUTTON}
    Click Button    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_CLOSE_BUTTON}
    Sleep    5s 
    
Click Dupplicate Data From
    [Arguments]    ${data}
    ${group_id}=    Get Element Value From Data Field   field_label    ${data['field_label']}    data-id
    Click Dupplicate Button Group Detail    ${group_id}
    # ${index_id}=    Get Element Value From Data Field   field_label    ${data['field_label']}    data-rowindex
    # ${new_index_id}=    Evaluate    int(${index_id}) + 1
    # ${new_group_id}=    Get Element Value From Index Id    ${new_index_id}    data-id
    ${new_group_id}=    Get Element Value From Data Field   field_label    ${EMPTY}    data-id
    Return From Keyword    ${new_group_id}

Get Element Value From Data Field
    [Arguments]    ${key}    ${value}    ${element_value}
    ${element}=    Get WebElement    xpath=//div[div[@data-field="${key}" and (.='${value}')]]
    ${result}=    SeleniumLibrary.Get Element Attribute    ${element}   ${element_value}
    # Log To Console    ${result}
    Return From Keyword  ${result}

Get Element Value From Index Id
    [Arguments]    ${key}    ${element_value}
    ${element}=    Get WebElement    //div[@data-rowindex="${key}"]
    ${result}=    SeleniumLibrary.Get Element Attribute    ${element}   ${element_value}
    # Log To Console    ${result}
    Return From Keyword  ${result}

Get Data Id From Field 
    [Arguments]    ${data}    ${field}
    ${group_id}=    Get Element Value From Data Field   ${field}   ${data}    data-id
    Log To Console    Data ID: ${group_id}
    Return From Keyword    ${group_id}

Auto Check Text Data Detail
    [Arguments]    ${data}    ${choose_key_auto_complete}    ${choose_key_text}    ${choose_key_select_option}    ${choose_key_check_box}
    Check Auto Complete Data Detail Edit Page   ${data}    ${choose_key_auto_complete}
    Check Text Data Edit Page    ${data}    ${choose_key_text}
    Check Select Option Data Edit Page    ${data}    ${choose_key_select_option}
    Check Check Box Data Detail Edit Page    ${data}    ${choose_key_check_box}


Check Auto Complete Data Detail Edit Page 
    [Arguments]    ${data}   ${choose_key_auto_complete}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_auto_complete}'
            # ${result}    Set Variable    ${None}
            ${title}=    Mapping Key Title Name    ${key}
                IF    '${value}' != '${EMPTY}'
                    IF    '${title}' == 'Field Name'
                        ${text_value}=    Get Value    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input 
                        ${split_parts}=    Split String    ${text_value}    ${EMPTY}
                        ${result}=    Get From List    ${split_parts}    1
                        # Log To Console    ${result} 
                        ${value}=    Evaluate    "${value} ${result}"
                        # Log To Console    ${value}
                    END
                END
            Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input
            Wait Until Keyword Succeeds   5x    5s     Textfield Value Should Be    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input    ${value}
        END
    END

Check Check Box Data Detail Edit Page   #Work With Check Status Data Check Box
    [Arguments]    ${data}    ${choose_key_check_box}

    FOR    ${key}    ${value}   IN    &{data}
        Run Keyword If    '${key}' in '${choose_key_check_box}'    Wait Until Keyword Succeeds   5x    5s     Check Status Data Detail Check Box Edit Page    ${key}    ${value}
    END

Check Status Data Detail Check Box Edit Page   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'true'    Checkbox Should Be Selected    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'false'   Checkbox Should Not Be Selected    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]

Auto Update Data Detail
    [Arguments]    ${data}   ${choose_key_auto_complete}    ${choose_key_text}    ${choose_key_check_box}    ${choose_key_select_option}
    Update Auto Complete Data    ${data}    ${choose_key_auto_complete}
    Update Text Data    ${data}    ${choose_key_text}
    Update Select Option Data    ${data}    ${choose_key_select_option}
    Update Check Box Data Detail   ${data}    ${choose_key_check_box}
    Sleep    5s

Update Auto Complete Data
    [Arguments]    ${data}   ${choose_key_text}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_text}'
                ${title}=    Mapping Key Title Name    ${key}
                ${text_value}=    Get Value    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input
                IF    '${text_value}' != '${EMPTY}'
                    ${split_parts}=    Split String    ${text_value}    ${EMPTY}
                    ${result}=    Get From List    ${split_parts}    0
                END
            IF    '${result}' != '${value}'
                Wait Until Keyword Succeeds    5x    5s    Press Keys    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input    ${value}    ARROW_DOWN    ENTER
            ELSE
                Log To Console    ${key} value = ${value} no update on web = ${text_value}
            END
        END
    END

Update Check Box Data Detail
    [Arguments]    ${data}   ${choose_key_check_box}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_check_box}'
            Wait Until Keyword Succeeds   5x    2s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${key}"]
            ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status    Textfield Value Should Be   ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${key}"]    ${value}
            IF    '${data_has_change}' == 'False'
                Wait Until Keyword Succeeds   5x    2s    Check Status Update Check Box Data Detail   ${key}    ${value}
            END
        END
    END

Check Status Update Check Box Data Detail   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]

Check Validate Data Detail
    [Arguments]    ${data}    ${choose_key_validate}    ${choose_key_validate_auto_complete}    ${text_validate}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key_validate}'           
            Check Text Alert Validate    ${key}    ${value}    ${text_validate}   
        ELSE IF    '${key}' in '${choose_key_validate_auto_complete}'           
            ${title}=    Mapping Key Title Name    ${key} 
            Check Text Alert Validate Auto Complete Data Detail    ${title}    ${value}    ${text_validate}
        END    
    END

Check Text Alert Validate Data Detail
    [Arguments]    ${key}    ${value}    ${text_validate}
    IF    '${value}' == ''
        Wait Until Keyword Succeeds   5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[*[@name="${key}"]]]//*[text()="${text_validate}"]
        Wait Until Keyword Succeeds   5x    5s    Element Should Be Visible    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[*[@name="${key}"]]]//*[text()="${text_validate}"]
    END

Check Text Alert Validate Auto Complete Data Detail
    [Arguments]    ${key}    ${value}    ${text_validate}
    IF    '${value}' == ''
        Wait Until Keyword Succeeds   5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${key}"]]//*[text()="${text_validate}"]
        Wait Until Keyword Succeeds   5x    5s    Element Should Be Visible    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${key}"]]//*[text()="${text_validate}"]
    END

Click Button Save Group Control
    [Arguments]    ${option_contol}
    Click Button Save
    Sleep    2s
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Are you sure you want to save your changes?.
    IF    '${option_contol}' == 'Yes'
        Wait Until Keyword Succeeds   5x    5s    Click Element    //button[text()="Yes"] 
    ELSE IF    '${option_contol}' == 'No'
        Wait Until Keyword Succeeds   5x    5s    Click Element    //button[text()="No"]  
    ELSE IF    '${option_contol}' == 'Close'
        Wait Until Keyword Succeeds   5x    5s    Click Element    //button[@aria-label="Close this dialog"]
    END
