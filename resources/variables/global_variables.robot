*** Variables ***
${BASE_URL}    http://localhost:3000
${BASE_BROWSER}    Chrome
${TIMEOUT}     10

#PATH
${CREATE_CRITERIA_URL}    ${BASE_URL}/create?campCode=CM-2400001&offerCode=OF-240000001324&campName=Campaign_Test&offerName=Offer_test&channel=SMS&expectedSize=5000&user=admin&productType=Prepaid&user_role=Planning
${CHANNEL_CONFIGURATION_URL}    ${BASE_URL}/config/ChannelList
${EXCLUDE_CONFIGURATION_URL}    ${BASE_URL}/config/ExcludeCriteriaList
${COMMON_CONFIGURATION_URL}    ${BASE_URL}/config/CommonCriteriaList
${SPECIFIC_COMMON_CONFIGURATION_URL}    ${BASE_URL}/config/SpecificCriteriaList
${DATASOURCE_CONFIGURATION_URL}    ${BASE_URL}/config/datasourceList
${PRESEGMENT_CONFIGURATION_URL}    ${BASE_URL}/config/PresegmentList
${PROFILE_CONFIGURATION_URL}    ${BASE_URL}/config/ProfileList