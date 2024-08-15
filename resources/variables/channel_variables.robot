*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/channel_data.yaml

*** Variables ***
${DELAY}    5s

#GET DATA
${TC_001_DATA}    ${TC_001}
${TC_002_DATA}    ${TC_002}
${TC_003_DATA}    ${TC_003}


#TC_001
${CHOOSE_KEY_INPUT_TEXT}    channel_name,channel_delimiter,channel_label,channel_file_name_format,channel_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port
${CHOOSE_KEY_INPUT_CHECKBOX}    is_active,is_header,is_teohong
${CHOOSE_KEY_INPUT_SELECT_OPTION}    channel_file_type

#TC_002