*** Settings ***
Library     RequestsLibrary


*** Variables ***
${Base_URL}     http://thetestingworldapi.com/
${StudantID}    529390
${StudantInvalidID}    529390x


*** Test Cases ***
TC_001_Get_Request (Retorna uma Lista de Estudantes)
    create session      Get_Studant_Details     ${Base_URL}
    ${response} =    get request         Get_Studant_Details     api/studentsDetails
    log to console  ${response.status_code}
    log to console  ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200

TC_002_Fetch_Studant_details_by_id (Obter detalhes do estudante pelo seu ID)
    create session      FetchData    ${Base_URL}
    ${response} =   get request     FetchData   api/studentsDetails/${StudantID}
    log to console  ${response.status_code}
    log to console  ${response.content}
    status should be  200
    request should be successful
    Should Be Equal As Strings    ${response.status_code}    200

    ${actualCode} =  convert to string   ${response.status_code}
    should be equal  ${actualCode}   200

TC_003_Fetch_Studant_details_invalid_id (Obter detalhes do estudante através de um ID inválido)
    create session      FetchData    ${Base_URL}
    ${response} =   get request     FetchData   api/studentsDetails/${StudantInvalidID}
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    status should be  400
    Should Be Equal As Strings    ${response.status_code}    400

    ${actualCode} =  convert to string   ${response.status_code}
    should be equal  ${actualCode}   400