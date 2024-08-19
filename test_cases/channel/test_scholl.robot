*** Settings ***
Library    SeleniumLibrary
Library    DatabaseLibrary
Library    OperatingSystem
Library    Collections
Library    BuiltIn
Library    XML
Resource   ../../resources/Keywords/channel_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/channel_variables.robot

*** Variables ***
${CONTAINER_XPATH}    //div[@class="MuiDataGrid-row MuiDataGrid-row--lastVisible"]
${ITEM_XPATH}    //div[@data-id="28"]

*** Keywords ***
Scroll In Container
    [Arguments]    ${container}
    Execute JavaScript    arguments[0].scrollLeft += 200;    ${container}
    
*** Test Cases ***

Click Element
