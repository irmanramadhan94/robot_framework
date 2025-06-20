# 🤖 Robot Framework Automation Project

Automated testing project for reqres, saucedemo & Lion Parcel, covering:

- ✅ API Test (Reqres as sample)
- 🖥️ Web UI Test (https://www.saucedemo.com)
- 📱 Android Mobile App Test (Lion Parcel App)

Using **Robot Framework** with modular structure.

---

## 🧰 Tech Stack

- **Robot Framework** + AppiumLibrary, SeleniumLibrary, RequestsLibrary
- **Appium** for Android test automation
- **Browser (Chrome)** for web tests
- **Reqres** for API sample tests
- **Python 3.x**, **Android SDK**, **Appium Server**

---

## 🔧 Setup Instructions

### ✅ Install Dependencies

```bash
pip install robotframework
pip install robotframework-appiumlibrary
pip install robotframework-seleniumlibrary
pip install robotframework-requests
```

### 📱 Android SDK & Appium

- Install Android Studio (ensure `platform-tools` available in PATH)
- Start Android Emulator
- Install Appium:

```bash
npm install -g appium
appium driver install uiautomator2
```

- Run Appium Server:

```bash
appium server --base-path /wd/hub
```

---

## 🚀 How to Run Tests

### 🧪 API Test

```bash
robot tests/api/reqres_api.robot
```

### 🖥️ Web Test (SauceDemo)

```bash
robot tests/web/saucedemo.robot
```

### 📱 Android Test (Lion Parcel)

```bash
robot tests/android/lionparcel_app.robot
```

---

## 📌 Sample Test Scenarios

### ✅ API (Reqres)

- ✅ Get single user successfully
- ✅ Create new user successfully
- 

### 🖥️ Web UI (Saucedemo.com)

**Test Case: E2E Buyer Flow**

- Login with standard user
- Add product to cart
- Go to cart
- Checkout and fill information
- Finish and assert success

### 📱 Android (Lion Parcel App)

**Test Case: Check Tariff Flow**

- Open App
- Tap "Cek Tarif"
- Input Origin: `Ciawi`
- Input Destination: `Cakung`
- Tap Check
- Validate shipping services (BUSSPACK, JAGOPACK, etc.)

**Negative Ideas:**
- Unavailable service route

---

## ✅ Reusable Robot Keywords

Located in `keywords/android_keywords.robot`, e.g.:

```robot
Tap Element With Text
    [Arguments]    ${text}
    Click Element    android=new UiSelector().text("${text}")
```

---

## 📷 Sample Locators

Prefer this over XPath:

```robot
android=new UiSelector().resourceId("com.lionparcel.services.consumer:id/btnCheckTariff")
```

Use `.instance()` if multiple elements exist with same ID:

```robot
android=new UiSelector().text("4-6 Hari").instance(1)
```

---

## 📌 Tips & Best Practices

- Use `noReset=true` to skip login/onboarding after first run
- Prefer **resource-id** or **text()** over **xpath**
- Use **Appium Inspector** or **uiautomatorviewer** to inspect elements
- To scroll: use `Swipe` command:
  - Down: `Swipe 500 1600 500 400 1000`
  - Up: `Swipe 500 400 500 1600 1000`

---

## 📋 Report

Robot automatically generates `log.html`, `report.html`, and `output.xml` inside `/results`.

---

## 👨‍💻 Maintainer

Created by **Irman**  
Automation Engineer | QA Specialist  
[LinkedIn : https://www.linkedin.com/in/irmanramadhan/](#) | [GitHub : https://github.com/irmanramadhan94/](#)

