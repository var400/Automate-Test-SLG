*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot

Resource    ../../resources/keywords/profile_keywords.robot


*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}


TC_002
    [Documentation]    ที่หน้าจอ "Configuration Channel" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Back
    Check Screen    Main
    Sleep    ${DELAY}
    Close Browser


TC_010
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "X"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_010_DATA.condition}
    Click Delete Botton    ${CHANNEL_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_CANCEL_BUTTON_DELETE}
    Check List Data Is Visible    ${CHANNEL_ID}
    Sleep    ${DELAY}
    Close Browser


TC_011
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "Yes"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_010_DATA.condition}
    Click Delete Botton    ${CHANNEL_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_ACCEPT_BUTTON_DELETE}
    Alert Popup Message    Deleted.
    Check List Data Is Not Visible    ${CHANNEL_ID}
    Click Show Status    any
    Check List Data Is Visible    ${CHANNEL_ID}
    Sleep    ${DELAY}
    Close Browser


TC_012
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "No"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_012_DATA.condition}
    Click Delete Botton    ${CHANNEL_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_DENY_BUTTON_DELETE}
    Check List Data Is Visible    ${CHANNEL_ID}
    Sleep    ${DELAY}
    Close Browser


TC_014
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Back
    Check Screen    Configuration Channel
    Sleep    ${DELAY}
    Close Browser


TC_015
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_015_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_015_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_015_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_015_DATA.channel_label}    ${TC_015_DATA.is_active}    ${TC_015_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_016
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_016_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_016_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_016_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_016_DATA.channel_label}    ${TC_016_DATA.is_active}    ${TC_016_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_017
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Active, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_017_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_017_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_017_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_017_DATA.channel_label}    ${TC_017_DATA.is_active}    ${TC_017_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_018
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Inactive, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_018_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_018_DATA.result.expected_result}
    Click Button Cancel
    # CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_018_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_018_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_018_DATA.channel_label}    ${TC_018_DATA.is_active}    ${TC_018_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_019
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_019_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_019_DATA.result.expected_result}
    Click Button Cancel
    # CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_019_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_019_DATA.channel_label}    ${TC_019_DATA.is_active}    ${TC_019_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_020
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_020_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_020_DATA.result.expected_result}
    Click Button Cancel
    # CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_020_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_020_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_020_DATA.channel_label}    ${TC_020_DATA.is_active}    ${TC_020_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_021
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Active, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_021_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_021_DATA.result.expected_result}
    Click Button Cancel
    # CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_021_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_021_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_021_DATA.channel_label}    ${TC_021_DATA.is_active}    ${TC_021_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_022
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Inactive, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_022_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_022_DATA.result.expected_result}
    Click Button Cancel
    # CHECK DATABASE & CHANNEL LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_022_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_022_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_022_DATA.channel_label}    ${TC_022_DATA.is_active}    ${TC_022_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_023
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ แต่ผู้ใช้ระบุ "Channel Label" ที่มีอยู่แล้วในระบบ
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_023_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_023_DATA.result.expected_result}
    Sleep    ${DELAY}
    Close Browser


TC_024
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Name" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_024_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_024_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_024_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_025
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้เลือก "Channel File Type" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_025_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${EMPTY}
    Click Button Save
    Check Validate Edit Page    ${TC_025_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_025_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_026
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Delimiter" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_026_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_026_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_026_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_027
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Label" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_027_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_027_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_027_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_028
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel File Name Format" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_028_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_028_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_028_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_029
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Format" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_029_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_029_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_029_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_030
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Temp Path" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_030_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_030_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_030_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_031
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Target Path" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_031_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_031_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_031_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_032
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Host" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_032_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_032_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_032_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_033
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel User" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_033_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_033_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_033_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_034
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Pass" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_034_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_034_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_034_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_035
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Port" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_035_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_035_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_035_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_036
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ/เลือกข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    Check Validate Edit Page    ${TC_036_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_036_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_037
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Cancel
    Check Screen    Configuration Channel
    Sleep    ${DELAY}
    Close Browser


TC_039
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Click Edit Botton    ${CHANNEL_ID}
    Click Button Back
    Check Screen    Configuration Channel
    Sleep    ${DELAY}
    Close Browser


TC_040
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_018_DATA.condition}
    Click Show Status    any
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_018_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_040_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_040_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_040_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_040_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_040_DATA.channel_label}    ${TC_040_DATA.is_active}    ${TC_040_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_041
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_017_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_017_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_041_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_041_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_041_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_041_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_041_DATA.channel_label}    ${TC_041_DATA.is_active}    ${TC_041_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_042
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Active, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_016_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_016_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_042_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_042_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_042_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_042_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_042_DATA.channel_label}    ${TC_042_DATA.is_active}    ${TC_042_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_043
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Inactive, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_015_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_043_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_043_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_043_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_043_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_043_DATA.channel_label}    ${TC_043_DATA.is_active}    ${TC_043_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_044
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_022_DATA.condition}
    Click Show Status    any
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_022_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_044_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_044_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_044_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_044_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_044_DATA.channel_label}    ${TC_044_DATA.is_active}    ${TC_044_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_045
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_021_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_021_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_045_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_045_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_045_DATA.channel_label}    ${TC_045_DATA.is_active}    ${TC_045_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_046
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Active, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_020_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_020_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_046_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_046_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_046_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_046_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_046_DATA.channel_label}    ${TC_046_DATA.is_active}    ${TC_046_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_047
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = csv, Checkbox (Active) = Inactive, Checkbox (Show Header) = Not Show Header, Checkbox (Is TeoHong) = Not TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_019_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_019_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_047_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_047_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_047_DATA.condition}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_047_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console    ${CHANNEL_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Output Templete    ${TC_047_DATA.channel_label}    ${TC_047_DATA.is_active}    ${TC_047_DATA.is_teohong}
    Sleep    ${DELAY}
    Close Browser


TC_048
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ แต่ผู้ใช้ระบุ "Channel Label" ที่มีอยู่แล้วในระบบ
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_048_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_048_DATA.result.expected_result}
    Sleep    ${DELAY}
    Close Browser


TC_049
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Name" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_049_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_049_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_049_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_050
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Delimiter" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_050_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_050_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_050_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_051
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Label" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_051_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_051_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_051_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_052
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel File Name Format" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_052_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_052_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_052_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_053
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Format" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_053_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_053_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_053_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_054
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Temp Path" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_054_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_054_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_054_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_055
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Target Path" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_055_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_055_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_055_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_056
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Host" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_056_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_056_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_056_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_057
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel User" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_057_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_057_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_057_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_058
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Pass" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_058_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_058_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_058_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_059
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ "Channel Port" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_059_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_059_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_059_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_060
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีไม่ได้ระบุ/เลือกข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Check Text Data Edit Page    ${TC_045_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_060_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_060_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_060_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_061
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_045_DATA.condition}
    Check List Data Is Visible    ${CHANNEL_ID}
    Click Edit Botton    ${CHANNEL_ID}
    Click Button Cancel
    Check Screen    Configuration Channel
    Sleep    ${DELAY}
    Close Browser







