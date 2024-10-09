*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    XML
Resource   ../../resources/keywords/global_keywords.robot
Resource   ../../resources/locators/create_criteria_locators.robot


*** Keywords ***
Click Choose Channel
    [Arguments]    ${channel}
    Scroll Element Into View    //div[input[@name="OutputTemplate"]]
    Click Element    //div[input[@name="OutputTemplate"]]
    Click Element    //li[text()="${channel}"]

Choose Group Control
    [Arguments]    ${data_list}
    ${list}=    Create List    Common    Exclude
    ##Exclude, Common
    FOR    ${choose_list}    IN    @{list}
        IF    "${data_list['${choose_list}']}" != "None"
            FOR    ${data}    IN    @{data_list['${choose_list}']}
                FOR    ${label}    IN    @{data_list['${choose_list}']['${data}']['value']}
                    Log To Console    tyep: ${data_list['${choose_list}']['${data}']['group_type']} | group_name: ${data_list['${choose_list}']['${data}']['group_name']} | label: ${data_list['${choose_list}']['${data}']['value']['${label}']}
                    Click Common Exclude Group Control value    ${data_list['${choose_list}']['${data}']['group_type']}    ${data_list['${choose_list}']['${data}']['group_name']}    ${data_list['${choose_list}']['${data}']['value']['${label}']}
                END
            END
        ELSE
            Log To Console    ${choose_list}: No Input Data
        END
    END
    ##Specific
    ${index_inc}=    Set Variable    1
    ${index_exc}=    Set Variable    1
    FOR    ${data}    IN    @{data_list['Specific']}
        Scroll Element Into View    ${LOCATOR_HEADER_SPECIFIC}
        Click Element    ${LOCATOR_HEADER_SPECIFIC}//button[text()="${data_list['Specific']['${data}']['inc_exc']}"]
        FOR    ${data_value}    IN    @{data_list['Specific']['${data}']}
            Log To Console    ${data_list['Specific']['${data}']['inc_exc']} | group_name: ${data_list['Specific']['${data}']['group_name']} | input_value: ${data_list['Specific']['${data}']['field_label']} value: ${data_list['Specific']['${data}']['value']} and_or: ${data_list['Specific']['${data}']['and_or']} lavel: ${data_list['Specific']['${data}']['level']}
            IF    '${data_list['Specific']['${data}']['inc_exc']}' == 'INC'
                Click Specific Group Control Value    ${index_inc}    ${data_list['Specific']['${data}']}
                ${index_inc}=    Evaluate    ${index_inc}+1
            ELSE
                Click Specific Group Control Value    ${index_exc}    ${data_list['Specific']['${data}']}
                ${index_exc}=    Evaluate    ${index_exc}+1
            END
        END
    END
Click Common Exclude Group Control Value
    [Arguments]    ${element_type}    ${group_name}    ${field_label}
    Scroll Element Into View    //*[*[text()="${group_name}"]]
    IF    '${element_type}' in 'checkbox,radio'
        Click Element   //*[*[text()="${group_name}"]]//*[*[text()="${field_label}"]]//input
    ELSE IF    '${element_type}' == 'text'
        Input Text    //input[@name="${group_name}"]    ${field_label}
    ELSE IF    '${element_type}' == 'dropdown'
        Input Text    //*[*[text()="${group_name}"]]//input    ${field_label}
        Press Keys    //*[*[text()="${group_name}"]]//input    DOWN    ENTER
    ELSE IF    '${element_type}' == 'multi_dropdown'
        Click Element    //*[*[text()="${group_name}"]]//div[@role="combobox" and @aria-expanded="false"]
        Press Keys   //ul[@role="listbox"]//*[*[*[text()="${field_label}"]]]//input[@type="checkbox"]    TAB
    ELSE IF    '${element_type}' == listbox
        Click Element   //*[*[text()="${group_name}"]]//*[*[*[text()="${field_label}"]]]//input
        Click Element   //*[*[text()="${group_name}"]]//button[@aria-label="move selected right"]
    END
