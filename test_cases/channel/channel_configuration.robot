*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot

*** Test Cases ***
Test Keyword
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    # ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_DATA['condition']}
    # Click Edit Botton    ${CHANNEL_ID}
    Click Button Back
    # Auto Check Text Data Edit Page    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}


TC_001
    [Documentation]    add new channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_001_DATA.result.expected_result}
    Click Button Back
    # ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_DATA['condition']}
    # Auto Check List Data   ${CHANNEL_ID}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    # Click Edit Botton    ${CHANNEL_ID}
    # Auto Check Text Data Edit Page    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    # # Auto Update Data    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    # Close Browser

TC_002
    [Documentation]    add new channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_002_DATA['condition']}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Update Data    ${TC_002_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_002_DATA.result.expected_result}
    Click Button Back
    Auto Check List Data   ${CHANNEL_ID}    ${TC_002_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Close Browser

TC_003
    [Documentation]    add dupplicate channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_003_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_003_DATA.result.expected_result}
    # Click Button Back
    # Auto Update Data    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Close Browser
# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot

TC_004
    [Documentation]    Delete Item
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_004_DATA['condition']}
    Click Delete Botton    ${CHANNEL_ID}
    Alert Popup Message    Do you want to delete item ?
    # Click Button    ${LOCATOR_DENY_BUTTON_DELETE}
    Click Button    ${LOCATOR_ACCEPT_BUTTON_DELETE}
    Alert Popup Message    Deleted.
    Check List Data Is Not Visible    ${CHANNEL_ID}
    # Do you want to delete item ?

TC_005
    [Documentation]
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    # Element Text Should Be    xpath=//div[.//input[@name="channel_file_type"]]/following-sibling::div//p    This value cannot be null.
    Check Validate Edit Page    ${TC_005_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    This value cannot be null.
    # Check Text Alert Validate    channel_name    This value cannot be null.
    Close Browser

*** Keywords ***
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
    