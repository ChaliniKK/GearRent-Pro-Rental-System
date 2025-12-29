# GearRent Pro - Equipment Rental Management System

Name - M.A.Chalini Kaushalya
Batch - 112
Course - Comprehensive Master Java Developer (CMJD)
Institute - Institute of Software Engineering

## Project Description
A comprehensive multi-branch equipment rental management system developed for the Comprehensive Master Java Developer (CMJD) coursework. The system manages equipment inventory, customer reservations, rentals, returns, and generates reports across multiple branches.

## Features
- Multi-branch equipment rental management
- Customer registration with membership levels
- Equipment reservation and rental system
- Automated pricing calculations
- Late fee and damage charge processing
- User role-based access control (Admin, Branch Manager, Staff)
- Comprehensive reporting system

## Technologies Used
- **Backend**: Java 23
- **Database**: MySQL 8.0
- **UI Framework**: JavaFX
- **Database Access**: JDBC
- **Architecture**: Layered Architecture (Presentation → Controller → Service → DAO → Entity)

## How to Configure the Database
1. Install MySQL 8.0+
2. Create database: `CREATE DATABASE gear_rent_pro;`
3. Run all SQL commands from `database_schema.sql` file
4. Check connection in `DBConnection.java`

## How to Run the Application
1. Open project in IntelliJ/Eclipse
2. Add MySQL connector JAR to libraries
3. Run `MainApp.java` in `ui` package
4. Application window will open

## Login Credentials
- **Admin Access**
- Username: admin
- Password: admin123
- Permissions: Full system access

- **Branch Manager**
- Username: manager1
- Password: manager123
- Branch: Panadura Branch
- Permissions: Manage their branch only

- **Staff**
- Username: staff1
- Password: staff123
- Branch: Panadura Branch
- Permissions: Daily operations for their branch
