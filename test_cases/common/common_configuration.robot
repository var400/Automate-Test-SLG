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
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_015_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_015_DATA}
    Auto Check Seq On Create Criteria    ${TC_015_DATA}
    Check Preview Script    ${TC_015_DATA}
    Close Browser


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
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_016_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_016_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_016_DATA}
    Auto Check Seq On Create Criteria    ${TC_016_DATA}
    Check Preview Script    ${TC_016_DATA}
    Close Browser


TC_017
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Checkbox, Checkbox (Active) = Active, Checkbox (Read Only) = Read Only, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_017_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        # ${group_id}=    Get Data Id From Field    ${TC_017_DATA['group_details']['${data}']['field_label']}    field_label
        # Auto Check List Data    ${group_id}    ${TC_017_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        # Auto Check Seq Group Detail    ${TC_017_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_017_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_017_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_017_DATA}
    Auto Check Seq On Create Criteria    ${TC_017_DATA}
    Check Preview Script    ${TC_017_DATA}
    Close Browser


TC_018
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Checkbox, Checkbox (Active) = Inactive, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_018_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_018_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        # ${group_id}=    Get Data Id From Field    ${TC_018_DATA['group_details']['${data}']['field_label']}    field_label
        # Auto Check List Data    ${group_id}    ${TC_018_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        # Auto Check Seq Group Detail    ${TC_018_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_018_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_018_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_018_DATA}
    Auto Check Seq On Create Criteria    ${TC_018_DATA}
    Check Preview Script    ${TC_018_DATA}   
    Close Browser


TC_019
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = DropDown, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_019_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_019_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_019_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_019_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_019_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_019_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_019_DATA}
    Auto Check Seq On Create Criteria    ${TC_019_DATA}
    Check Preview Script    ${TC_019_DATA}   
    Close Browser


TC_020
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = DropDown, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_020_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_020_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
    END
    Click Button Save
    Alert Popup Message     ${TC_020_DATA.result.expected_result}
    Close Browser


TC_021
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = DropDown, Checkbox (Active) = Active, Checkbox (Read Only) = Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_021_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_021_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_021_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_021_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_021_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_021_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_021_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_021_DATA}
    Auto Check Seq On Create Criteria    ${TC_021_DATA}
    Check Preview Script    ${TC_021_DATA}   
    Close Browser 


TC_022
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = DropDown, Checkbox (Active) = Inactive, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_022_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_022_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_022_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_022_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_022_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_022_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_022_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_022_DATA}
    Auto Check Seq On Create Criteria    ${TC_022_DATA}
    Check Preview Script    ${TC_022_DATA}   
    Close Browser


TC_023
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Radio Button, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_023_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_023_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_023_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_023_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_023_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_023_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_023_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_023_DATA}
    Auto Check Seq On Create Criteria    ${TC_023_DATA}
    Check Preview Script    ${TC_023_DATA}   
    Close Browser


TC_024
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Radio Button, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_024_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_024_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_024_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_024_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_024_DATA}
    END
    Click Button Save
    Alert Popup Message     ${TC_024_DATA.result.expected_result}
    Close Browser


TC_025
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Radio Button, Checkbox (Active) = Active, Checkbox (Read Only) = Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_025_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_025_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_025_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_025_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_025_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_025_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_025_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_025_DATA}
    Auto Check Seq On Create Criteria    ${TC_025_DATA}
    Check Preview Script    ${TC_025_DATA}   
    Close Browser


TC_026
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Radio Button, Checkbox (Active) = Inactive, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_026_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_026_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_026_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_026_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_026_DATA}
    Auto Check Seq On Create Criteria    ${TC_026_DATA}
    Check Preview Script    ${TC_026_DATA}   
    Close Browser


TC_027
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Text, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_027_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_027_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_027_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_027_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_027_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_027_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_027_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_027_DATA}
    Auto Check Seq On Create Criteria    ${TC_027_DATA}
    Check Preview Script    ${TC_027_DATA}   
    Close Browser    


TC_028
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Text, Checkbox (Active) = Active, Checkbox (Read Only) = Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_028_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_028_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_028_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_028_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_028_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_028_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_028_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_028_DATA}
    Auto Check Seq On Create Criteria    ${TC_028_DATA}
    Check Preview Script    ${TC_028_DATA}   
    Close Browser


TC_029
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Text, Checkbox (Active) = Inactive, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_029_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_029_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_029_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_029_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_029_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_029_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_029_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_029_DATA}
    Auto Check Seq On Create Criteria    ${TC_029_DATA}
    Check Preview Script    ${TC_029_DATA}   
    Close Browser   


TC_030
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Listbox, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_030_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_030_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_030_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_030_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_030_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_030_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_030_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_030_DATA}
    Auto Check Seq On Create Criteria Listbox    ${TC_030_DATA}
    Check Preview Script    ${TC_030_DATA}   
    Close Browser


TC_031
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Listbox, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_031_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_031_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_031_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_031_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_031_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_031_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_031_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_031_DATA}
    Auto Check Seq On Create Criteria Listbox    ${TC_031_DATA}
    Check Preview Script    ${TC_031_DATA}   
    Close Browser    


TC_032
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Listbox, Checkbox (Active) = Active, Checkbox (Read Only) = Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_032_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_032_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_032_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_032_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_032_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_032_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_032_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_032_DATA}
    Auto Check Seq On Create Criteria Listbox    ${TC_032_DATA}
    Check Preview Script    ${TC_032_DATA}   
    Close Browser     


TC_033
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Listbox, Checkbox (Active) = Inactive, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_033_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_033_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_033_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_033_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_033_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_033_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_033_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_033_DATA}
    Auto Check Seq On Create Criteria Listbox    ${TC_033_DATA}
    Check Preview Script    ${TC_033_DATA}   
    Close Browser


