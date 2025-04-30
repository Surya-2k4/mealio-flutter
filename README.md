
# 🍽️ Mealio Flutter App

Mealio is a cross-platform food recipe app developed using Flutter. It integrates Firebase for backend services and follows the MVVM (Model-View-ViewModel) architecture pattern to ensure a scalable and maintainable codebase.

---

## 🚀 Features

- 🔐 User Authentication (Firebase Auth)
- 🗂️ Recipe Categories
- 📷 Image Upload and Display (Firebase Storage)
- 🔄 Realtime Sync with Firestore
- 🔎 Search and Filter Functionality
- 🌐 Web & Mobile Support (Responsive)
- 📲 Firebase Push Notifications (Planned)

---



---

## 📁 Project Structure

```
lib/
├── models/         # Data models (e.g., User, Recipe)
├── views/          # UI Screens and Widgets
├── viewmodels/     # Business logic and data manipulation
└── main.dart       # App entry point
```

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
