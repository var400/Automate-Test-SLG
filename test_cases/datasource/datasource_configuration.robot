*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/global_keywords.robot
Resource    ../../resources/keywords/datasource_keywords.robot
Resource    ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/datasource_variables.robot


*** Test Cases ***
TC_002
    [Documentation]    ที่หน้าจอ "Configuration Datasource" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Back
    Check Screen    Main
    Sleep    ${DELAY}


TC_015
    [Documentation]    ที่หน้าจอ "Add Datasource" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Back
    Check Screen    Configuration DataSource
    Sleep    ${DELAY}


TC_016
    [Documentation]    ที่หน้าจอ "Add Datasource" กรณีระบุข้อมูลถูกต้อง และกดปุ่ม "Test Connect"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Test Connect
    Check Connect Status    ${TC_016_DATA.result.validate_connect_status}
    Sleep    ${DELAY}


TC_017
    [Documentation]    ที่หน้าจอ "Add Datasource" กรณีระบุข้อมูลไม่ถูกต้อง และกดปุ่ม "Test Connect"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Test Connect
    Check Connect Status    ${TC_017_DATA.result.validate_connect_status}
    Sleep    ${DELAY}


TC_018
    [Documentation]    ที่หน้าจอ "Add Datasource" กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Test Connect"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Test Connect
    Check Connect Status    ${TC_018_DATA.result.validate_connect_status}
    Sleep    ${DELAY}


TC_019
    [Documentation]    ที่หน้าจอ "Add Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Success จากนั้นผู้ใช้เลือก Checkbox (Active) = Active และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_019_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Test Connect
    Check Connect Status    ${TC_019_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_019_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & DATASOURCE LIST
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Auto Check List Data   ${DATASOURCE_ID}     ${TC_019_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${DATASOURCE_ID}





    