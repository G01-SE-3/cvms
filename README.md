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
app/                          # Main application package
├── core/                     # Core logic and business rules (Domain Layer)
│   ├── entities/             # Core domain entities 
│   ├── value_objects/        # Immutable value objects 
│   ├── services/             # Domain services
│   ├── exceptions.py         # Custom exceptions for domain logic
│   └── interfaces.py         # Interfaces for repositories, services, etc.
├── infrastructure/           # Infrastructure Layer
│   ├── repositories/         # Data access repositories
│   ├── adapters/             # Adapters for APIs, file systems, etc.
│   ├── services/             # External service handlers
│   ├── database/             # DB connection and migrations
│   │   ├── migrations/       # Migration scripts
│   │   ├── base.py           # Base database setup
│   │   └── session.py        # Database session management
│   ├── config.py             # Configuration for database, services, etc.
│   └── logger.py             # Application-wide logging setup
├── application/              # Application Layer
│   ├── use_cases/            # Use cases for specific workflows
│   │   ├── add_user.py       # Example: Adding a user
│   │   └── get_report.py     # Example: Generating a report
│   ├── services.py           # Application-level services
│   └── events.py             # Event system (optional)
├── ui/                       # Presentation Layer (UI)
│   ├── views/                # UI screens (e.g., MainWindow, Dashboard)
│   ├── components/           # Reusable UI components
│   ├── viewmodels/           # MVVM ViewModels
│   ├── controllers/          # Controllers for routing (optional)
│   └── styles/               # Stylesheets or QML files (optional)
├── tests/                    # Unit and integration tests
│   ├── core/                 # Tests for Domain Layer
│   ├── application/          # Tests for Application Layer
│   ├── infrastructure/       # Tests for Infrastructure Layer
│   └── ui/                   # Tests for Presentation Layer
├── utils/                    # Utility functions and helpers
│   ├── validators.py         # Input validators
│   ├── serializers.py        # Data serializers
│   └── helpers.py            # Miscellaneous helpers
├── main.py                   # Entry point for the application
├── config.py                 # Global configuration settings
└── requirements.txt          # Python dependencies
docs/                         # Documentation
├── architecture.md           # Detailed architecture description
├── use_cases.md              # List of use cases and workflows
└── api.md                    # API documentation (if any)
scripts/                      # Automation scripts
├── run.py                    # Script to launch the app
├── setup.py                  # Environment setup script
└── test.py                   # Script to run tests
.gitignore                    # Files and directories to ignore in git
README.md                     # Project overview and setup instructions
LICENSE                       # License file
```

### Descriptions

- **app/**: The main application package containing all the source code.

  - **core/**: Implements the core business logic and domain rules of the application.
    - **entities/**: Contains domain entities, representing the main objects within the application (e.g., User, Order).
    - **value_objects/**: Defines immutable objects used within the domain (e.g., Price, Address).
    - **services/**: Contains business logic helpers that encapsulate domain operations.
    - **exceptions.py**: Defines custom exceptions used throughout the domain.
    - **interfaces.py**: Defines interfaces for repositories and services to enforce contract adherence.

  - **infrastructure/**: Contains code that interacts with external systems and frameworks.
    - **repositories/**: Implements data access logic for various storage solutions.
    - **adapters/**: Contains adapters for integrating external APIs and file systems.
    - **services/**: Defines handlers for external services (e.g., REST APIs).
    - **database/**: Contains database connection setup and migration scripts.
      - **migrations/**: Holds migration scripts for database schema changes.
      - **base.py**: Contains the base configuration for the database connection.
      - **session.py**: Manages database sessions and transactions.
    - **config.py**: Manages application configuration settings (e.g., database credentials).
    - **logger.py**: Sets up logging configuration for the application.

  - **application/**: Manages application-specific use cases and workflows.
    - **use_cases/**: Contains individual scripts for specific application functionalities.
      - **add_user.py**: Implements the use case for adding a user to the system.
      - **get_report.py**: Implements the use case for generating reports.
    - **services.py**: Contains application-level services that provide higher-level functionality.
    - **events.py**: (Optional) Implements an event system for handling application events.

  - **ui/**: Contains all user interface components and logic.
    - **views/**: Defines the main UI screens and layouts (e.g., MainWindow, Dashboard).
    - **components/**: Reusable UI components (e.g., buttons, dialogs).
    - **viewmodels/**: Implements MVVM pattern to separate UI logic from business logic.
    - **controllers/**: (Optional) Manages the routing and communication between views and models.
    - **styles/**: Holds stylesheets or QML files for UI styling.

  - **tests/**: Contains unit and integration tests for the application.
    - **core/**: Tests related to the core business logic.
    - **application/**: Tests related to application use cases and services.
    - **infrastructure/**: Tests related to data access and external services.
    - **ui/**: Tests related to the user interface components.

  - **utils/**: Contains utility functions and helper scripts.
    - **validators.py**: Implements input validation functions.
    - **serializers.py**: Implements data serialization and deserialization functions.
    - **helpers.py**: Miscellaneous utility functions.

  - **main.py**: The entry point for the application, starting the main application loop.
  - **config.py**: Contains global configuration settings for the application.
  - **requirements.txt**: Lists the Python dependencies required for the application.

- **docs/**: Contains documentation related to the project.
  - **architecture.md**: Detailed description of the system architecture.
  - **use_cases.md**: Documentation of various use cases supported by the application.
  - **api.md**: API documentation if applicable.

- **scripts/**: Contains scripts for automation and setup.
  - **run.py**: Script to launch the application.
  - **setup.py**: Script for setting up the development environment.
  - **test.py**: Script to run the application's tests.

- **.gitignore**: Specifies files and directories to be ignored by Git.
- **README.md**: Contains the project overview, setup instructions, and other relevant information.
- **LICENSE**: License information for the project.

---


## 🚀 Getting Started  

### 📋 Prerequisites  
- 🐍 Python 3.9+  
- 🛢️ PostgreSQL (for database functionality)  

### 🛠️ Steps to Set Up  
1. Clone the repository:  
   ```bash  
   git clone https://github.com/G01-SE-3/Commercial-Violations-Management-System.git
   cd   
   ```  

2. Install dependencies:  
   ```bash  
   pip install -r requirements.txt  
   ```  

3. Run the initial database setup script:  
   ```bash  
    
   ```  

4. Launch the application:  
   ```bash  
    
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
