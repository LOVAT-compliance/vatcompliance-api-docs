#!/usr/bin/env python3
"""
Update Customer - Python Example
This script demonstrates how to update an existing customer in the VAT Compliance API
"""

import requests
import json

# API endpoint
url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}"

# Headers
headers = {"Content-Type": "application/json"}

# Update data
payload = {
    "name": "Updated Corp Ltd",
    "email": "updated@corp.com",
    "city": "Berlin",
    "country": "DEU",
    "tax_number": "DE123456789"
}

# Make the request
response = requests.put(url, headers=headers, data=json.dumps(payload))

# Print the response
print(response.json())
