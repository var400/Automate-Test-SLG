*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/specific_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/specific_variables.robot


*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}

Test Keyword
    Open Browser To URL    ${SPECIFIC_COMMON_CONFIGURATION_URL}     ${BASE_BROWSER}
    Auto Check Seq Group
    # Check Output On Create Critiria Page    ${TC_001_DATA}
    # ${operator_DB}=    Get Operator From DB    text
    # FOR    ${operator}    IN    @{operator_DB}
    #     Log To Console    ${operator[0]}
    # END
    # Check Seq On Create Criteria    ${TC_001_DATA}

Test Keyword Insert New Config Dupplcate Detail
    Open Browser To URL    ${SPECIFIC_COMMON_CONFIGURATION_URL}     ${BASE_BROWSER}
    ###Insert Group Control
    Click Button Add
    Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ###Insert Group Control Detail
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_001_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
    END 
    ###Click Dupplicate Data
    ${new_group_id}=    Click Dupplicate Data From    ${TC_001_DATA['group_details']['DATA_1']}
    # ###Check Data Dupplicate
    Auto Check List Data    ${new_group_id}    ${TC_001_DATA['TC_001_TEST_INSERT_DUPPLICATE']['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    Click Edit Botton    ${new_group_id}
    Auto Check Text Data Detail    ${TC_001_DATA['TC_001_TEST_INSERT_DUPPLICATE']['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_EDIT_PAGE_AUTO_COMPLETE}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    # ###Insert Data Dupplicate
    Auto Update Data Detail    ${TC_001_DATA['group_details']['DATA_3']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save Detail
    Click Button Save Group Control    Yes
    # Page Should Contain    Save Complete.
    Sleep    2s
