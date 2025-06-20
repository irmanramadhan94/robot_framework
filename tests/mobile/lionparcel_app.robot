*** Settings ***
Resource         ../../keywords/android_keywords.robot

*** Test Cases ***
User Can Cek Tarif
    Given Open LionParcel App
    And Tap Cek Tarif Button
    When User Input Origin address
    And User Input Destination address
    Then User should see the list of available shipping services like BUSSPACK
    And User see shipping services JUMBOPACK
    And User see shipping services REGPACK
    And User see shipping services JAGOPACK
    And User see shipping services BIGPACK
    and User see shipping services OTOPACK150
    And User see shipping services OTOPACK250

User input non-existent address
    Given Open LionParcel App
    When User input non-existent address
    Then User should see error message Lokasi tidak ditemukan




    
