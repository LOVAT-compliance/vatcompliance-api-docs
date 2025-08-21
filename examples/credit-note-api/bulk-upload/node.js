/**
 * Bulk Credit Note Upload - Node.js Example
 * This script demonstrates how to upload multiple credit notes to the VAT Compliance API
 */

const fetch = require("node-fetch");

// API endpoint
const url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/credit_notes/your-access-token";

// Credit note data
const credit_notes = [
  {
    credit_note_number: "CN-2024-001",
    customer_name: "Acme Corporation",
    customer_email: "contact@acme.com",
    customer_country: "USA",
    customer_tax_number: "123456789",
    customer_address: "123 Business Ave, New York, NY 10001",
    credit_note_date: "2024-01-15",
    due_date: "2024-02-15",
    currency: "USD",
    status: "draft",
    line_items: [
      {
        description: "Web Development Services Refund",
        quantity: 10,
        unit_price: 75.00,
        tax: true
      },
      {
        description: "Domain Registration Refund",
        quantity: 1,
        unit_price: 15.00,
        tax: false
      }
    ],
    subtotal: 765.00,
    total_tax: 168.30,
    total: 933.30,
    total_discount_amount: 0.00,
    supplier_company_name: "Tech Solutions Inc",
    supplier_address: "456 Tech Street, San Francisco, CA 94102",
    supplier_email: "billing@techsolutions.com",
    supplier_tax_number: "987654321",
    supplier_country: "USA"
  }
];

// Make the request
fetch(url, {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify(credit_notes),
})
  .then(res => res.json())
  .then(json => console.log(json))
  .catch(err => console.error("Error:", err));
