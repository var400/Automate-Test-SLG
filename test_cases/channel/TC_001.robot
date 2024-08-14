*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/channel_variables.robot
Variables    ../../data/channel_data.yaml

*** Test Cases ***
# READ DATA FROM YMAL
#     Log To Console    Read Data ${TC_001}

TC_001:TEST12
    #Load Channel Data    TC_001
    Open Browser To URL    ${HOME_URL}     ${BROWSER}
    Click Button Add
    Input Data     ${TC_001}
    Click Button Save
    Alert Message Error    Duplicate channel label.

TC_002:TEST2
    Open Browser To URL    ${HOME_URL}     ${BROWSER}
    Click Button Add
    Input Data     ${TC_002}
    Click Button Save
    Alert Message Success   Save Complete.

# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot