#!/bin/bash

# Bulk Customer Upload - cURL Example
# This script demonstrates how to upload multiple customers to the VAT Compliance API

curl -X POST \
"https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token" \
-H "Content-Type: application/json" \
-d '[
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
},
{
"name": "Tech Solutions Ltd",
"email": "info@techsolutions.com",
"country": "GBR",
"tax_number": "GB123456789",
"contact_person": "Jane Doe",
"language": "EN",
"city": "London",
"address_line_1": "456 Tech Street",
"postal_code": "SW1A 1AA",
"sending_method": "Email"
}
]'
