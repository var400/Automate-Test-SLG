*** Variables ***
${BASE_URL}    http://localhost:3000
${BASE_BROWSER}    Chrome
${TIMEOUT}     10

#PATH
# ${CREATE_CRITERIA_URL}    ${BASE_URL}/create?campCode=CM-2400001&offerCode=OF-240000001324&campName=Campaign_Test&offerName=Offer_test&channel=SMS&expectedSize=5000&user=admin&productType=Prepaid&user_role=Planning
${CREATE_CRITERIA_URL}    ${BASE_URL}/create?eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjYW1wQ29kZSI6IkNNLTI0MDAwMDEiLCJvZmZlckNvZGUiOiJPRi0yNDAwMDAwMDEzMjQiLCJjYW1wTmFtZSI6IkNhbXBhaWduX1Rlc3QiLCJvZmZlck5hbWUiOiJPZmZlcl90ZXN0IiwiY2hhbm5lbCI6IlNNUyIsImV4cGVjdGVkU2l6ZSI6IjUwMDAiLCJwcm9kdWN0VHlwZSI6IlRSVUVfTU9CSUxFX1BSRVBBSUQiLCJ1c2VyX3JvbGUiOiJQbGFubmVyIiwibW9kZSI6ImVkaXQiLCJrZXkiOiJDTS0yNDAwMDAxX09GLTI0MDAwMDAwMTMyNF8xNzI4MDI2NTIzIiwibmJmIjoxNzI4MDI2NTYzLCJleHAiOjE3MjgyNDI1NjMsImlhdCI6MTcyODAyNjU2M30.jpHpbmPT2Q89wJ-wESPsYmdLjf2NeOPDlkqYvSrOLG4
${CREATE_CRITERIA_URL_NO_PERMISSTION}    ${BASE_URL}/create?campCode=CM-2400001&offerCode=OF-240000001324&campName=Campaign_Test&offerName=Offer_test&channel=SMS&expectedSize=5000&user=admin&productType=Prepaid&user_role=NoPermision
${CHANNEL_CONFIGURATION_URL}    ${BASE_URL}/config/ChannelList
${EXCLUDE_CONFIGURATION_URL}    ${BASE_URL}/config/ExcludeCriteriaList
${COMMON_CONFIGURATION_URL}    ${BASE_URL}/config/CommonCriteriaList
${SPECIFIC_COMMON_CONFIGURATION_URL}    ${BASE_URL}/config/SpecificCriteriaList
${DATASOURCE_CONFIGURATION_URL}    ${BASE_URL}/config/datasourceList
${PRESEGMENT_CONFIGURATION_URL}    ${BASE_URL}/config/PresegmentList
${PROFILE_CONFIGURATION_URL}    ${BASE_URL}/config/ProfileList
${DATASOURCE_CONFIGURATION_URL}    ${BASE_URL}/config/ChannelList