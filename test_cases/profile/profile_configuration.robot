*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/global_keywords.robot
Resource    ../../resources/keywords/profile_keywords.robot
Resource    ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/profile_variables.robot
Resource    ../../resources/locators/profile_locators.robot


*** Test Cases ***
Clear And Insert Data In Database
    ${sql_script} =    Get File    ${SQLFilePath}
    Clear Database    ${sql_script}


TC_002
    [Documentation]    ที่หน้าจอ "Configuration Profile" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Back
    Check Screen    Main
    Sleep    ${DELAY}
    Close Browser


TC_010
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "X"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_010_DATA.condition}
    Click Delete Botton    ${PROFILE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_CANCEL_BUTTON_DELETE}
    Check List Data Is Visible    ${PROFILE_ID}
    Sleep    ${DELAY}
    Close Browser


TC_011
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "Yes"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_010_DATA.condition}
    Click Delete Botton    ${PROFILE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_ACCEPT_BUTTON_DELETE}
    Alert Popup Message    Deleted.
    Check List Data Is Not Visible    ${PROFILE_ID}
    Click Show Status    any
    Check List Data Is Visible    ${PROFILE_ID}
    Sleep    ${DELAY}
    Close Browser


TC_012
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "No"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_012_DATA.condition}
    Click Delete Botton    ${PROFILE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_DENY_BUTTON_DELETE}
    Check List Data Is Visible    ${PROFILE_ID}
    Sleep    ${DELAY}
    Close Browser


TC_014
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีกดปุ่ม "ย้อนกลับ" 
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Back
    Check Screen    Configuration Profile
    Sleep    ${DELAY}
    Close Browser


TC_015 
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีระบุ/เลือก Profile Name, Profile Label, Profile Group, Profile Table, Checkbox (Active) = Active และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_015_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${EMPTY}
    Click Button Save
    Alert Popup Message     ${TC_015_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Auto Check List Data   ${PROFILE_ID}     ${TC_015_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Product Type    ${TC_015_DATA.profile_name}    ${TC_015_DATA.is_active}
    Sleep    ${DELAY}
    Close Browser


TC_016
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีระบุ/เลือก Profile Name, Profile Label, Profile Group, Profile Table, Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${EMPTY}
    Click Button Save
    Alert Popup Message     ${TC_016_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_016_DATA.condition}
    Auto Check List Data   ${PROFILE_ID}     ${TC_016_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Close Browser
    # #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Product Type    ${TC_016_DATA.profile_name}    ${TC_016_DATA.is_active}
    Sleep    ${DELAY}
    Close Browser


TC_017
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีระบุ "Profile Name" ที่มีอยู่แล้วในระบบ และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${EMPTY}
    Click Button Save
    Alert Popup Message     ${TC_017_DATA.result.expected_result}
    Sleep    ${DELAY}
    Close Browser


TC_018
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีไม่ได้ระบุ "Profile Name" และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_018_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${EMPTY}
    Click Button Save
    Check Validate Edit Page    ${TC_018_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_018_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_019
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีไม่ได้ระบุ "Profile Label" และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Auto Insert Data    ${TC_019_DATA}    ${CHOOSE_KEY_INPUT_TEXT}    ${CHOOSE_KEY_INPUT_CHECKBOX}    ${EMPTY}
    Click Button Save
    Check Validate Edit Page    ${TC_019_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_019_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_020
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    Check Validate Edit Page    ${TC_020_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_020_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_021
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Cancel
    Check Screen    Configuration Profile
    Sleep    ${DELAY}
    Close Browser


TC_023
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Click Button Back
    Check Screen    Configuration Profile
    Sleep    ${DELAY}
    Close Browser


TC_024
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีระบุ/เลือก Profile Name, Profile Label, Profile Group, Profile Table, Checkbox (Active) = Active และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_016_DATA.condition}
    Click Show Status    any
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_016_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_024_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_024_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_024_DATA.condition}
    Auto Check List Data   ${PROFILE_ID}     ${TC_024_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Product Type    ${TC_024_DATA.profile_name}    ${TC_024_DATA.is_active}
    Sleep    ${DELAY}
    Close Browser


TC_025
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีระบุ/เลือก Profile Name, Profile Label, Profile Group, Profile Table, Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_015_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_025_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_025_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_025_DATA.condition}
    Auto Check List Data   ${PROFILE_ID}     ${TC_025_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Close Browser
    #CHECK SCREEN CREATE CRITERIA IN SLG
    Open Browser To URL    ${CREATE_CRITERIA_URL}    ${BASE_BROWSER}
    Check Output On Screen Create Criteria For Product Type    ${TC_025_DATA.profile_name}    ${TC_025_DATA.is_active}
    Sleep    ${DELAY}
    Close Browser


TC_026
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีระบุ "Profile Name" ที่มีอยู่แล้วในระบบ และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_024_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_024_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_026_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_026_DATA.result.expected_result}
    Sleep    ${DELAY}
    Close Browser


TC_027
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีไม่ได้ระบุ "Profile Name" และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_024_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_024_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_027_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_027_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_027_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_028
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีไม่ได้ระบุ "Profile Label" และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_024_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_024_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_028_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_028_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_028_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_029
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_024_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_024_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_029_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_029_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_029_DATA.result.validate_data}
    Sleep    ${DELAY}
    Close Browser


TC_030
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_024_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Click Button Cancel
    Check Screen    Configuration Profile
    Sleep    ${DELAY}
    Close Browser


    