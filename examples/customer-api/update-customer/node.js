/**
 * Update Customer - Node.js Example
 * This script demonstrates how to update an existing customer in the VAT Compliance API
 */

const fetch = require("node-fetch");

// API endpoint
const url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}";

// Update data
const payload = {
    name: "Updated Corp Ltd",
    email: "updated@corp.com",
    city: "Berlin",
    country: "DEU",
    tax_number: "DE123456789"
};

// Make the request
fetch(url, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload)
})
.then(res => res.json())
.then(json => console.log(json))
.catch(err => console.error(err));
