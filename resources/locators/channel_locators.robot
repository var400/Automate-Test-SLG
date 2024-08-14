*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Button_Add_ConfigurationGroup}    //div[@class="MuiBox-root css-70qvj9"]
${INPUT_TEXT_BOX_CHANNEL_NAME}      name=channel_name
${CLICK_DROPDOWN_CHANNEL_FILE_TYPE}      id=mui-component-select-channel_file_type
${CHOOSE_CHANNEL_FILE_TYPE}      //li[@data-value="txt"]
${INPUT_TEXT_BOX_CHANNEL_DELIMITER}      name=channel_delimiter