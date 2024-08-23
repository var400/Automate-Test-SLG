*** Settings ***
Library    SeleniumLibrary
Library    String
Library    XML
Resource   ../../resources/keywords/global_keywords.robot
Resource   ../../resources/locators/common_locators.robot


*** Keywords ***
Click Button Add Detail
    Scroll Element Into View     //*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1hk7bbc-MuiSvgIcon-root" and @data-testid="AddCircleIcon"]
    Click Element    //*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1hk7bbc-MuiSvgIcon-root" and @data-testid="AddCircleIcon"]

Auto Insert Data Detail
    [Arguments]    ${data}    ${text_choose_key}    ${check_box_choose_key}    ${select_option_choose_key}    ${auto_complete_choose_key}
    Input Auto Complete Data Detail    ${data}    ${auto_complete_choose_key}
    Input Text Data   ${data}    ${text_choose_key}
    Input Check Box Data Detail    ${data}    ${check_box_choose_key}
    Input Select Option Data    ${data}    ${select_option_choose_key}

Input Auto Complete Data Detail
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key}'
            ${title}=    Mapping Key Title Name    ${key}
            Wait Until Keyword Succeeds    5x    5s    Press Keys    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input    ${value}    ARROW_DOWN    ENTER
            Log To Console    ${title}
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
    [Return]    ${title}
Input Check Box Data Detail   #Work With Check Status Data Check Box
    [Arguments]    ${data}    ${choose_key}

    FOR    ${key}    ${value}   IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     Check Status Data Check Box Detail    ${key}    ${value}
    END

Check Status Data Check Box Detail   #Work With Input Check Box Data 
    [Arguments]    ${option_locator}    ${option_value}
    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${LOCATOR_SUB_WINDOWS_DETAIL}//*[@name="${option_locator}"]
    
Click Button Save Detail
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_SAVE_BUTTON}
    Click Button    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_SAVE_BUTTON}
    Sleep    1s

Click Button Close Detail
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_CLOSE_BUTTON}
    Click Button    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_CLOSE_BUTTON}
    Sleep    5s 
    
Click Dupplicate Data From
    [Arguments]    ${data}
    ${group_id}=    Get Element Value From Data Field   field_label    ${data['field_label']}    data-id
    Click Dupplicate Button Group Detail    ${group_id}
    ${index_id}=    Get Element Value From Data Field   field_label    ${data['field_label']}    data-rowindex
    ${new_index_id}=    Evaluate    int(${index_id}) + 1
    ${new_group_id}=    Get Element Value From Index Id    ${new_index_id}    data-id
    [Return]    ${new_group_id}

Get Element Value From Data Field
    [Arguments]    ${key}    ${value}    ${element_value}
    ${element}=    Get WebElement    xpath=//div[div[@data-field="${key}" and (.='${value}')]]
    ${result}=    Get Element Attribute    ${element}   ${element_value}
    Log To Console    ${result}
    [Return]  ${result}

Get Element Value From Index Id
    [Arguments]    ${key}    ${element_value}
    ${element}=    Get WebElement    //div[@data-rowindex="${key}"]
    ${result}=    Get Element Attribute    ${element}   ${element_value}
    Log To Console    ${result}
    [Return]  ${result}

Get Data Id From Field 
    [Arguments]    ${data}    ${field}
    ${group_id}=    Get Element Value From Data Field   ${field}   ${data}    data-id
    [Return]    ${group_id}

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
            IF    '${title}' == 'Field Name'
                ${text_value}=    Get Value    ${LOCATOR_SUB_WINDOWS_DETAIL}//div[div[text()="${title}"]]//input 
                ${split_parts}=    Split String    ${text_value}    ${EMPTY}
                ${result}=    Get From List    ${split_parts}    1
                Log To Console    ${result} 
                ${value}=    Evaluate    "${value} ${result}"
                Log To Console    ${value}
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
    [Arguments]    ${data}   ${choose_key_auto_complete}    ${choose_key_text}    ${choose_key_select_option}    ${choose_key_check_box}
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
            ${split_parts}=    Split String    ${text_value}    ${EMPTY}
            ${result}=    Get From List    ${split_parts}    0
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