TC_034
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Multi Dropdown, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_034_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_034_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_034_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_034_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_034_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_034_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_034_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_034_DATA}
    Auto Check Seq On Create Criteria    ${TC_034_DATA}
    Check Preview Script    ${TC_034_DATA}
    Close Browser


TC_035
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Multi Dropdown, Checkbox (Active) = Active, Checkbox (Read Only) = Not Read Only, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_035_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_035_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_035_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_035_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_035_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_035_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_035_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_035_DATA}
    Auto Check Seq On Create Criteria    ${TC_035_DATA}
    Check Preview Script    ${TC_035_DATA}
    Close Browser


TC_036
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Multi Dropdown, Checkbox (Active) = Active, Checkbox (Read Only) = Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_036_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_036_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_036_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_036_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_036_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_036_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_036_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_036_DATA}
    Auto Check Seq On Create Criteria    ${TC_036_DATA}
    Check Preview Script    ${TC_036_DATA}
    Close Browser


TC_037
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Multi Dropdown, Checkbox (Active) = Inactive, Checkbox (Read Only) = Not Read Only, Checked = 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_037_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_037_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_037_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_037_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_037_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_037_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_037_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_037_DATA}
    Auto Check Seq On Create Criteria    ${TC_037_DATA}
    Check Preview Script    ${TC_037_DATA}
    Close Browser


TC_038
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้ระบุ Group Name ที่มีอยู่แล้วในระบบแต่อยู่คนละ Profile กัน
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    # Auto Insert Data    ${TC_038_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    # ${Data_List}     Create List    DATA_1    DATA_2
    # FOR    ${data}    IN    @{Data_List}
    #     Click Button Add Detail
    #     Auto Insert Data Detail    ${TC_038_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    #     Click Button Save Detail
    # END
    # Click Button Save Group Control    Yes
    # Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_038_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_038_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Close Browser


TC_039
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้ระบุ Group Name ที่มีอยู่แล้วในระบบและอยู่ Profile เดียวกัน
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_039_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_039_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
    END
    Click Button Save Group Control    Yes
    Alert Popup Message     ${TC_039_DATA.result.expected_result}
    Close Browser


TC_040
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้ระบุ Group Sequence ที่มีอยู่แล้วในระบบแต่อยู่คนละ Profile กัน
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_040_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_040_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_040_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_040_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_040_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    Auto Check Seq Group List
    ${group_id}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_040_DATA.condition}
    Auto Check List Data    ${group_id}    ${TC_040_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Close Browser


TC_041
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้ระบุ Group Sequence ที่มีอยู่แล้วในระบบและอยู่ Profile เดียวกัน
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_041_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_041_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_041_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_041_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_041_DATA}
    END
    Click Button Save Group Control    Yes
    Alert Popup Message     ${TC_041_DATA.result.expected_result}
    Close Browser


TC_042
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้ระบุ Field Value ซ้ำ
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_042_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_042_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_042_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_042_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_042_DATA}
    END
    Click Button Save
    Alert Popup Message     ${TC_042_DATA.result.expected_result}
    Close Browser   


TC_043 
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field แต่ผู้ใช้ไม่ได้ระบุ Field Value
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_043_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_043_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_043_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_043_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_043_DATA}
    END
    Click Button Save
    Alert Popup Message     ${TC_043_DATA.result.expected_result}
    Close Browser       


TC_046
    [Documentation]    ที่หน้าจอ "Add Common Criteria" กรณีกด Icon Duplicate
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_046_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_046_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_046_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_046_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_046_DATA}
    END
    ${new_group_id}=    Click Dupplicate Data From    ${TC_046_DATA['group_details']['DATA_2']}
    Auto Check List Data    ${new_group_id}    ${TC_046_DATA['TC_046_TEST_INSERT_DUPPLICATE']['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    Click Edit Botton    ${new_group_id}
    Auto Check Text Data Detail    ${TC_046_DATA['TC_046_TEST_INSERT_DUPPLICATE']['CHECK_DUPPLICATE_DATA']}    ${CHOOSE_KEY_EDIT_PAGE_AUTO_COMPLETE}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data Detail    ${TC_046_DATA['group_details']['DATA_3']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save Detail
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    Close Browser


TC_047
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field และกด Icon ถังขยะ
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_047_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}    
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_047_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_047_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_047_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_047_DATA}
    END
    ${group_id}=    Get Data Id From Field    ${TC_047_DATA['group_details']['${data}']['field_label']}    field_label
    Click Delete Botton    ${group_id}
    Close Browser


TC_048
    [Documentation]    ที่หน้าจอ "Add Common Criteria" กรณีไม่ได้เลือก "Profile Name"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_048_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    ${Data_List}     Create List    DATA_1    DATA_2
    FOR    ${data}    IN    @{Data_List}
        Click Button Add Detail
        Auto Insert Data Detail    ${TC_048_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
        Click Button Save Detail
        ${group_id}=    Get Data Id From Field    ${TC_048_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_048_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_048_DATA}
    END
    Click Button Save
    Check Validate Edit Page    ${TC_048_DATA}    ${CHOOSE_KEY_VALIDATE_DATA}    ${TC_048_DATA.result.validate_data}
    Close Browser


TC_052
    [Documentation]    ที่หน้าจอ "Add Common Criteria" กรณีไม่ได้ระบุ/เลือกข้อมูลและกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    Check Validate Edit Page    ${TC_052_DATA}    ${CHOOSE_KEY_VALIDATE_DATA}    ${TC_052_DATA.result.validate_data}
    Close Browser


TC_053
    [Documentation]    ที่หน้าจอ "Add Common Criteria" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Cancel
    Check Screen    Configuration Common Criteria
    Close Browser




















