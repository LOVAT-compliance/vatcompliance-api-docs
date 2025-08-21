#!/bin/bash

# Update Credit Note - cURL Example
# This script demonstrates how to update an existing credit note in the VAT Compliance API

curl -X PUT \
"https://invoice.vatcompliance.co/api/1/app/l_invoice/credit_notes/your-access-token/1234" \
-H "Content-Type: application/json" \
-d '{
  "credit_note_date": "2024-01-20",
  "due_date": "2024-02-20",
  "status": "sent",
  "line_items": [
    {
      "description": "Updated Web Development Services Refund",
      "quantity": 15,
      "unit_price": 75.00,
      "tax": true
    },
    {
      "description": "Additional Consulting Refund",
      "quantity": 5,
      "unit_price": 100.00,
      "tax": true
    }
  ],
  "subtotal": 1625.00,
  "total_tax": 357.50,
  "total": 1982.50,
  "total_discount_amount": 0.00
}'
