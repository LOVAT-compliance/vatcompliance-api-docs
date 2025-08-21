<?php
/**
 * Update Customer - PHP Example
 * This script demonstrates how to update an existing customer in the VAT Compliance API
 */

// API endpoint
$url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}";

// Update data
$data = [
    "name" => "Updated Corp Ltd",
    "email" => "updated@corp.com",
    "city" => "Berlin",
    "country" => "DEU",
    "tax_number" => "DE123456789"
];

// Request options
$options = [
    "http" => [
        "header"  => "Content-Type: application/json\r\n",
        "method"  => "PUT",
        "content" => json_encode($data),
    ],
];

// Create context and make request
$context = stream_context_create($options);
$result = file_get_contents($url, false, $context);

// Check for errors
if ($result === FALSE) {
    die("Error occurred");
}

// Print the response
echo $result;
?>
