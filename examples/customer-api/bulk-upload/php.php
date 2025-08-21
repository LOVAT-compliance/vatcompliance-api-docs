<?php
/**
 * Bulk Customer Upload - PHP Example
 * This script demonstrates how to upload multiple customers to the VAT Compliance API
 */

// API endpoint
$url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token";

// Customer data
$customers = [
    [
        "name" => "Acme Corporation",
        "email" => "contact@acme.com",
        "country" => "USA",
        "tax_number" => "123456789",
        "peppol_id" => "0192:123456789",
        "contact_person" => "John Smith",
        "language" => "EN",
        "city" => "New York",
        "state" => "NY",
        "address_line_1" => "123 Business Ave",
        "postal_code" => "10001",
        "sending_method" => "Peppol"
    ]
];

// Request options
$options = [
    "http" => [
        "header"  => "Content-Type: application/json\r\n",
        "method"  => "POST",
        "content" => json_encode($customers),
    ]
];

// Create context and make request
$context = stream_context_create($options);
$result = file_get_contents($url, false, $context);

// Check for errors
if ($result === FALSE) {
    die("Error sending request");
}

// Print the response
echo $result;
?>
