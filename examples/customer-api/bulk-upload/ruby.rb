#!/usr/bin/env ruby

# Bulk Customer Upload - Ruby Example
# This script demonstrates how to upload multiple customers to the VAT Compliance API

require 'net/http'
require 'uri'
require 'json'

# API endpoint
url = URI("https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token")

# Setup HTTP client
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

# Headers
headers = { "Content-Type" => "application/json" }

# Customer data
customers = [
    {
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
    }
]

# Create request
request = Net::HTTP::Post.new(url, headers)
request.body = customers.to_json

# Make the request
response = http.request(request)

# Print the response
puts response.body
