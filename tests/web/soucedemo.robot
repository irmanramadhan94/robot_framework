*** Settings ***
Resource    ../../keywords/web_keywords.robot

*** Test Cases ***
User can add items to shopping cart to checkout
    Given Login saucedemo
    When User shopping cart checkout
    Then User should be able to add items to the cart
    When User checkout
    And User fill checkout information
    And User click continue
    Then User should see checkout overview
    When User click finish
    Then User should see checkout complete
    