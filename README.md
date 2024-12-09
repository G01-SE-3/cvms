# 📝 **Commercial Violations Management System**  

![Project Status](https://img.shields.io/badge/Status-In%20Development-yellow)  
![License](https://img.shields.io/badge/License-Educational-blue)  
![Contributors](https://img.shields.io/badge/Contributors-5-brightgreen)  

## 📖 Overview  
The **PV Management System** is a school project (Software Engineering module, ENSIA, ALGERIA2024) developed to digitize the management and processing of legal reports (*procès-verbaux*, or PVs). This application will help government entities efficiently manage PVs, offender data, and inspector information while ensuring data security and user-friendliness.  

> 🚧 **This project is currently in its initial development phase.** The structure, functionality, and features will evolve as the team progresses. Teachers have access to this repository to monitor and review our progress.

---

## 🎯 Objectives  
✅ Replace the manual process of handling PVs with a secure digital system.  
✅ Provide efficient data entry, retrieval, and report generation functionalities.  
✅ Ensure secure access and compliance with data protection standards.  

---

## 🛠️ Planned Features  

| **Feature**                | **Description**                                                                      |  
|----------------------------|--------------------------------------------------------------------------------------|  
| 🔐 **User Authentication**  | Secure login system to protect sensitive data.                                       |  
| 📋 **Offender Management**  | Add, update, and search offender details, including registration and personal data.  |  
| 📄 **PV Management**        | Create, update, search, and manage PVs associated with offenders.                   |  
| 🕵️ **Inspector Management** | Maintain inspector data and link them to PVs.                                       |  
| 📊 **Report Generation**    | Export PV and offender data into PDF summaries for administrative use.              |  

---

## 🧩 Current Status  
- **📅 Development Phase**: Initial setup and requirement analysis.  
- **📝 Team Tasks**:  
  - Setting up the repository structure.  
  - Drafting project requirements and initial designs.  
  - Defining core functionalities and user workflows.  


---

## Repository Structure

The repository is organized into several directories and files, each serving a specific purpose in the application development. Below is a breakdown of the structure:

```
cvms/
├── lib/
│   ├── main.dart                   # Entry point
│   ├── core/                       # Core utilities, constants, and shared functions
│   │   ├── constants/              # App-wide constants (e.g., colors, text styles)
│   │   ├── exceptions/             # Custom exception classes
│   │   ├── utils/                  # Helper functions and utilities
│   ├── data/                       # Data layer (Model)
│   │   ├── models/                 # Data models
│   │   ├── services/               # APIs, local database, or data sources
│   ├── domain/                     # Business logic (Controller)
│   │   ├── use_cases/              # Application-specific use cases
│   │   ├── repositories/           # Abstractions for data operations
│   ├── presentation/               # UI layer (View)
│   │   ├── screens/                # Screen widgets (pages)
│   │   ├── widgets/                # Reusable UI components
│   │   ├── themes/                 # Themes and styles
│   ├── routes/                     # App navigation routes
│   ├── controllers/                # UI Controllers for screen logic
├── assets/                         # Static assets (images, fonts, etc.)
├── test/                           # Unit and widget tests
├── pubspec.yaml                    # Project dependencies
├── analysis_options.yaml           # Code analysis rules
└── README.md                       # Project documentation
.
.
.
└──

```




## 🚀 Getting Started  

### 📋 Prerequisites  
1. **Flutter SDk**
2. **Dart SDK**
3. **IDE/Editor**
   - Install an IDE or editor to work with Flutter:
     - **Visual Studio Code** with Flutter and Dart plugins
     - **Android Studio** with Flutter and Dart plugins
     - **IntelliJ IDEA** with Flutter and Dart plugins

4. **Flutter Desktop Support**
   - Ensure you have Flutter Desktop support enabled. Follow the instructions in the [Flutter Desktop documentation](https://flutter.dev/desktop) to enable desktop support for your platform.

5. **Operating System Requirements**
   - For **Windows**:
     - You need **Visual Studio** installed with Desktop development tools (C++, Windows SDK).
   - For **macOS**:
     - You need **Xcode** installed.
   - For **Linux**:
     - Install the necessary dependencies like **GTK** and **libxi-dev**.

6. **Git**
7. **Flutter Dependencies** (Optional)
   - You may need to install additional Flutter packages. Check the `pubspec.yaml` file for required dependencies and run:
     ```bash
     flutter pub get
     ```
8. 🛢️ **PostgreSQL (for database functionality)**

### 🛠️ Steps to Set Up  
1. Clone the repository:  
   ```bash  
   git clone https://github.com/G01-SE-3/Commercial-Violations-Management-System.git
   cd   
   ```  

2. Install flutter dependencies:  
   ```bash  
   flutter pub get 
   ```  


4. Launch the application:  
   ```bash 
   flutter run
    
   ```  

---

## 🤝 Contribution Guidelines  

This project is a collaborative effort by our team. Teachers will monitor contributions and provide feedback.  

### 🛠️ Workflow  
1. Each team member should work on a specific module or feature.  
2. Create a new branch for your work:  
   ```bash  
   git checkout -b feature/<feature-name>_<developer-initials>_<YYYYMMDD>  
   ```  
3. Commit and push your changes:  
   ```bash  
   git commit -m "Add a clear description of your changes"  
   git push origin feature/<feature-name>_<developer-initials>_<YYYYMMDD>   
   ```  
4. Submit a pull request for review by the team.  

---

## 📜 License  
This project is for **educational purposes only** and is not intended for commercial use.  

---

## 📞 Contact  

For any questions or suggestions, please reach out to the project team:  
| **Role**       | **Name**       | **Email**               |  
|----------------|---------------|-------------------------|  
| Team Lead      | Safia TIFOUR     | safia.tifour@ensia.edu.dz  |  
| Contributor    | Hiba AYADI | hiba.ayadi@ensia.edu.dz|  
| Contributor    | Yousra BOUHOUIA | yousra.bouhouia@ensia.edu.dz|  
| Contributor    | Manar BENTAYEB | manar.bentayeb@ensia.edu.dz| 
| Contributor    | Lydia BENHAMOUCHE | lydia.benhamouche@ensia.edu.dz| 
