*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/src/channel_data.yaml

*** Variables ***
${DELAY}    5s


#CLEAR AND INSERT DATA
${SQLFilePath}   test_cases/channel/clear_and_insert.sql


#SET VARIABLE DATABASE
${TABLE_NAME}    slg.mst_channel_config
${COLUMN_ID}    channel_id


#GET DATA
${TC_010_DATA}    ${TC_010}
${TC_012_DATA}    ${TC_012}
${TC_015_DATA}    ${TC_015}
${TC_016_DATA}    ${TC_016}
${TC_017_DATA}    ${TC_017}
${TC_018_DATA}    ${TC_018}
${TC_019_DATA}    ${TC_019}
${TC_020_DATA}    ${TC_020}
${TC_021_DATA}    ${TC_021}
${TC_022_DATA}    ${TC_022}
${TC_023_DATA}    ${TC_023}
${TC_024_DATA}    ${TC_024}
${TC_025_DATA}    ${TC_025}
${TC_026_DATA}    ${TC_026}
${TC_027_DATA}    ${TC_027}
${TC_028_DATA}    ${TC_028}
${TC_029_DATA}    ${TC_029}
${TC_030_DATA}    ${TC_030}
${TC_031_DATA}    ${TC_031}
${TC_032_DATA}    ${TC_032}
${TC_033_DATA}    ${TC_033}
${TC_034_DATA}    ${TC_034}
${TC_035_DATA}    ${TC_035}
${TC_036_DATA}    ${TC_036}
${TC_040_DATA}    ${TC_040}
${TC_041_DATA}    ${TC_041}
${TC_042_DATA}    ${TC_042}
${TC_043_DATA}    ${TC_043}
${TC_044_DATA}    ${TC_044}
${TC_045_DATA}    ${TC_045}
${TC_046_DATA}    ${TC_046}
${TC_047_DATA}    ${TC_047}
${TC_048_DATA}    ${TC_048}
${TC_049_DATA}    ${TC_049}
${TC_050_DATA}    ${TC_050}
${TC_051_DATA}    ${TC_051}
${TC_052_DATA}    ${TC_052}
${TC_053_DATA}    ${TC_053}
${TC_054_DATA}    ${TC_054}
${TC_055_DATA}    ${TC_055}
${TC_056_DATA}    ${TC_056}
${TC_057_DATA}    ${TC_057}
${TC_058_DATA}    ${TC_058}
${TC_059_DATA}    ${TC_059}
${TC_060_DATA}    ${TC_060}


#CHANNEL LIST
${CHOOSE_KEY_CHECK_LIST_TEXT_DATA}    channel_name,channel_format,channel_file_type,channel_delimiter,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass
${CHOOSE_KEY_CHECK_LIST_BOOLEAN_DATA}    is_active


#ADD CHANNEL
${CHOOSE_KEY_INPUT_TEXT}    channel_name,channel_delimiter,channel_label,channel_file_name_format,channel_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active,is_header,is_teohong
${CHOOSE_KEY_INPUT_SELECT_OPTION}    channel_file_type


#UPDATE/CHECK EDIT PAGE CHANNEL
${CHOOSE_KEY_EDIT_PAGE_TEXT_DATA}    channel_name,channel_delimiter,channel_format,channel_label,channel_file_name_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port
${CHOOSE_KEY_EDIT_PAGE_CHECKBOX_DATA}    is_active,is_header,is_teohong
${CHOOSE_KEY_EDIT_PAGE_SELECT_OPTION}    channel_file_type


#CHECK_VALIDATE
${CHOOSE_KEY_VALIDATE_DATA_EDIT_PAGE}    channel_name,channel_delimiter,channel_format,channel_label,channel_file_name_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port,channel_file_type








#${QRY_DATA_ID}    ${TABLE_NAME}${COLUMN_ID}${CONDITION}

#TC_002
${UL}    //ul[@class="MuiList-root MuiList-padding MuiDataGrid-menuList css-fsg6gs-MuiList-root"]//li[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-kk1bwy-MuiButtonBase-root-MuiMenuItem-root"]//*[text()="Filter"]