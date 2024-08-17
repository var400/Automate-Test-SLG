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
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Execute JavaScript  window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft += 400

Test Scroll
    ${text}=    Set Variable    ' '  
    Open Browser To URL    http://dev.awake-it.com:7300/config/ChannelList     ${BASE_BROWSER}
    Execute JavaScript  window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft += 800
    Sleep    5s
    Wait Until Element Is Visible    //div[@data-id="29"]//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall MuiDataGrid-booleanCell css-ptiqhd-MuiSvgIcon-root" and @data-value="true"]
    # Wait Until Element Is Visible    //div[@data-id="29"]//div[@data-field="is_active"]//*[text()="yes"]
    # ${title}=    Get Text      //div[@data-id="29"]//div[@data-field="is_active"]//*[text()="no"]

    # Wait Until Element Is Enabled  svg[data-testid='CheckIcon']
    # ${value}=  Get Text    //div[@data-id="28"]//div[@data-field="is_active" and (.='yes')]
    # # ${value}=  Get Text  //div[@data-id="28"]//div[@data-field="is_active"]//title
    # Log To Console    ${value}

    # //div[@data-id="28"]//div[@data-field="is_active" and (.='yes')]

Get All Elements from Scrollable Container
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    ${container}=    Get WebElement    ${CONTAINER_XPATH}
    FOR    ${i}    IN RANGE    10  # จำนวนครั้งที่ต้องการ scroll (อาจจะต้องเพิ่มหรือลด)
        Scroll In Container    ${container}
        ${elements}=    Get WebElements    ${ITEM_XPATH}
        FOR    ${element}    IN    @{elements}
            ${text}=    Get Text    ${element}
            Log To Console    ${text}
        END
    END

GET Element
    Open Browser To URL    ${CHANNEL_CONFIGURATION_URL}     ${BASE_BROWSER}
    Execute JavaScript  window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft += 800
    ${elements}=    Get WebElements    //div[@data-id="28"]
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log To Console    ${text}
    END

Click Filter
    Open Browser To URL    http://dev.awake-it.com:7300/config/ChannelList     ${BASE_BROWSER}
    Execute JavaScript  window.document.getElementsByClassName('MuiDataGrid-scrollbar MuiDataGrid-scrollbar--horizontal css-1rtad1')[0].scrollLeft += 800
    Mouse Over    //div[@class="css-yrdy0g-MuiDataGrid-columnHeaderRow"]//div[@data-field="is_active"]
    Wait Until Element Is Visible    //div[@class="css-yrdy0g-MuiDataGrid-columnHeaderRow"]//div[@data-field="is_active"]//div[@class="MuiDataGrid-menuIcon"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    //div[@class="css-yrdy0g-MuiDataGrid-columnHeaderRow"]//div[@data-field="is_active"]//div[@class="MuiDataGrid-menuIcon"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    //ul[@class="MuiList-root MuiList-padding MuiDataGrid-menuList css-fsg6gs-MuiList-root"]//li[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-kk1bwy-MuiButtonBase-root-MuiMenuItem-root"]//*[text()="Filter"]
    Wait Until Keyword Succeeds    5x    5s    Click Element    //div[@class="MuiDataGrid-panelWrapper css-1miuj5f-MuiDataGrid-panelWrapper"]//div[@class="MuiFormControl-root MuiDataGrid-filterFormValueInput css-1h08ml-MuiFormControl-root-MuiDataGrid-filterFormValueInput"]//div[@role="combobox"]    #//div[@clss="MuiSelect-select MuiSelect-standard MuiInputBase-input MuiInput-input css-1rxz5jq-MuiSelect-select-MuiInputBase-input-MuiInput-input"]
    Sleep     1s
    Wait Until Keyword Succeeds    5x    5s    Click Element   //div[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation8 MuiPopover-paper MuiMenu-paper MuiMenu-paper css-3dzjca-MuiPaper-root-MuiPopover-paper-MuiMenu-paper"]//ul[@role="listbox"]//li[text()="any"]
    Wait Until Keyword Succeeds    5x    5s    Click Element   //div[@class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-7kmsou-MuiPaper-root-MuiCard-root"]//div[@class="MuiBox-root css-i9gxme"]
    # Wait Until Keyword Succeeds    5x    5s    Click Element   //div[@class="MuiDataGrid-panelWrapper css-1miuj5f-MuiDataGrid-panelWrapper"]//div[@class="MuiDataGrid-filterForm css-1t5wrdm-MuiDataGrid-filterForm"]//div[@class="MuiFormControl-root MuiDataGrid-filterFormDeleteIcon css-rne967-MuiFormControl-root-MuiDataGrid-filterFormDeleteIcon"]//button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeSmall css-1pe4mpk-MuiButtonBase-root-MuiIconButton-root" and @title="Delete"]
    Sleep     1s


Check Click Filter
    Open Browser To URL    http://dev.awake-it.com:7300/config/ChannelList     ${BASE_BROWSER}
    Click Show All Status    any
