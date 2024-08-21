*** Settings ***
Library    SeleniumLibrary
Library    Keyboard
Resource   ../../resources/keywords/global_keywords.robot
Resource   ../../resources/locators/common_locators.robot


*** Keywords ***
Click Button Add Detail
    Scroll Element Into View     //*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1hk7bbc-MuiSvgIcon-root" and @data-testid="AddCircleIcon"]
    Click Element    //*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-1hk7bbc-MuiSvgIcon-root" and @data-testid="AddCircleIcon"]

Auto Insert Data Detail
    [Arguments]    ${data}    ${text_choose_key}    ${check_box_choose_key}    ${select_option_choose_key}
    Input Text Data Detail   ${data}    ${text_choose_key}
    Input Check Box Data Detail    ${data}    ${check_box_choose_key}
    Input Select Option Data Detail    ${data}    ${select_option_choose_key}

Input Auto Complete Detail
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        IF    '${key}' in '${choose_key}'
            ${title}=    Mapping Key Title Name    ${key}
            # Input Text    //div[@class="MuiDialogContent-root MuiDialogContent-dividers css-1t4vnk2-MuiDialogContent-root"]//div[div[text()="${title}"]]//input    ${value}
            Press Keys    //div[@class="MuiDialogContent-root MuiDialogContent-dividers css-1t4vnk2-MuiDialogContent-root"]//div[div[text()="${title}"]]//input    ${value}    ENTER
            Log To Console    ${title}
            Sleep    2s
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


Input Text Data Detail
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Scroll Element Into View    name=${key}
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT   name=${key}    ${value}
    END

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

Input Select Option Data Detail
    [Arguments]    ${data}    ${choose_key}
    FOR    ${key}    ${value}    IN    &{data}
        Run Keyword If    '${key}' in '${choose_key}'    Scroll Element Into View    //div[@id="mui-component-select-${key}"]
        Run Keyword If    '${key}' in '${choose_key}'    Click Element    //div[@id="mui-component-select-${key}"]
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Element Is Visible    //li[@data-value="${value}"]    timeout=5s
        Run Keyword If    '${key}' in '${choose_key}'    Wait Until Keyword Succeeds   5x    5s    Click Element    //li[@data-value="${value}"]
    END
    
Click Button Save Detail
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_SAVE_BUTTON}
    Click Button    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_SAVE_BUTTON}
    Sleep    1s

Click Button Close Detail
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_CLOSE_BUTTON}
    Click Button    ${LOCATOR_SUB_WINDOWS_DETAIL}${LOCATOR_CLOSE_BUTTON}
    Sleep    5s 
    