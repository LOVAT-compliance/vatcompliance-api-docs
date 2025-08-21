#!/bin/bash

# Update Customer - cURL Example
# This script demonstrates how to update an existing customer in the VAT Compliance API

curl -X PUT \
"https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}" \
-H "Content-Type: application/json" \
-d '{
"name": "Updated Corp Ltd",
"email": "updated@corp.com",
"city": "Berlin",
"country": "DEU",
"tax_number": "DE123456789"
}'
