*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Variables    ../../resources/variables/channel_data.yaml

*** Test Cases ***
READ DATA FROM YMAL
    Log To Console    READ DATA ${TC_001}
    # Auto Input Data    ${TC_001}

TC_001:TEST12
    #Load Channel Data    TC_001
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Auto Input Data      ${TC_001}    channel_name,channel_delimiter,channel_label,channel_file_name_format,channel_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port
    Sleep    5s
    Click Button Save
    Alert Message Error    ${TC_001.result.expeted_result}

TC_002:TEST2
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Click Button Add
    Input Data     ${TC_002}
    Click Button Save
    Alert Message Success   Duplicate channel label.

# robot --test "READ DATA FROM YAML" path/to/your/test_cases/channel/TC_001.robot