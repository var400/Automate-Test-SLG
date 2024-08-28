*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/exclude_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/exclude_variables.robot


*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}
    
Process Dictionary List
    ${list_script}=    Process Dictionary List TEST    ${TC_001_DATA}
    FOR    ${script}    IN    @{list_script}
        Log To Console   ${script}
    END

Test Keyword Insert New Config
    Open Browser To URL    ${EXCLUDE_CONFIGURATION_URL}     ${BASE_BROWSER}
    ###Insert Group Control
    Click Button Add
    Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Sleep    2s
    ###Insert Group Detail
    FOR    ${data}    IN    @{TC_001_DATA['group_details']}
        Click Button Add Detail
        Log To Console    Group Detail [${data}]: ${TC_001_DATA['group_details']['${data}']}
        Auto Insert Data Detail    ${TC_001_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ###Check List Data When Create Detail
        ${group_id}=    Get Data Id From Field    ${TC_001_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_001_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    END
    ###Save Group Control
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete.
    Sleep    2s   
    ###Check Order by Seq On Add Exclude Criteria Group Detail
    ${result_base}=    Check SEQ List DB   ${SCRIPT_CHECK_SEQ_BASE_LIST_GROUP_DETAIL}
    ${result_web}=    Check Seq From Web List Group Detail 
    CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}
    
    ###Check List Data On Configuration Exclude Criteria
    Click Button Back
    ${group_id}=    Get Data Id From Field    ${TC_001_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    ###Check Order by Seq On Configuration Exclude Criteria
    ${result_base}=    Check SEQ List DB    ${SCRIPT_CHECK_SEQ_BASE_LIST_GROUP}
    ${result_web}=    Check Seq From Web List
    CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}

    ###Go To Create Critiria Page
    Go To    ${CREATE_CRITERIA_URL}
    ###Check Out Put Group Control Detail
    Check Output On Create Critiria Page    ${TC_001_DATA}
    Check Preview Script    ${TC_001_DATA}
    ###Check Seq Grop Control
    ${result_base}=    Check SEQ Create Criteria DB    ${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA}
    ${result_web}=    Check Seq From Web Create Criteria
    CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}
    ###Check Seq Grop Control Detail
    ${result_base}=    Check SEQ Create Criteria DB    ${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA_DETAIL}
    ${result_web}=    Check Seq From Web Create Criteria Detail    ${TC_001_DATA}
    CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}

Test Keyword Insert New Config Dupplcate Detail
    Open Browser To URL    ${EXCLUDE_CONFIGURATION_URL}     ${BASE_BROWSER}
    ###Insert Group Control
    Click Button Add
    Reload Page
    Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ###Insert Group Control Detail
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_001_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
    END 
    # Auto Insert Data Detail    ${TC_001_DATA['group_details']['DATA_1']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
    ###Click Dupplicate Data
    ${new_group_id}=    Click Dupplicate Data From    ${TC_001_DATA['group_details']['DATA_1']}
    ###Check Data Dupplicate
    Auto Check List Data    ${new_group_id}    ${TC_001_DATA['TC_001_TEST_INSERT_DUPPLICATE']['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    Click Edit Botton    ${new_group_id}
    Auto Check Text Data Detail    ${TC_001_DATA['TC_001_TEST_INSERT_DUPPLICATE']['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_EDIT_PAGE_AUTO_COMPLETE}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    ###Insert Data Dupplicate
    Auto Update Data Detail    ${TC_001_DATA['group_details']['DATA_3']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save Detail
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete.
    Sleep    2s

Test keyword Check Create Crireria
    Open Browser To URL    ${CREATE_CRITERIA_URL}     ${BASE_BROWSER}
    ###Check Out Put Group Control Detail
    Check Output On Create Critiria Page    ${TC_001_DATA}

    # Check Preview Script    ${TC_001_DATA}
    ###Check Seq Grop Control
    ${result_base}=    Check SEQ Create Criteria DB    ${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA}
    ${result_web}=    Check Seq From Web Create Criteria
    CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}
    ###Check Seq Grop Control Detail
    # ${result_base}=    Check SEQ Create Criteria DB    ${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA_DETAIL}
    # ${result_web}=    Check Seq From Web Create Criteria Detail    ${TC_001_DATA}
    # CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}

    ###Check Seq Grop Control Detail If Control Type = listbox
    ${result_base}=    Check SEQ Create Criteria DB    ${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA_DETAIL_LISTBOX}
    ${result_base_is_checked}=    Check SEQ Create Criteria DB    ${SCRIPT_CHECK_SEQ_BASE_CREATE_CRITIRIA_DETAIL_LISTBOX_IS_CHECKED}
    Append To List    ${result_base}     ${result_base_is_checked[0]}
    ${result_web}=    Check Seq From Web Create Criteria Detail    ${TC_001_DATA}
    # CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}
    CHECK SEQ List WEB VS BASE    ${result_base}    ${result_web}