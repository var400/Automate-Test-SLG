*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOCATOR_HEADER_CAMPAIGN_DETAIL}    //div[div[div[@id="Header"]//*[text()="Campaign Detail"]]]
${LOCATOR_HEADER_COMMON}    //div[div[div[@id="Header"]//*[text()="Common Criteria"]]]
${LOCATOR_HEADER_EXCLUDE}    //div[div[div[@id="Header"]//*[text()="Exclusion Criteria"]]]
${LOCATOR_HEADER_SPECIFIC}    //div[div[div[@id="Header"]//*[text()="Specific Criteria"]]]
${LOCATOR_HEADER_CUSTOMSQL}    //div[div[div[@id="Header"]//*[text()="Custom SQL"]]]