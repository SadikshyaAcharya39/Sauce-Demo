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
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=10s
#    ${error}= Get Text  &{LOCATOR_ERROR_MESSAGE}
#    Should Contain    ${error}
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Correct Username and Incorrect Password
    Enter Credentials    standard_user   sadikshya
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Incorrect Username and Incorrect Password
    Enter Credentials    sadikshya   sadikshya
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Empty Username and Password
    Enter Credentials   ""    ""
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Username With Different Case And Correct Password
    Enter Credentials    STANDARD_USER    secret_sauce
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Correct Username And Password With Different Case
    Enter Credentials    standard_user    SECRET_SAUCE
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Both Username And Password With Wrong Case
    Enter Credentials    STANDARD_USER    SECRET_SAUCE
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Username with leading/trailing spaces and Correct Password
    Enter Credentials   ${SPACE}standard_user${SPACE}   secret_sauce
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service

Correct Username and Password with leading/trailing spaces
    Enter Credentials   standard_user   ${SPACE}secret_sauce${SPACE}
    Wait Until Element Is Visible    ${LOCATOR_ERROR_MESSAGE}   timeout=5s
    Element Text Should Be    ${LOCATOR_ERROR_MESSAGE}   Epic sadface: Username and password do not match any user in this service