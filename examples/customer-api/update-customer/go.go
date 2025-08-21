package main

import (
    "bytes"
    "fmt"
    "net/http"
    "io/ioutil"
)

/**
 * Update Customer - Go Example
 * This program demonstrates how to update an existing customer in the VAT Compliance API
 */
func main() {
    // API endpoint
    url := "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}"
    
    // Update data as JSON
    payload := []byte(`{
        "name": "Updated Corp Ltd",
        "email": "updated@corp.com",
        "city": "Berlin",
        "country": "DEU",
        "tax_number": "DE123456789"
    }`)
    
    // Create PUT request
    req, _ := http.NewRequest("PUT", url, bytes.NewBuffer(payload))
    req.Header.Set("Content-Type", "application/json")
    
    // Create HTTP client and make request
    client := &http.Client{}
    res, err := client.Do(req)
    if err != nil {
        panic(err)
    }
    defer res.Body.Close()
    
    // Read and print response
    body, _ := ioutil.ReadAll(res.Body)
    fmt.Println(string(body))
}
