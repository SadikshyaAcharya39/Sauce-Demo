*** Settings ***
Library    SeleniumLibrary
Resource    ../Pages/LoginPage.robot

*** Variables ***
${LOCATOR_FIRST_PRODUCT_ADD_TO_CART}     //button[@id="add-to-cart-sauce-labs-backpack"]
${LOCATOR_REMOVE_BUTTON}                 //button[@id="remove-sauce-labs-backpack"]
${LOCATOR_CART_BADGE}                    //span[@class="shopping_cart_badge"]
${LOCATOR_SECOND_PRODUCT_ADD_TO_CART}    //button[@id="add-to-cart-sauce-labs-bike-light"]
${LOCATOR_SHOPPING_CART_LINK}            //a[@class='shopping_cart_link']
${LOCATOR_CART_ITEMS}                    //div[@class='cart_item']
${LOCATOR_CHECKOUT_BUTTON}               //button[normalize-space(text())='Checkout']
${LOCATOR_CHECKOUT_INFO}                 //span[normalize-space(text())='Checkout: Your Information']                     
${LOCATOR_FIRST_NAME}                    //input[@id="first-name"]
${LOCATOR_LAST_NAME}                     //input[@id="last-name"]
${LOCATOR_ZIP_CODE}                      //input[@id="postal-code"]
${LOCATOR_CONTINUE_BUTTON}               //input[@id="continue"]
${LOCATOR_CHECKOUT_OVERVIEW}             //span[normalize-space(text())='Checkout: Overview']
${LOCATOR_FINISH_BUTTON}                 //button[normalize-space(text())='Finish']
${LOCATOR_CHECKOUT_COMPLETE}             //span[normalize-space(text())='Checkout: Complete!']
${LOCATOR_HAMBURGER_BUTTON}              //button[@id="react-burger-menu-btn"]
${LOCATOR_ALL_MENU}                      //div[@class="bm-menu"]
${LOCATOR_LOGOUT_BUTTON}                 //a[@id="logout_sidebar_link"]
${LOCATOR_LOGIN_PAGE}                    //div[@class="login_wrapper-inner"]
${LOCATOR_PRODUCT_SORT}                  //select[@class="product_sort_container"]
${LOCATOR_PS_ASC}                        //option[@value="az"]
${LOCATOR_PS_DESC}                       //option[@value="za"]
${LOCATOR_PS_L_TO_H}                     //option[@value="lohi"]
${LOCATOR_PS_H_TO_L}                     //option[@value="hilo"]


*** Keywords ***

Logging In
    Open Login Page
    Enter Credentials    standard_user    secret_sauce
    Wait Until Page Contains    Products    timeout=5s

Add Product to Cart
    Logging In
    Wait Until Page Contains    Products    timeout=5s
    Click Element    ${LOCATOR_FIRST_PRODUCT_ADD_TO_CART}
    Wait Until Element Is Visible    ${LOCATOR_CART_BADGE}  timeout=5s
    Element Should Be Visible    ${LOCATOR_CART_BADGE}
    Wait Until Element Is Visible    ${LOCATOR_REMOVE_BUTTON}    timeout=5s
    Element Text Should Be    ${LOCATOR_REMOVE_BUTTON}    Remove

Add Products to Cart
    Logging In
    Wait Until Page Contains    Products    timeout=5s
    Click Element    ${LOCATOR_FIRST_PRODUCT_ADD_TO_CART}
    Click Element    ${LOCATOR_SECOND_PRODUCT_ADD_TO_CART}
    Wait Until Element Is Visible    ${LOCATOR_CART_BADGE}  timeout=5s
    Element Should Be Visible    ${LOCATOR_CART_BADGE}
    Wait Until Element Is Visible    ${LOCATOR_REMOVE_BUTTON}    timeout=5s
    Element Text Should Be    ${LOCATOR_REMOVE_BUTTON}    Remove

Cart Badge Should Show
    [Arguments]    ${count}
    ${badge_text}=    Get Text    ${LOCATOR_CART_BADGE}
    Should Be Equal    ${badge_text}    ${count}

Verify Cart Has Items
    Wait Until Page Contains Element    ${LOCATOR_CART_ITEMS}   timeout=5s
    
Checkout Info
    [Arguments]    ${firstname}   ${lastname}   ${zipcode}
    Input Text   ${LOCATOR_FIRST_NAME}   ${firstname}
    Input Text    ${LOCATOR_LAST_NAME}    ${lastname}
    Input Text    ${LOCATOR_ZIP_CODE}     ${zipcode}
    
