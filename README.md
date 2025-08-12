A SwiftUI-based iOS application that fetches and displays meal categories from [TheMealDB API](https://www.themealdb.com/api.php).  
This app demonstrates using the **Singleton** pattern for API calls and includes mock data for testing.

---

## 📱 Features
- Fetches meal categories from a public API.
- Displays category image, name, and description.
- Singleton API service for network calls.
- Mock data support for testing without API calls.
- Simple and clean SwiftUI UI components.

---

## 🚀 How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/category-viewer.git
   cd category-viewer
Open in Xcode

Open CategoryViewer.xcodeproj in Xcode.

Set Deployment Target

Minimum iOS version: iOS 15.0

Run the App

Select an iOS simulator or a physical device.

Press Cmd + R to build and run.

📂 Project Structure
Copy
Edit
CategoryViewer/
├── Models/
│   └── Category.swift
├── ViewModels/
│   └── CategoryViewModel.swift
├── CartManager/
│   └── CartManager.swift
├── NetworkManager/
│   └── NetworkManager.swift
├── Views/
│   ├── ContentView.swift
│   └── CartView.swift
│   └── CategoryDetailView.swift
│   └── CategoryCardView.swift
└── Assets.xcassets/


⚙️ Additional Notes
Singleton Pattern is used for API service to maintain a single shared instance.

For demonstration purposes, rating and price fields are not included in the API response.

Alert is shown in the UI at the appropriate view hierarchy level to ensure it appears correctly.

Network errors and data parsing issues are logged in the console for debugging.
