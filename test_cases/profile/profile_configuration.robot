*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/global_keywords.robot
Resource    ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/profile_variables.robot
Resource    ../../resources/locators/profile_locators.robot



*** Test Cases ***
Test Database
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    ${PROFILE_ID}=    Get Data Id     ${COLUMN_ID}    ${TABLE_NAME}    "where ${CONDITION}='${TC_015_DATA.profile_name}'"
    Log To Console      ${PROFILE_ID}
    #${CHNNEL_ID}=    Get Data Id  ${QRY_GET_DATA_ID}
    # Click Edit Botton    ${PROFILE_ID}
    #Click Delete Botton    ${CHNNEL_ID}
    # Sleep    ${DELAY}


TC_002
    [Documentation]    กรณีกดปุ่ม "ย้อนกลับ"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
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
    Sleep    ${DELAY}


TC_016
    [Documentation]    กรณีระบุ/เลือก Profile Name, Profile Group, Profile Table, Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    Alert Popup Message     ${TC_016_DATA.result.expected_result}
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
    Alert Popup Message     ${TC_018_DATA.result.expected_result}
    Sleep    ${DELAY}


TC_019
    [Documentation]    กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    Alert Popup Message     ${TC_019_DATA.result.expected_result}
    Sleep    ${DELAY}




# TC_test
#     Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
#     Click Button Edit    ${LOCATOR_BUTTON_EDIT_CONFIGURATIONGROUP}
#     Sleep    ${DELAY}