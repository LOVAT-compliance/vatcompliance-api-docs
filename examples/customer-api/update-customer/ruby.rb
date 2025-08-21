#!/usr/bin/env ruby

# Update Customer - Ruby Example
# This script demonstrates how to update an existing customer in the VAT Compliance API

require 'net/http'
require 'uri'
require 'json'

# API endpoint
url = URI("https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}")

# Setup HTTP client
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

# Create PUT request
request = Net::HTTP::Put.new(url, { "Content-Type" => "application/json" })

# Update data
request.body = {
    name: "Updated Corp Ltd",
    email: "updated@corp.com",
    city: "Berlin",
    country: "DEU",
    tax_number: "DE123456789"
}.to_json

# Make the request
response = http.request(request)

# Print the response
puts response.read_body
