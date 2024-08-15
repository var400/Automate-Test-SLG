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
    #Load Channel Data    TC_001
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Auto Input Data      ${TC_001}    ${CHOOSE_KEY_INPUT_TEXT}
    Sleep    ${DELAY}
    Click Button Save
    Alert Message Error    ${TC_001.result.expected_result}

TC_002:TEST2
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Data     ${TC_002}
    Click Button Save
    Alert Message Success   ${TC_001.result.expected_result}

# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot