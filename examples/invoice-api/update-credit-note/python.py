#!/usr/bin/env python3
"""
Update Invoice - Python Example
This script demonstrates how to update an existing invoice in the VAT Compliance API
"""

import requests
import json

# API endpoint
url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/invoices/your-access-token/1234"

# Headers
headers = {"Content-Type": "application/json"}

# Update data
update_data = {
    "invoice_date": "2024-01-20",
    "due_date": "2024-02-20",
    "status": "sent",
    "line_items": [
        {
            "description": "Updated Web Development Services",
            "quantity": 45,
            "unit_price": 80.00,
            "tax": True
        },
        {
            "description": "Additional Consulting",
            "quantity": 5,
            "unit_price": 100.00,
            "tax": True
        }
    ],
    "subtotal": 4100.00,
    "total_tax": 902.00,
    "total": 5002.00,
    "total_discount_amount": 0.00
}

# Make the request
response = requests.put(url, headers=headers, data=json.dumps(update_data))

# Print the response
print(response.json())
