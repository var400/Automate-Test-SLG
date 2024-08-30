*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    XML
Resource   ../../resources/keywords/global_keywords.robot
Resource   ../../resources/locators/specific_locators.robot


*** Keywords ***
Check Output On Create Critiria Page
    [Arguments]    ${data_list}
    Scroll Element Into View    ${LOCATOR_HEADER}
    Click Element    ${LOCATOR_HEADER}//*[*[text()="Add Condition"]]//*[@data-testid="AddCircleIcon"]
    Click Element    //*[*[text()="Data"]]//*[@role="combobox"]
    Log To Console    Items Should Be Variables: ${data_list['group_name']}
    IF    '${data_list['is_active']}' == 'true'
        SeleniumLibrary.Element Text Should Be    //ul[@role="listbox"]//li[text()="${data_list['group_name']}"]   ${data_list['group_name']}
        Sleep    2s
        Click Element    //ul[@role="listbox"]//li[text()="${data_list['group_name']}"]
        FOR    ${data}    IN    @{data_list['group_details']}
            Log To Console    Items Detail Should Be Variables: ${data_list['group_details']['${data}']['field_label']}
            Click Element    //*[*[text()="Data Detail"]]//*[@role="combobox"]
            IF    '${data_list['group_details']['${data}']['is_active']}' == 'true'
                SeleniumLibrary.Element Text Should Be    //ul[@role="listbox"]//li[text()="${data_list['group_details']['${data}']['field_label']}"]    ${data_list['group_details']['${data}']['field_label']}
                Click Element    //ul[@role="listbox"]//li[text()="${data_list['group_details']['${data}']['field_label']}"]
                Click Element    //*[*[text()="Condition"]]//*[@role="combobox"]
                ###CHECK INPUT TYPE
                Element Attribute Value Should Be    ${LOCATOR_HEADER}${INPUT_BOX}   type    ${data_list['group_details']['${data}']['field_type']}
                ##ADD CHECK operator
                ${operator_Web}=    Get Operator From WEB
                ${operator_DB}=    Get Operator From DB    ${data_list['group_details']['${data}']['field_type']}
                ${index}=    Set Variable    0
                FOR    ${element}    IN    @{operator_DB}
                    Log To Console    INDEX ${index}: DB Result: ${operator_DB[${index}]} | Web Result: ${operator_Web[${index}]}    no_newline=false
                    Run Keyword If    '${operator_DB[${index}]}' == '${operator_Web[${index}]}'    Log    operator is true
                    Run Keyword If    '${operator_DB[${index}]}' != '${operator_Web[${index}]}'    Fail    operator is not true
                    ${index}=    Evaluate    ${index}+1
                END
                Click Element    //ul[@role="listbox"]//li[text()=">"]
            ELSE
                SeleniumLibrary.Element Text Should Not Be    //ul[@role="listbox"]//li[text()="${data_list['group_details']['${data}']['field_label']}"]   ${data_list['group_details']['${data}']['field_label']}
            END
            Sleep    2s
        END
    ELSE
        SeleniumLibrary.Element Text Should Not Be    //ul[@role="listbox"]//li[text()="${data_list['group_name']}"]   ${data_list['group_name']}
    END



Get Operator From DB
    [Arguments]    ${operator}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    select type_value from slg.mst_condition_type where type_name='${operator}' order by type_seq
    ${results_list}=    Create List
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        Append To List    ${results_list}    ${element[0]}
    END
    # Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}

Get Group Control From DB SEQ
    [Arguments]    ${profile_name}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    select group_name from slg.mst_group_specific where is_active='true' and profile_name='${profile_name}' order by profile_name,group_seq;
    ${results_list}=    Create List
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        Append To List    ${results_list}    ${element[0]}
    END
    # Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}

