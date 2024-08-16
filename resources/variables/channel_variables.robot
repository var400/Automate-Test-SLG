*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/channel_data.yaml

*** Variables ***
${DELAY}    5s
${CHOOSE_KEY_INPUT_TEXT}    channel_name,channel_delimiter,channel_label,channel_file_name_format,channel_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active,is_header,is_teohong
${CHOOSE_KEY_INPUT_SELECT_OPTION}    channel_file_type

#Set Variable Database
${TABLE_NAME}    slg.mst_channel_config
${COLUMN_ID}    channel_id
${CONDITION}    channel_label

#${QRY_DATA_ID}    ${TABLE_NAME}${COLUMN_ID}${CONDITION}
#GET DATA
${TC_002_DATA}    ${TC_002}
${TC_003_DATA}    ${TC_003}


#TC_001
${TC_001_DATA}    ${TC_001}
${TC_001_QRY_GET_DATA_ID}    SELECT channel_id FROM slg.mst_channel_config where channel_label='${TC_001_DATA.channel_label}'

#TC_002
${TC_002_QRY_GET_DATA_ID}    SELECT channel_id FROM slg.mst_channel_config where channel_label='${TC_002_DATA.channel_label}'