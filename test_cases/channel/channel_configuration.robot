*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot

*** Test Cases ***
READ DATA FROM YMAL
    Input Select Option Data   ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    # Auto Input Data    ${TC_001}

TC_001
    [Documentation]    ตรวจสอบกรณีผู้ใช้ทำการเพิ่ม/แก้ไข/ลบ  Channel
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Text Data      ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Input Select Option Data   ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_001_DATA.result.expected_result}
    Create Session    myapi    http://localhost:44300/api/MasterController
    ${response}=    GET On Session  http://localhost:44300/api/MasterController/GetChannelList
    Log To Console    ${response.text}
    Close Browser

TC_002
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Text Data      ${TC_002_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Input Check Box Data    ${TC_002_DATA}    ${CHOOSE_KEY_INPUT_CHECKBOX}
    Input Select Option Data   ${TC_002_DATA}    ${CHOOSE_KEY_INPUT_SELECT_OPTION}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_002_DATA.result.expected_result}
    Sleep    ${DELAY}
    Close Browser

TC_003
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Data     ${TC_003_DATA}
    Click Button Save
    Wait Until Keyword Succeeds   5x    5s     Page Should Contain     ${TC_003_DATA.result.expected_result}
    Close Browser

# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot