# PetPedia 🐾

A Flutter-based mobile application to manage pet profiles with an AI-powered breed recognition feature. This project was built as part of a 3-week placement-readiness plan.

## 📸 Screenshots & Demo

(This is very important! Add screenshots of your app's login screen, home screen, and the AI feature working. You can even record a short GIF of the app in action and add it here.)




## ✨ Features

- **User Authentication:** Secure user sign-up and login using Firebase Authentication.
- **Pet Profiles:** Users can create, view, and manage profiles for their pets.
- **Real-time Database:** Data is stored and synced in real-time with Cloud Firestore.
- **AI Breed Recognition:** Suggests a dog's breed by analyzing an uploaded image with a TensorFlow Lite model.

## 🛠️ Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Backend:** Firebase (Authentication, Cloud Firestore)
- **Machine Learning:** TensorFlow Lite
- **Key Packages:** `provider`, `google_fonts`, `image_picker`, `tflite_flutter`

## 🚀 Getting Started

**Prerequisites:** Flutter SDK, Firebase Account.

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/petpedia-flutter-app.git](https://github.com/your-username/petpedia-flutter-app.git)
    ```
2.  **Set up Firebase:**
    - Create a Firebase project and connect it by running `flutterfire configure`.
    - (Add any other specific setup steps here).
3.  **Run the app:**
    ```bash
    flutter pub get
    flutter run
    ```