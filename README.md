# 🛍️ E-Commerce Flutter App

A modern **E-Commerce** mobile application built with **Flutter**, following **Clean Architecture principles** and using **BLoC** for state management.  
This project demonstrates scalable architecture, testability, and maintainable code for production-grade apps.

---

## 📷 Screenshots

| Home | Login | SignUp |
|------|-------|--------|
| ![Home](assets/screenshots/home.png) | ![Login](assets/screenshots/login.png) | ![SignUp](assets/screenshots/signup.png) |

| Categories | Products | Products Details |
|------------|----------|------------------|
| ![Categories](assets/screenshots/categories.png) | ![Products](assets/screenshots/products.png) | ![Products Details](assets/screenshots/product_details.png) |

| Settings | Cart |
|----------|------|
| ![Settings](assets/screenshots/settings.png) | ![Login](assets/screenshots/cart.png) |


---

## 🚀 Features

### 🔐 Authentication
- User **Sign Up**, **Login**, and **Logout**
- **Form validation** and input handling
- Persistent login (FirebaseAuth or SharedPreferences)

### 🧩 Categories
- Fetch and display product categories dynamically
- Filter products by category
- Reusable UI components for clean presentation

### 🛒 Products
- Product listing with name, price, and image
- **Product Details Page** with extended info
- Add to cart (extendable feature)

---

## 🧠 State Management — BLoC

The app uses **BLoC (Business Logic Component)** to separate UI from logic, ensuring predictable and testable states.  
