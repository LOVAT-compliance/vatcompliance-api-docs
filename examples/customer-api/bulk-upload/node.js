/**
 * Bulk Customer Upload - Node.js Example
 * This script demonstrates how to upload multiple customers to the VAT Compliance API
 */

const fetch = require("node-fetch");

// API endpoint
const url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token";

// Customer data
const customers = [
    {
        name: "Acme Corporation",
        email: "contact@acme.com",
        country: "USA",
        tax_number: "123456789",
        peppol_id: "0192:123456789",
        contact_person: "John Smith",
        language: "EN",
        city: "New York",
        state: "NY",
        address_line_1: "123 Business Ave",
        postal_code: "10001",
        sending_method: "Peppol"
    }
];

// Make the request
fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(customers),
})
.then(res => res.json())
.then(json => console.log(json))
.catch(err => console.error("Error:", err));
