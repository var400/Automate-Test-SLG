*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    String
Resource   ../../resources/Keywords/create_criteria_keywords.robot
Resource   ../../resources/variables/global_variables.robot
Resource    ../../resources/variables/create_criteria_variables.robot

*** Test Cases ***
TEST KEY WORD
    # Open Browser To URL    ${CREATE_CRITERIA_URL}     ${BASE_BROWSER}
    # Choose Group Control    ${TC_002_DATA}
    # ${results_list}=    Get List From Yaml    ${TC_002_DATA['Common']}    ${TC_002_DATA['Profile_name']}
    # ${results_list}=    Get List From Yaml    ${TC_002_DATA['Exclude']}    ${TC_002_DATA['Profile_name']}
    # Genarate Script Common/Exclude    ${results_list}
    # Click Choose Channel    ${TC_001_DATA['Channel']}
    # Check Control Type    ${TC_001_DATA['Common']['Group_1']}
    # Choose Group Control    listbox    ${TC_001_DATA['Common']['Group_1']}
    # Sleep    5s
    # Get Control From DB    'Subscriber Status','Turecard Type'    'Soft Suspend','Full Suspend','Green'
    Get List From Yaml Specific   ${TC_002_DATA['Specific']}    ${TC_002_DATA['Profile_name']}
