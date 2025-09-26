*** Settings ***
Resource    ../resources/performance_lib.robot
Suite Setup    Start Performance Session

*** Variables ***
${THRESHOLD}    2.0    

*** Test Cases ***
Homepage Response Time Under Threshold
    ${dur} =    Get Page And Measure Time    /
    Assert Response Time Less Than    ${dur}    ${THRESHOLD}

Homepage Stress Under Load
    ${durations} =    Create List
    FOR    ${i}    IN RANGE    1    11
        ${d} =    Get Page And Measure Time    /
        Append To List    ${durations}    ${d}
    END
    FOR    ${d}    IN    @{durations}
        Assert Response Time Less Than    ${d}    ${THRESHOLD}
    END

