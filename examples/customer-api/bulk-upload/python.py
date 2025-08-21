#!/usr/bin/env python3
"""
Bulk Customer Upload - Python Example
This script demonstrates how to upload multiple customers to the VAT Compliance API
"""

import requests
import json

# API endpoint
url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token"

# Headers
headers = {"Content-Type": "application/json"}

# Customer data
customers = [
    {
        "name": "Acme Corporation",
        "email": "contact@acme.com",
        "country": "USA",
        "tax_number": "123456789",
        "peppol_id": "0192:123456789",
        "contact_person": "John Smith",
        "language": "EN",
        "city": "New York",
        "state": "NY",
        "address_line_1": "123 Business Ave",
        "postal_code": "10001",
        "sending_method": "Peppol"
    }
]

# Make the request
response = requests.post(url, headers=headers, data=json.dumps(customers))

# Print the response
print(response.json())
