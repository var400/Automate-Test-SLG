*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/keywords/global_keywords.robot
Resource   ../../resources/locators/channel_locators.robot

*** Keywords ***
CHECK IS HEADER
    [Arguments]    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${LOCATOR_CHECK_IS_HEADER}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${LOCATOR_CHECK_IS_HEADER}

CHECK IS TEOHONG
    [Arguments]    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${LOCATOR_CHECK_IS_TEOHONG}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${LOCATOR_CHECK_IS_TEOHONG}

CHECK IS ACTIVE
    [Arguments]    ${option_value}
    Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${LOCATOR_CHECK_IS_ACTIVE}
    Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${LOCATOR_CHECK_IS_ACTIVE}

Click Dropdown And Select Option
    [Arguments]    ${dropdown_locator}    ${option_value}
    Click Element    ${dropdown_locator}
    Wait Until Element Is Visible    //li[@data-value="${option_value}"]    timeout=5s
    Click Element    //li[@data-value="${option_value}"]


Input Data
    [Arguments]     ${data} 
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_NAME}      ${data.channel_name}
    Click Dropdown And Select Option        ${LOCATOR_CLICK_DROPDOWN_CHANNEL_FILE_TYPE}    ${data.channel_file_type}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_DELIMITER}      ${data.channel_delimiter}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_LABEL}      ${data.channel_label}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_FILE_NAME_FORMAT}    ${data.channel_file_name_format}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_FORMAT}    ${data.channel_format}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_TEMP_PATH}    ${data.channel_temp_path}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_TARGET_PATH}    ${data.channel_target_path}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_HOST}    ${data.channel_host}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_USER}    ${data.channel_user}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_PASS}    ${data.channel_pass}
    Wait Until Keyword Succeeds   5x    5s     INPUT TEXT      ${LOCATOR_INPUT_TEXT_BOX_CHANNEL_PORT}    ${data.channel_port}
    #IS_ACTIVE
    Wait Until Keyword Succeeds   5x    5s     CHECK IS ACTIVE    ${data.is_active}
    #IS_HEADER
    Wait Until Keyword Succeeds   5x    5s     CHECK IS HEADER    ${data.is_header}
    #IS_TEOHONG
    Wait Until Keyword Succeeds   5x    5s     CHECK IS TEOHONG    ${data.is_teohong}
    Sleep    5s 


Check Output On Screen Create Criteria For Output Templete
    [Arguments]    ${channel_label_name}    ${channel_is_active}    ${channel_is_teohong}
    ${LOCATOR_HEADER}=    Set Variable    //*[*[*[*[h5[(.='Campaign Detail')]]]]]
    ${LOCATOR_TITLE}=    Set Variable    //*[*[text()="Output Template"]]
    IF    '${channel_is_active}' == 'true'
        IF    '${channel_is_teohong}' == 'true'
            Wait Until Keyword Succeeds   5x    5s    Click Element    //div[@id="mui-component-select-OutputTemplate"]
            Wait Until Keyword Succeeds   5x    5s    Element Should Not Be Visible    //li[(.='${channel_label_name}')]
        ELSE IF    '${channel_is_teohong}' == 'false'
            Wait Until Keyword Succeeds   5x    5s    Click Element    //div[@id="mui-component-select-OutputTemplate"]
            Wait Until Keyword Succeeds   5x    5s    Element Text Should Be    //li[(.='${channel_label_name}')]    ${channel_label_name}
        END
    ELSE IF  '${channel_is_active}' == 'false'
        Wait Until Keyword Succeeds   5x    5s    Element Should Not Be Visible    //li[(.='${channel_label_name}')]
    END