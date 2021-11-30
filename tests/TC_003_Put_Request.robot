*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${Base_URL}     http://thetestingworldapi.com/
${StudantID}    529417

*** Test Cases ***
TC_002_Post_Request create new resource
    create session      AddData     ${Base_URL}
    ${body} =   create dictionary   id=${StudantID}   first_name=Isaias2   middle_name=Santos2  last_name=Silvas     date_of_birth=14/09/1989
    ${header} =  create dictionary   Content-Type=application/json

    ${response} =    put request  AddData     api/studentsDetails/${StudantID}     data=${body}    headers=${header}
    ${code} =  convert to string   ${response.status_code}
    should be equal   ${code}  200
    Should Be Equal As Strings    ${response.status_code}    200
