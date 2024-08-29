*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    XML
Resource   ../../resources/keywords/global_keywords.robot
Resource   ../../resources/locators/exclude_locators.robot


*** Keywords ***
Check Output On Create Critiria Page
    [Arguments]    ${data_list}
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
            ELSE IF    '${data_list['group_type']}' == 'multi_dropdown'
                Check MultiDropdown Config    ${data}     ${data_list}    ${LOCATOR_HEADER}   
            ELSE IF    '${data_list['group_type']}' == 'listbox'
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
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}"]    type    ${data_list['group_type']}
        ##Check field_label
        Element Should Be Visible    ${LOCATOR_HEADER}//label[*[*[@name="${data_list['group_name']}"]]]//*[text()="${data_list['group_details']['${data}']['field_label']}"]
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}"]    value    ${data_list['group_details']['${data}']['field_label']}
        ##Check Read Only
        IF    '${data_list['is_disable']}' == 'true'
            Scroll Element Into View    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}"]
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}" and @disabled]]]
        ELSE
            Scroll Element Into View    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}"]
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}" and @disabled]]]
        END
        # Should Not Be Empty    condition
        ##Check Default Value
        IF    '${data_list['group_type']}' == 'checkbox'
            IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
                Checkbox Should Be Selected     ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}"]
            ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
                Checkbox Should Not Be Selected     ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}"]
            END
        ELSE IF    '${data_list['group_type']}' == 'radio'
            ${checked}=    SeleniumLibrary.Get Element Attribute    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}"]    checked
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
        Textfield Value Should Be    ${LOCATOR_HEADER}//*[@name="${data_list['group_name']}"]    ${data_list['group_details']['${data}']['field_value_yes']}
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
            ##Check Field label
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
            Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_label']}"]
            Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_label']}"]//*//*[text()="${data_list['group_details']['${data}']['field_label']}"]
            
            ##Check Default Value
            ${default_string_value}=    Get Text    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox"]
            IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
                Run Keyword If    '${data_list['group_details']['${data}']['field_label']}' not in '${default_string_value}'    Fail    This data is set default value, but not in control
                Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_label']}" and @aria-selected="true"]
            ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
                Run Keyword If    '${data_list['group_details']['${data}']['field_label']}' in '${default_string_value}'    Fail    This data is set default value, but not in control
                Element Should Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_label']}" and @aria-selected="false"]
            END

        ELSE 
            Element Should Not Be Visible    //div//li[@role="option" and @data-value="${data_list['group_details']['${data}']['field_label']}"]
        END
    ELSE
        #Check Read Only
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox"]   id    demo-multiple-checkbox    #Check Type
        Element Should Be Visible   ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[input[@disabled]]
        ${default_string_value}=    Get Text    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox"]
        ##Check Default Value
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
        Element Attribute Value Should Be    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]]    role    listitem
        ##READ ONLY
        IF    '${data_list['is_disable']}' == 'true'    #Check Read Only
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][2]//button[@aria-label="move all right" and @disabled][1]
        ELSE
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][2]//button[@aria-label="move all right" and @disabled][1]
        END
        ##Check Label
        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]]
        ##Check Value
        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]]//*[text()="${data_list['group_details']['${data}']['field_label']}"]
        ##Check Default Value
        IF    '${data_list['group_details']['${data}']['is_checked']}' == 'true'
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][3]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]]
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][1]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]] 
        ELSE IF    '${data_list['group_details']['${data}']['is_checked']}' == 'false'
            Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][1]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]] 
            Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][3]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]] 
        END
    ELSE
        Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[*[*[input[@aria-labelledby="transfer-list-item-${data_list['group_details']['${data}']['field_label']}-label"]]]]
    END

Check SEQ List DB
    [Arguments]    ${script_qry}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    ${script_qry}
    ${results_list}=    Create List
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        Append To List    ${results_list}    ${element}
    END
    # Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}

Check Seq From Web List
    ${elements}=    Get WebElements    //div[@role="rowgroup"]//div[@role="row"]
    ${elements_list}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${text_split}=    Split String    ${text}    \n
        ${joined_values}=    Set Variable    (${text_split[2]}, '${text_split[0]}', '${text_split[1]}')
        Append To List    ${elements_list}    ${joined_values}
    END
    Log To Console    Check Seq From Web ${elements_list}
    Return From Keyword    ${elements_list}

