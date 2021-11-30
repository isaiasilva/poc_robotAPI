*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${Base_URL}     http://thetestingworldapi.com/


*** Test Cases ***
TC_002_Post_Request create new resource
    create session      AddData     ${Base_URL}
    ${body} =   create dictionary   first_name=Isaias   middle_name=Santos  last_name=Silva     date_of_birth=14/09/1989
    ${header} =  create dictionary   Content-Type=application/json

    ${response} =    post request   AddData     api/studentsDetails     data=${body}    headers=${header}
    ${code} =  convert to string   ${response.status_code}
    should be equal   ${code}  201
    Should Be Equal As Strings    ${response.status_code}    201