Click Specific Group Control Value
    [Arguments]    ${index}    ${data}
    Click Element    ${LOCATOR_HEADER_SPECIFIC}//*[*[text()="Add Condition"]]//*[@data-testid="AddCircleIcon"]
    ${condition_index}=    Set Variable    ${LOCATOR_HEADER_SPECIFIC}//div[@class="MuiBox-root css-1ixnamp"][${index}]
    ##Group Name
    Click Element    ${condition_index}//*[*[text()="Data"]]//*[@role="combobox"]
    Click Element    //ul[@role="listbox"]//li[text()="${data['group_name']}"]
    ##Data Detail
    Click Element    ${condition_index}//*[*[text()="Data Detail"]]//*[@role="combobox"]
    Click Element    //ul[@role="listbox"]//li[text()="${data['field_label']}"]
    ##Condition
    Click Element    ${condition_index}//*[*[text()="Condition"]]//*[@role="combobox"]
    Click Element    //ul[@role="listbox"]//li[text()="${data['condition']}"]
    ##value
    IF    '${data['condition']}' in 'BETWEEN,NOT BETWEEN'
        ${field_value}=    Split String    ${data['value']}    ,
        Input Text   ${condition_index}//input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall css-1n4twyu-MuiInputBase-input-MuiOutlinedInput-input"][1]    ${field_value[0]}
        Input Text   ${condition_index}//input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall css-1n4twyu-MuiInputBase-input-MuiOutlinedInput-input"][2]    ${field_value[1]}
    ELSE
        Input Text   ${condition_index}//input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall css-1n4twyu-MuiInputBase-input-MuiOutlinedInput-input"]    ${data['value']}
    END
    IF    ${index} > 1
        ##Level Condition
        Run Keyword If    '${data['level']}' == '1'    Click Element    ${condition_index}//button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary css-11yeauu-MuiButtonBase-root-MuiButton-root"]
        ##And/Or Condition
        Run Keyword If    '${data['and_or']}' != 'None'    Click Element    ${condition_index}//input[@type="radio" and @value="${data['and_or']}"]
    END

Get List From Yaml
    [Arguments]    ${data_list}    ${profile_name}
    ##Common,Exclude
    ${list_group_name}=    Set Variable    ''
    ${list_label}=    Set Variable    ''
    FOR    ${data}    IN    @{data_list}
        ${list_group_name}=    Evaluate    "${list_group_name}, '${data_list['${data}']['group_name']}'"
        FOR    ${label}    IN    @{data_list['${data}']['value']}
            IF    '${data_list['${data}']['group_type']}' == 'text'
                ${list_label}=    Evaluate    "${list_label}, '${data_list['${data}']['field_label']}'"
            ELSE
                ${list_label}=    Evaluate    "${list_label}, '${data_list['${data}']['value']['${label}']}'"
            END
        END
    END
    Log To Console    ${list_group_name}
    Log To Console    ${list_label}
    ${results_list}=    Get Control From DB Common/Exclude    ${list_group_name}    ${list_label}    Exclude    ${data_list}    ${profile_name}
    Return From Keyword    ${results_list}
    
Get Control From DB Common/Exclude
    [Arguments]    ${list_group_name}    ${list_label}    ${Process}    ${data_list}     ${profile_name}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    IF    '${Process}' == 'Common'
        ${select}=    Set Variable    select group_name,group_type,schema_name||'.'||table_name||'.'||field_name as table,field_label,field_value,is_checked,is_null
        ${from_join}=    Set Variable    from slg.mst_group_common g join slg.mst_group_common_detail d on g.group_id = d.group_id
        ${condition}=    Set Variable    where g.profile_name = '${profile_name}' and g.is_active = true and d.is_active = true and g.group_name in (${list_group_name}) and d.field_label in (${list_label}) or d.is_checked = true
        ${order_by}=    Set Variable   order by group_name,field_seq
        ${final_script}=    Set Variable    ${select} ${from_join} ${condition} ${order_by}
    ELSE IF    '${Process}' == 'Exclude'
        ${script_1}=    Set Variable    select group_name,group_type,schema_name||'.'||table_name||'.'||field_name as table,field_label,field_value_yes as field_value,is_checked,is_null from slg.mst_group_exclude g join slg.mst_group_exclude_detail d on g.group_id = d.group_id where g.profile_name = '${profile_name}' and g.is_active = true and d.is_active = true and d.field_label in (${list_label})
        ${script_2}=    Set Variable    select group_name,group_type,schema_name||'.'||table_name||'.'||field_name as table,field_label,case when is_checked = true then field_value_yes else field_value_no end as field_value,is_checked,is_null from slg.mst_group_exclude g join slg.mst_group_exclude_detail d on g.group_id = d.group_id where g.profile_name = '${profile_name}' and g.is_active = true and d.is_active = true and d.field_label not in (${list_label})
        ${condition}=    Set Variable    UNION      
        ${final_script}=    Set Variable    ${script_1} ${condition} ${script_2}
    END
    ${queryResults} =    Query    ${final_script}
    ${results_list}=    Create List
    ${index}=    Set Variable    1
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        IF    '${element[1]}' == 'text'
            FOR    ${data}    IN    @{data_list}
                IF    '${data_list['${data}']['group_name']}' == '${element[0]}'
                    ${dict}=    Create Dictionary    group_name=${element[0]}    group_type=${element[1]}    table=${element[2]}    field_label=${element[3]}    field_value=${data_list['${data}']['value']['field_value_1']}    is_checked=${element[5]}    is_null=${element[6]}      
                    Log To Console    ${data_list['${data}']['value']['field_value_1']}
                END
            END
        ELSE
            ${dict}=    Create Dictionary    group_name=${element[0]}    group_type=${element[1]}    table=${element[2]}    field_label=${element[3]}    field_value=${element[4]}    is_checked=${element[5]}    is_null=${element[6]}
        END
        ${dict_entry}=    Create Dictionary    ${index}=${dict}
        Append To List    ${results_list}    ${dict_entry}
        ${index}=    Evaluate    ${index}+1
    END
    Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}

