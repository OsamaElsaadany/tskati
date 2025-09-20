# 📌 Tskaty – Task Management App  

A modern **Flutter task management app** with **dark & light themes**, smooth UI, and **local caching** using Hive for offline-first experience.  
Manage your tasks efficiently with simple UI and persistent storage.  

---

## ✨ Features  

- ✅ Beautiful Splash Screen  
- ✅ Add / Edit / Delete Tasks  
- ✅ User Profile (Light & Dark Mode)  
- ✅ Local Data Persistence with **Hive**  
- ✅ Dark & Light Themes  
- ✅ Smooth Animations & Modern UI  

---

## 🛠 Tech Stack  

- **Flutter** (UI + State Management)  
- **Hive** (Local database – fast NoSQL caching)  
- **Lottie Animations**  
- **Shared Preferences** (lightweight storage)  
- **Intl** (date & time formatting)  

---

## 📱 Screenshots  

### 🌞 Light Mode  
| Add Task | Home | Edit Task | User Upload |  
|----------|------|-----------|-------------|  
| ![addtask](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/addtask.png) | ![home](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/home.png) | ![edit](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/edit.png) | ![userupload](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/userupload.jpg) |  

---

### 🌙 Dark Mode  
| Home | Add Task | Empty Home | Edit Profile |  
|------|----------|------------|--------------|  
| ![darckhome](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/darckhome.png) | ![darkaddtask](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/darkaddtask.png) | ![darkemptyhome](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/darkemptyhome.png) | ![darkeditprofile](https://github.com/OsamaElsaadany/tskati/blob/main/assets/images/output/darkeditprofile.png) |  

---

## 💾 Caching in Flutter  

Caching = saving data locally on device to improve performance and reduce battery usage.  

### Types of Caching  
1. **In-Memory Cache** – fast, temporary (lost on app close)  
2. **Local Storage Cache** – persists after app close  
   - 🔹 SharedPreferences → key-value pairs  
   - 🔹 SQLite / Drift / ObjectBox → relational / structured data  
   - 🔹 Hive → **fastest**, NoSQL, great for objects  
   - 🔹 flutter_cache_manager → caching images & files  

### 🔑 Why Hive?  
- Super fast & lightweight  
- Supports storing **custom objects** with `TypeAdapter`  
- Perfect for small/medium data apps  
- Faster than SharedPreferences or SQLite  

---

## 📂 Project Structure  

project_root/
├── assets/
│   ├── fonts/
│   ├── icons/
│   └── images/
│       ├── output/
│       └── (lottie json files...)
│
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_fonts.dart
│   │   │   ├── app_images.dart
│   │   │   └── taskcolors.dart
│   │   │
│   │   ├── functions/
│   │   │   ├── navigation.dart
│   │   │   └── snackbar.dart
│   │   │
│   │   ├── models/
│   │   │   ├── task_model.dart
│   │   │   └── task_model.g.dart
│   │   │
│   │   ├── services/
│   │   │   └── localhelper.dart
│   │   │
│   │   ├── utils/
│   │   │   └── theme.dart
│   │   │
│   │   └── widgets/
│   │       └── mainbutton.dart
│   │
│   ├── features/
│   │   ├── home/
│   │   │   ├── pages/
│   │   │   │   └── homescreen.dart
│   │   │   └── widgets/
│   │   │
│   │   ├── editprofile/
│   │   │   ├── pages/
│   │   │   │   └── edit.dart
│   │   │   └── widgets/
│   │   │
│   │   ├── add_task/
│   │   │   ├── pages/
│   │   │   │   └── add_task.dart
│   │   │   └── widgets/
│   │   │       └── datepicker.dart
│   │   │
│   │   ├── splash/
│   │   │   └── splash.dart
│   │   │
│   │   └── uploadScreen/
│   │       └── uploadscreen.dart
│   │
│   └── main.dart
│
└── pubspec.yaml
