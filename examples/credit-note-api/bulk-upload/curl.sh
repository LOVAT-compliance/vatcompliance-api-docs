#!/bin/bash

# Bulk Credit Note Upload - cURL Example
# This script demonstrates how to upload multiple credit notes to the VAT Compliance API

curl -X POST \
"https://invoice.vatcompliance.co/api/1/app/l_invoice/credit_notes/your-access-token" \
-H "Content-Type: application/json" \
-d '[
  {
    "credit_note_number": "CN-2024-001",
    "customer_name": "Acme Corporation",
    "customer_email": "contact@acme.com",
    "customer_country": "USA",
    "customer_tax_number": "123456789",
    "customer_address": "123 Business Ave, New York, NY 10001",
    "credit_note_date": "2024-01-15",
    "due_date": "2024-02-15",
    "currency": "USD",
    "status": "draft",
    "line_items": [
      {
        "description": "Web Development Services Refund",
        "quantity": 10,
        "unit_price": 75.00,
        "tax": true
      },
      {
        "description": "Domain Registration Refund",
        "quantity": 1,
        "unit_price": 15.00,
        "tax": false
      }
    ],
    "subtotal": 765.00,
    "total_tax": 168.30,
    "total": 933.30,
    "total_discount_amount": 0.00,
    "supplier_company_name": "Tech Solutions Inc",
    "supplier_address": "456 Tech Street, San Francisco, CA 94102",
    "supplier_email": "billing@techsolutions.com",
    "supplier_tax_number": "987654321",
    "supplier_country": "USA"
  },
  {
    "credit_note_number": "CN-2024-002",
    "customer_name": "Tech Solutions Ltd",
    "customer_email": "info@techsolutions.com",
    "customer_country": "GBR",
    "customer_tax_number": "GB123456789",
    "customer_address": "456 Tech Street, London, SW1A 1AA",
    "credit_note_date": "2024-01-16",
    "due_date": "2024-02-16",
    "currency": "EUR",
    "status": "draft",
    "line_items": [
      {
        "description": "Software License Refund",
        "quantity": 1,
        "unit_price": 299.00,
        "tax": true
      }
    ],
    "subtotal": 299.00,
    "total_tax": 65.78,
    "total": 364.78,
    "total_discount_amount": 0.00,
    "supplier_company_name": "Tech Solutions Inc",
    "supplier_address": "456 Tech Street, San Francisco, CA 94102",
    "supplier_email": "billing@techsolutions.com",
    "supplier_tax_number": "987654321",
    "supplier_country": "USA"
  }
]'