Check Output On Create Critiria Page
    [Arguments]    ${data_list}
    ${LOCATOR_HEADER}=    Set Variable    //div[div[div[@id="Header"]//*[text()="Common Criteria"]]]
    IF    '${data_list['is_active']}' == 'true'
        Scroll Element Into View    ${LOCATOR_HEADER}
        Scroll Element Into View    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]
        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]
        # ##CHECK SEQ
        # Element Should Be Visible    ${LOCATOR_HEADER}//div[contains(@class, 'MuiGrid-root') and contains(@class, 'MuiGrid-item') and contains(@class, 'MuiGrid-grid-xs-12') and contains(@class,'MuiGrid-grid-md')][1+${data_list['group_seq']}]//*[*[text()="${data_list['group_name']}"]]
        FOR    ${data}    IN    @{data_list['group_details']}
            IF    '${data_list['group_type']}' == 'text'
                Check Textbox Config    ${data}     ${data_list}    ${LOCATOR_HEADER}
            ELSE IF    '${data_list['group_type']}' == 'dropdown'
                Check Dropdown Config    ${data}     ${data_list}    ${LOCATOR_HEADER}
            ELSE IF    '${data_list['group_type']}' in 'checkbox,radio'
                Check Checkbox Config    ${data}     ${data_list}    ${LOCATOR_HEADER}
            ELSE IF    '${data_list['group_type']}' in 'multi_dropdown'
                Check MultiDropdown Config    ${data}     ${data_list}    ${LOCATOR_HEADER}   
            ELSE IF    '${data_list['group_type']}' in 'listbox'
                Check CheckListBox Config    ${data}     ${data_list}    ${LOCATOR_HEADER}
            END         
        END
    ELSE
        Scroll Element Into View    ${LOCATOR_HEADER}
        Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]
    END

Check Checkbox Config
    [Arguments]     ${data}    ${data_list}    ${LOCATOR_HEADER}
    Log To Console    ${data}
    Log To Console    default_value: ${data_list['group_details']['${data}']['is_checked']}
    IF    '${data_list['group_details']['${data}']['is_active']}' == 'true'
        ##Check Type
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}"]    type    ${data_list['group_type']}
        ##Check field_label
        Element Should Be Visible    ${LOCATOR_HEADER}//label[*[*[@name="${data_list['group_name']}"]]]//*[text()="${data_list['group_details']['${data}']['field_label']}"]
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}"]    value    ${data_list['group_details']['${data}']['field_value']}
        ##Check Read Only
        IF    '${data_list['is_disable']}' == 'true'
            Scroll Element Into View    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}"]
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}" and @disabled]]]
        ELSE
            Scroll Element Into View    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}"]
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}" and @disabled]]]
        END
        Should Not Be Empty    condition
        ##Check Default Value
        IF    '${data_list['group_type']}' == 'checkbox'
            IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
                Checkbox Should Be Selected     ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}"]
            ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
                Checkbox Should Not Be Selected     ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}"]
            END
        ELSE IF    '${data_list['group_type']}' == 'radio'
            ${checked}=    SeleniumLibrary.Get Element Attribute    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_value']}"]    checked
            IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'  
                Run Keyword If    '${checked}' != '${data_list['group_details']['${data}']['is_checked']}'    Fail    Radio button should be selected, but it is not.
            ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
                Run Keyword If    '${checked}' != 'None'    Fail    Radio button should not be selected, but it is.
            END
        END

    ELSE
        ##Check field_label
        Element Should Not Be Visible    ${LOCATOR_HEADER}//label[*[*[@name="${data_list['group_name']}"]]]//*[text()="${data_list['group_details']['${data}']['field_label']}"]
    END

