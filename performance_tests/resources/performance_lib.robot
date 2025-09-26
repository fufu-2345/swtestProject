*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn

*** Variables ***
${BASE_URL}    https://automationexercise.com

*** Keywords ***
Start Performance Session
    Create Session    ae    ${BASE_URL}

Get Page And Measure Time    [Arguments]    ${path}
    ${start} =    Get Time    epoch
    ${resp} =    GET On Session    ae    ${path}    verify=${True}
    ${end} =    Get Time    epoch
    ${duration} =    Evaluate    ${end} - ${start}
    Should Be Equal As Integers    ${resp.status_code}    200
    Log    Response time for ${path} = ${duration} seconds
    RETURN    ${duration}


Assert Response Time Less Than    [Arguments]    ${duration}    ${threshold}
    Run Keyword If    ${duration} > ${threshold}    Fail    Response time ${duration} exceeded threshold ${threshold}
