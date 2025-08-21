/**
 * Bulk Invoice Upload - Node.js Example
 * This script demonstrates how to upload multiple invoices to the VAT Compliance API
 */

const fetch = require("node-fetch");

// API endpoint
const url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/invoices/your-access-token";

// Invoice data
const invoices = [
  {
    invoice_number: "INV-2024-001",
    customer_name: "Acme Corporation",
    customer_email: "contact@acme.com",
    customer_country: "USA",
    customer_tax_number: "123456789",
    customer_address: "123 Business Ave, New York, NY 10001",
    invoice_date: "2024-01-15",
    due_date: "2024-02-15",
    currency: "USD",
    status: "draft",
    line_items: [
      {
        description: "Web Development Services",
        quantity: 40,
        unit_price: 75.00,
        tax: true
      },
      {
        description: "Domain Registration",
        quantity: 1,
        unit_price: 15.00,
        tax: false
      }
    ],
    subtotal: 3015.00,
    total_tax: 663.30,
    total: 3678.30,
    total_discount_amount: 0.00,
    supplier_tax_number: "987654321",
    supplier_country: "USA"
  }
];

// Make the request
fetch(url, {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify(invoices),
})
  .then(res => res.json())
  .then(json => console.log(json))
  .catch(err => console.error("Error:", err));
