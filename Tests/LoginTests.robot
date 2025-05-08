*** Settings ***
Library    SeleniumLibrary
Resource    ../Pages/LoginPage.robot
Test Setup    Open Login Page
Test Teardown    Close Browser

*** Test Cases ***
Correct Username and Password
    Enter Credentials   standard_user    secret_sauce
#    Alert Should Be Present   timeout = 10s
#    Handle Alert    action=ACCEPT
    Wait Until Page Contains    Products  timeout=5s

Incorrect Username and CorrectPassword
    Enter Credentials    sadikshya    secret_sauce
    Error Message Should Be Displayed   ${expected_message}

Correct Username and Incorrect Password
    Enter Credentials    standard_user   sadikshya
    Error Message Should Be Displayed    ${expected_message}

Incorrect Username and Incorrect Password
    Enter Credentials    sadikshya   sadikshya
    Error Message Should Be Displayed   ${expected_message}

Empty Username and Password
    Enter Credentials   ""    ""
    Error Message Should Be Displayed   ${expected_message}

Username With Different Case And Correct Password
    Enter Credentials    STANDARD_USER    secret_sauce
    Error Message Should Be Displayed  ${expected_message}

Correct Username And Password With Different Case
    Enter Credentials    standard_user    SECRET_SAUCE
    Error Message Should Be Displayed     ${expected_message}

Both Username And Password With Wrong Case
    Enter Credentials    STANDARD_USER    SECRET_SAUCE
    Error Message Should Be Displayed    ${expected_message}

Username with leading/trailing spaces and Correct Password
    Enter Credentials   ${SPACE}standard_user${SPACE}   secret_sauce
    Error Message Should Be Displayed   ${expected_message}

Correct Username and Password with leading/trailing spaces
    Enter Credentials   standard_user   ${SPACE}secret_sauce${SPACE}
    Error Message Should Be Displayed    ${expected_message}