Genarate Script Common/Exclude
    [Arguments]    ${results_list}
    ${header_list}=    Create List
    ${list_script}=    Create List
    FOR    ${element}    IN    @{results_list}
        ${keys}=    Get Dictionary Keys    ${element}
        ${first_key}=    Get From List    ${keys}    0
        ${value}=    Get From Dictionary    ${element}    ${first_key}
        ${header}=    Set Variable    ${value['table']}
        ${count_round}=    Set Variable    0
        ${check_isnull}=    Set Variable    0
        IF    '${value['table']}' not in ${header_list}
            FOR    ${element_lavel2}    IN    @{results_list} 
                ${keys_lavel2}=    Get Dictionary Keys    ${element_lavel2}
                ${first_key_lavel2}=    Get From List    ${keys_lavel2}    0
                ${value_lavel2}=    Get From Dictionary    ${element_lavel2}    ${first_key_lavel2}
                IF    '${value_lavel2['table']}' == '${header}'
                    IF    ${count_round} == 0 
                        ${script_condition}=    Set Variable    '${value_lavel2['field_value']}'
                        ${operator}=    Set Variable    =
                        ${count_round}=    Evaluate    ${count_round}+1
                    ELSE IF    ${count_round} > 0 
                        ${script_condition}=    Evaluate    "${script_condition}, '${value_lavel2['field_value']}'"
                        ${operator}=    Set Variable    IN
                        ${count_round}=    Evaluate    ${count_round}+1
                    END
                    IF    '${value_lavel2['is_null']}' == 'True'
                        IF    ${check_isnull} == 0
                            ${check_isnull}=    Set Variable    1
                            ${collease}=    Set Variable    ${value_lavel2['field_value']}
                        END
                    END
                END
            END
            IF    ${count_round} > 1
                IF    ${check_isnull} == 1
                    Append To List    ${list_script}    COALESCE(${value['table']},'${collease}') ${operator} (${script_condition})
                ELSE
                    Append To List    ${list_script}    ${value['table']} ${operator} (${script_condition})
                END
            ELSE
                IF    ${check_isnull} == 1
                    Append To List    ${list_script}    COALESCE(${value['table']},'${collease}') ${operator} ${script_condition}
                ELSE
                    Append To List    ${list_script}    ${value['table']} ${operator} ${script_condition}
                END
            END
        END
        Append To List    ${header_list}    ${value['table']}
    END
    Log To Console    ${list_script}

