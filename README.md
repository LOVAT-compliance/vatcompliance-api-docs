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


# E-Invoices API Documentation

Comprehensive documentation for the E-Invoices API endpoint. This API enables merchants to create and manage electronic invoices with automatic Peppol transmission and tax compliance.

## Table of Contents

- [Overview](#overview)
- [Authentication](#authentication)
- [API Endpoint](#api-endpoint)
- [Request Parameters](#request-parameters)
- [Response Format](#response-format)
- [Error Handling](#error-handling)
- [Rate Limits](#rate-limits)
- [Examples](#examples)
- [Terms and Abbreviations](#terms-and-abbreviations)

## Overview

The E-Invoices API provides functionality to:

- **Create E-Invoices**: Generate one or multiple electronic invoices
- **Automatic Peppol Transmission**: Send invoices to Peppol network
- **Error Recovery**: Update existing documents in error status
- **Bulk Processing**: Handle multiple invoices in a single request

The API supports both real-time and bulk operations with automatic data validation and secure transmission.

## URL

- **Production**: `https://invoice.vatcompliance.co/api/1/app/l_invoice/e_documents/invoices/{access_token}/`

## Authentication

All API requests require an access token for authentication. Include your token in the URL path:

```
POST /edocuments/invoices/{access_token}
```

## API Endpoint

### Create E-Invoices

**Endpoint**: `POST /edocuments/invoices/{access_token}`

**Description**: Create one or multiple e-invoices and send to Peppol network.

**Authentication**: Token-based (access_token in URL path)

## Request Parameters

### Request Body

The request body should contain an array of e-invoice data objects. Each object represents a single e-invoice to be created.

### E-Invoice Data Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `invoice_number` | String | Unique invoice identifier | Optional. Max 255 characters |
| `created_date` | String | Invoice creation date | Required. YYYY-MM-DD format |
| `due_date` | String | Payment due date | Optional. YYYY-MM-DD format |
| `currency` | String | Invoice currency | Optional. Default: "EUR". Max 3 characters |
| `recipient_reference` | String | Reference for recipient | Optional. Max 255 characters |

#### Customer Information

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `customer` | String | Customer business name | Required. Max 255 characters |
| `customer_street` | String | Customer street address | Required. Max 255 characters |
| `customer_city` | String | Customer city | Required. Max 255 characters |
| `customer_postal_code` | String | Customer postal code | Required. Max 12 characters |
| `customer_peppol_id` | String | Customer Peppol identifier | Required. Max 255 characters |
| `customer_tax_number` | String | Customer tax/VAT number | Optional. Max 25 characters |
| `customer_country` | String | Customer country code | Optional. ISO 3166-1 alpha-3 format |

#### Supplier Information

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `supplier` | String | Supplier business name | Required. Max 255 characters |
| `supplier_street` | String | Supplier street address | Required. Max 255 characters |
| `supplier_city` | String | Supplier city | Required. Max 255 characters |
| `supplier_postal_code` | String | Supplier postal code | Required. Max 12 characters |
| `supplier_peppol_id` | String | Supplier Peppol identifier | Required. Max 255 characters |
| `supplier_tax_number` | String | Supplier tax/VAT number | Optional. Max 25 characters |
| `supplier_country` | String | Supplier country code | Optional. ISO 3166-1 alpha-3 format |

#### Financial Information

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `total` | Float | Final invoice amount | Required. Positive number, 2 decimal places |
| `subtotal` | Float | Sum before taxes | Required. Positive number, 2 decimal places |
| `tax` | Float | Total tax amount | Required. Positive number, 2 decimal places |
| `tax_rate` | Float | Tax percentage | Required. Positive number |

#### Line Items

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `line_items` | Array | List of invoice items | Required. At least one item required |

##### Line Item Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `description` | String | Item description | Required. Max 255 characters |
| `quantity` | Float | Item quantity | Required. Positive number |
| `unit_price` | Float | Price per unit | Required. Positive number |
| `is_taxable` | Boolean | Whether item is taxable | Default: true |

## Response Format

### Success Response

```json
{
  "status": 200,
  "message": "Processed X e-invoice(s)",
  "results": [
    {
      "index": 0,
      "status": "success",
      "data": {
        "id": 123,
        "invoice_number": "INV-001",
        "status": "new",
        "created_at": "2024-01-15T10:30:00Z"
      }
    }
  ],
  "total_processed": 1,
  "successful": 1,
  "failed": 0
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `status` | Integer | HTTP status code (200 for success) |
| `message` | String | Descriptive message about the operation |
| `results` | Array | Array of processing results for each invoice |
| `total_processed` | Integer | Total number of invoices processed |
| `successful` | Integer | Number of successfully processed invoices |
| `failed` | Integer | Number of failed invoice processing attempts |

### Result Object Fields

| Field | Type | Description |
|-------|------|-------------|
| `index` | Integer | Index of the invoice in the request array |
| `status` | String | Processing status: "success", "updated", or "error" |
| `data` | Object | Created/updated invoice data (for success/updated) |
| `error` | String | Error message (for error status) |
| `message` | String | Additional information (for updated status) |

## Error Handling

### Error Response Format

```json
{
  "status": 400,
  "message": "Error processing bulk e-invoice creation: [error details]"
}
```

### Common Error Scenarios

1. **Invalid Access Token**: Token not found or invalid
2. **Validation Errors**: Missing required fields or invalid data format
3. **Date Format Errors**: Dates not in YYYY-MM-DD format
4. **Negative Amounts**: Financial values cannot be negative
5. **Empty Line Items**: At least one line item is required
6. **Invalid Country Codes**: Country codes must be ISO 3166-1 alpha-3 format

### Error Recovery

The API automatically handles error recovery for existing documents:

- If an e-invoice with the same `invoice_number` already exists and is in "error" status, the API will update the existing document instead of creating a new one
- The response will indicate "updated" status for such cases

## Rate Limits

- **Request Frequency**: No specific rate limit, but reasonable usage is expected
- **Token Validation**: Access tokens are validated on each request
- **Data Validation**: All invoice data is validated before processing
- **Bulk Processing**: Supports processing multiple invoices in a single request
- **Error Tracking**: All API usage is tracked for monitoring and billing purposes

## Examples

### Single E-Invoice Creation

```json
[
  {
    "invoice_number": "INV-2024-001",
    "created_date": "2024-01-15",
    "due_date": "2024-02-15",
    "currency": "EUR",
    "customer": "Acme Corporation",
    "customer_street": "123 Business Street",
    "customer_city": "Berlin",
    "customer_postal_code": "10115",
    "customer_peppol_id": "DE123456789",
    "customer_tax_number": "DE123456789",
    "customer_country": "DEU",
    "supplier": "Your Company Ltd",
    "supplier_street": "456 Supplier Avenue",
    "supplier_city": "London",
    "supplier_postal_code": "SW1A 1AA",
    "supplier_peppol_id": "GB987654321",
    "supplier_tax_number": "GB987654321",
    "supplier_country": "GBR",
    "total": 120.00,
    "subtotal": 100.00,
    "tax": 20.00,
    "tax_rate": 20.0,
    "line_items": [
      {
        "description": "Professional Services",
        "quantity": 1.0,
        "unit_price": 100.00,
        "is_taxable": true
      }
    ]
  }
]
```

### Multiple E-Invoices Creation

```json
[
  {
    "invoice_number": "INV-2024-001",
    "created_date": "2024-01-15",
    "customer": "Customer A",
    "customer_street": "123 Street A",
    "customer_city": "City A",
    "customer_postal_code": "12345",
    "customer_peppol_id": "PE001",
    "supplier": "Your Company",
    "supplier_street": "456 Street B",
    "supplier_city": "City B",
    "supplier_postal_code": "67890",
    "supplier_peppol_id": "PE002",
    "total": 120.00,
    "subtotal": 100.00,
    "tax": 20.00,
    "tax_rate": 20.0,
    "line_items": [
      {
        "description": "Service A",
        "quantity": 1.0,
        "unit_price": 100.00,
        "is_taxable": true
      }
    ]
  },
  {
    "invoice_number": "INV-2024-002",
    "created_date": "2024-01-15",
    "customer": "Customer B",
    "customer_street": "789 Street C",
    "customer_city": "City C",
    "customer_postal_code": "54321",
    "customer_peppol_id": "PE003",
    "supplier": "Your Company",
    "supplier_street": "456 Street B",
    "supplier_city": "City B",
    "supplier_postal_code": "67890",
    "supplier_peppol_id": "PE002",
    "total": 240.00,
    "subtotal": 200.00,
    "tax": 40.00,
    "tax_rate": 20.0,
    "line_items": [
      {
        "description": "Service B",
        "quantity": 2.0,
        "unit_price": 100.00,
        "is_taxable": true
      }
    ]
  }
]
```

## Terms and Abbreviations

| Term | Definition |
|------|------------|
| **E-Invoice** | Electronic invoice that complies with digital standards and can be transmitted via electronic networks |
| **Peppol** | Pan-European Public Procurement On-Line, a network for electronic procurement and invoicing |
| **Peppol ID** | Unique identifier used in the Peppol network for business identification |
| **Access Token** | A secret string used to authenticate API requests and identify the merchant |
| **Line Item** | Individual product or service entry in an invoice with quantity, unit price, and total |
| **Tax Rate** | Percentage of tax applied to taxable items |
| **Subtotal** | Sum of all line items before taxes and discounts |
| **Total** | Final amount including all taxes and discounts |



# E-Credit Notes API Documentation

Comprehensive documentation for the E-Credit Notes API endpoint. This API enables merchants to create and manage electronic credit notes with automatic Peppol transmission and tax compliance.

## Table of Contents

- [Overview](#overview)
- [Authentication](#authentication)
- [API Endpoint](#api-endpoint)
- [Request Parameters](#request-parameters)
- [Response Format](#response-format)
- [Error Handling](#error-handling)
- [Rate Limits](#rate-limits)
- [Examples](#examples)
- [Terms and Abbreviations](#terms-and-abbreviations)

## Overview

The E-Credit Notes API provides functionality to:

- **Create E-Credit Notes**: Generate one or multiple electronic credit notes
- **Automatic Peppol Transmission**: Send credit notes to Peppol network
- **Error Recovery**: Update existing documents in error status
- **Bulk Processing**: Handle multiple credit notes in a single request

The API supports both real-time and bulk operations with automatic data validation and secure transmission.

## URL

- **Production**: `https://invoice.vatcompliance.co/api/1/app/l_invoice/e_documents/credit-notes/{access_token}/`


## Authentication

All API requests require an access token for authentication. Include your token in the URL path:

```
POST /edocuments/credit-notes/{access_token}
```

## API Endpoint

### Create E-Credit Notes

**Endpoint**: `POST /edocuments/credit-notes/{access_token}`

**Description**: Create one or multiple e-credit notes and send to Peppol network.

**Authentication**: Token-based (access_token in URL path)

## Request Parameters

### Request Body

The request body should contain an array of e-credit note data objects. Each object represents a single e-credit note to be created.

### E-Credit Note Data Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `credit_note_number` | String | Unique credit note identifier | Optional. Max 255 characters |
| `created_date` | String | Credit note creation date | Required. YYYY-MM-DD format |
| `due_date` | String | Payment due date | Optional. YYYY-MM-DD format |
| `currency` | String | Credit note currency | Optional. Default: "EUR". Max 3 characters |
| `recipient_reference` | String | Reference for recipient | Optional. Max 255 characters |

#### Customer Information

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `customer` | String | Customer business name | Required. Max 255 characters |
| `customer_street` | String | Customer street address | Required. Max 255 characters |
| `customer_city` | String | Customer city | Required. Max 255 characters |
| `customer_postal_code` | String | Customer postal code | Required. Max 12 characters |
| `customer_peppol_id` | String | Customer Peppol identifier | Required. Max 255 characters |
| `customer_tax_number` | String | Customer tax/VAT number | Optional. Max 25 characters |
| `customer_country` | String | Customer country code | Optional. ISO 3166-1 alpha-3 format |

#### Supplier Information

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `supplier` | String | Supplier business name | Required. Max 255 characters |
| `supplier_street` | String | Supplier street address | Required. Max 255 characters |
| `supplier_city` | String | Supplier city | Required. Max 255 characters |
| `supplier_postal_code` | String | Supplier postal code | Required. Max 12 characters |
| `supplier_peppol_id` | String | Supplier Peppol identifier | Required. Max 255 characters |
| `supplier_tax_number` | String | Supplier tax/VAT number | Optional. Max 25 characters |
| `supplier_country` | String | Supplier country code | Optional. ISO 3166-1 alpha-3 format |

#### Financial Information

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `total` | Float | Final credit note amount | Required. Positive number, 2 decimal places |
| `subtotal` | Float | Sum before taxes | Required. Positive number, 2 decimal places |
| `tax` | Float | Total tax amount | Required. Positive number, 2 decimal places |
| `tax_rate` | Float | Tax percentage | Required. Positive number |

#### Line Items

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `line_items` | Array | List of credit note items | Required. At least one item required |

##### Line Item Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `description` | String | Item description | Required. Max 255 characters |
| `quantity` | Float | Item quantity | Required. Positive number |
| `unit_price` | Float | Price per unit | Required. Positive number |
| `is_taxable` | Boolean | Whether item is taxable | Default: true |

## Response Format

### Success Response

```json
{
  "status": 200,
  "message": "Processed X e-credit note(s)",
  "results": [
    {
      "index": 0,
      "status": "success",
      "data": {
        "id": 123,
        "credit_note_number": "CN-001",
        "status": "new",
        "created_at": "2024-01-15T10:30:00Z"
      }
    }
  ],
  "total_processed": 1,
  "successful": 1,
  "failed": 0
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `status` | Integer | HTTP status code (200 for success) |
| `message` | String | Descriptive message about the operation |
| `results` | Array | Array of processing results for each credit note |
| `total_processed` | Integer | Total number of credit notes processed |
| `successful` | Integer | Number of successfully processed credit notes |
| `failed` | Integer | Number of failed credit note processing attempts |

### Result Object Fields

| Field | Type | Description |
|-------|------|-------------|
| `index` | Integer | Index of the credit note in the request array |
| `status` | String | Processing status: "success", "updated", or "error" |
| `data` | Object | Created/updated credit note data (for success/updated) |
| `error` | String | Error message (for error status) |
| `message` | String | Additional information (for updated status) |

## Error Handling

### Error Response Format

```json
{
  "status": 400,
  "message": "Error processing bulk e-credit note creation: [error details]"
}
```

### Common Error Scenarios

1. **Invalid Access Token**: Token not found or invalid
2. **Validation Errors**: Missing required fields or invalid data format
3. **Date Format Errors**: Dates not in YYYY-MM-DD format
4. **Negative Amounts**: Financial values cannot be negative
5. **Empty Line Items**: At least one line item is required
6. **Invalid Country Codes**: Country codes must be ISO 3166-1 alpha-3 format

### Error Recovery

The API automatically handles error recovery for existing documents:

- If an e-credit note with the same `credit_note_number` already exists and is in "error" status, the API will update the existing document instead of creating a new one
- The response will indicate "updated" status for such cases

## Rate Limits

- **Request Frequency**: No specific rate limit, but reasonable usage is expected
- **Token Validation**: Access tokens are validated on each request
- **Data Validation**: All credit note data is validated before processing
- **Bulk Processing**: Supports processing multiple credit notes in a single request
- **Error Tracking**: All API usage is tracked for monitoring and billing purposes

## Examples

### Single E-Credit Note Creation

```json
[
  {
    "credit_note_number": "CN-2024-001",
    "created_date": "2024-01-15",
    "due_date": "2024-02-15",
    "currency": "EUR",
    "customer": "Acme Corporation",
    "customer_street": "123 Business Street",
    "customer_city": "Berlin",
    "customer_postal_code": "10115",
    "customer_peppol_id": "DE123456789",
    "customer_tax_number": "DE123456789",
    "customer_country": "DEU",
    "supplier": "Your Company Ltd",
    "supplier_street": "456 Supplier Avenue",
    "supplier_city": "London",
    "supplier_postal_code": "SW1A 1AA",
    "supplier_peppol_id": "GB987654321",
    "supplier_tax_number": "GB987654321",
    "supplier_country": "GBR",
    "total": 120.00,
    "subtotal": 100.00,
    "tax": 20.00,
    "tax_rate": 20.0,
    "line_items": [
      {
        "description": "Refund for Professional Services",
        "quantity": 1.0,
        "unit_price": 100.00,
        "is_taxable": true
      }
    ]
  }
]
```

### Multiple E-Credit Notes Creation

```json
[
  {
    "credit_note_number": "CN-2024-001",
    "created_date": "2024-01-15",
    "customer": "Customer A",
    "customer_street": "123 Street A",
    "customer_city": "City A",
    "customer_postal_code": "12345",
    "customer_peppol_id": "PE001",
    "supplier": "Your Company",
    "supplier_street": "456 Street B",
    "supplier_city": "City B",
    "supplier_postal_code": "67890",
    "supplier_peppol_id": "PE002",
    "total": 120.00,
    "subtotal": 100.00,
    "tax": 20.00,
    "tax_rate": 20.0,
    "line_items": [
      {
        "description": "Refund for Service A",
        "quantity": 1.0,
        "unit_price": 100.00,
        "is_taxable": true
      }
    ]
  },
  {
    "credit_note_number": "CN-2024-002",
    "created_date": "2024-01-15",
    "customer": "Customer B",
    "customer_street": "789 Street C",
    "customer_city": "City C",
    "customer_postal_code": "54321",
    "customer_peppol_id": "PE003",
    "supplier": "Your Company",
    "supplier_street": "456 Street B",
    "supplier_city": "City B",
    "supplier_postal_code": "67890",
    "supplier_peppol_id": "PE002",
    "total": 240.00,
    "subtotal": 200.00,
    "tax": 40.00,
    "tax_rate": 20.0,
    "line_items": [
      {
        "description": "Refund for Service B",
        "quantity": 2.0,
        "unit_price": 100.00,
        "is_taxable": true
      }
    ]
  }
]
```

## Terms and Abbreviations

| Term | Definition |
|------|------------|
| **E-Credit Note** | Electronic credit note that complies with digital standards and can be transmitted via electronic networks |
| **Peppol** | Pan-European Public Procurement On-Line, a network for electronic procurement and invoicing |
| **Peppol ID** | Unique identifier used in the Peppol network for business identification |
| **Access Token** | A secret string used to authenticate API requests and identify the merchant |
| **Line Item** | Individual product or service entry in a credit note with quantity, unit price, and total |
| **Tax Rate** | Percentage of tax applied to taxable items |
| **Subtotal** | Sum of all line items before taxes and discounts |
| **Total** | Final amount including all taxes and discounts |
| **Credit Note** | A commercial document issued by a seller to a buyer, indicating a reduction in the amount owed for previously issued invoices |



# Get E-Document Status API Documentation

Comprehensive documentation for the Get E-Document Status API endpoint. This API enables merchants to retrieve the current status and details of electronic documents (invoices and credit notes) by their database ID.

## Table of Contents

- [Overview](#overview)
- [Authentication](#authentication)
- [API Endpoint](#api-endpoint)
- [Request Parameters](#request-parameters)
- [Response Format](#response-format)
- [Error Handling](#error-handling)
- [Rate Limits](#rate-limits)
- [Examples](#examples)
- [Terms and Abbreviations](#terms-and-abbreviations)

## Overview

The Get E-Document Status API provides functionality to:

- **Retrieve Document Status**: Get the current status of any e-document by its database ID
- **Document Details**: Access comprehensive information about the document
- **Status Tracking**: Monitor the processing status of invoices and credit notes
- **Error Investigation**: Check document details when troubleshooting issues

The API supports real-time status queries with secure access control based on company ownership.

## URL

- **Production**: `https://invoice.vatcompliance.co/api/1/app/l_invoice/e_documents/status-by-id/{access_token}/{document_id}/`

## Authentication

All API requests require an access token for authentication. Include your token in the URL path:

```
GET /edocuments/status-by-id/{access_token}/{document_id}
```

## API Endpoint

### Get E-Document Status by ID

**Endpoint**: `GET /edocuments/status-by-id/{access_token}/{document_id}`

**Description**: Retrieve the status and details of an e-document by its database ID.

**Authentication**: Token-based (access_token in URL path)

## Request Parameters

### URL Parameters

| Parameter | Type | Description | Validation |
|-----------|------|-------------|------------|
| `access_token` | String | Authentication token | Required. Must be valid and belong to the company |
| `document_id` | Integer | Database ID of the e-document | Required. Must be a positive integer |

### Path Structure

```
/edocuments/status-by-id/{access_token}/{document_id}
```

**Example**:
```
/edocuments/status-by-id/abc123def456/12345
```

## Response Format

### Success Response

```json
{
  "status": 200,
  "data": {
    "document_id": 12345,
    "invoice_number": "INV-2024-001",
    "document_status": "sent",
    "invoice_type": "invoice",
    "type": "vat_invoice",
    "customer": "Acme Corporation",
    "supplier": "Your Company Ltd",
    "total": "120.00",
    "created_date": "2024-01-15",
    "created_at": "2024-01-15T10:30:00Z",
    "updated_at": "2024-01-15T10:35:00Z"
  }
}
```

### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `status` | Integer | HTTP status code (200 for success) |
| `data` | Object | Document information object |

### Data Object Fields

| Field | Type | Description |
|-------|------|-------------|
| `document_id` | Integer | Database ID of the document |
| `invoice_number` | String | Invoice or credit note number |
| `document_status` | String | Current processing status of the document |
| `invoice_type` | String | Type of document: "invoice" or "credit_note" |
| `type` | String | Document subtype (e.g., "vat_invoice", "sales_tax_invoice", "credit-note") |
| `customer` | String | Customer business name |
| `supplier` | String | Supplier business name |
| `total` | String | Total amount of the document (formatted as string) |
| `created_date` | String | Document creation date (ISO format) |
| `created_at` | String | Database record creation timestamp (ISO format) |
| `updated_at` | String | Last update timestamp (ISO format) |

### Document Status Values

| Status | Description |
|--------|-------------|
| `new` | Document has been created but not yet processed |
| `pending` | Document is being processed |
| `sent` | Document has been successfully sent via Peppol |
| `error` | Document processing failed |
| `delivered` | Document has been delivered to recipient |
| `rejected` | Document was rejected by recipient |

### Document Types

| Type | Description |
|------|-------------|
| `vat_invoice` | Standard VAT invoice |
| `sales_tax_invoice` | Sales tax invoice (typically for US) |
| `credit-note` | Credit note document |

## Error Handling

### Error Response Format

```json
{
  "status": 400,
  "message": "E-document with ID 12345 not found"
}
```

### Common Error Scenarios

1. **Document Not Found**: The document ID does not exist or does not belong to the authenticated company
2. **Invalid Access Token**: Token not found or invalid
3. **Invalid Document ID**: Document ID is not a valid integer
4. **Access Denied**: Document exists but belongs to a different company

### Error Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `status` | Integer | HTTP status code (400 for client errors) |
| `message` | String | Descriptive error message |

## Rate Limits

- **Request Frequency**: No specific rate limit, but reasonable usage is expected
- **Token Validation**: Access tokens are validated on each request
- **Company Isolation**: Users can only access documents belonging to their company
- **Data Privacy**: All responses are filtered to show only relevant company data

## Examples

### Successful Status Query

**Request**:
```
GET /edocuments/status-by-id/abc123def456/12345
```

**Response**:
```json
{
  "status": 200,
  "data": {
    "document_id": 12345,
    "invoice_number": "INV-2024-001",
    "document_status": "sent",
    "invoice_type": "invoice",
    "type": "vat_invoice",
    "customer": "Acme Corporation",
    "supplier": "Your Company Ltd",
    "total": "120.00",
    "created_date": "2024-01-15",
    "created_at": "2024-01-15T10:30:00Z",
    "updated_at": "2024-01-15T10:35:00Z"
  }
}
```

### Credit Note Status Query

**Request**:
```
GET /edocuments/status-by-id/abc123def456/67890
```

**Response**:
```json
{
  "status": 200,
  "data": {
    "document_id": 67890,
    "invoice_number": "CN-2024-001",
    "document_status": "delivered",
    "invoice_type": "credit_note",
    "type": "credit-note",
    "customer": "Beta Corporation",
    "supplier": "Your Company Ltd",
    "total": "60.00",
    "created_date": "2024-01-16",
    "created_at": "2024-01-16T14:20:00Z",
    "updated_at": "2024-01-16T14:25:00Z"
  }
}
```

### Error Response Example

**Request**:
```
GET /edocuments/status-by-id/abc123def456/99999
```

**Response**:
```json
{
  "status": 400,
  "message": "E-document with ID 99999 not found"
}
```

## Use Cases

### 1. Status Monitoring
Check the processing status of documents to ensure they are being handled correctly.

### 2. Error Investigation
When documents fail to process, use this API to retrieve detailed information for troubleshooting.

### 3. Integration Monitoring
Monitor document processing in real-time for system integrations.

### 4. Customer Support
Retrieve document details when assisting customers with invoice or credit note inquiries.

## Terms and Abbreviations

| Term | Definition |
|------|------------|
| **E-Document** | Electronic document (invoice or credit note) that complies with digital standards |
| **Document ID** | Unique database identifier for each e-document |
| **Document Status** | Current processing state of the document in the system |
| **Peppol** | Pan-European Public Procurement On-Line, a network for electronic procurement |
| **Access Token** | A secret string used to authenticate API requests and identify the merchant |
| **Invoice Type** | Classification of the document as either "invoice" or "credit_note" |
| **Document Type** | Sub-classification indicating the specific type of invoice or credit note |
| **ISO Format** | International standard for date and time representation (YYYY-MM-DDTHH:MM:SSZ) |


## Support

For technical support and questions about the API, please contact our support team at **support@vatcompliance.co** or refer to the individual example files for implementation guidance.
