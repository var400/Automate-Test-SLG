*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/locators/datasource_locators.robot

*** Keywords ***
Click Button Test Connect
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_TEST_CONNECT_BUTTON}
    Click Element   ${LOCATOR_TEST_CONNECT_BUTTON}
    Sleep    1s


Check Connect Status
    [Arguments]    ${connect_status}
    ${LOCATOR_TITLE}=    Set Variable    //*[*[*[text()=" Connect Status : "]]]
    ${LOCATOR_CONNECT_STATUS}=    Set Variable    //*[text()='${connect_status}']
    Wait Until Keyword Succeeds    5x    5s    Scroll Element Into View    ${LOCATOR_TITLE}${LOCATOR_CONNECT_STATUS}
    Run Keyword If    '${connect_status}' == 'Success'    Element Text Should Be    ${LOCATOR_CONNECT_STATUS}    ${connect_status}
    Run Keyword If    '${connect_status}' == 'Fail'    Element Text Should Be    ${LOCATOR_CONNECT_STATUS}    ${connect_status}
    Run Keyword If    '${connect_status}' == '-'    Element Text Should Be    ${LOCATOR_CONNECT_STATUS}    ${connect_status}


    # IF    '${connect_status}' == 'Success'
    #     Wait Until Keyword Succeeds    5x    5s    Element Text Should Be    ${LOCATOR_CONNECT_STATUS}    ${connect_status}
    # ELSE IF     '${connect_status}' == 'Fail'
    #     Wait Until Keyword Succeeds    5x    5s    Element Text Should Be    ${LOCATOR_CONNECT_STATUS}    ${connect_status}
    # ELSE IF     '${connect_status}' == '-'
    #     Wait Until Keyword Succeeds    5x    5s    Element Text Should Be    ${LOCATOR_CONNECT_STATUS}    ${connect_status}
    # END
