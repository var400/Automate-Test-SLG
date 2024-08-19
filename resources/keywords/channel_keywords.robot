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


# Auto Change Data Edit Page
#     [Arguments]    ${data}   ${choose_key_text}    ${choose_key_select_option}    ${choose_key_check_box}
#     Change Text Data Edit Page    ${data}    ${choose_key_text}
#     Change Select Option Data Edit Page    ${data}    ${choose_key_select_option}
#     Change Check Box Data Edit Page    ${data}    ${choose_key_check_box}
#     Sleep    5s


# Change Text Data Edit Page
#     [Arguments]    ${data}   ${choose_key_text}
#     FOR    ${key}    ${value}    IN    &{data}
#         IF    '${key}' in '${choose_key_text}'
#             Wait Until Keyword Succeeds   5x    2s    Scroll Element Into View    name=${key}
#             ${tag_name}=    Check Element Type    name=${key}
#             IF    '${tag_name}' == 'TEXTAREA'
#                 ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status    Textarea Value Should Be   name=${key}    ${value}
#                 IF    '${data_has_change}' == 'False'
#                     Wait Until Keyword Succeeds   5x    2s    Input Text    name=${key}    ${value}
#                 END
#             ELSE IF    '${tag_name}' == 'INPUT'
#                 ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status    Textfield Value Should Be   name=${key}    ${value}
#                 IF    '${data_has_change}' == 'False'
#                     Wait Until Keyword Succeeds   5x    2s     Input Text    name=${key}    ${value}
#                 END
#             END
#         END
#     END

# Change Select Option Data Edit Page
#     [Arguments]    ${data}   ${choose_key_select_option}
#     FOR    ${key}    ${value}    IN    &{data}
#         IF    '${key}' in '${choose_key_select_option}'
#             Wait Until Keyword Succeeds   5x    2s    Scroll Element Into View    name=${key}
#             ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status     Textfield Value Should Be   name=${key}    ${value}
#             IF    '${data_has_change}' == 'False'
#                 Scroll Element Into View    //div[@id="mui-component-select-${key}"]
#                 Click Element    //div[@id="mui-component-select-${key}"]
#                 Wait Until Element Is Visible    //li[@data-value="${value}"]    timeout=5s
#                 Wait Until Keyword Succeeds   5x    2s    Click Element    //li[@data-value="${value}"]
#             END
#         END
#     END

# Change Check Box Data Edit Page
#     [Arguments]    ${data}   ${choose_key_check_box}
#     FOR    ${key}    ${value}    IN    &{data}
#         IF    '${key}' in '${choose_key_check_box}'
#             Wait Until Keyword Succeeds   5x    2s    Scroll Element Into View    name=${key}
#             ${data_has_change}=    Wait Until Keyword Succeeds   5x    2s    Run Keyword And Return Status    Textfield Value Should Be   name=${key}    ${value}
#             IF    '${data_has_change}' == 'False'
#                 Wait Until Keyword Succeeds   5x    2s    Check Status Change Data Check Box   name=${key}    ${value}
#             END
#         END
#     END

# Check Status Change Data Check Box   #Work With Input Check Box Data 
#     [Arguments]    ${option_locator}    ${option_value}
#     Scroll Element Into View    ${option_locator}
#     Run Keyword If    '${option_value}' == 'true'    Select Checkbox    ${option_locator}
#     Run Keyword If    '${option_value}' == 'false'   Unselect Checkbox    ${option_locator}
