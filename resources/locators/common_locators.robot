*** Variables ***
${Button_Add_ConfigurationGroup}    //div[@class="MuiBox-root css-70qvj9"]
${CHECK_IS_ACTIVE}    name=is_active
${SAVE_BUTTON}    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth css-tj0q4n-MuiButtonBase-root-MuiButton-root" and (.='Save')]
${CANCEL_BUTTON}    //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-colorPrimary MuiButton-fullWidth css-tj0q4n-MuiButtonBase-root-MuiButton-root" and (.='Cancel')]
${ALERT_MESSAGE_ERROR}    //div[@class="swal2-popup swal2-modal swal2-icon-error swal2-show"]//h2
${ALERT_MESSAGE_SUCCESS}    //div[@class="swal2-popup swal2-modal swal2-icon-error swal2-show"]//h2
...    #//h2[@class="swal2-title"]