*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Keywords ***

Given Login saucedemo
    [Documentation]    Login to the Saucedemo application with provided username and password.
    Open Browser    ${WEB_URL}    ${BROWSER}    options=add_argument("--incognito")
    Maximize Browser Window
    Wait Until Element Is Visible    css:[data-test="username"]    timeout=10s
    Input Text    css:[data-test="username"]    standard_user
    Input Text   css:[data-test="password"]    secret_sauce
    Click Button    css:[data-test="login-button"]
    Wait Until Page Contains Element    css=.inventory_list
When User shopping cart checkout
    Click Button    css:[data-test="add-to-cart-sauce-labs-backpack"]
    Click Button    css:[data-test="add-to-cart-sauce-labs-bike-light"]
    Click Button    css:[data-test="add-to-cart-sauce-labs-bolt-t-shirt"]
    Click Button    css:[data-test="add-to-cart-sauce-labs-fleece-jacket"]
    Click Element    css:[data-test="shopping-cart-link"]

Then User should be able to add items to the cart
    ${prices}=    Get WebElements    css:[data-test="inventory-item-price"]
    ${qty}=    Get WebElements    css:[data-test="item-quantity"]

    Element Text Should Be    css:[data-test="item-4-title-link"]    Sauce Labs Backpack
    ${qty1}=    Get Text    ${qty[0]}
    Should Be Equal As Strings    ${qty1}    1
    ${price1}=    Get Text    ${prices[0]}
    Should Be Equal As Strings    ${price1}    $29.99

    Element Text Should Be    css:[data-test="item-0-title-link"]    Sauce Labs Bike Light
    ${qty2}=    Get Text    ${qty[1]}
    Should Be Equal As Strings    ${qty2}    1
    ${price2}=    Get Text    ${prices[1]}
    Should Be Equal As Strings    ${price2}    $9.99

    Element Text Should Be    css:[data-test="item-1-title-link"]    Sauce Labs Bolt T-Shirt
    ${qty3}=    Get Text    ${qty[2]}
    Should Be Equal As Strings    ${qty3}    1
    ${price3}=    Get Text    ${prices[2]}
    Should Be Equal As Strings    ${price3}    $15.99

    Element Text Should Be    css:[data-test="item-5-title-link"]    Sauce Labs Fleece Jacket
    ${qty4}=    Get Text    ${qty[3]}
    Should Be Equal As Strings    ${qty4}    1
    ${price4}=    Get Text    ${prices[3]}
    Should Be Equal As Strings    ${price4}    $49.99

When User checkout
    Click Button    css:[data-test="checkout"]
And User fill checkout information
    Input Text    css:[data-test="firstName"]    Irman
    Input Text    css:[data-test="lastName"]    Ramadhan
    Input Text    css:[data-test="postalCode"]    007007
And User click continue
    Click Button    css:[data-test="continue"]
Then User should see checkout overview
    Wait Until Page Contains Element    css:[data-test="title"]    timeout=10s
    Element Text Should Be    css:[data-test="title"]    Checkout: Overview

    ${prices}=    Get WebElements    css:[data-test="inventory-item-price"]
    ${qty}=    Get WebElements    css:[data-test="item-quantity"]

    Element Text Should Be    css:[data-test="item-4-title-link"]    Sauce Labs Backpack
    ${qty1}=    Get Text    ${qty[0]}
    Should Be Equal As Strings    ${qty1}    1
    ${price1}=    Get Text    ${prices[0]}
    Should Be Equal As Strings    ${price1}    $29.99

    Element Text Should Be    css:[data-test="item-0-title-link"]    Sauce Labs Bike Light
    ${qty2}=    Get Text    ${qty[1]}
    Should Be Equal As Strings    ${qty2}    1
    ${price2}=    Get Text    ${prices[1]}
    Should Be Equal As Strings    ${price2}    $9.99

    Element Text Should Be    css:[data-test="item-1-title-link"]    Sauce Labs Bolt T-Shirt
    ${qty3}=    Get Text    ${qty[2]}
    Should Be Equal As Strings    ${qty3}    1
    ${price3}=    Get Text    ${prices[2]}
    Should Be Equal As Strings    ${price3}    $15.99

    Element Text Should Be    css:[data-test="item-5-title-link"]    Sauce Labs Fleece Jacket
    ${qty4}=    Get Text    ${qty[3]}
    Should Be Equal As Strings    ${qty4}    1
    ${price4}=    Get Text    ${prices[3]}
    Should Be Equal As Strings    ${price4}    $49.99

    Element Text Should Be    css:[data-test="payment-info-label"]    Payment Information:
    Element Text Should Be    css:[data-test="payment-info-value"]    SauceCard #31337
    Element Text Should Be    css:[data-test="shipping-info-label"]    Shipping Information:
    Element Text Should Be    css:[data-test="shipping-info-value"]    Free Pony Express Delivery!
    Element Text Should Be    css:[data-test="total-info-label"]    Price Total
    Element Text Should Be    css:[data-test="subtotal-label"]    Item total: $105.96000000000001
    Element Text Should Be    css:[data-test="tax-label"]    Tax: $8.48
    Element Text Should Be    css:[data-test="total-label"]    Total: $114.44

When User click finish
    Click Button    css:[data-test="finish"]
Then User should see checkout complete
    Element Text Should Be    css:[data-test="title"]    Checkout: Complete!
    Element Text Should Be    css:[data-test="complete-header"]    Thank you for your order!
    Element Text Should Be    css:[data-test="complete-text"]    Your order has been dispatched, and will arrive just as fast as the pony can get there!









    




