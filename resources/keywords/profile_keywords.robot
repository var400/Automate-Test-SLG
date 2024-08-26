*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Check Output On Screen Create Criteria For Product Type
    [Arguments]    ${profile_name}    ${profile_is_active}
    ${LOCATOR_HEADER}=    Set Variable    //*[*[*[*[h5[(.='Common Criteria')]]]]]
    ${LOCATOR_TITLE}=    Set Variable    //div[label[text()="Product Type"]]
    Scroll Element Into View    ${LOCATOR_HEADER}${LOCATOR_TITLE}
    Wait Until Keyword Succeeds   5x    5s    Element Should Be Visible    ${LOCATOR_HEADER}
    Wait Until Keyword Succeeds   5x    5s    Element Should Be Visible    ${LOCATOR_TITLE}
    IF    '${profile_is_active}' == 'true'
        Wait Until Keyword Succeeds   5x    5s    Element Text Should Be    ${LOCATOR_HEADER}${LOCATOR_TITLE}//span[(.='${profile_name}')]    ${profile_name}
    ELSE IF    '${profile_is_active}' == 'false'
        Wait Until Keyword Succeeds   5x    5s    Element Should Not Be Visible    ${LOCATOR_HEADER}${LOCATOR_TITLE}//span[(.='${profile_name}')]
    END

  

  
