# Smooth Avatar

A customizable fade-in circular avatar widget for Flutter.

SmoothAvatar provides animated image loading, error handling and optional border styling, making it a flexible and production-ready alternative to `CircleAvatar`.

---

## ✨ Features

- Animated fade-in when image loads
- Supports `NetworkImage`, `AssetImage`, `FileImage`, and any `ImageProvider`
- Optional border color and width
- Built-in error fallback widget
- Lightweight and easy to integrate

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  smooth_avatar: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

```dart
import 'package:smooth_avatar/smooth_avatar.dart';

SmoothAvatar(
  image: NetworkImage(
    'https://randomuser.me/api/portraits/women/68.jpg',
  ),
  radius: 50,
  borderColor: Colors.blue,
  borderWidth: 3,
)
```

---

## 🛠 Example

A complete runnable example is available inside the `example/` folder of this repository.

---

## 📄 License

This package is released under the MIT License.

---

Created with ❤️ by Gregorio Cruz