Check Textbox Config
    [Arguments]     ${data}    ${data_list}    ${LOCATOR_HEADER}
    Log To Console    ${data}
    Log To Console    default_value: ${data_list['group_details']['${data}']['is_checked']}
    ##Check Type
    Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}"]    type    ${data_list['group_type']}
    ##Check Read Only
    IF    '${data_list['is_disable']}' == 'true'
        Element Should Be Visible    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']} and @disabled"]
    ELSE
        Element Should Not Be Visible    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']} and @disabled"]
    END
    #Check Default Value
    IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
        Textfield Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}"]    ${data_list['group_details']['${data}']['field_value']}
    ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
        Textfield Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}"]    ${EMPTY}
    END

  
Check Dropdown Config
    [Arguments]     ${data}    ${data_list}    ${LOCATOR_HEADER}
    Log To Console    ${data}
    Log To Console    default_value: ${data_list['group_details']['${data}']['is_checked']}
    IF    '${data_list['is_disable']}' == 'false'    #Check Read Only
        IF    '${data_list['group_details']['${data}']['is_active']}' == 'true'
            Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input    type    search    #Check Type
            Click Element    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[@data-testid="ArrowDropDownIcon"]
            Page Should Contain    ${data_list['group_details']['${data}']['field_label']}
            
            ##Check Read Only
            Element Should Not Be Visible   ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input[@disabled]

            IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'    #Check Default Value
                Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input[@value="${data_list['group_details']['${data}']['field_label']}"]
            ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
                Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input[@value="${data_list['group_details']['${data}']['field_label']}"]
            END

            Click Element    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[@data-testid="ArrowDropDownIcon"]
        ELSE 
            Click Element    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[@data-testid="ArrowDropDownIcon"]
            Page Should Not Contain    ${data_list['group_details']['${data}']['field_label']}
            Click Element    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[@data-testid="ArrowDropDownIcon"]
        END
    ELSE
        ##Check Type
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input    type    search
        ##Check Read Only
        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input[@disabled]
        ##Check Default Value
        IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input[@value="${data_list['group_details']['${data}']['field_label']}"]
        ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//input[@value="${data_list['group_details']['${data}']['field_label']}"]
        END
    END

Check MultiDropdown Config
    [Arguments]     ${data}    ${data_list}    ${LOCATOR_HEADER}
    Log To Console    ${data}
    Log To Console    default_value: ${data_list['group_details']['${data}']['is_checked']}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox" and @aria-expanded="false"]
    Log To Console    ${status}
    IF    '${data_list['is_disable']}' == 'false'    #Check Read Only
        Run Keyword If    '${status}' == 'True'   Wait Until Keyword Succeeds   5x    5s    Click Element    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox" and @aria-expanded="false"]
        IF    '${data_list['group_details']['${data}']['is_active']}' == 'true'
            Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox"]   id    demo-multiple-checkbox    #Check Type
            
            #Check Read Only
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[input[@disabled]]

            ##Check Field Value and Label
            Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_value']}"]
            Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_value']}"]//*//*[text()="${data_list['group_details']['${data}']['field_label']}"]
            
            ##Check Default Value
            ${default_string_value}=    Get Text    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox"]
            IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
                Run Keyword If    '${data_list['group_details']['${data}']['field_label']}' not in '${default_string_value}'    Fail    This data is set default value, but not in control
                Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_value']}" and @aria-selected="true"]
            ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
                Run Keyword If    '${data_list['group_details']['${data}']['field_label']}' in '${default_string_value}'    Fail    This data is set default value, but not in control
                Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_value']}" and @aria-selected="false"]
            END

        ELSE 
            Element Should Not Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_value']}"]
        END
    ELSE
        #Check Read Only
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox"]   id    demo-multiple-checkbox    #Check Type
        Element Should Be Visible   ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[input[@disabled]]
        ${default_string_value}=    Get Text    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox"]
        IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
            Run Keyword If    '${data_list['group_details']['${data}']['field_label']}' not in '${default_string_value}'    Fail    This data is set default value, but not in control
        ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
            Run Keyword If    '${data_list['group_details']['${data}']['field_label']}' in '${default_string_value}'    Fail    This data is set default value, but not in control
        END
    END

