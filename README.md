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
assets/ # Static files (images, fonts, icons)
│── fonts/ # Custom fonts
│── icons/ # App icons (currently empty)
│── images/
│ ├── output/ # App screenshots for README
│ ├── *.json # Lottie animation files

lib/
│── core/ # Core app utilities
│ ├── constants/ # Global constants
│ │ ├── app_colors.dart
│ │ ├── app_fonts.dart
│ │ ├── app_images.dart
│ │ └── taskcolors.dart
│ ├── functions/ # Common reusable functions
│ │ ├── navigation.dart
│ │ └── snackbar.dart
│ ├── models/ # Data models
│ │ ├── task_model.dart
│ │ └── task_model.g.dart
│ ├── services/ # Local database / services
│ │ └── localhelper.dart
│ ├── utils/ # App utilities (themes, etc.)
│ │ └── theme.dart
│ └── widgets/ # Reusable custom widgets
│ └── mainbutton.dart
│
│── features/ # App features (modules/screens)
│ ├── home/ # 🏠 Home screen (task list, dashboard)
│ │ ├── pages/
│ │ │ └── homescreen.dart
│ │ └── widgets/ # (empty for now)
│ │
│ ├── editprofile/ # 👤 Edit profile (user info, settings)
│ │ ├── pages/
│ │ │ └── edit.dart
│ │ └── widgets/ # (empty for now)
│ │
│ ├── add_task/ # ➕ Add task (form & date picker)
│ │ ├── pages/
│ │ │ └── add_task.dart
│ │ └── widgets/
│ │ └── datepicker.dart
│ │
│ ├── splash/ # 🚀 Splash screen (app intro)
│ │ └── splash.dart
│ │
│ └── uploadScreen/ # 📤 Upload screen (user image, files)
│ └── uploadscreen.dart
│
└── main.dart # App entry point
