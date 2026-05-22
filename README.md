# Mobeen | مبين

<p align="center">
  <img src="assets/images/logo_mobeen.png" width="180" alt="Mobeen Logo"/>
</p>

<p align="center">
  <b>Empowering Hajj Operations Through Smart Field Data Collection & Real-Time Coordination</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart"/>
  <img src="https://img.shields.io/badge/Clean_Architecture-Implemented-success?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/BLoC-State_Management-blueviolet?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Supabase-Backend-green?style=for-the-badge&logo=supabase"/>
  <img src="https://img.shields.io/badge/Google_Maps-Live_Tracking-red?style=for-the-badge&logo=googlemaps"/>
</p>

---

# Overview

**Mobeen** is a smart digital platform designed to improve field operations and data collection during the Hajj season.

The application addresses major operational challenges faced by field researchers and organizers, including:

* High crowd density
* Language barriers
* Delayed communication
* Inaccurate or incomplete data collection
* Difficulty tracking field teams in real time

Mobeen transforms traditional manual workflows into a modern, intelligent, and scalable digital solution that enables faster communication, accurate reporting, live monitoring, and multilingual interaction.

---

# Problem Statement

Managing field data collection during Hajj presents significant challenges due to:

* Massive crowd gatherings
* Multi-language communication difficulties
* Time-sensitive coordination
* High probability of incomplete or inconsistent reports
* Lack of centralized real-time monitoring

These issues can negatively impact service quality and operational efficiency.

---

# Solution

Mobeen provides an integrated mobile platform that enables:

* Smart digital form management
* Real-time team tracking
* Live location monitoring
* AI-powered translation support
* Voice-to-text communication
* Centralized field operation management
* Data export and reporting

The platform improves communication between field teams and administrators while increasing data accuracy and reducing manual effort.

---

# Key Features

## Authentication & Security

* Secure login system
* OTP authentication flow
* Password setup and management
* Secure local storage implementation

## Smart Form Management

* Create and manage dynamic forms
* Assign forms to teams and users
* Fill and submit forms digitally
* Export collected data
* QR-based data collection workflow

## Real-Time Live Location Tracking

* Monitor field teams live on Google Maps
* Track movement and location updates
* Improve operational coordination
* Enhance response efficiency during field operations

## Team & Task Management

* Team creation and organization
* Task assignment system
* Real-time coordination between teams
* Field operation management

## AI Translation & Voice Features

* AI-powered multilingual translation
* Text-to-Speech (TTS)
* Voice interaction support
* Improved communication with pilgrims from different languages

## Data Export & Reporting

* Export data to CSV and Excel
* Structured reporting workflow
* Improved analytics readiness

## User & Organization Management

* User role organization
* Organization management system
* Administrative control panels

---

# Technical Highlights

* Built using **Flutter** for cross-platform mobile development
* Implemented using **Clean Architecture** principles
* Structured using **Feature-Driven Development**
* State management powered by **BLoC/Cubit**
* Dependency Injection implemented using **Injectable + GetIt**
* Backend services powered by **Supabase**
* Real-time capabilities using Supabase streams
* Google Maps integration for live tracking
* AI translation integration using **Google Generative AI**
* Secure storage implementation for sensitive data
* Modular and scalable project architecture

---

# Project Architecture

The project follows a layered Clean Architecture approach:

```text
Presentation Layer
│
├── BLoC / Cubit
├── Screens
├── Widgets
│
Domain Layer
│
├── Entities
├── Use Cases
├── Repository Contracts
│
Data Layer
│
├── Models
├── Remote Data Sources
├── Repository Implementations
│
Core Layer
│
├── Dependency Injection
├── Networking
├── Theme & Constants
├── Error Handling
├── Shared Widgets & Utilities
```

---

# Project Structure

```text
lib/
├── core/
│   ├── common/
│   ├── constants/
│   ├── di/
│   ├── errors/
│   ├── extensions/
│   ├── navigation/
│   ├── network/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── auth/
│   ├── form_management/
│   ├── home/
│   ├── live_team/
│   ├── location_management/
│   ├── organizations_managment/
│   ├── tasks/
│   ├── team/
│   ├── translate/
│   ├── user_home/
│   ├── user_profile/
│   └── users_managment/
│
├── main.dart
└── injection.dart
```

---

# Tech Stack

| Category             | Technologies                       |
| -------------------- | ---------------------------------- |
| Framework            | Flutter                            |
| Language             | Dart                               |
| State Management     | flutter_bloc / bloc                |
| Architecture         | Clean Architecture                 |
| Backend              | Supabase                           |
| Maps & Location      | Google Maps Flutter, Geolocator    |
| Dependency Injection | Injectable, GetIt                  |
| Networking           | Dio                                |
| Navigation           | GoRouter                           |
| AI & Translation     | Google Generative AI, Translator   |
| Local Storage        | Flutter Secure Storage, GetStorage |
| Voice Features       | Flutter TTS                        |
| Data Export          | CSV, Excel                         |
| Localization         | Easy Localization                  |

---

# Screenshots

## Application Preview

> Screenshots and demo recordings will be added soon.

### Authentication

* Login Screen
* OTP Verification
* Password Setup

### Home & Dashboard

* Admin Dashboard
* User Home

### Smart Forms

* Form Creation
* Form Assignment
* Form Submission

### Live Tracking

* Google Maps Live Location
* Team Monitoring

### Translation & Voice

* AI Translation Interface
* Voice Interaction Features

---

# Future Improvements

The following enhancements are planned for future releases:

* OCR integration for automatic text extraction
* Advanced analytics dashboard
* Offline-first synchronization
* Push notifications
* Enhanced AI recommendations
* Performance optimizations for large-scale events
* Web dashboard support

---

# Development Practices

This project follows professional software engineering practices including:

* Clean Architecture
* SOLID Principles
* Modular Feature Structure
* Reusable Components
* Scalable State Management
* Separation of Concerns
* Git-based Collaboration Workflow
* Consistent Naming Conventions

---

# Challenges Solved

During development, several technical and operational challenges were addressed:

* Real-time location synchronization
* Managing multilingual communication
* Structuring scalable feature modules
* Building maintainable architecture
* Handling asynchronous data streams
* Optimizing user experience for field usage
* Managing large operational workflows

---

# Team

## Developers

* **Amasi Alhazmi**
* **Ohood Albagami**

---

# Capstone Project

This project was developed as part of the **Capstone II Project**.

The objective was to demonstrate:

* Engineering excellence
* Professional architecture implementation
* Advanced state management
* Real-world problem solving
* UI/UX innovation
* Industry-level software development practices

---

## Demo

### 🎥 Demo Video

The demo video showcases the full functionality of the system:

🔗 https://drive.google.com/drive/folders/1M4pFJUMRYNhYKblUeCLO-bWv_lixnLWg?usp=drive_link
---

<p align="center">
  Built with passion, innovation, and purpose.
</p>
