*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${LOCATOR_FIRST_PRODUCT_ADD_TO_CART}     //button[@id="add-to-cart-sauce-labs-backpack"]
${LOCATOR_REMOVE_BUTTON}                 //button[@id="remove-sauce-labs-backpack"]
${LOCATOR_CART_BADGE}                    //span[@class="shopping_cart_badge"]
${LOCATOR_SECOND_PRODUCT_ADD_TO_CART}    //button[@id="add-to-cart-sauce-labs-bike-light"]
${LOCATOR_SHOPPING_CART_LINK}            //a[@class='shopping_cart_link']
${LOCATOR_CART_ITEMS}                    //div[@class='cart_item']


*** Keywords ***
Add Product to Cart
#    Open Login Page
#    Enter Credentials    standard_user    secret_sauce
#    Correct Username and Password

    Wait Until Page Contains    Products    timeout=5s
    Click Element    ${LOCATOR_FIRST_PRODUCT_ADD_TO_CART}
    Wait Until Element Is Visible    ${LOCATOR_CART_BADGE}  timeout=5s
    Element Should Be Visible    ${LOCATOR_CART_BADGE}
    Wait Until Element Is Visible    ${LOCATOR_REMOVE_BUTTON}    timeout=5s
    Element Text Should Be    ${LOCATOR_REMOVE_BUTTON}    Remove


Add Products to Cart
#    Open Login Page
#    Enter Credentials    standard_user    secret_sauce
#    Correct Username and Password

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
    
    