Check Seq From Web List Group Detail 
    ${elements}=    Get WebElements    //div[@role="rowgroup"]//div[@role="row"]
    ${elements_list}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${text_split}=    Split String    ${text}    \n
        ${joined_values}=    Set Variable    (${text_split[2]}, '${text_split[4]}')
        Append To List    ${elements_list}    ${joined_values}
    END
    # Log To Console    Check Seq From Web ${elements_list}
    Return From Keyword    ${elements_list}

Check SEQ List WEB VS BASE 
    [Arguments]    ${results_base}    ${results_web}
    ${index}=    Set Variable    0
    ${seq}=    Set Variable    1
    FOR    ${row}    IN    @{results_base}
        Log To Console    INDEX ${seq}: Base Result: ${results_base[${index}]} | Web Result: ${results_web[${index}]}    no_newline=false
        Run Keyword If    ${results_base[${index}]} == ${results_web[${index}]}    Log    Seq Is True
        Run Keyword If    ${results_base[${index}]} != ${results_web[${index}]}    Fail    Seq Is Not True
        ${index}=    Evaluate    ${index}+1
        ${seq}=    Evaluate    ${seq}+1
    END

##CREATE CRITIRIA
Check Seq From Web Create Criteria
    Scroll Element Into View    ${LOCATOR_HEADER}
    ${elements}=    Get WebElements    ${LOCATOR_HEADER}//div[contains(@class, 'MuiGrid-root') and contains(@class, 'MuiGrid-item') and contains(@class, 'MuiGrid-grid-xs-12') and contains(@class,'MuiGrid-grid-md')]
    ${elements_list}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${text_split}=    Split String    ${text}    \n
        ${joined_values}=    Set Variable    ${text_split[0]}
        Append To List    ${elements_list}    '${joined_values}'
    END
    # Log To Console    Check Seq From Web ${elements_list}
    Return From Keyword    ${elements_list}

Check SEQ Create Criteria DB
    [Arguments]    ${script_qry}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    ${script_qry}
    ${results_list}=    Create List
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        Append To List    ${results_list}    '${element[0]}'
    END
    Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}

Check Seq From Web Create Criteria Detail
    [Arguments]    ${data_list}
    ${elements_list}=    Create List
    IF    '${data_list['group_type']}' == 'text'
        Log    No Check Seq Field
    ELSE IF    '${data_list['group_type']}' == 'radio'
        ${elements}=    Get WebElements    ${LOCATOR_HEADER}//label[*[*[@name="${data_list['group_name']}"]]]
    ELSE IF    '${data_list['group_type']}' == 'checkbox'
        ${elements}=    Get WebElements    ${LOCATOR_HEADER}//label[*[*[@name="${data_list['group_name']}"]]]
    ELSE IF    '${data_list['group_type']}' == 'multi_dropdown'
        ${check_locator}=    Run Keyword And Return Status    Element Should Be Visible    //ul[@role="listbox"]//li[@data-value!="all"]
        Run Keyword If    '${check_locator}' != 'True'    Click Element    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@role="combobox" and @aria-expanded="false"]
        ${elements}=    Get WebElements    //ul[@role="listbox"]//li[@data-value!="all"]
    ELSE IF    '${data_list['group_type']}' == 'listbox'
        ${elements}=    Get WebElements    //div[*[*[text()="${data_list['group_name']}"]]]//div[@role="list"]//div[@role="listitem"]
    ELSE IF    '${data_list['group_type']}' == 'dropdown'
        Click Element    //*[*[text()="${data_list['group_name']}"]]//div[@class="MuiAutocomplete-endAdornment css-p1olib-MuiAutocomplete-endAdornment"]
        Sleep    1s
        ${elements}=    Get WebElements    //body//div[@role="presentation"][2]//li
    END
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${text_split}=    Split String    ${text}    \n
        ${joined_values}=    Set Variable    ${text_split}
        Append To List    ${elements_list}    '${joined_values[0]}'
    END
    # Log To Console    Check Seq From Web ${elements_list}       
    Return From Keyword    ${elements_list}


