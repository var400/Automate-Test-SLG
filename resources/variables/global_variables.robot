*** Variables ***
${BASE_URL}    http://localhost:3000/
${BASE_BROWSER}    Chrome
${TIMEOUT}     10

#PATH
${CHANNEL_CONFIGURATION_URL}    ${BASE_URL}config/ChannelList
${EXCLUDE_CONFIGURATION_URL}    ${BASE_URL}config/ExcludeCriteriaList
${COMMON_CONFIGURATION_URL}    ${BASE_URL}config/CommonCriteriaList
${SPECIFIC_COMMON_CONFIGURATION_URL}    ${BASE_URL}config/SpecificCriteriaList
${DATASOURCE_CONFIGURATION_URL}    ${BASE_URL}config/datasourceList
${PRESEGMENT_CONFIGURATION_URL}    ${BASE_URL}config/PresegmentList
${PROFILE_CONFIGURATION_URL}    ${BASE_URL}config/ProfileList