Get Group Control Detail From DB
    [Arguments]     ${group_name}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    select field_label from slg.mst_group_specific join slg.mst_group_specific_detail on slg.mst_group_specific.group_id = slg.mst_group_specific_detail.group_id where slg.mst_group_specific.group_name = '${group_name}' and slg.mst_group_specific_detail.is_active='true' order by field_seq;
    ${results_list}=    Create List
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        Append To List    ${results_list}    ${element[0]}
    END
    # Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}
    
Get Operator From WEB
    Scroll Element Into View    ${LOCATOR_HEADER}
    ${elements}=    Get WebElements    //ul[@role="listbox"]//li
    ${elements_list}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        ${text_split}=    Split String    ${text}    \n
        ${joined_values}=    Set Variable    ${text_split[0]}
        Append To List    ${elements_list}    ${joined_values}
    END
    # Log To Console    Check Seq From Web ${elements_list}
    Return From Keyword    ${elements_list}


Check SEQ List DB
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    select group_seq,profile_name,group_name from slg.mst_group_specific where is_active='true' order by profile_name,group_seq;
    ${results_list}=    Create List
    Disconnect From Database
    FOR    ${element}    IN    @{queryResults}
        Append To List    ${results_list}    ${element}
    END
    # Log To Console    Results List: ${results_list}
    Return From Keyword    ${results_list}

Check SEQ List DB Group Detail
    [Arguments]    ${group_name}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    select field_seq,field_label from slg.mst_group_specific join slg.mst_group_specific_detail on slg.mst_group_specific.group_id  = slg.mst_group_specific_detail.group_id and group_name = '${group_name}' order by field_seq;
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

Check SEQ List WEB VS BASE Create Criteria
    [Arguments]    ${results_base}    ${results_web}
    ${index}=    Set Variable    0
    ${seq}=    Set Variable    1
    FOR    ${row}    IN    @{results_base}
        Log To Console    INDEX ${seq}: Base Result: ${results_base[${index}]} | Web Result: ${results_web[${index}]}    no_newline=false
        Run Keyword If    '${results_base[${index}]}' == '${results_web[${index}]}'    Log    Seq Is True
        Run Keyword If    '${results_base[${index}]}' != '${results_web[${index}]}'    Fail    Seq Is Not True
        ${index}=    Evaluate    ${index}+1
        ${seq}=    Evaluate    ${seq}+1
    END
Auto Check Seq Group List
    ${seq_Db}=    Check SEQ List DB
    ${seq_Web}=    Check Seq From Web List
    Check SEQ List WEB VS BASE    ${seq_Db}    ${seq_Web}
Auto Check Seq Group Detail
    [Arguments]    ${data}
    ${seq_Db}=    Check SEQ List DB Group Detail    ${data['group_name']}
    ${seq_Web}=    Check Seq From Web List Group Detail 
    Check SEQ List WEB VS BASE    ${seq_Db}    ${seq_Web}

Auto Check Seq On Create Criteria
    [Arguments]    ${data}
    Scroll Element Into View    ${LOCATOR_HEADER}
    Click Element    ${LOCATOR_HEADER}//*[*[text()="Add Condition"]]//*[@data-testid="AddCircleIcon"]
    Click Element    //*[*[text()="Data"]]//*[@role="combobox"]
    ##CHECK GROUP CONTROL
    ${seq_Web}=    Get Operator From WEB
    ${seq_Db}=    Get Group Control From DB SEQ    ${data['profile_name']}
    Check SEQ List WEB VS BASE Create Criteria    ${seq_Db}    ${seq_Web}
    Click Element    //ul[@role="listbox"]//li[text()="${data['group_name']}"]
    ##CHECK GROUP DETAIL
    Click Element    //*[*[text()="Data Detail"]]//*[@role="combobox"]
    ${seq_Web}=    Get Operator From WEB
    ${seq_Db}=    Get Group Control Detail From DB    ${data['group_name']}
    Check SEQ List WEB VS BASE Create Criteria    ${seq_Db}    ${seq_Web}
    Get Operator From WEB