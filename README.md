# VAT Compliance API Documentation

Comprehensive documentation and examples for Lovat Invoice API integration. This API enables merchants to manage customers, invoices, and credit notes efficiently while maintaining compliance with tax regulations.

## Table of Contents

- [Overview](#overview)
- [Authentication](#authentication)
- [API Endpoints](#api-endpoints)
  - [Customer API](#customer-api)
  - [Invoice API](#invoice-api)
  - [Credit Note API](#credit-note-api)
- [Rate Limits](#rate-limits)
- [Examples](#examples)
- [Terms and Abbreviations](#terms-and-abbreviations)

## Overview

The VAT Compliance API provides three main services:

- **Customer API**: Upload and manage customer data in real-time or bulk
- **Invoice API**: Generate, manage, and track invoices with tax compliance
- **Credit Note API**: Handle credit notes and refunds efficiently

All APIs support both real-time and bulk operations, with automatic data validation and secure transmission.

## Authentication

All API requests require an access token for authentication. Include your token in the URL path:

```
https://invoice.vatcompliance.co/api/1/app/l_invoice/{endpoint}/{access_token}
```

## API Endpoints

### Customer API

The Customer API allows merchants to upload customer data in real-time or in bulk. Customer data flows automatically and securely into Lovat, enabling businesses to manage their customer database efficiently.

#### Endpoints

- **Bulk Customer Upload**: `POST /customers/{access_token}`
- **Update Customer**: `PUT /customers/{access_token}/{customer_id}`

#### Customer Data Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `name` | String | Customer business name | Required. Max 255 characters |
| `email` | String | Customer email address | Optional. Must contain '@' if provided |
| `country` | String | Customer country code | Optional. ISO 3166-1 alpha-3 format |
| `tax_number` | String | Customer tax/VAT number | Optional. Min 3 characters if provided |
| `peppol_id` | String | Peppol identifier | Optional. Max 25 characters |
| `contact_person` | String | Primary contact person | Optional. Max 75 characters |
| `language` | String | Preferred language | Optional. ISO 639-1 format |
| `city` | String | Customer city | Optional. Max 30 characters |
| `state` | String | State/province | Optional. Max 30 characters |
| `address_line_1` | String | Primary address line | Optional. Max 75 characters |
| `address_line_2` | String | Secondary address line | Optional. Max 40 characters |
| `postal_code` | String | Postal/ZIP code | Optional. Max 12 characters |
| `sending_method` | String | Document sending method | Optional. Default: "Peppol". Values: "Peppol", "Email" |

**Examples**: See [`examples/customer-api/`](./examples/customer-api/) for implementation examples in multiple programming languages.

### Invoice API

The Invoice Feed API allows merchants to upload invoice data in real-time or in bulk. Invoice data flows automatically and securely into Lovat, enabling businesses to generate, manage, and track invoices efficiently.

#### Endpoints

- **Bulk Invoice Upload**: `POST /invoices/{access_token}`
- **Update Invoice**: `PUT /invoices/{access_token}/{invoice_id}`

#### Invoice Data Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `invoice_number` | String | Unique invoice identifier | Optional. Max 255 characters |
| `customer_id` | Integer | Existing customer ID in system | Optional. Must exist in customer database |
| `customer_name` | String | Customer business name | Required. Max 255 characters |
| `customer_email` | String | Customer email address | Optional. Must contain '@' if provided |
| `customer_country` | String | Customer country code | Optional. ISO 3166-1 alpha-3 format |
| `customer_tax_number` | String | Customer tax/VAT number | Optional. Max 25 characters |
| `customer_address` | String | Customer address | Optional. Max 255 characters |
| `invoice_date` | String | Invoice creation date | Required. YYYY-MM-DD format |
| `due_date` | String | Payment due date | Optional. YYYY-MM-DD format |
| `currency` | String | Invoice currency | Optional. Default: "EUR". Max 3 characters |
| `status` | String | Invoice status | Required. Values: "draft", "pending", "sent", "paid" |
| `line_items` | Array | List of invoice items | Required. At least one item required |
| `subtotal` | Float | Sum before taxes and discounts | Required. Decimal with 2 places |
| `total_tax` | Float | Total tax amount | Required. Decimal with 2 places |
| `total` | Float | Final invoice amount | Required. Decimal with 2 places |
| `total_discount_amount` | Float | Total discount amount | Required. Decimal with 2 places |
| `supplier_tax_number` | String | Supplier tax number | Optional. Max 25 characters |
| `supplier_country` | String | Supplier country code | Optional. ISO 3166-1 alpha-3 format |
| `tax_rate` | Float | Tax percentage | Required |

#### Line Item Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `description` | String | Item description | Required. Max 255 characters |
| `quantity` | Float | Item quantity | Required. Positive number |
| `unit_price` | Float | Price per unit | Required. Positive number |
| `is_taxable` | Boolean | Whether item is taxable | Default: true |

**Examples**: See [`examples/invoice-api/`](./examples/invoice-api/) for implementation examples in multiple programming languages.

### Credit Note API

The Credit Note Feed API allows merchants to upload credit note data in real-time or in bulk. Credit note data flows automatically and securely into Lovat, enabling businesses to generate, manage, and track credit notes efficiently.

#### Endpoints

- **Bulk Credit Note Upload**: `POST /credit_notes/{access_token}`
- **Update Credit Note**: `PUT /credit_notes/{access_token}/{credit_note_id}`

#### Credit Note Data Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|-----------|
| `credit_note_number` | String | Unique credit note identifier | Optional. Max 255 characters |
| `customer_id` | Integer | Existing customer ID in system | Optional. Must exist in customer database |
| `customer_name` | String | Customer business name | Required. Max 255 characters |
| `customer_email` | String | Customer email address | Optional. Must contain '@' if provided |
| `customer_country` | String | Customer country code | Optional. ISO 3166-1 alpha-3 format |
| `customer_tax_number` | String | Customer tax/VAT number | Optional. Max 25 characters |
| `customer_address` | String | Customer address | Optional. Max 255 characters |
| `credit_note_date` | String | Credit note creation date | Required. YYYY-MM-DD format |
| `due_date` | String | Payment due date | Required. YYYY-MM-DD format |
| `currency` | String | Credit note currency | Optional. Default: "EUR". Max 3 characters |
| `status` | String | Credit note status | Required. Values: "draft", "pending", "sent", "paid" |
| `line_items` | Array | List of credit note items | Required. At least one item required |
| `subtotal` | Float | Sum before taxes and discounts | Required. Decimal with 2 places |
| `total_tax` | Float | Total tax amount | Required. Decimal with 2 places |
| `total` | Float | Final credit note amount | Required. Decimal with 2 places |
| `total_discount_amount` | Float | Total discount amount | Required. Decimal with 2 places |
| `supplier_tax_number` | String | Supplier tax number | Optional. Max 25 characters |
| `supplier_country` | String | Supplier country code | Optional. ISO 3166-1 alpha-3 format |
| `tax_rate` | Float | Tax percentage | Required |

#### Line Item Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `description` | String | Item description | Required. Max 255 characters |
| `quantity` | Float | Item quantity | Required. Positive number |
| `unit_price` | Float | Price per unit | Required. Positive number |
| `is_taxable` | Boolean | Whether item is taxable | Default: true |

**Examples**: See [`examples/credit-note-api/`](./examples/credit-note-api/) for implementation examples in multiple programming languages.

## Rate Limits

### Customer API
- **Bulk Upload Limit**: Maximum 100 customers per request
- **Request Frequency**: No specific rate limit, but reasonable usage is expected
- **Token Validation**: Access tokens are validated on each request
- **Data Validation**: All customer data is validated before processing

### Invoice API
- **Rate Limiting**: Maximum 100 requests per minute per access token
- **Partial Updates**: Only provided fields will be updated, others remain unchanged
- **Data Validation**: All update data is validated before processing
- **Line Items**: If updating line items, must provide complete new list
- **Date Format**: All dates must be in YYYY-MM-DD format
- **Decimal Precision**: All monetary values support 2 decimal places

### Credit Note API
- **Rate Limiting**: Maximum 100 requests per minute per access token
- **Partial Updates**: Only provided fields will be updated, others remain unchanged
- **Data Validation**: All update data is validated before processing
- **Line Items**: If updating line items, must provide complete new list
- **Date Format**: All dates must be in YYYY-MM-DD format
- **Decimal Precision**: All monetary values support 2 decimal places

## Examples

This repository includes comprehensive examples for all API endpoints in multiple programming languages:

### File Structure
```
examples/
├── customer-api/
│   ├── bulk-upload/
│   │   ├── curl.sh
│   │   ├── python.py
│   │   ├── ruby.rb
│   │   ├── php.php
│   │   ├── node.js
│   │   ├── dotnet.cs
│   │   ├── java.java
│   │   └── go.go
│   └── update-customer/
│       ├── curl.sh
│       ├── python.py
│       ├── ruby.rb
│       ├── php.php
│       ├── node.js
│       ├── dotnet.cs
│       ├── java.java
│       └── go.go
├── invoice-api/
│   ├── bulk-upload/
│   │   ├── curl.sh
│   │   ├── python.py
│   │   ├── ruby.rb
│   │   ├── php.php
│   │   ├── node.js
│   │   ├── dotnet.cs
│   │   ├── java.java
│   │   └── go.go
│   └── update-invoice/
│       ├── curl.sh
│       ├── python.py
│       ├── ruby.rb
│       ├── php.php
│       ├── node.js
│       ├── dotnet.cs
│       ├── java.java
│       └── go.go
└── credit-note-api/
    ├── bulk-upload/
    │   ├── curl.sh
    │   ├── python.py
    │   ├── ruby.rb
    │   ├── php.php
    │   ├── node.js
    │   ├── dotnet.cs
    │   ├── java.java
    │   └── go.go
    └── update-credit-note/
        ├── curl.sh
        ├── python.py
        ├── ruby.rb
        ├── php.php
        ├── node.js
        ├── dotnet.cs
        ├── java.java
        └── go.go
```

### Supported Languages
- **cURL** (`.sh` files)
- **Python** (`.py` files)
- **Ruby** (`.rb` files)
- **PHP** (`.php` files)
- **Node.js** (`.js` files)
- **.NET** (`.cs` files)
- **Java** (`.java` files)
- **Go** (`.go` files)

## Terms and Abbreviations

| Term | Definition |
|------|------------|
| **API** | Application Programming Interface. A set of calls provided by the system for integration with external software products. |
| **Merchant** | The owner of an online store or business using the Lovat platform. |
| **Customer** | An individual or business entity who purchases goods or services from the merchant. |
| **Invoice** | A commercial document issued by a seller to a buyer, indicating the products, quantities, and agreed prices for products or services. |
| **Credit Note** | A commercial document issued by a seller to a buyer, indicating a reduction in the amount owed for previously issued invoices. |
| **Token** | A secret string used by the system to identify the merchant and authenticate API requests. |
| **Line Item** | Individual product or service entry in an invoice or credit note with quantity, unit price, and total. |
| **Peppol** | Pan-European Public Procurement On-Line, a network for electronic procurement. |

## Base URLs

- **Production**: `https://invoice.vatcompliance.co/api/1/app/l_invoice/`

## Support

For technical support and questions about the API, please contact our support team at **support@vatcompliance.co** or refer to the individual example files for implementation guidance.
