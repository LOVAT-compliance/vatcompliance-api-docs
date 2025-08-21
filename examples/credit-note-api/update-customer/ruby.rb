#!/usr/bin/env ruby

# Update Credit Note - Ruby Example
# This script demonstrates how to update an existing credit note in the VAT Compliance API

require 'net/http'
require 'uri'
require 'json'

# API endpoint
url = URI("https://invoice.vatcompliance.co/api/1/app/l_invoice/credit_notes/your-access-token/1234")

# Setup HTTP client
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

# Headers
headers = { "Content-Type" => "application/json" }

# Update data
update_data = {
  "credit_note_date" => "2024-01-20",
  "due_date" => "2024-02-20",
  "status" => "sent",
  "line_items" => [
    {
      "description" => "Updated Web Development Services Refund",
      "quantity" => 15,
      "unit_price" => 75.00,
      "tax" => true
    },
    {
      "description" => "Additional Consulting Refund",
      "quantity" => 5,
      "unit_price" => 100.00,
      "tax" => true
    }
  ],
  "subtotal" => 1625.00,
  "total_tax" => 357.50,
  "total" => 1982.50,
  "total_discount_amount" => 0.00
}

# Create PUT request
request = Net::HTTP::Put.new(url, headers)
request.body = update_data.to_json

# Make the request
response = http.request(request)

# Print the response
puts response.body
