*** Settings ***
Resource    ../resources/performance_lib.robot
Suite Setup    Start Performance Session

*** Variables ***
${THRESHOLD_SIGNUP}    3.0
${THRESHOLD_LOGIN}     2.0

*** Test Cases ***
Signup Page Load Performance
    ${dur1} =    Get Page And Measure Time    /signup
    Assert Response Time Less Than    ${dur1}    ${THRESHOLD_SIGNUP}

Login Page Load Performance
    ${dur2} =    Get Page And Measure Time    /login
    Assert Response Time Less Than    ${dur2}    ${THRESHOLD_LOGIN}
