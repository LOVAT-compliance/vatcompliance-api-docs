#!/usr/bin/env python3
"""
Bulk Invoice Upload - Python Example
This script demonstrates how to upload multiple invoices to the VAT Compliance API
"""

import requests
import json

# API endpoint
url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/invoices/your-access-token"

# Headers
headers = {"Content-Type": "application/json"}

# Invoice data
invoices = [
    {
        "invoice_number": "INV-2024-001",
        "customer_name": "Acme Corporation",
        "customer_email": "contact@acme.com",
        "customer_country": "USA",
        "customer_tax_number": "123456789",
        "customer_address": "123 Business Ave, New York, NY 10001",
        "invoice_date": "2024-01-15",
        "due_date": "2024-02-15",
        "currency": "USD",
        "status": "draft",
        "line_items": [
            {
                "description": "Web Development Services",
                "quantity": 40,
                "unit_price": 75.00,
                "tax": True
            },
            {
                "description": "Domain Registration",
                "quantity": 1,
                "unit_price": 15.00,
                "tax": False
            }
        ],
        "subtotal": 3015.00,
        "total_tax": 663.30,
        "total": 3678.30,
        "total_discount_amount": 0.00,
        "supplier_tax_number": "987654321",
        "supplier_country": "USA"
    }
]

# Make the request
response = requests.post(url, headers=headers, data=json.dumps(invoices))

# Print the response
print(response.json())
