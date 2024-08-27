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

Test Variable 
    Log To Console    ${TC_001_DATA['group_details']['DATA_1']}
    FOR    ${data}    IN    @{TC_001_DATA['group_details']}
        Log To Console    Group Detail:${TC_001_DATA['group_details']['${data}']}
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
        Auto Insert Data Detail    ${TC_001_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}
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
