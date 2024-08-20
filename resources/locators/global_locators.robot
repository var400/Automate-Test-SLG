*** Variables ***
${LOCATOR_BUTTON_ADD_CONFIGURATIONGROUP}    //div[@class="MuiBox-root css-70qvj9"]
${LOCATOR_CHECK_IS_ACTIVE}    name=is_active
${LOCATOR_SAVE_BUTTON}    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth css-tj0q4n-MuiButtonBase-root-MuiButton-root" and (.='Save')]
${LOCATOR_CANCEL_BUTTON}    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth css-tj0q4n-MuiButtonBase-root-MuiButton-root" and (.='Cancel')]
${LOCATOR_ALERT_MESSAGE_ERROR}    //div[@class="swal2-popup swal2-modal swal2-icon-error swal2-show"]//h2
${LOCATOR_ALERT_MESSAGE_SUCCESS}    //div[@class="swal2-popup swal2-modal swal2-icon-error swal2-show"]//h2
${LOCATOR_DROPDOWN_INPUT_DATA}    id=mui-component-select-
${LOCATOR_TEXT_INPUT_DATA}    name=
${LOCATOR_CHECK_BOX_INPUT_DATA}    name=
${LOCATOR_BUTTON_BACK}    //div[@class="MuiBox-root css-1pgize9"]//button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeMedium css-78trlr-MuiButtonBase-root-MuiIconButton-root"]
${LOCATOR_GROUP_TITLE_ACTIVE_LIST}   //div[@role="columnheader" and @data-field="is_active"]

${LOCATOR_ACCEPT_BUTTON_DELETE}   //div[@class="swal2-actions"]//button[text()="Yes"]
${LOCATOR_DENY_BUTTON_DELETE}   //div[@class="swal2-actions"]//button[text()="No" and @style="display: inline-block;"]