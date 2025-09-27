*** Settings ***
Library    JMeterLibrary
Library    Process

*** Variables ***
${JMX_FILE}       ./performance_tests/jmeter/tc1/getProducts.jmx
${RESULT_FILE}    ./performance_tests/jmeter/tc1/result.jtl
${REPORT_DIR}     .performance_tests/jmeter/tc1/results/performance

*** Test Cases ***
Run JMeter Performance Test
    [Documentation]    Stress testing /api/productsList
    Run JMeter Test    ${JMX_FILE}    resultFile=${RESULT_FILE}

    JMeter Should Have Successful Tests    ${RESULT_FILE}

    Run Process    mkdir    -p    ${REPORT_DIR}

    Run Process    jmeter    -g    ${RESULT_FILE}    -o    ${REPORT_DIR}
