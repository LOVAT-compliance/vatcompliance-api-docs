<?php
/**
 * Bulk Invoice Upload - PHP Example
 * This script demonstrates how to upload multiple invoices to the VAT Compliance API
 */

// API endpoint
$url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/invoices/your-access-token";

// Invoice data
$invoices = [
    [
        "invoice_number" => "INV-2024-001",
        "customer_name" => "Acme Corporation",
        "customer_email" => "contact@acme.com",
        "customer_country" => "USA",
        "customer_tax_number" => "123456789",
        "customer_address" => "123 Business Ave, New York, NY 10001",
        "invoice_date" => "2024-01-15",
        "due_date" => "2024-02-15",
        "currency" => "USD",
        "status" => "draft",
        "line_items" => [
            [
                "description" => "Web Development Services",
                "quantity" => 40,
                "unit_price" => 75.00,
                "tax" => true
            ],
            [
                "description" => "Domain Registration",
                "quantity" => 1,
                "unit_price" => 15.00,
                "tax" => false
            ]
        ],
        "subtotal" => 3015.00,
        "total_tax" => 663.30,
        "total" => 3678.30,
        "total_discount_amount" => 0.00,
        "supplier_tax_number" => "987654321",
        "supplier_country" => "USA",
        "tax_rate" => 22.0
    ],
    [
        "invoice_number" => "INV-2024-002",
        "customer_name" => "Tech Solutions Ltd",
        "customer_email" => "info@techsolutions.com",
        "customer_country" => "GBR",
        "customer_tax_number" => "GB123456789",
        "customer_address" => "456 Tech Street, London, SW1A 1AA",
        "invoice_date" => "2024-01-16",
        "due_date" => "2024-02-16",
        "currency" => "EUR",
        "status" => "draft",
        "line_items" => [
            [
                "description" => "Software License",
                "quantity" => 1,
                "unit_price" => 299.00,
                "tax" => true
            ]
        ],
        "subtotal" => 299.00,
        "total_tax" => 65.78,
        "total" => 364.78,
        "total_discount_amount" => 0.00,
        "supplier_tax_number" => "987654321",
        "supplier_country" => "USA",
        "tax_rate" => 22.0
    ]
];

// Request options
$options = [
    "http" => [
        "header"  => "Content-Type: application/json\r\n",
        "method"  => "POST",
        "content" => json_encode($invoices),
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
