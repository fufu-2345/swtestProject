*** Settings ***
Resource    ../resources/performance_lib.robot
Suite Setup    Start Performance Session

*** Variables ***
${THRESHOLD}    2

*** Test Cases ***
Product Page Load Under Threshold
    ${dur} =    Get Page And Measure Time    /product_details/1
    Assert Response Time Less Than    ${dur}    ${THRESHOLD}

Product Page Under Load
    ${durations} =    Create List
    FOR    ${i}    IN RANGE    1    21
        ${d} =    Get Page And Measure Time    /product_details/1
        Append To List    ${durations}    ${d}
    END
    FOR    ${d}    IN    @{durations}
        Assert Response Time Less Than    ${d}    ${THRESHOLD}
    END