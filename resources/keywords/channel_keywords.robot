*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/locators/channel_locators.robot

*** Keywords ***
Open Browser To URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    5s

Click Button Add
    Click Element   ${Button_Add_ConfigurationGroup}
    Sleep    1s

Click Dropdown And Select Option
    [Arguments]    ${dropdown_locator}    ${option_value}
    Click Element    ${dropdown_locator}
    Wait Until Element Is Visible    //li[@data-value="${option_value}"]    timeout=5s
    Click Element    //li[@data-value="${option_value}"]

CHECK IS ACTIVE
    [Arguments]    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${CHECK_IS_ACTIVE}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${CHECK_IS_ACTIVE}

CHECK IS HEADER
    [Arguments]    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${CHECK_IS_HEADER}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${CHECK_IS_HEADER}

CHECK IS TEOHONG
    [Arguments]    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${CHECK_IS_TEOHONG}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${CHECK_IS_TEOHONG}

Click Button Save
    Click Button    ${SAVE_BUTTON}
    Sleep    1s

Click Button Cancel
    Click Button    ${CANCEL_BUTTON}
    Sleep    5s 

Alert Message Success
    [Arguments]    ${expected_result}
    Wait Until Element Is Visible    ${ALERT_MESSAGE_SUCCESS}    timeout=10s
    Element Text Should Be    ${ALERT_MESSAGE_SUCCESS}    ${expected_result}

Alert Message Error
    [Arguments]    ${expected_result}
    Wait Until Element Is Visible    ${ALERT_MESSAGE_ERROR}    timeout=10s
    Element Text Should Be    ${ALERT_MESSAGE_ERROR}    ${expected_result}
    
Input Data
    [Arguments]     ${data} 
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_NAME}      ${data['channel_name']}
    Click Dropdown And Select Option        ${CLICK_DROPDOWN_CHANNEL_FILE_TYPE}    ${data['channel_file_type']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_DELIMITER}      ${data['channel_file_delimiter']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_LABEL}      ${data['channel_label']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_FILE_NAME_FORMAT}    ${data['channel_file_name_format']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_FORMAT}    ${data['channel_format']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_TEMP_PATH}    ${data['channel_temp_path']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_TARGET_PATH}    ${data['channel_target_path']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_HOST}    ${data['channel_host']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_USER}    ${data['channel_user']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_PASS}    ${data['channel_pass']}
    INPUT TEXT      ${INPUT_TEXT_BOX_CHANNEL_PORT}    ${data['channel_port']}
    #IS_ACTIVE
    CHECK IS ACTIVE    ${data['is_active']}
    #IS_HEADER
    CHECK IS HEADER    ${data['is_header']}
    #IS_TEOHONG
    CHECK IS TEOHONG    ${data['is_teohong']}
    Sleep    5s 