Check CheckListBox Config
    [Arguments]     ${data}    ${data_list}    ${LOCATOR_HEADER}
    Log To Console    ${data}
    Log To Console    default_value: ${data_list['group_details']['${data}']['is_checked']}
    IF    '${data_list['group_details']['${data}']['is_active']}' == 'true'
        ##Check Type
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]]    role    listitem
        ##READ ONLY
        IF    '${data_list['is_disable']}' == 'true'    #Check Read Only
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][2]//button[@aria-label="move all right" and @disabled][1]
        ELSE
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][2]//button[@aria-label="move all right" and @disabled][1]
        END
        ##Check Label
        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]]
        ##Check Value
        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]]//*[text()="${data_list['group_details']['${data}']['field_label']}"]
        ##Check Default Value
        IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][3]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]]
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][1]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]] 
        ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][1]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]] 
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][3]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]] 
        END
    ELSE
        Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_value']}-label"]]]]
    END

# CVMSBOX.CAMPAIGN_PREPAID_360.Smartphone = 'Smart Phone'
# CVMSBOX.CAMPAIGN_PREPAID_360.Smartphone in ('Smart Phone','WLAN Router')
# COLLEASE(CVMSBOX.CAMPAIGN_PREPAID_360.Smartphone) in ('Smart Phone','WLAN Router')
Check Preview Script
    [Arguments]     ${data_list}
    ${script}=    Generate Script    ${data_list}
    Click Element    //div[input[@name="OutputTemplate"]]
    Click Element    //li[text()="Template Channel Prepaid"]
    Scroll Element Into View    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary css-xnayt1-MuiButtonBase-root-MuiButton-root" and (.='Preview')]
    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary css-xnayt1-MuiButtonBase-root-MuiButton-root" and (.='Preview')]
    Sleep    1s
    Textarea Should Contain    //*[*[h5[text()="Preview"]]]//textarea[1]    ${script}

Generate Script
    [Arguments]    ${data_list}
    ${count_con}=    Set Variable    0
    ${count_isnull}=    Set Variable    0
    
    FOR    ${data}    IN    @{data_list['group_details']}
        IF    '${data_list['group_details']['${data}']['is_active']}' == 'true'
            ${schema}=    Set Variable    ${data_list['group_details']['${data}']['schema_name']}
            ${table}=    Set Variable    ${data_list['group_details']['${data}']['table_name']}
            ${column}=    Set Variable    ${data_list['group_details']['${data}']['field_name']}
            IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
                IF    ${count_con} == 0
                    # First active and checked element
                    ${type}=    Set Variable    =
                    ${condition}=    Set Variable    '${data_list['group_details']['${data}']['field_value']}'
                ELSE
                    # Subsequent elements
                    ${type}=    Set Variable    IN
                    ${condition}=    Evaluate    ${Condition}, '${data_list['group_details']['${data}']['field_value']}'
                END
                ${count_con}=    Evaluate    ${count_con} + 1
            END
            IF    '${data_list['group_details']['${data}']['is_null']}' == 'true'
                ${count_isnull}=    Set Variable    1
                ${value_collease}=    Set Variable    ${data_list['group_details']['${data}']['field_value']}
            END
        END
    END
    # Construct final script
    ${script}=    Set Variable    ${EMPTY}
    IF    ${count_con} >= 1
        ${final_Table}=    Set Variable    ${schema}.${table}.${column}
        ${final_Condition}=    Set Variable    ${condition}
        IF    ${count_isnull} == 1
            ${script}=    Set Variable    COALESCE(${final_Table},'${value_collease}') ${type} ${final_Condition}
        ELSE
            ${script}=    Set Variable    ${final_Table} ${type} ${final_Condition}
        END
    END
    [Return]    ${script}