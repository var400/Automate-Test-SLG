*** Variables ***
${BASE_URL}    http://localhost:3000
${BASE_BROWSER}    Chrome
${TIMEOUT}     10

#PATH
# ${CREATE_CRITERIA_URL}    ${BASE_URL}/create?campCode=CM-2400001&offerCode=OF-240000001324&campName=Campaign_Test&offerName=Offer_test&channel=SMS&expectedSize=5000&user=admin&productType=Prepaid&user_role=Planning
${CREATE_CRITERIA_URL}    ${BASE_URL}/create?eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjYW1wQ29kZSI6IkNNLTI0MDAwMDMiLCJvZmZlckNvZGUiOiJPRi0yNDAwMDAwMDIwMDEiLCJjYW1wTmFtZSI6IkNhbXBhaWduX1Rlc3QwMDEiLCJvZmZlck5hbWUiOiJPZmZlcl9UZXN0XzExMSIsImNoYW5uZWwiOiJTTVMiLCJleHBlY3RlZFNpemUiOiI1MDAwIiwicHJvZHVjdFR5cGUiOiJUUlVFX01PQklMRV9QUkVQQUlEIiwidXNlcl9yb2xlIjoiT1dORVIiLCJtb2RlIjoiY3JlYXRlIiwia2V5IjoiQ00tMjQwMDAwM19PRi0yNDAwMDAwMDIwMDFfMTcyODUzMDIzMSIsIm5iZiI6MTcyODUzMDI4OCwiZXhwIjoxNzI4NzQ2Mjg4LCJpYXQiOjE3Mjg1MzAyODh9.Qbb710jeL1clgK2JiGUKhMOck21hT4D9-7e79xQGNXM
${CREATE_CRITERIA_URL_NO_PERMISSTION}    ${BASE_URL}/create?campCode=CM-2400001&offerCode=OF-240000001324&campName=Campaign_Test&offerName=Offer_test&channel=SMS&expectedSize=5000&user=admin&productType=Prepaid&user_role=NoPermision
${CHANNEL_CONFIGURATION_URL}    ${BASE_URL}/config/ChannelList
${EXCLUDE_CONFIGURATION_URL}    ${BASE_URL}/config/ExcludeCriteriaList
${COMMON_CONFIGURATION_URL}    ${BASE_URL}/config/CommonCriteriaList
${SPECIFIC_COMMON_CONFIGURATION_URL}    ${BASE_URL}/config/SpecificCriteriaList
${DATASOURCE_CONFIGURATION_URL}    ${BASE_URL}/config/datasourceList
${PRESEGMENT_CONFIGURATION_URL}    ${BASE_URL}/config/PresegmentList
${PROFILE_CONFIGURATION_URL}    ${BASE_URL}/config/ProfileList
${DATASOURCE_CONFIGURATION_URL}    ${BASE_URL}/config/ChannelList