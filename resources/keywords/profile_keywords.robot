*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Check Home Screen
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Main
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Create Campaign
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Dashboard
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Config
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Template Config
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Common Criteria Config
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Specific Criteria Config
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Exclude Criteria Config
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    System Configuration
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Config Datasource
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Config Profile
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Config Channel
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Config Presegment
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Setting
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    User Maintenance
    Wait Until Keyword Succeeds   5x    5s    Page Should Contain    Role Maintenance
