*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${Base_URL}     http://thetestingworldapi.com/
${StudantID}    529408

*** Test Cases ***
TC_004_Delete_Request validate Delete Request
    create session      appAccess    ${Base_URL}
    ${response} =   delete request     appAccess   api/studentsDetails/${StudantID}

   # log to console  ${response.status_code}
  #  log to console  ${response.content}
    ${code} =  convert to string   ${response.status_code}
    should be equal   ${code}  200
    Should Be Equal As Strings    ${response.status_code}    200
