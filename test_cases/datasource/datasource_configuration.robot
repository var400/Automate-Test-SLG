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


TC_004
    [Documentation]    ที่หน้าจอ "Configuration Datasource" กรณีเลือก "Default DataSource" และกดปุ่ม "Save Config"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_011_DATA.condition}
    Select Default DataSource    ${DATASOURCE_ID}    ${TC_011_DATA.datasource_name}
    Click Button Save Config Default Datasource
    Alert Popup Message     ${TC_011_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_011
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "X"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_011_DATA.condition}
    Click Delete Botton    ${DATASOURCE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_CANCEL_BUTTON_DELETE}
    Check List Data Is Visible    ${DATASOURCE_ID}
    Sleep    ${DELAY}


TC_012
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "Yes"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_011_DATA.condition}
    Click Delete Botton    ${DATASOURCE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_ACCEPT_BUTTON_DELETE}
    Alert Popup Message    Deleted.
    Check List Data Is Not Visible    ${DATASOURCE_ID}
    Click Show Status    any
    Check List Data Is Visible    ${DATASOURCE_ID}
    Sleep    ${DELAY}


TC_013
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "No"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_011_DATA.condition}
    Click Delete Botton    ${DATASOURCE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_DENY_BUTTON_DELETE}
    Check List Data Is Visible    ${DATASOURCE_ID}
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
    Sleep    ${DELAY}


TC_020
    [Documentation]    ที่หน้าจอ "Add Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Success จากนั้นผู้ใช้เลือก Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_020_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Test Connect
    Check Connect Status    ${TC_020_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_020_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & DATASOURCE LIST
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_020_DATA.condition}
    Auto Check List Data   ${DATASOURCE_ID}     ${TC_020_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${DATASOURCE_ID}
    Sleep    ${DELAY}


TC_021
    [Documentation]    ที่หน้าจอ "Add Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Success แต่ผู้ใช้ระบุ "Datasource Name" ที่มีอยู่แล้วในระบบ และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_021_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Test Connect
    Check Connect Status    ${TC_021_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_021_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_022
    [Documentation]    ที่หน้าจอ "Add Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Fail และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_022_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Test Connect
    Check Connect Status    ${TC_022_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_022_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_023
    [Documentation]    ที่หน้าจอ "Add Datasource" กรณีไม่ได้ระบุ "Datasource Name" และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_023_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Test Connect
    Check Connect Status    ${TC_023_DATA.result.validate_connect_status}
    Click Button Save
    Check Validate Edit Page    ${TC_023_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_023_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_024
    [Documentation]    ที่หน้าจอ "Add Datasource" กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    Check Validate Edit Page    ${TC_024_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_024_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_025
    [Documentation]    ที่หน้าจอ "Add Datasource" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Cancel
    Check Screen    Configuration DataSource
    Sleep    ${DELAY}


TC_027
    [Documentation]    ที่หน้าจอ "Edit Datasource" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Click Button Back
    Check Screen    Configuration DataSource
    Sleep    ${DELAY}


TC_028
    [Documentation]    ที่หน้าจอ "Edit Datasource" กรณีระบุข้อมูลถูกต้อง และกดปุ่ม "Test Connect"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_019_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_028_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_028_DATA.result.validate_connect_status}
    Sleep    ${DELAY}


TC_029
    [Documentation]    ที่หน้าจอ "Edit Datasource" กรณีระบุข้อมูลไม่ถูกต้อง และกดปุ่ม "Test Connect"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_019_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_029_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_029_DATA.result.validate_connect_status}
    Sleep    ${DELAY}


TC_030
    [Documentation]    ที่หน้าจอ "Edit Datasource" กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Test Connect"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_019_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_030_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_030_DATA.result.validate_connect_status}
    Sleep    ${DELAY}


TC_031
    [Documentation]    ที่หน้าจอ "Edit Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Success จากนั้นผู้ใช้เลือก Checkbox (Active) = Active และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_020_DATA.condition}
    Click Show Status    any
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_020_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_031_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_031_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_031_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & DATASOURCE LIST
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_031_DATA.condition}
    Auto Check List Data   ${DATASOURCE_ID}     ${TC_031_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${DATASOURCE_ID}
    Sleep    ${DELAY}


TC_032
    [Documentation]    ที่หน้าจอ "Edit Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Success จากนั้นผู้ใช้เลือก Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_019_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_032_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_032_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_032_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & DATASOURCE LIST
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_032_DATA.condition}
    Auto Check List Data   ${DATASOURCE_ID}     ${TC_032_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${DATASOURCE_ID}
    Sleep    ${DELAY}


TC_033
    [Documentation]    ที่หน้าจอ "Edit Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Success แต่ผู้ใช้ระบุ "Datasource Name" ที่มีอยู่แล้วในระบบ และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_031_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_031_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_033_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_033_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_033_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_034
    [Documentation]    ที่หน้าจอ "Edit Datasource" ตรวจสอบหลังระบุข้อมูลแล้ว Connect Status = Fail และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_031_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_031_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_034_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_034_DATA.result.validate_connect_status}
    Click Button Save
    Alert Popup Message     ${TC_034_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_035
    [Documentation]    ที่หน้าจอ "Edit Datasource" กรณีไม่ได้ระบุ "Datasource Name" และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_031_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_031_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_035_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_035_DATA.result.validate_connect_status}
    Click Button Save
    Check Validate Edit Page    ${TC_035_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_035_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_036
    [Documentation]    ที่หน้าจอ "Edit Datasource" กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_031_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Auto Check Text Data Edit Page    ${TC_031_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_036_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Test Connect
    Check Connect Status    ${TC_036_DATA.result.validate_connect_status}
    Click Button Save
    Check Validate Edit Page    ${TC_036_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_036_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_037
    [Documentation]    ที่หน้าจอ "Edit Datasource" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${DATASOURCE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${DATASOURCE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_031_DATA.condition}
    Click Edit Botton    ${DATASOURCE_ID}
    Click Button Cancel
    Check Screen    Configuration DataSource
    Sleep    ${DELAY}


