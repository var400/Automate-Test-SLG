*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
Save Data And Get ID
    ${response}=    GET  ${CHANNEL_CONFIGURATION_URL}/SaveChannel
    Log To Console    ${response}

    Create Session    myapi    http://localhost:44300/api/MasterController
    ${response}=    GET On Session  http://localhost:44300/api/MasterController/GetChannelList
    Log To Console    ${response.text}