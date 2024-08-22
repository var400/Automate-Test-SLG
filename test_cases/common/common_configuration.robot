*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/common_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/common_variables.robot
Resource    ../channel/test_scholl.robot

*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}

Test Variable 
    Log To Console    ${TC_001_DATA['group_details']['DATA_1']}

Test Keyword
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}     ${BASE_BROWSER}
    # Click Button Add
    # Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    # Click Button Add Detail
    # Auto Insert Data Detail    ${TC_001_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
    # Click Button Save Detail
    # ${group_id}=    Get Data Id From Field    ${TC_001_DATA['group_details']['DATA_1']['field_label']}    field_label
    # Log To Console    ${group_id}
    # Auto Check List Data    ${group_id}    ${TC_001_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    # Click Button Save
    # Click Button Back
    # ${group_id}=    Get Data Id From Field    ${TC_001_DATA['group_name']}    group_name
    # Auto Check List Data    ${group_id}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    # Auto Check List Data    ${group_id}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    ###Add more detail
    # Click Button Add Detail
    # Auto Insert Data Detail    ${TC_001_DATA['group_details']['DATA_2']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
    # Click Button Save Detail

    ###Dupplcate
    ${new_group_id}=    Click Dupplicate Data From    ${TC_001_DATA['group_details']['DATA_1']}
    Auto Check List Data    ${new_group_id}    ${TC_001_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Click Edit Botton    ${new_group_id}
    Log To Console    ${new_group_id}
    Auto Check List Data    ${new_group_id}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check List Data    ${new_group_id}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}

    # Copy Group Detail    ${TC_001_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_COPPY_GROUP_DETAIL}
    # Auto Insert Data Detail    ${TC_001_DATA['group_details']['DATA_3']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
    # Click Button Save Detail
    # Click Button Close Detail
    # Sleep    5s
    # ${COMMON_CONFIG_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_DATA['condition']}
    # Click Edit Botton    ${COMMON_CONFIG_ID}
    # Click Button Back
    # Auto Check Text Data Edit Page    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}

Test Keyword Test Click Dupplicate
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    # Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Add Detail
    Auto Insert Data Detail    ${TC_001_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
    Click Button Save Detail
    ${new_group_id}=    Click Dupplicate Data From    ${TC_001_DATA['group_details']['DATA_1']}
    Click Edit Botton    ${new_group_id}
    Auto Check List Data    ${new_group_id}    ${TC_001_DATA['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    Auto Check Text Data Detail    ${TC_001_DATA['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_EDIT_PAGE_AUTO_COMPLETE}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}

Test Keyword Update Data
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    # Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Add Detail
    Auto Insert Data Detail    ${TC_001_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
    Click Button Save Detail
    ${group_id}=    Get Data Id From Field    ${TC_001_DATA['group_details']['DATA_1']['field_label']}    field_label
    Click Edit Botton    ${group_id}
    Auto Update Data Detail    ${TC_001_DATA['group_details']['Change_DATA_1']}    ${CHOOSE_KEY_EDIT_PAGE_AUTO_COMPLETE}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}

Test Keyword Validate
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Click Button Save    
    Check Validate Edit Page    ${TC_002_DATA}    ${CHOOSE_KEY_VALIDATE_DATA}    This value cannot be null.
    Click Button Add Detail
    Click Button Save Detail
    Check Validate Data Detail    ${TC_002_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_VALIDATE_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_AUTO_COMPLETE}    This value cannot be null.
    Sleep    5s
    
Test Key Word Check Output On Create Critiria Page
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Create Critiria Page    ${TC_003_DATA}
    # Scroll Element Into View    //div[div[div[@id="Header"]//*[text()="Common Criteria"]]]
    # ##TEXT BOX
    # Scroll Element Into View    //div[div[div[@id="Header"]//*[text()="Common Criteria"]]]//*[*[text()="TEST TEXT BOX"]]
    # Element Should Be Visible    //div[div[div[@id="Header"]//*[text()="Common Criteria"]]]//*[*[text()="TEST TEXT BOX"]]
    #     ##Check Default Value
    #     ## 'default_value' != ''
    # Textfield Value Should Be    //div[div[div[@id="Header"]//*[text()="Common Criteria"]]]//*[@name="TEST TEXT BOX"]    TEST
    Sleep    5s