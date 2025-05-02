# 🍽️ Mealio - A Flutter Recipe App

Mealio is a Flutter-based recipe management application built using the MVVM architecture. It features user authentication, category-wise meal organization, and Firestore integration for storing meal data and images.

📁 **Output Resources:** The `output` directory contains the working demo video, APK file, and UI screenshots.  
🚀 Access [output](./output) for the final build, demo, and visual walkthrough of the application.

---

## 🚀 Features

- Firebase Authentication (Login/Signup)
- Firestore integration for data storage
- Category-wise recipe filtering
- Image support via Firebase Storage/URL
- MVVM Architecture using Provider
- Responsive UI for Web and Mobile

---

## 🧠 MVVM Architecture in This Project

This project follows the **MVVM (Model-View-ViewModel)** architectural pattern to maintain clean separation of concerns and better scalability. Here's how each component is implemented:

### 🧩 Model
The **Model** represents the app's data layer. In this project, Firebase Cloud Firestore acts as the data source, with collections such as:
- `food-list` – Stores available food items.
- `orders` – Stores user-specific orders.
- `cart` – Temporarily holds items the user adds to their cart.

Each collection acts as a source of truth, and documents within them represent individual data entities.

### 🖼️ View
The **View** is composed of Flutter widgets that define the UI. These include screens such as:
- `CartScreen` – Displays items added to the cart.
- `MyOrdersScreen` – Shows the logged-in user's past orders.
- `HomeScreen` – Displays food items and navigation options.

The View is responsible solely for rendering UI elements and responding to user interactions.

### 🧮 ViewModel
The **ViewModel** contains the business logic and state management. It serves as a bridge between the Model and the View. For example:
- `CartViewModel` handles cart operations like adding/removing items, computing the total amount, and syncing with Firestore.
- ViewModels ensure that the UI gets updated reactively when the data changes, without directly modifying the View from the Model.

Using this separation:
- The UI remains simple and declarative.
- Logic and data handling are encapsulated and testable.
- Firestore queries and updates are centralized in the ViewModel layer, keeping code modular and easier to maintain.

### ✅ Benefits
- Easier testing and debugging.
- Separation of UI and business logic.
- Reactive and scalable architecture, ideal for Firebase-based applications.

This approach improves readability and maintainability, especially as the project grows.

---


## 🛠️ Project Setup Instructions

### Prerequisites

- ✅ [Flutter SDK](https://docs.flutter.dev/get-started/install)
- ✅ Dart
- ✅ Android Studio or VS Code
- ✅ Git
- ✅ Firebase project

### 🔧 Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Surya-2k4/mealio-flutter.git
   cd mealio-flutter
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Connect to Firebase**
   - Create a Firebase project
   - Add Android/Web apps
   - Place `google-services.json` in `android/app/`
   - Ensure web has `firebase_options.dart`

4. **Enable Firebase Services**
   - Firestore, Auth, (Optional: Storage)

5. **Run the App**
   ```bash
   flutter run
   ```

6. **Build APK**
   ```bash
   flutter build apk --release
   ```

---

## 🔗 Download APK

You can find the latest release APK of the project here:

📂 **[output/mealio.apk](output/mealio.apk)**

To install:
1. Download the APK file from the above path.
2. Transfer it to your Android device.
3. Open the file and follow the installation instructions.
4. Ensure you have allowed installations from unknown sources on your device settings.

> This APK was built in release mode and is ready for testing or distribution.


---

## 🐞 Known Issues and Fixes

### 1. 🔲 Black Screen on Release APK

- **Issue:** APK installs but only shows a black screen
- **Reason:** Improper Firebase initialization or ProGuard stripping code
- **Solutions:**
  - Ensure `WidgetsFlutterBinding.ensureInitialized()` and `await Firebase.initializeApp()` are called in `main.dart`
  - Add required rules to `proguard-rules.pro`
  - Avoid obfuscating critical Firebase classes

### 2. 🖼️ Image Not Displayed on Mobile

- **Issue:** Images load on web but not on mobile
- **Root Cause:** Image URL in Firestore starts with `data:` instead of `http://` or `https://`
- **Fix:** Always use valid image URLs (inspect by pasting in browser)

---

### 3. 🔒 Firebase Permission Denied

**Problem:**
- Read/Write operations failed with a “Missing or insufficient permissions” error.

**Solution:**
- Configure Firestore rules correctly:
  ```js
  rules_version = '2';
   service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;  
    }
  }
   }
  ```
---

## 4. **Authentication Issues** 🔒
   - Initially, I created the project for Android and tried running it on Chrome. 🌐
   - Later, I added a web app to the project in the Firebase console and included the corresponding API keys inside the `main.dart` file. This approach worked well because I checked the running platform (whether Web or Android) and initialized Firebase accordingly. ✔️
   - However, I forgot to enable Firebase Authentication in the Firebase console, which caused issues with authentication functionality. 🚫

## 5. **Cloud Firestore Issues** 📂
   - I created a Firestore collection called `food-list` for storing food items. 🍔
   - Initially, I manually inserted a single document into the collection and tried to retrieve it. However, the first attempt resulted in a "Permission Denied" error. ❌
   - To fix this, I updated the Firestore security rules to allow both read and write operations if the condition is set to true. This resolved the issue. 🔑

## 6. **Orders Screen Issues** 🛒
   - Initially, the orders screen was displaying all food items ordered by every registered user, which was not the expected behavior. Every user could see all the orders, which was incorrect. 😕
   - To resolve this, I modified the `orders` collection schema. I ensured that the `userId` of the logged-in user is stored whenever an order is placed. This way, the food details and the corresponding `userId` are stored together in the `orders` collection. 📝
   - Then, I retrieved the orders by matching the currently logged-in user's `userId` with the `userId` stored in the `orders` collection. This solution worked perfectly and ensured that only the specific user's orders were displayed. ✅

## 7. **Navigation Issues** 🔄
   - There was an issue where the back arrow navigation button appeared incorrectly on the home screen when returning from the cart screen. 🔙
   - Initially, I was using `Navigator.pushReplacementNamed`, but this caused the back button to show up incorrectly on the home screen. ⚠️
   - To resolve this, I replaced `Navigator.pushReplacementNamed` with `Navigator.pop(context)` to ensure that the correct navigation behavior was followed. This solved the issue and removed the unwanted back arrow button. 🎉


---

## ✅ Final Notes

- Ensure proper Firebase configuration in both `android/` and `ios/` directories.
- Test both release and debug builds before deployment.
- Always store valid, accessible URLs for remote resources like images.

---

## 🔗 Contact

Gmail : [suryanatarajan04@gmail.com](suryanatarajan04@gmail.com)
