*** Settings ***
Library    SeleniumLibrary
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

Check List Data Dupplicate
    [Arguments]    ${data_id}    ${data}    ${choose_key_text}    ${choose_key_boolean}
    Check List Text Data    ${data_id}      ${data}     ${choose_key_text}
    Check List Status Data      ${data_id}      ${data}     ${choose_key_boolean}

    # IF    '${data['is_active']}' == 'true'
    #     Check List Data Is Visible    ${data_id}
    #     Check List Text Data    ${data_id}      ${data}     ${choose_key_text}
    #     Check List Status Data      ${data_id}      ${data}     ${choose_key_boolean}
    # ELSE IF    '${data['is_active']}' == 'false'
    #     Check List Data Is Not Visible    ${data_id}
	# 	Click Show Status    any
    #     Check List Text Data    ${data_id}      ${data}     ${choose_key_text}
    #     Check List Status Data      ${data_id}      ${data}     ${choose_key_boolean}
    # END
    # Scroll Page    left    500
    
# Click Edit Button Group Detail
#     [Arguments]    ${key}
#     Click Element    //div[@data-id="${key}"]//div[@data-field="Detail"]

# Click Delete Button Group Detail
#     [Arguments]    ${key}
#     Click Element    //div[@data-id="${key}"]//div[@data-field="Delete"]

# Click Dupplicate Button Group Detail
#     [Arguments]    ${key}
#     Click Element    //div[@data-id="${key}"]//div[@data-field="Dupplicate"]


# Click Edit Button Group Detail From Copy Data
#     [Arguments]    ${index_key}
#     Click Element    //div[@data-rowindex="${index_key}"]//div[@data-field="Detail"]