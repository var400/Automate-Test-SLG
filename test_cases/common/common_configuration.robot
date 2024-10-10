*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/common_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/common_variables.robot

*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}

 
TC_002
    [Documentation]    ที่หน้าจอ "Configuration Common Criteria" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Back
    Check Screen    Main
    Sleep    ${DELAY}
    Close Browser


TC_010
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "X"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${group_id}=    Get Data Id From Field    ${TC_010_DATA['group_name']}    group_name
    Check List Data Is Visible    ${group_id}
    Click Delete Botton    ${group_id}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_CANCEL_BUTTON_DELETE}
    Check List Data Is Visible    ${group_id}
    Sleep    ${DELAY}
    Close Browser


TC_011
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "Yes"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${group_id}=    Get Data Id From Field    ${TC_010_DATA['group_name']}    group_name
    Check List Data Is Visible    ${group_id}
    Click Delete Botton    ${group_id}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_ACCEPT_BUTTON_DELETE}
    Alert Popup Message    Deleted.
    Check List Data Is Not Visible    ${group_id}
    Click Show Status    any
    Sleep    ${DELAY}
    Close Browser


TC_012
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "No"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${group_id}=    Get Data Id From Field    ${TC_012_DATA['group_name']}    group_name
    Check List Data Is Visible    ${group_id}
    Click Delete Botton    ${group_id}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_DENY_BUTTON_DELETE}
    Check List Data Is Visible    ${group_id}
    Sleep    ${DELAY}
    Close Browser


TC_014
    [Documentation]    ที่หน้าจอ "Add Common Criteria" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Back
    Check Screen    Configuration Common Criteria
    Sleep    ${DELAY}
    Close Browser


TC_015
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Checkbox, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_015_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_015_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_015_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_015_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_015_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    ${group_id}=    Get Data Id From Field    ${TC_015_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_015_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_015_DATA}
        # Auto Check Seq On Create Criteria    ${TC_015_DATA}
        # Check Preview Script    ${TC_015_DATA}


TC_016
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Checkbox, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_016_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_016_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_016_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_016_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    ${group_id}=    Get Data Id From Field    ${TC_016_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_016_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_016_DATA}
        # Auto Check Seq On Create Criteria    ${TC_015_DATA}
        # Check Preview Script    ${TC_015_DATA}


TC_017
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Checkbox, Checkbox (Active) = Active, Checkbox (Read Only) = Read Only, Checked > 1 รายการ และกดปุ่ม "Save"





