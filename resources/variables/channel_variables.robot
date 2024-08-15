*** Settings ***
Library    SeleniumLibrary
Variables    ../../resources/variables/channel_data.yaml

*** Variables ***
${DELAY}    5s

#GET DATA
${TC_001_DATA}    ${TC_001}
${TC_002_DATA}    ${TC_002}

#TC_001
${CHOOSE_KEY_INPUT_TEXT}    channel_name,channel_delimiter,channel_label,channel_file_name_format,channel_format,channel_temp_path,channel_target_path,channel_host,channel_user,channel_pass,channel_port

#TC_002