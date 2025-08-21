/**
 * Update Credit Note - Node.js Example
 * This script demonstrates how to update an existing credit note in the VAT Compliance API
 */

const fetch = require("node-fetch");

// API endpoint
const url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/credit_notes/your-access-token/1234";

// Update data
const update_data = {
  credit_note_date: "2024-01-20",
  due_date: "2024-02-20",
  status: "sent",
  line_items: [
    {
      description: "Updated Web Development Services Refund",
      quantity: 15,
      unit_price: 75.00,
      tax: true
    },
    {
      description: "Additional Consulting Refund",
      quantity: 5,
      unit_price: 100.00,
      tax: true
    }
  ],
  subtotal: 1625.00,
  total_tax: 357.50,
  total: 1982.50,
  total_discount_amount: 0.00
};

// Make the request
fetch(url, {
  method: "PUT",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify(update_data),
})
  .then(res => res.json())
  .then(json => console.log(json))
  .catch(err => console.error("Error:", err));