Get Control From DB Specific
    [Arguments]    ${list_group_name}    ${list_label}    ${data_list}     ${profile_name}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${select}=    Set Variable    select group_name,group_desc,schema_name||'.'||table_name||'.'||field_name as table,field_label,field_type_source,is_field_type_change
    ${from_join}=    Set Variable    from slg.mst_group_specific g join slg.mst_group_specific_detail d on g.group_id = d.group_id
    ${condition}=    Set Variable    where g.profile_name = '${profile_name}' and g.is_active = true and d.is_active = true and g.group_name in (${list_group_name}) and d.field_label in (${list_label})
    ${order_by}=    Set Variable   order by group_name,field_seq
    ${final_script}=    Set Variable    ${select} ${from_join} ${condition} ${order_by}
    ${queryResults} =    Query    ${final_script}
    ${results_list}=    Create List
    ${index}=    Set Variable    1
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        FOR    ${data}    IN    @{data_list}
            IF    '${data_list['${data}']['group_name']}' == '${element[0]}'
                IF    '${data_list['${data}']['field_label']}' == '${element[3]}'
                    ${dict}=    Create Dictionary    group_name=${element[0]}    group_type=${element[1]}    table=${element[2]}    field_label=${element[3]}    field_value=${data_list['${data}']['value']}    field_type_source=${element[4]}    is_field_type_change=${element[5]}    inc_exc=${data_list['${data}']['inc_exc']}    and_or=${data_list['${data}']['and_or']}    condition=${data_list['${data}']['condition']}    level=${data_list['${data}']['level']}   
                END
            END
        END
        ${dict_entry}=    Create Dictionary    ${index}=${dict}
        Append To List    ${results_list}    ${dict_entry}
        ${index}=    Evaluate    ${index}+1
    END
    Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}

Genarate Script Specific
    [Arguments]    ${results_list}
    ${list_script}=    Create List
    FOR    ${element}    IN    @{results_list}
        ${keys}=    Get Dictionary Keys    ${element}
        ${first_key}=    Get From List    ${keys}    0
        ${value}=    Get From Dictionary    ${element}    ${first_key}
        ##field_type_change
        ${field_type_change}=    Set Variable
        IF    '${value['is_field_type_change']}' == 'True'
            ${field_type_change}=    Set Variable    ::${value['field_type_source']}
        END
        ##value
        ${value_condition}=    Set Variable
        IF    '${value['condition']}' == 'IN'
            ${text_split}=    Split String    ${value['field_value']}    ,
            ${length}=    Set Variable    0
            ${field_value}=    Set Variable
            FOR    ${text}    IN    @{text_split}
                IF    ${length} == 0
                    ${field_value}=    Set Variable    '${text}'
                    ${length}=    Evaluate    ${length}+1
                ELSE
                    ${field_value}=    Evaluate   "${field_value}, '${text}'"
                END
            END
            ${value_condition}=    Set Variable    ${value['condition']} (${field_value})
        ELSE IF    '${value['condition']}' in 'LIKE,NOT LIKE,ILIKE'
            ${value_condition}=    Set Variable    ${value['condition']} %'${value['field_value']}'%
        ELSE IF    '${value['condition']}' in 'IS NULL,IS NOT NULL'
                ${value_condition}=    Set Variable    ${value['condition']}
        ELSE IF    '${value['condition']}' in 'BETWEEN,NOT BETWEEN'
            ${field_value}=    Split String    ${value['field_value']}    ,
            ${value_condition}=    Set Variable    ${value['condition']} '${field_value[0]}' AND '${field_value[1]}'
        ELSE
            ${value_condition}=    Set Variable    ${value['condition']} '${value['field_value']}'
        END
        IF    '${value['inc_exc']}' == 'EXC'
            # ${table_split}=    Split String    ${value['table']}    .
            # IF    '${table_split[0]}.${table_split[1]}' not in '${header_llist}'
            #     IF    ${count} == 0
            #         ${condition}=    ${value['table']} ${value_condition}${field_type_change})
            #     ELSE
            #         ${condition}=    Evaluate    ${condition} ${value['and_or']} ${value_condition}${field_type_change})
            #     END
            #     ##PROD_KEY NOT IN (SELECT PROD_KEY FROM SLG.CUSTOMER_USAGE WHERE SLG.CUSTOMER_USAGE.LAST_BUY_OC_DATE < '09/02/2024')
            # END
            Log To Console    ${value['table']} ${value_condition}${field_type_change}
        ELSE
            Log To Console    ${value['and_or']} ${value['table']} ${value_condition}${field_type_change}
        END
    END
    # Log To Console    ${list_script}

Get List From Yaml Specific
    [Arguments]    ${data_list}    ${profile_name}
    ##Common,Exclude
    ${list_group_name}=    Set Variable    ''
    ${list_label}=    Set Variable    ''
    FOR    ${data}    IN    @{data_list}
        ${list_group_name}=    Evaluate    "${list_group_name}, '${data_list['${data}']['group_name']}'"
        ${list_label}=    Evaluate    "${list_label}, '${data_list['${data}']['field_label']}'"
    END
    Log To Console    ${list_group_name}
    Log To Console    ${list_label}
    ${results_list}=    Get Control From DB Specific    ${list_group_name}    ${list_label}    ${data_list}    ${profile_name}
    Genarate Script Specific    ${results_list}