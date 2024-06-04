# IRD Hadith App

This Flutter application is a clone of the "Al Hadith" app's Hadith Details page, demonstrating a clean architecture and GetX usage. 

## Features

* **Pixel-Perfect UI Design:** The app closely mimics the design of the Al Hadith app's Hadith Details page.
* **Data from Database:** It uses the provided Sahih Bukhari database (Chapter 1) to display Hadith details.
* **GetX for State Management:**  GetX is used to manage the state and provide a reactive UI.
* **Clean Architecture:** The app follows a clean architecture pattern for better organization, maintainability, and testability.

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Noctambulist-007/IRD_Task

# Usage
1. Run the app: The app will display the Hadith Details page from the Sahih Bukhari, Chapter 1.
2. Navigate: You can explore the database by navigating through the different hadiths.

# Dependencies
1. flutter: Framework for building cross-platform mobile apps.
2. get: A powerful state management solution for Flutter apps.
3. sqflite: A database library for Flutter to interact with SQLite.
4. flutter_svg: A package for displaying SVG images in Flutter.

# Project Structure
The project follows a clean architecture structure:
   ```bash
├───lib
│   ├───data
│   │   ├───data_sources
│   │   ├───models
│   │   └───repositories
│   ├───domain
│   │   ├───entities
│   │   ├───repositories
│   │   └───usecases
│   └───presentation
│       ├───controllers
│       ├───pages
│       ├───utils
│       └───widgets
