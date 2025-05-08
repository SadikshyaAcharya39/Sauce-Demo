*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_PAGE_URL}         https://www.saucedemo.com/
${LOCATOR_USERNAME}       //input[@id='user-name']
${LOCATOR_PASSWORD}       //input[@id='password']
${LOCATOR_LOGIN_BUTTON}   //input[@id='login-button']
${LOCATOR_ERROR_MESSAGE}  //h3[@data-test="error"]

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN_PAGE_URL}
    Maximize Browser Window
    Click Element    ${LOCATOR_USERNAME}
    Click Element    ${LOCATOR_PASSWORD}
    Click Element    ${LOCATOR_LOGIN_BUTTON}
    
Enter Credentials
    [Arguments]    ${username}   ${password}
    Wait Until Element Is Visible    ${LOCATOR_USERNAME}  timeout=5s
    Wait Until Element Is Visible    ${LOCATOR_PASSWORD}
    Input Text    ${LOCATOR_USERNAME}  ${username}
    Input Password    ${LOCATOR_PASSWORD}  ${password}
    Click Button    ${LOCATOR_LOGIN_BUTTON}
