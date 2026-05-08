🎓 Online Exam App

💻 Project Description

🎯 Overview

Online Exam App is a modern Flutter application designed to provide a smooth and secure online examination experience for students. The app allows users to browse exams, answer questions, track results, and manage authentication with a clean and responsive UI.
Built using Clean Architecture and Bloc/Cubit state management, the project focuses on scalability, maintainability, and performance.

🏗️ Architecture and Structure
The project follows Clean Architecture principles with feature-based modularization.
LayerFolder(s)ResponsibilitiesPresentationpresentationUI screens, widgets, Cubits, and state handlingDomaindomainBusiness logic, entities, repository contracts, use casesDatadataAPI calls, models, local storage, repository implementationsCorecoreShared utilities, networking, constants, error handling

✨ Features
🔐 Authentication


Login & Registration


Forgot Password & OTP Verification


Secure token storage


Session management


📝 Exams


Browse available exams


View exam details


Start and submit exams


Timer-based exam sessions


Multiple-choice questions


📊 Results & Scores


Instant exam results


Score calculation


Correct/incorrect answer review


Exam history


🌍 Localization


Arabic & English support


RTL layout support


easy_localization integration


⚡ State Management

Bloc/Cubit architecture

Reactive UI updates

Separation of concerns


💉 Dependency Injection

GetIt & Injectable integration


🌐 Networking

Dio & Retrofit APIs

Error handling & interceptors

Repository pattern implementation


🛠️ Tech Stack & Dependencies
Core
Package	Purpose
flutter_bloc	State management
go_router	App routing
get_it + injectable	Dependency injection
dio + retrofit	API communication
equatable	Value equality
UI & UX
Package	Purpose
easy_localization	Localization
shimmer / skeletonizer	Loading animations
flutter_svg	SVG rendering
lottie	Animations
Data & Storage
Package	Purpose
shared_preferences	Local storage
json_serializable	JSON parsing
🚀 Getting Started
# Clone the repository
git clone <repository-link>

# Install dependencies
flutter pub get

# Run code generation
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
🧪 Testing
Type	Packages
Unit & Widget Testing	flutter_test, bloc_test
Mocking	mockito, mocktail
flutter test
🌐 Localization
assets/translations/
├── en.json
└── ar.json
🧭 App Routes
Route	Screen
/login	Login Screen
/register	Register Screen
/forgot-password	Forgot Password
/verify-code	OTP Verification
/home	Home Screen
/exams	Exams List
/exam-details	Exam Details
/questions	Exam Questions
/results	Exam Results
/profile	User Profile
