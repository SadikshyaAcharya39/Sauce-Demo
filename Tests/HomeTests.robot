*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   ../Pages/HomePage.robot
Test Setup    Logging In
Test Teardown    Close Browser

*** Test Cases ***
Add Product To Cart 
    Add Product To Cart
    Cart Badge Should Show    1
    Click Element   ${LOCATOR_SHOPPING_CART_LINK}
    Verify Cart Has Items

Add Products To Cart 
    Add Products To Cart
    Cart Badge Should Show    2
    Click Element   ${LOCATOR_SHOPPING_CART_LINK}
    Verify Cart Has Items
    Click Button    ${LOCATOR_CHECKOUT_BUTTON}
    Wait Until Page Contains    Checkout: Your Information    timeout=10s
    Checkout Info    Sadikshya   Acharya   44700
    Click Button    ${LOCATOR_CONTINUE_BUTTON}
    Wait Until Page Contains  Checkout: Overview    timeout=15s
    Click Button    ${LOCATOR_FINISH_BUTTON}    
    Wait Until Page Contains    Checkout: Complete!

Verify Logout Button
    Click Element    ${LOCATOR_HAMBURGER_BUTTON}
    Wait Until Element Is Visible    ${LOCATOR_ALL_MENU}   timeout=5s
    Wait Until Element Is Visible    ${LOCATOR_LOGOUT_BUTTON}   timeout=5s
    Click Element    ${LOCATOR_LOGOUT_BUTTON}
    Title Should Be    Swag Labs    timeout=5s

Verify Items Are Sorted A to Z
    Click Element    ${LOCATOR_PRODUCT_SORT}
    Click Element    ${LOCATOR_PS_ASC}

#   Locate all product name elements on the page
#   Uses SeleniumLibrary's Get WebElements to fetch a list of web elements that match
#   the CSS selector .inventory_item_name, which identify product titles.

    ${elements}=    Get WebElements    css:.inventory_item_name

#    Initialize an empty list to store product names.
#    Creates a new list named @{names} that will hold the text values of all the product name elements fetched in the previous step.

    @{names}=       Create List

#   Start a loop to process each product element.
#   Iterates over each element in the list ${elements} to extract its text content.

    FOR    ${el}    IN    @{elements}

#   Extract the product name.
#   Retrieves the visible text (product name) from the current element ${el} in the loop.
        ${text}=    Get Text    ${el}

#   Purpose: Add the product name to the list.

#   Explanation: Appends the extracted text ${text} to the list ${names} which stores all product names.
         Append To List    ${names}    ${text}
    END

#   Purpose: Create a sorted version of the product names.
#   Explanation: Uses Python's built-in sorted() function to return a new list that contains the product names in ascending alphabetical order and assigns it to ${sorted}.

    ${sorted}=    Evaluate    sorted(${names})
    Should Be Equal As Strings    ${names}    ${sorted}



Verify Items Are Sorted Z to A
    Click Element    ${LOCATOR_PRODUCT_SORT}
    Click Element    ${LOCATOR_PS_DESC}

#   Locate all product name elements on the page
    ${elements}=    Get WebElements    css:.inventory_item_name

#    Initialize an empty list to store product names.
    @{names}=       Create List

#   Start a loop to process each product element.
    FOR    ${el}    IN    @{elements}

#   Extract the product name.
        ${text}=    Get Text    ${el}

#   Purpose: Add the product name to the list.
         Append To List    ${names}    ${text}
    END

#   Purpose: Create a sorted version of the product names.
#   Explanation: Uses Python's built-in sorted() function to return a new list that contains the product names in ascending alphabetical order and assigns it to ${sorted}.

    ${sorted}=    Evaluate    sorted(${names}, reverse=True)
    Should Be Equal As Strings    ${names}    ${sorted}

Verify Items Are Sorted Low To High By Price
    Click Element    ${LOCATOR_PRODUCT_SORT}
    Click Element    ${LOCATOR_PS_L_TO_H}
    ${price_elements}=    Get WebElements    css:.inventory_item_price
    @{prices}=    Create List
    FOR    ${el}    IN    @{price_elements}
        ${price_text}=    Get Text    ${el}
        ${price}=    Evaluate    float("${price_text}".replace("$", ""))
        Append To List    ${prices}    ${price}
    END
    ${sorted}=    Evaluate    sorted(${prices})
    Should Be Equal    ${prices}    ${sorted}

Verify Items Are Sorted High To Low By Price
    Click Element    ${LOCATOR_PRODUCT_SORT}
    Click Element    ${LOCATOR_PS_H_TO_L}
    ${price_elements}=    Get WebElements    css:.inventory_item_price
    @{prices}=    Create List
    FOR    ${el}    IN    @{price_elements}
        ${price_text}=    Get Text    ${el}
        ${price}=    Evaluate    float("${price_text}".replace("$", ""))
        Append To List    ${prices}    ${price}
    END
    ${sorted}=    Evaluate    sorted(${prices}, reverse=True)
    Should Be Equal    ${prices}    ${sorted}


Verify clicking on Remove button removes cart badge
    Click Button    ${LOCATOR_FIRST_PRODUCT_ADD_TO_CART}
    Cart Badge Should Show    1
    Click Button    ${LOCATOR_REMOVE_BUTTON}
    Verify Cart Badge Disappears Or Shows Count   0


