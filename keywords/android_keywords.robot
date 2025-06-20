*** Settings ***
Library           AppiumLibrary
Resource          ../resources/variables.robot

*** Keywords ***
Open LionParcel App
    Open Application    http://localhost:4723/wd/hub
    ...    platformName=Android
    ...    deviceName=emulator-5554
    ...    automationName=UiAutomator2
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true
    Sleep    3s
    Start Activity    com.lionparcel.services.consumer    com.lionparcel.services.consumer.view.main.MainActivity
    Sleep    5s

Tap Cek Tarif Button
    Wait Until Element Is Visible    android=new UiSelector().text("Cek Tarif")    10s
    Click Element    android=new UiSelector().text("Cek Tarif")
    Wait Until Element Is Visible    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtOriginAddress")    10s
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtOriginAddress")
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")
    Input Text    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")    ciawi
    Wait Until Element Is Visible    android=new UiSelector().text("Ciawi, Bogor (BGR)")    10s
    Click Element    android=new UiSelector().text("Ciawi, Bogor (BGR)")

    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtDestinationAddress")
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")
    Input Text    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")   jakarta
    Wait Until Element Is Visible    android=new UiSelector().text("Cakung")    10s
    Click Element    android=new UiSelector().text("Cakung")
    



    


