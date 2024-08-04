E-Commerce Web Application
Project Overview
This e-commerce web application is designed to provide a seamless shopping experience for users, allowing them to browse products, manage a shopping cart, and complete transactions online. Built using Java Servlets and JSP for server-side processing, combined with MySQL for database management, this project showcases a full-stack approach to modern web development.
![Screenshot (82)](https://github.com/user-attachments/assets/42490657-21fb-426d-907e-ee30a12f7bef)

Features
User Authentication:

Login/Logout: Users can securely log in and log out. Post-login, user-specific cart items are loaded to ensure a personalized shopping experience.
User Session Management: Maintains user sessions to keep track of user-specific data and actions.

Product Management:

Product Browsing: Users can browse a catalog of products with details such as name, price, image, and description.

Product Details: Each product page displays detailed information and allows users to add items to their shopping cart.
Shopping Cart:
![Screenshot (85)](https://github.com/user-attachments/assets/5ede4ecc-5be5-4da5-99e7-ec8496cfab5e)
![Screenshot (84)](https://github.com/user-attachments/assets/0d9ff3ce-00c3-47da-aa8b-d17946e64b07)

Add/Update/Remove Items: Users can add products to their cart, update quantities, and remove items. Cart updates are reflected immediately.
Persistent Cart: Cart contents are saved and restored even after a user logs out and logs back in.
Quantity Management: Adjustments to product quantities in the cart are handled efficiently, with duplicate items combined.
![Screenshot (85)](https://github.com/user-attachments/assets/2fdf86c8-7d9f-4127-aa36-3868fd4e808f)

Checkout Process:

Order Placement: Users can place orders by providing shipping details. The system calculates the total price and processes the transaction.
Order Confirmation: After a successful order, users are redirected to a confirmation page, and cart items are cleared from both the session and the database.
![Screenshot (86)](https://github.com/user-attachments/assets/4fc081b2-c0e9-4e2f-b911-cd235c75a918)

Database Integration:

MySQL Database: Manages user data, product information, cart items, and order details.
Order and Cart Management: Efficiently handles cart item persistence and order processing.
![Screenshot (90)](https://github.com/user-attachments/assets/e2974ff9-cfcd-4b7c-bfcc-335e4e78634a)
![Screenshot (91)](https://github.com/user-attachments/assets/a974e893-8a5f-4eeb-9afe-9df965d86cac)

Technical Stack
Frontend:

HTML/CSS: For creating a responsive and user-friendly interface.
JSP: JavaServer Pages for dynamic content generation and integration with Java Servlets.
Backend:

Java Servlets: For handling HTTP requests and responses, and managing server-side logic.
Java: The core programming language for server-side development.
MySQL: For storing user, product, cart, and order information.
JDBC: For connecting and interacting with the MySQL database.
Database Schema:

Users Table: Stores user information.
Products Table: Contains product details.
Cart Items Table: Manages items added to the cart by users.
Orders Table: Records order details.
Order Items Table: Stores the items included in each order.
Project Structure
Servlets: Handle various actions like login, cart management, and checkout.
JSP Pages: Provide the frontend for user interactions and display content dynamically.
DAO Classes: Facilitate database interactions.
Models: Represent data entities such as User, Product, and Order.
Usage
Navigating the Site: Users can browse products, view details, and add items to their cart.
Managing Cart: Users can view, update, or remove items from their cart.
Checkout: Users provide shipping details and place orders. Post-order, users receive a confirmation and the cart is cleared.
Future Enhancements
User Profiles: Add features for users to view and manage their profile information.
Product Reviews: Implement a review and rating system for products.
Advanced Search: Provide enhanced search capabilities and filtering options.
Admin Panel: Develop an admin interface for managing products, users, and orders.
