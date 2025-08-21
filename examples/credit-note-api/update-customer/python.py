#!/usr/bin/env python3
"""
Update Credit Note - Python Example
This script demonstrates how to update an existing credit note in the VAT Compliance API
"""

import requests
import json

# API endpoint
url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/credit_notes/your-access-token/1234"

# Headers
headers = {"Content-Type": "application/json"}

# Update data
update_data = {
    "credit_note_date": "2024-01-20",
    "due_date": "2024-02-20",
    "status": "sent",
    "line_items": [
        {
            "description": "Updated Web Development Services Refund",
            "quantity": 15,
            "unit_price": 75.00,
            "tax": True
        },
        {
            "description": "Additional Consulting Refund",
            "quantity": 5,
            "unit_price": 100.00,
            "tax": True
        }
    ],
    "subtotal": 1625.00,
    "total_tax": 357.50,
    "total": 1982.50,
    "total_discount_amount": 0.00
}

# Make the request
response = requests.put(url, headers=headers, data=json.dumps(update_data))

# Print the response
print(response.json())
