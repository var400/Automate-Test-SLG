*** Settings ***
Suite Setup       Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem
Library           Collections

*** Variables ***
${DBHost}         localhost
${DBName}         postgres
${DBPass}         p@ssw0rd
${DBPort}         5432
${DBUser}         postgres

*** Test Cases ***
Get Data
    ${queryResults} =    Query    SELECT * FROM slg.mst_channel_config;
    Log To Console    ${queryResults}
    #Should Be Equal As Strings    ${queryResults[0]}

etrieve records from person table
    ${output} =    Query    SELECT * FROM slg.mst_channel_config;
    Log    ${output}