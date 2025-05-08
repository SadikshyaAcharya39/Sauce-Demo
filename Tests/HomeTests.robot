*** Settings ***
Library    SeleniumLibrary
Resource   ../Pages/HomePage.robot
Resource    ../Pages/LoginPage.robot
Test Teardown    Close Browser

*** Test Cases ***
Add Product To Cart From Home Page
    Open Login Page
    Enter Credentials    standard_user    secret_sauce
#    Wait Until Page Contains    Products

    Add Product To Cart
    Cart Badge Should Show    1
    Click Element   ${LOCATOR_SHOPPING_CART_LINK}
    Verify Cart Has Items


Add Products To Cart From Home Page
    Open Login Page
    Enter Credentials    standard_user    secret_sauce
    Add Products To Cart
    Cart Badge Should Show    2
    Click Element   ${LOCATOR_SHOPPING_CART_LINK}
    Verify Cart Has Items



