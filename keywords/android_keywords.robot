*** Settings ***
Library           AppiumLibrary
Resource          ../resources/variables.robot

*** Keywords ***

#User Can Cek Tarif
Given Open LionParcel App
    Open Application    http://localhost:4723/wd/hub
    ...    platformName=Android
    ...    deviceName=emulator-5554
    ...    automationName=UiAutomator2
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=true
    Sleep    3s
    # Start Activity    com.lionparcel.services.consumer    com.lionparcel.services.consumer.view.main.MainActivity
    # Sleep    5s

And Tap Cek Tarif Button
    Wait Until Element Is Visible    android=new UiSelector().text("Cek Tarif")    10s
    Click Element    android=new UiSelector().text("Cek Tarif")
When User Input Origin address
    Wait Until Element Is Visible    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtOriginAddress")    15s
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtOriginAddress")
    Wait Until Element Is Visible    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")    10s
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")
    Input Text    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")    ciawi
    Wait Until Element Is Visible    android=new UiSelector().text("Ciawi, Bogor (BGR)")    10s
    Click Element    android=new UiSelector().text("Ciawi, Bogor (BGR)")
And User Input Destination address
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtDestinationAddress")
    Wait Until Element Is Visible    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")    10s
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")
    Input Text    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")   jakarta
    Wait Until Element Is Visible    android=new UiSelector().text("Cakung")    10s
    Click Element    android=new UiSelector().text("Cakung")
    Wait Until Element Is Visible    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/btnCheckTariff")    10s
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/btnCheckTariff")
Then User should see the list of available shipping services like BUSSPACK
    #BUSSPACK
    Wait Until Element Is Visible   android=new UiSelector().text("1 Hari")    10s
    Element Should Contain Text    android=new UiSelector().text("1 Hari")    1 Hari
    Element Should Contain Text    android=new UiSelector().text("Lebih cuan! Dapat 2x Parcel Poin!")    Lebih cuan! Dapat 2x Parcel Poin!
    Element Should Contain Text    android=new UiSelector().text("Rp11.000").instance(0)    Rp11.000
    #JUMBOPACK
And User see shipping services JUMBOPACK
    Element Should Contain Text    android=new UiSelector().text("3-4 Hari").instance(0)    3-4 Hari
    Element Should Contain Text    android=new UiSelector().text("Pengiriman paket jumbo mulai 30 kg")    Pengiriman paket jumbo mulai 30 kg
    Element Should Contain Text    android=new UiSelector().text("Rp78.000")    Rp78.000
    #REGPACK
and User see shipping services REGPACK
    Swipe    500    1600    500    400    1000
    Element Should Contain Text    android=new UiSelector().text("1-2 Hari")   1-2 Hari
    Element Should Contain Text    android=new UiSelector().text("Pengiriman reguler")    Pengiriman reguler
    Element Should Contain Text    android=new UiSelector().text("Rp8.000")    Rp8.000
    #JAGOPACK
and User see shipping services JAGOPACK
    Element Should Contain Text    android=new UiSelector().text("1-4 Hari")    1-4 Hari
    Element Should Contain Text    android=new UiSelector().text("Pengiriman termurah")    Pengiriman termurah
    Element Should Contain Text    android=new UiSelector().text("Rp7.500")    Rp7.500
    #BIGPACK
and User see shipping services BIGPACK
    Element Should Contain Text    android=new UiSelector().text("3-4 Hari").instance(1)    3-4 Hari
    Element Should Contain Text    android=new UiSelector().text("Kirim paket hemat mulai dari 10kg")    Kirim paket hemat mulai dari 10kg
    Element Should Contain Text    android=new UiSelector().text("Rp30.000").instance(0)    Rp30.000
    #OTOPACK150
and User see shipping services OTOPACK150
    Element Should Contain Text    android=new UiSelector().text("4-6 Hari").instance(0)    4-6 Hari
    Element Should Contain Text    android=new UiSelector().text("Pengiriman motor dibawah 150 cc")    Pengiriman motor dibawah 150 cc
    Element Should Contain Text    android=new UiSelector().text("Rp315.500")    Rp315.500
    #OTOPACK250
and User see shipping services OTOPACK250
    Element Should Contain Text    android=new UiSelector().text("4-6 Hari").instance(1)    4-6 Hari
    Element Should Contain Text    android=new UiSelector().text("Pengiriman motor 150cc sampai 250cc")    Pengiriman motor 150cc sampai 250cc
    Element Should Contain Text    android=new UiSelector().text("Rp438.500")    Rp438.500


# Address not found
When User input non-existent address
    Swipe    500    400    500    1600    1000
    Wait Until Element Is Visible    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtOriginAddress")    15s
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtOriginAddress")
    Wait Until Element Is Visible    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")    10s
    Click Element    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")
    Input Text    android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/edtRouteSearch")    lorem ipsum dolor sit amet
Then User should see error message Lokasi tidak ditemukan
    Element Should Contain Text    android=new UiSelector().text("Lokasi tidak ditemukan")    Lokasi tidak ditemukan
    Element Should Contain Text    android=new UiSelector().text("Lokasi yang kamu masukkan tidak ada dalam daftar")   Lokasi yang kamu masukkan tidak ada dalam daftar

    