Generate Dictionary List
    [Arguments]    ${data}
    ${list_data}=    Create List
    FOR    ${key}    IN    @{data['group_details']}
        ${schema}=    Set Variable    ${data['group_details']['${key}']['schema_name']}
        ${table}=    Set Variable    ${data['group_details']['${key}']['table_name']}
        ${column}=    Set Variable    ${data['group_details']['${key}']['field_name']}
        ${is_checked}=    Set Variable    ${data['group_details']['${key}']['is_checked']}
        ${field_value_yes}=    Set Variable    ${data['group_details']['${key}']['field_value_yes']}
        ${field_value_no}=    Set Variable    ${data['group_details']['${key}']['field_value_no']}     
        ${collease}=    Set Variable    ${data['group_details']['${key}']['is_null']}
        ${seq}=    Set Variable    ${data['group_details']['${key}']['field_seq']}
        ${status_group}=    Set Variable    ${data['is_active']}
        ${status_detail}=    Set Variable    ${data['group_details']['${key}']['is_active']}
        # Create dictionary for current item
        ${key_name}=    Set Variable    ${seq}
        ${dict}=    Create Dictionary    schema=${schema}    table=${table}    column=${column}    field_value_yes=${field_value_yes}    field_value_no=${field_value_no}    is_checked=${is_checked}    is_null=${collease}    field_seq=${seq}    status_group=${status_group}    status_detail=${status_detail}
        ${dict_entry}=    Create Dictionary    ${key_name}=${dict}
        # Append dictionary to list
        Append To List    ${list_data}    ${dict_entry}
    END
    Return From Keyword    ${list_data}

Process Dictionary List TEST
    [Arguments]    ${data}
    ${list_data}=    Generate Dictionary List   ${data}
    ${list_script}    Create List
    ${get_all_header}=    Set Variable    ExampleHeader
    ${list_count}=    Get Length    ${list_data}
    # Log To Console    ${list_count}
    FOR    ${element}    IN    @{list_data}
        # ${script_condition}=    Set Variable
        ${count_isnull}=    Set Variable    0
        ${count_round}=    Set Variable    0
        ${type}=    Set Variable    =
        ${keys}=    Get Dictionary Keys    ${element}
        ${first_key}=    Get From List    ${keys}    0
        ${value}=    Get From Dictionary    ${element}    ${first_key}
        ${header}=    Set Variable    ${value['schema']}.${value['table']}.${value['column']}
        IF    ${value['status_group']} == 'true'
            IF    '${value['schema']}.${value['table']}.${value['column']}' not in '${get_all_header}'
                FOR    ${element_level2}    IN    @{list_data}
                    ${keys_level2}=    Get Dictionary Keys    ${element_level2}
                    ${first_key_level2}=    Get From List    ${keys_level2}    0
                    ${value_level2}=    Get From Dictionary    ${element_level2}    ${first_key_level2}
                    # Log To Console    ${get_all_header}
                    IF    '${value_level2['status_detail']}' == 'true'
                        IF    '${value_level2['schema']}.${value_level2['table']}.${value_level2['column']}' == '${header}'
                            IF    '${value_level2['is_checked']}'=='true'
                                IF    ${count_round} <= 0
                                    ${script_condition}=    Set Variable    ${value_level2['field_value_yes']}
                                    ${count_round}=    Evaluate    ${count_round}+1
                                ELSE
                                    ${script_condition}=    Evaluate    "${script_condition}, '${value_level2['field_value_yes']}'"
                                    ${type}    Set Variable    IN
                                    ${count_round}=    Evaluate    ${count_round}+1
                                END
                                IF    '${value_level2['is_null']}' == 'true'
                                    ${count_isnull}=    Set Variable    1
                                    ${collease}=    Set Variable    ${value_level2['field_value_yes']}
                                END
                            ELSE IF    '${value_level2['is_checked']}'=='false'
                                IF    ${count_round} <= 0
                                    ${script_condition}=    Set Variable    ${value_level2['field_value_no']}
                                    ${count_round}=    Evaluate    ${count_round}+1
                                ELSE
                                    ${script_condition}=    Evaluate     "${script_condition}, '${value_level2['field_value_no']}'"
                                    ${type}    Set Variable    IN
                                    ${count_round}=    Evaluate    ${count_round}+1
                                END
                                IF    '${value_level2['is_null']}' == 'true'
                                    ${count_isnull}=    Set Variable    1
                                    ${collease}=    Set Variable    ${value_level2['field_value_no']}
                                END
                            END
                        END
                    END
                END
                IF    ${count_round} == 1
                    IF    ${count_isnull} >= 1
                        Append To List    ${list_script}    COALESCE(${header},'${collease}') ${type} '${script_condition}'
                    ELSE
                        Append To List    ${list_script}    ${header} ${type} '${script_condition}'
                    END
                ELSE IF    ${count_round} > 1
                    IF    ${count_isnull} >= 1
                        Append To List    ${list_script}    COALESCE(${header},'${collease}') ${type} (${script_condition})
                    ELSE
                        Append To List    ${list_script}    ${header} ${type} (${script_condition})
                    END
                END
            END
        END
        ${get_all_header}=    Evaluate    "${get_all_header}, ${header}"
        # Log To Console    test: ${get_all_header}
    END
    Log To Console    ${list_script}
    Return From Keyword    ${list_script}

