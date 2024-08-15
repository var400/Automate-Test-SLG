*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot

*** Test Cases ***
READ DATA FROM YMAL
    Log To Console    READ DATA ${TC_001.result}
    # Auto Input Data    ${TC_001}

TC_001:TEST12
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Auto Input Data      ${TC_001_DATA}    ${CHOOSE_KEY_INPUT_TEXT}
    Click Button Save
    Alert Message Error    ${TC_001_DATA.result.expected_result}
    Sleep    ${DELAY}

TC_002:TEST2
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Data     ${TC_002_DATA}
    Click Button Save
    Alert Message Success   ${TC_002_DATA.result.expected_result}
    Sleep    ${DELAY}

# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot