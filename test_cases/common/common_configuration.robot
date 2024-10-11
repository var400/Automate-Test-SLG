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
    ${group_id}=    Get Data Id From Field    ${TC_016_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_016_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
        ${group_id}=    Get Data Id From Field    ${TC_017_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_017_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_017_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    ${group_id}=    Get Data Id From Field    ${TC_017_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_017_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_017_DATA}
    Auto Check Seq On Create Criteria    ${TC_017_DATA}
    Check Preview Script    ${TC_017_DATA}
    Close Browser


TC_018
    [Documentation]    ที่หน้าจอ "Add Common Criteria" ตรวจสอบกรณีระบุ/เลือกข้อมูลครบทุก Field โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Group Type = Checkbox, Checkbox (Active) = Inactive, Checked > 1 รายการ และกดปุ่ม "Save"
    Open Browser To URL    ${COMMON_CONFIGURATION_URL}    ${BASE_BROWSER}
    # Click Button Add
    # Auto Insert Data    ${TC_018_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    # ${Data_List}     Create List    DATA_1    DATA_2
    # FOR    ${data}    IN    @{Data_List}
    #     Click Button Add Detail
    #     Auto Insert Data Detail    ${TC_018_DATA['group_details']['${data}']}    ${CHOOSE_KEY_INPUT_AUTO_COMPLETE}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    #     Click Button Save Detail
    #     ${group_id}=    Get Data Id From Field    ${TC_018_DATA['group_details']['${data}']['field_label']}    field_label
    #     Auto Check List Data    ${group_id}    ${TC_018_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
    #     Auto Check Seq Group Detail    ${TC_018_DATA}
    # END
    # Click Button Save Group Control    Yes
    # Page Should Contain    Save Complete. 
    # #CHECK DATABASE & COMMON LIST
    # Click Button Back
    ${group_id}=    Get Data Id From Field    ${TC_018_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_018_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_019_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_019_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
        ${group_id}=    Get Data Id From Field    ${TC_020_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_020_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_020_DATA}
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
    ${group_id}=    Get Data Id From Field    ${TC_021_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_021_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_022_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_022_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_023_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_023_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_025_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_025_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
        ${group_id}=    Get Data Id From Field    ${TC_026_DATA['group_details']['${data}']['field_label']}    field_label
        Auto Check List Data    ${group_id}    ${TC_026_DATA['group_details']['${data}']}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA_GROUP_DETAIL}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA_GROUP_DETAIL}
        Auto Check Seq Group Detail    ${TC_026_DATA}
    END
    Click Button Save Group Control    Yes
    Page Should Contain    Save Complete. 
    #CHECK DATABASE & COMMON LIST
    Click Button Back
    ${group_id}=    Get Data Id From Field    ${TC_026_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_026_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_027_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_027_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_028_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_028_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_029_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_029_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_030_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_030_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
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
    ${group_id}=    Get Data Id From Field    ${TC_031_DATA['group_name']}    group_name
    Auto Check List Data    ${group_id}    ${TC_031_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Auto Check Seq Group List
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Go To    ${CREATE_CRITERIA_URL}
    Check Output On Create Critiria Page    ${TC_031_DATA}
    Auto Check Seq On Create Criteria Listbox    ${TC_031_DATA}
    Check Preview Script    ${TC_031_DATA}   
    Close Browser    


TC_032
   


