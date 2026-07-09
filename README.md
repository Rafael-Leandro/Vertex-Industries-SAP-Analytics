# 🚀 Vertex Industries – SAP Analytics Project

### End-to-End Data Analytics Project using SQL, Python, MySQL and Power BI

> Enterprise Business Intelligence Project inspired by SAP ERP environments.

![Python](https://img.shields.io/badge/Python-3.12-blue)  ![MySQL](https://img.shields.io/badge/MySQL-Database-orange)  ![SQL](https://img.shields.io/badge/SQL-Advanced-blue)  ![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)  ![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black)  ![License](https://img.shields.io/badge/License-MIT-green)

## 📑 Table of Contents

- About
- Business Scenario
- Architecture
- Technologies
- Database Model
- Python Automation
- SQL Analytics
- Power BI Dashboard
- Business KPIs
- Project Structure
- Installation
- Future Improvements

## 📖 About the Project

Vertex Industries is a fictional technology company created to simulate a real-world SAP ERP environment.

The objective of this project is to demonstrate the complete lifecycle of a Business Intelligence solution, including database design, data generation, SQL analytics, and executive dashboard development.

Unlike projects focused only on dashboard creation, this solution reproduces an enterprise workflow similar to those used by organizations that rely on ERP systems such as SAP.

## 🏢 Business Scenario

Vertex Industries is a fictional Brazilian technology company specializing in enterprise infrastructure, industrial automation, logistics solutions, and networking equipment.

As the company expanded its operations across multiple states, the volume of transactional data increased significantly. Information related to customers, sales orders, products, inventory, payments, and deliveries became distributed across different business processes, making it difficult for managers to obtain a consolidated view of the company's performance.

To address this challenge, an end-to-end Business Intelligence solution was developed, inspired by SAP ERP environments. The solution integrates transactional data into an analytical model, enabling the creation of executive dashboards that support strategic decision-making.

The project simulates the complete business workflow, from customer registration and sales order generation to payment processing, logistics management, and executive reporting.

This approach demonstrates how data can be transformed into actionable business insights through SQL, Python automation, MySQL, and Power BI.

![Business Scenario](images/Scenario.png)

## 🏗️ Solution Architecture

The solution was designed following a layered architecture commonly found in enterprise Business Intelligence projects.

The workflow starts with transactional data stored in a relational database. Python scripts automatically generate realistic business data, which is then processed through SQL analytical views. Finally, Power BI consumes these views to build executive dashboards that support business decision-making.

### Architecture Overview

![Architecture](images/Architecture.png)

### Architecture Description

The project follows a layered Business Intelligence architecture inspired by SAP ERP environments.

The relational database stores transactional information such as customers, orders, products, payments and deliveries.

Python scripts automate the generation of realistic business records, simulating daily ERP operations.

SQL analytical views transform transactional data into optimized datasets for reporting.

Power BI connects directly to these analytical views, enabling interactive dashboards focused on executive decision-making.

## 🛠️ Technology Stack

The project combines database modeling, data engineering, automation, analytics, and business intelligence technologies to simulate an enterprise SAP-inspired environment.

| Technology | Purpose | Role in the Project |
|------------|---------|---------------------|
| **Python** | Data Generation & Automation | Generates realistic customers, orders, payments, deliveries and other transactional records. |
| **Pandas** | Data Manipulation | Supports data processing and preparation during the automation phase. |
| **Faker** | Synthetic Data Generation | Creates realistic business information for customers and transactions. |
| **MySQL** | Relational Database | Stores all transactional ERP data. |
| **SQL** | Data Query & Analytics | Responsible for analytical queries, KPIs and SQL Views. |
| **Power BI** | Business Intelligence | Builds interactive dashboards and executive reports. |
| **Git** | Version Control | Tracks project evolution and source code changes. |
| **GitHub** | Project Repository | Hosts documentation, source code and project artifacts. |

## 💡 Why These Technologies?

The selected technologies were chosen to reproduce a complete Business Intelligence pipeline commonly found in enterprise environments.

Python automates transactional data generation.

MySQL provides a structured relational database similar to ERP systems.

SQL transforms transactional records into analytical datasets.

Power BI delivers interactive dashboards for strategic decision-making.

Git and GitHub ensure version control and professional project documentation.

## 🎯 Skills Demonstrated

- Relational Database Modeling

- SQL Development

- Data Engineering Fundamentals

- Python Automation

- Business Intelligence

- Dashboard Design

- KPI Development

- Data Visualization

- ERP Business Processes

- Business Analytics

## 🗄️ Database Model

The Vertex Industries database was designed following relational database principles commonly used in ERP systems.

Its primary objective is to support the complete operational lifecycle of the company, including customer management, sales processing, inventory, financial transactions, and logistics.

The data model was intentionally normalized to reduce redundancy, maintain data integrity, and simplify analytical processing.

This structure also enables the creation of optimized SQL Views for Business Intelligence and reporting purposes.

## 📊 Entity Relationship Diagram

The following diagram illustrates the relational database model used throughout the project.

![Database Model](images/Database_Model.png)

## 📋 Database Structure

| Table | Description | Business Purpose | 
|--------|-------------|-------------|
| Customers | Stores customer registration information | Acts as the starting point of every commercial transaction |
| Products | Stores products available for sale | Provides the product catalog used in sales orders |
| Orders | Stores customer purchase orders | Represents the central business transaction within the ERP workflow |
| Order_Items | Stores all products associated with each order | Creates the many-to-many relationship between Orders and Products |
| Payments | Stores payment information | Supports financial reporting and payment tracking |
| Deliveries | Stores shipment and delivery information | Supports logistics analysis and delivery performance indicators |
| Inventory | Stores product stock levels | Provides the products stock level and warns when it reaches the minimum level |

## 📌 Business Rules

- A customer may place multiple orders.

- Every order belongs to exactly one customer.

- An order may contain multiple products.

- Every product can appear in multiple orders.

- Every order generates one payment record.

- Every order generates one delivery record.

- Payments may be Pending, Processing or Paid.

- Deliveries may be Processing, In Transit or Delivered.

## 🤖 Python Automation

Python was used to automate the generation of realistic business data, simulating the daily operations of an ERP system.

Instead of relying on static CSV files, the project dynamically creates customers, products, orders, order items, payments, and deliveries while preserving the relationships between entities.

This approach makes the dataset scalable, reproducible, and much closer to real enterprise environments.

## ⚙️ Data Generation Process

The automation follows a logical business sequence:

1. Customer records are generated.
2. Products are created with prices and costs.
3. Sales orders are generated.
4. Order items are associated with each order.
5. Payment records are created.
6. Delivery records are generated.
7. Data is inserted into the MySQL database.

## 📚 Python Libraries

| Library | Purpose |
|----------|----------|
| Faker | Generates realistic company names, addresses and contact information |
| Pandas | Data manipulation and preparation |
| Random | Simulates business scenarios |
| Datetime | Generates realistic business dates |

## 🎯 Automation Outcome

The automated data generation process allows the database to be rebuilt at any time with consistent and realistic business information.

This approach reproduces enterprise data pipelines and eliminates the need for manually created datasets.

## 🧠 Skills Demonstrated

- Python Programming

- Data Automation

- Relational Data Generation

- ETL Fundamentals

- Data Engineering Concepts

- ERP Process Simulation

## 📊 SQL Analytical Views

To support Business Intelligence and executive reporting, a set of SQL analytical views was created on top of the transactional database.

These views consolidate data from multiple tables, reducing query complexity and providing optimized datasets for Power BI.

This architecture follows a common approach adopted in enterprise ERP environments, where analytical layers are separated from operational data.

### 📈 vw_dashboard_executivo

**Purpose**

Provides high-level business indicators for executive dashboards.

**Business Value**

This view consolidates the main KPIs required by managers and executives, eliminating the need for complex calculations inside Power BI.

**Main Indicators**

- Total Revenue
- Total Orders
- Average Ticket
- Total Customers

### 💼 vw_vendas_comercial

**Purpose**

Consolidates customer, product and sales information into a single analytical dataset.

**Business Value**

Supports commercial analysis by combining sales transactions with customer and product information.

**Main Analysis**

- Revenue by Customer
- Revenue by State
- Revenue by Industry
- Sales History
- Customer Performance

### 📦 vw_performance_produtos

**Purpose**

Aggregates product sales and profitability information.

**Business Value**

Allows managers to identify the best-selling and most profitable products.

**Main Analysis**

- Best Selling Products
- Product Profitability
- Revenue by Product
- Product Ranking

### 💰 vw_financeiro

**Purpose**

Centralizes financial information related to customer payments.

**Business Value**

Enables financial monitoring, payment analysis and cash flow indicators.

**Main Analysis**

- Payment Status
- Revenue Collected
- Payment Methods
- Outstanding Payments

### 🚚 vw_logistica

**Purpose**

Combines shipment and delivery information for logistics monitoring.

**Business Value**

Supports operational analysis and delivery performance evaluation.

**Main Analysis**

- Delivery Status
- Average Delivery Time
- Carrier Performance
- Shipment Tracking

## 📋 Analytical Views Summary

| View | Purpose | Power BI Page |
|------|---------|---------------|
| **vw_dashboard_executivo** | Executive KPIs | Executive Overview |
| **vw_vendas_comercial** | Commercial Analysis | Commercial |
| **vw_performance_produtos** | Product Analysis | Products |
| **vw_financeiro** | Financial Analysis | Operations |
| **vw_logistica** | Logistics Analysis | Operations |

## 🚀 Benefits of the Analytical Layer

The SQL Views provide several advantages for Business Intelligence:

- Simplified SQL queries
- Better dashboard performance
- Reduced data redundancy
- Centralized business logic
- Easier maintenance
- Improved scalability
- Reusable analytical datasets

