*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/channel_data.yaml

*** Variables ***
${DELAY}    5s
${SQLFilePath}   test_cases/channel/clear_and_insert.sql
#ADD CHANNEL
${CHOOSE_KEY_INPUT_TEXT}    channel_name,channel_delimiter,channel_label,channel_file_name_format,channel_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active,is_header,is_teohong
${CHOOSE_KEY_INPUT_SELECT_OPTION}    channel_file_type
#CHANNEL LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    channel_name,channel_format,channel_file_type,channel_delimiter,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active
#Update/Check Edit Page Channel
${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    channel_name,channel_delimiter,channel_format,channel_label,channel_file_name_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port
${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}    is_active,is_header,is_teohong
${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    channel_file_type
#CHECK_VALIDATE
${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    channel_name,channel_delimiter,channel_format,channel_label,channel_file_name_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port,channel_file_type

#Set Variable Database
${TABLE_NAME}    slg.mst_channel_config
${COLUMN_ID}    channel_id

#${QRY_DATA_ID}    ${TABLE_NAME}${COLUMN_ID}${CONDITION}
#GET DATA
${TC_001_DATA}    ${TC_001}
${TC_002_DATA}    ${TC_002}
${TC_003_DATA}    ${TC_003}
${TC_004_DATA}    ${TC_004}
${TC_005_DATA}    ${TC_005}

#TC_002

${UL}    //ul[@class="MuiList-root MuiList-padding MuiDataGrid-menuList css-fsg6gs-MuiList-root"]//li[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-kk1bwy-MuiButtonBase-root-MuiMenuItem-root"]//*[text()="Filter"]