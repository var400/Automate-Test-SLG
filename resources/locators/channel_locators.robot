*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Button_Add_ConfigurationGroup}    //div[@class="MuiBox-root css-70qvj9"]
${INPUT_TEXT_BOX_CHANNEL_NAME}      name=channel_name
${CLICK_DROPDOWN_CHANNEL_FILE_TYPE}      id=mui-component-select-channel_file_type
${INPUT_TEXT_BOX_CHANNEL_DELIMITER}      name=channel_delimiter
${INPUT_TEXT_BOX_CHANNEL_LABEL}      name=channel_label
${INPUT_TEXT_BOX_CHANNEL_FILE_NAME_FORMAT}      name=channel_file_name_format
${INPUT_TEXT_BOX_CHANNEL_FORMAT}      name=channel_format
${INPUT_TEXT_BOX_CHANNEL_TEMP_PATH}    name=channel_temp_path
${INPUT_TEXT_BOX_CHANNEL_TARGET_PATH}    name=channel_target_path
${INPUT_TEXT_BOX_CHANNEL_HOST}    name=channel_host
${INPUT_TEXT_BOX_CHANNEL_USER}    name=channel_user
${INPUT_TEXT_BOX_CHANNEL_PASS}    name=channel_pass
${INPUT_TEXT_BOX_CHANNEL_PORT}    name=channel_port
${CHECK_IS_ACTIVE}    name=is_active
${CHECK_IS_HEADER}    name=is_header
${CHECK_IS_TEOHONG}    name=is_teohong
${SAVE_BUTTON}    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth css-tj0q4n-MuiButtonBase-root-MuiButton-root" and (.='Save')]
${CANCEL_BUTTON}    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth css-tj0q4n-MuiButtonBase-root-MuiButton-root" and (.='Cancel')]
${ALERT_MESSAGE_ERROR}    //div[@class="swal2-popup swal2-modal swal2-icon-error swal2-show"]//h2
${ALERT_MESSAGE_SUCCESS}    //div[@class="swal2-popup swal2-modal swal2-icon-error swal2-show"]//h2
...    #//h2[@class="swal2-title"]