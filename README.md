# 🍽️ Mealio - A Flutter Recipe App

Mealio is a Flutter-based recipe management application built using the MVVM architecture. It features user authentication, category-wise meal organization, and Firestore integration for storing meal data and images.

---

## 🚀 Features

- Firebase Authentication (Login/Signup)
- Firestore integration for data storage
- Category-wise recipe filtering
- Image support via Firebase Storage/URL
- MVVM Architecture using Provider
- Responsive UI for Web and Mobile



## 🧠 MVVM Architecture

This project follows the MVVM (Model-View-ViewModel) pattern:

- **Model:** Represents the data (e.g., Meal, Category)
- **View:** UI built using Flutter widgets
- **ViewModel:** Handles business logic, state management using `Provider`
- **Service Layer:** Handles Firebase interactions (auth, Firestore, storage)

This clean separation improves scalability and maintainability.

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

## 📂 Git Workflow Issue Fix

If you see this error:
```
! [rejected] main -> main (fetch first)
error: failed to push some refs
```

Use:
```bash
git pull origin main --allow-unrelated-histories
git push origin main
```

---

## ✅ Done!

You're all set to explore and enhance the Mealio app!


---

## 🛠️ Issues Faced & Solutions

### 1. 🏗️ Build Issue: APK shows black screen on install

**Problem:**
- Release build APK installed successfully but only showed a black screen.

**Solution:**
Ensure:
- Firebase is initialized before `runApp()`:
  ```dart
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }
  ```
- Internet permission is included in `AndroidManifest.xml`:
  ```xml
  <uses-permission android:name="android.permission.INTERNET"/>
  ```

- Any `FutureBuilder` or async widget in `main.dart` handles null/error states correctly.

---

### 2. 🖼️ Image Not Displayed on Mobile

**Problem:**
- Images rendered fine on Web but not on Mobile.

**Solution:**
- Firestore was storing image URLs in `data:image/...` format (copied directly from Google search).
- Firebase Storage image URLs should **start with `https://`**.
- Copy image links correctly and verify by opening in browser.
- Recommended to upload to Firebase Storage and use downloadable URLs.

---

### 3. 🔒 Firebase Permission Denied

**Problem:**
- Read/Write operations failed with a “Missing or insufficient permissions” error.

**Solution:**
- Configure Firestore rules correctly:
  ```js
  service cloud.firestore {
    match /databases/{database}/documents {
      match /{document=**} {
        allow read, write: if request.auth != null;
      }
    }
  }
  ```

---

### 4. 📦 Git Push Error: "Updates were rejected"

**Problem:**
- When pushing to GitHub:
  ```bash
  error: failed to push some refs to 'https://github.com/Surya-2k4/mealio-flutter'
  hint: Updates were rejected because the remote contains work that you do not
  hint: have locally.
  ```

**Solution:**
- Pull changes before pushing:
  ```bash
  git pull origin main --rebase
  git push origin main
  ```

---

## ✅ Final Notes

- Ensure proper Firebase configuration in both `android/` and `ios/` directories.
- Test both release and debug builds before deployment.
- Always store valid, accessible URLs for remote resources like images.

---

## 🔗 Author

Created by [Surya-2k4](https://github.com/Surya-2k4)
