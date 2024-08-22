*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot

*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}

Test Keyword
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    # ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_DATA['condition']}
    # Click Edit Botton    ${CHANNEL_ID}
    Click Button Back
    # Auto Check Text Data Edit Page    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}


TC_001_add new channel
    [Documentation]    add new channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_001_DATA.result.expected_result}
    Click Button Back
    # ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_001_DATA['condition']}
    # Auto Check List Data   ${CHANNEL_ID}    ${TC_001_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    # Click Edit Botton    ${CHANNEL_ID}
    # Auto Check Text Data Edit Page    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    # # Auto Update Data    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    # Close Browser

TC_002_edit new channel
    [Documentation]    add new channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_002_DATA['condition']}
    Click Edit Botton    ${CHANNEL_ID}
    Auto Update Data    ${TC_002_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_002_DATA.result.expected_result}
    Click Button Back
    Auto Check List Data   ${CHANNEL_ID}    ${TC_002_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Close Browser

TC_003_add dupplicate channel
    [Documentation]    add dupplicate channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_003_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_003_DATA.result.expected_result}
    # Click Button Back
    # Auto Update Data    ${TC_001_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Close Browser
# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot

TC_004_Delete Item
    [Documentation]    Delete Item
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_004_DATA['condition']}
    Click Delete Botton    ${CHANNEL_ID}
    Alert Popup Message    Do you want to delete item ?
    # Click Button    ${LOCATOR_DENY_BUTTON_DELETE}
    Click Button    ${LOCATOR_ACCEPT_BUTTON_DELETE}
    Alert Popup Message    Deleted.
    Check List Data Is Not Visible    ${CHANNEL_ID}
    # Do you want to delete item ?

TC_005_Test
    [Documentation]
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    # Element Text Should Be    xpath=//div[.//input[@name="channel_file_type"]]/following-sibling::div//p    This value cannot be null.
    Check Validate Edit Page    ${TC_005_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    This value cannot be null.
    # Check Text Alert Validate    channel_name    This value cannot be null.
    Close Browser








#TEST CASE
TC_002
    [Documentation]    ที่หน้าจอ "Configuration Channel" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Back
    Sleep    ${DELAY}


TC_014
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Back
    Sleep    ${DELAY}


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
    Check List Data Is Visible   ${CHANNEL_ID} 
    Auto Check List Data   ${CHANNEL_ID}     ${TC_015_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


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
    Check List Data Is Visible   ${CHANNEL_ID}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_016_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


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
    Check List Data Is Visible   ${CHANNEL_ID}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_017_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


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
    Check List Data Is Not Visible    ${CHANNEL_ID}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_018_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


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
    Check List Data Is Visible   ${CHANNEL_ID}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_019_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


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
    Check List Data Is Visible   ${CHANNEL_ID}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_020_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


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
    Check List Data Is Visible   ${CHANNEL_ID}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_021_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


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
    Check List Data Is Not Visible    ${CHANNEL_ID}
    Auto Check List Data   ${CHANNEL_ID}     ${TC_022_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${CHANNEL_ID}
    Sleep    ${DELAY}


TC_023
    [Documentation]    ที่หน้าจอ "Add Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ แต่ผู้ใช้ระบุ "Channel Label" ที่มีอยู่แล้วในระบบ
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_023_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Alert Popup Message     ${TC_023_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_024
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Name" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_024_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_024_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_024_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_025
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้เลือก "Channel File Type" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_025_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${EMPTY}
    Click Button Save
    Check Validate Edit Page    ${TC_025_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_025_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_026
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Delimiter" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_026_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_026_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_026_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_027
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Label" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_027_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_027_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_027_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_028
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel File Name Format" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_028_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_028_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_028_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_029
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Format" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_029_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_029_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_029_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_030
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Temp Path" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_030_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_030_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_030_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_031
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Target Path" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_031_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_031_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_031_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_032
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Host" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_032_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_032_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_032_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_033
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel User" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_033_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_033_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_033_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_034
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Pass" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_034_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_034_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_034_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_035
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ "Channel Port" และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_035_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Check Validate Edit Page    ${TC_035_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_035_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_036
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีไม่ได้ระบุ/เลือกข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    Check Validate Edit Page    ${TC_036_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_036_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_037
    [Documentation]    ที่หน้าจอ "Add Channel" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Cancel
    Sleep    ${DELAY}


TC_039
    [Documentation]    ที่หน้าจอ "Edit Channel" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Click Edit Botton    ${CHANNEL_ID}
    Click Button Back
    Sleep    ${DELAY}


TC_040
    [Documentation]    ที่หน้าจอ "Edit Channel" ตรวจสอบกรณีผู้ใช้ระบุ/เลือกข้อมูลครบ โดยผู้ใช้เลือกตามเงื่อนไขดังนี้ Channel File Type = txt, Checkbox (Active) = Active, Checkbox (Show Header) = Show Header, Checkbox (Is TeoHong) = TeoHong และกดปุ่ม "Save"
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${CHANNEL_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_018_DATA.condition}
    Click Show Status    any
    Click Edit Botton    ${CHANNEL_ID}







