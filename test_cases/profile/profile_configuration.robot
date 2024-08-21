*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/global_keywords.robot
Resource    ../../resources/keywords/profile_keywords.robot
Resource    ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/profile_variables.robot
Resource    ../../resources/locators/profile_locators.robot



*** Test Cases ***
# Test Database
#     Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
#     ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
#     Auto Check List Data   ${PROFILE_ID}     ${TC_015_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
#     Log To Console      ${PROFILE_ID}
#     #${CHNNEL_ID}=    Get Data Id  ${QRY_GET_DATA_ID}
#     # Click Edit Botton    ${PROFILE_ID}
#     #Click Delete Botton    ${CHNNEL_ID}
#     # Sleep    ${DELAY}


TC_002
    [Documentation]    ที่หน้าจอ "Configuration Profile" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Back
    Check Home Screen
    Sleep    ${DELAY}


TC_010
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "X"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_011_DATA.condition}
    Click Delete Botton    ${PROFILE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_CANCEL_BUTTON_DELETE}
    Check List Data Is Visible    ${PROFILE_ID}
    Sleep    ${DELAY}


TC_011
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "Yes"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_011_DATA.condition}
    Click Delete Botton    ${PROFILE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_ACCEPT_BUTTON_DELETE}
    Alert Popup Message    Deleted.
    Check List Data Is Not Visible    ${PROFILE_ID}
    Click Show Status    any
    Check List Data Is Visible    ${PROFILE_ID}
    Sleep    ${DELAY}


TC_012
    [Documentation]    ที่หน้าจอ Popup Message "Do you want to delete item?" กรณีกดปุ่ม "No"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_011_DATA.condition}
    Click Delete Botton    ${PROFILE_ID}
    Alert Popup Message    Do you want to delete item ?
    Click Button    ${LOCATOR_DENY_BUTTON_DELETE}
    Check List Data Is Visible    ${PROFILE_ID}
    Sleep    ${DELAY}


TC_014
    [Documentation]    ที่หน้าจอ "Add Profile" กรณีกดปุ่ม "ย้อนกลับ" 
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Back
    Sleep    ${DELAY}


TC_015 
    [Documentation]    กรณีระบุ/เลือก Profile Name, Profile Group, Profile Table, Checkbox (Active) = Active และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_015_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_015_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    Alert Popup Message     ${TC_015_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Auto Check List Data   ${PROFILE_ID}     ${TC_015_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Sleep    ${DELAY}


TC_016
    [Documentation]    กรณีระบุ/เลือก Profile Name, Profile Group, Profile Table, Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    Alert Popup Message     ${TC_016_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_016_DATA.condition}
    Auto Check List Data   ${PROFILE_ID}     ${TC_016_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Sleep    ${DELAY}


TC_017
    [Documentation]    กรณีระบุ "Profile Name" ที่ มีอยู่แล้ว ในระบบ และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    Alert Popup Message     ${TC_017_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_018
    [Documentation]    กรณีไม่ได้ระบุ "Profile Name" และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_018_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_018_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    Check Validate Edit Page    ${TC_018_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_018_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_019
    [Documentation]    กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    Check Validate Edit Page    ${TC_019_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_019_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_020
    [Documentation]    กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Cancel
    Sleep    ${DELAY}


TC_022
    [Documentation]    ที่หน้าจอ "Edit Profile" กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Click Button Back
    Sleep    ${DELAY}


TC_023
    [Documentation]    กรณีระบุ/เลือก Profile Name, Profile Group, Profile Table, Checkbox (Active) = Active และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_016_DATA.condition}
    Click Show Status    any
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_016_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_023_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_023_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    Auto Check List Data   ${PROFILE_ID}     ${TC_023_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Sleep    ${DELAY}


TC_024
    [Documentation]    กรณีระบุ/เลือก Profile Name, Profile Group, Profile Table, Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_015_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_024_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_024_DATA.result.expected_result}
    Click Button Cancel
    #CHECK DATABASE & PROFILE LIST
    Auto Check List Data   ${PROFILE_ID}     ${TC_024_DATA}    ${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    ${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}
    Log To Console      ${PROFILE_ID}
    Sleep    ${DELAY}


TC_025
    [Documentation]    กรณีระบุ "Profile Name" ที่ มีอยู่แล้ว ในระบบ และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_023_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_023_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_025_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Alert Popup Message     ${TC_025_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_026
    [Documentation]    กรณีไม่ได้ระบุ "Profile Name" และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_023_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_023_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_026_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_026_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_026_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_027
    [Documentation]    กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_023_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Auto Check Text Data Edit Page    ${TC_023_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Auto Update Data    ${TC_027_DATA}    ${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    ${EMPTY}    ${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}
    Click Button Save
    Check Validate Edit Page    ${TC_027_DATA}    ${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    ${TC_027_DATA.result.validate_data}
    Sleep    ${DELAY}


TC_028
    [Documentation]    กรณีกดปุ่ม "Cancel"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    ${TC_015_DATA.condition}
    Click Edit Botton    ${PROFILE_ID}
    Click Button Cancel
    Sleep    ${DELAY}


    