# CVMSBOX.CAMPAIGN_PREPAID_360.Smartphone = 'Smart Phone'
# CVMSBOX.CAMPAIGN_PREPAID_360.Smartphone in ('Smart Phone','WLAN Router')
# COLLEASE(CVMSBOX.CAMPAIGN_PREPAID_360.Smartphone) in ('Smart Phone','WLAN Router')
Check Preview Script
    [Arguments]     ${data_list}
    ${list_script}=    Process Dictionary List TEST    ${data_list}
    Click Element    //div[input[@name="OutputTemplate"]]
    Click Element    //li[text()="Template Channel Prepaid"]
    Scroll Element Into View    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary css-xnayt1-MuiButtonBase-root-MuiButton-root" and (.='Preview')]
    Click Element    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary css-xnayt1-MuiButtonBase-root-MuiButton-root" and (.='Preview')]
    Wait Until Element Is Visible    //*[*[h5[text()="Preview"]]]//textarea[1]
    FOR    ${script}    IN    @{list_script}
        Log To Console   condition: ${script}
        IF    "${script}" != "${EMPTY}"
            Wait Until Keyword Succeeds    5x    5s    Textarea Should Contain    //*[*[h5[text()="Preview"]]]//textarea[1]    ${script}
        END
    END

Check Permision On Create Criteria
    [Arguments]    ${data_list}
    IF    '${data_list['is_active']}' == 'true'
        Scroll Element Into View    ${LOCATOR_HEADER}
        Scroll Element Into View    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]
        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]
        IF    '${data_list['group_type']}' in 'text,dropdown,multi_dropdown'
            IF    '${data_list['is_authorize']}' == 'true'
                Log To Console    Group Control ${data_list['group_name']}: Is Disabled
                Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[input[@disabled]]
            ELSE
                Log To Console    Group Control ${data_list['group_name']}: Is Enabled
                Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[input[@disabled]]
            END
        ELSE IF    '${data_list['group_type']}' in 'checkbox,radio'
            FOR    ${data}    IN    @{data_list['group_details']}
                IF    '${data_list['group_details']['${data}']['is_active']}' == 'true'
                    IF    '${data_list['is_authorize']}' == 'true'
                        Log To Console    Group Control ${data_list['group_name']} - ${data_list['group_details']['${data}']['field_label']}: Is Disabled
                        Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//*[input[@disabled]]
                    ELSE
                        Log To Console    Group Control ${data_list['group_name']} - ${data_list['group_details']['${data}']['field_label']}: Is Enabled
                        Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}" and @disabled]]] 
                    END
                ELSE
                    Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[*[@name="${data_list['group_name']}" and @value="${data_list['group_details']['${data}']['field_label']}" and @disabled]]] 
                END
            END
        ELSE IF    '${data_list['group_type']}' == 'listbox'
            IF    '${data_list['is_authorize']}' == 'true'
                Log To Console    Group Control ${data_list['group_name']}: Is Disabled
                Element Should Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][2]//button[@aria-label="move all right" and @disabled][1]
            ELSE
                Log To Console    Group Control ${data_list['group_name']}: Is Enabled
                Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]//div[@class="MuiGrid-root MuiGrid-item css-13i4rnv-MuiGrid-root"][2]//button[@aria-label="move all right" and @disabled][1]
            END
        END
    ELSE
        Scroll Element Into View    ${LOCATOR_HEADER}
        Element Should Not Be Visible    ${LOCATOR_HEADER}//*[*[text()="${data_list['group_name']}"]]
    END

