*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/global_keywords.robot
Resource    ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/profile_variables.robot
Resource    ../../resources/locators/profile_locators.robot



*** Test Cases ***
TC_015 
    [Documentation]    กรณีระบุ/เลือก Profile Name, Profile Group, Profile Table, Checkbox (Active) = Active และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_015_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_015_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    # Alert Message Success   ${TC_015_DATA.result.expected_result}
    # Wait Until Keyword Succeeds   5x    5s     Page Should Contain    Save Complete.
    Sleep    ${DELAY}

TC_016
    [Documentation]    กรณีระบุ/เลือก Profile Name, Profile Group, Profile Table, Checkbox (Active) = Inactive และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_016_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    # Alert Message Success   ${TC_016_DATA.result.expected_result}
    Sleep    ${DELAY}

TC_017
    [Documentation]    กรณีไม่ได้ระบุ "Profile Name" และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Input Text Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_017_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Click Button Save
    # Alert Message Success   ${TC_016_DATA.result.expected_result}
    Sleep    ${DELAY}

TC_018
    [Documentation]    กรณีไม่ได้ระบุข้อมูล และกดปุ่ม "Save"
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Add
    Click Button Save
    # Alert Message Success   ${TC_016_DATA.result.expected_result}
    Sleep    ${DELAY}

TC_test
    Open Browser To URL    ${PROFILE_CONFIGURATION_URL}    ${BASE_BROWSER}
    Click Button Edit    ${LOCATOR_BUTTON_EDIT_CONFIGURATIONGROUP}
    Sleep    ${DELAY}