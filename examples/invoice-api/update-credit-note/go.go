package main

import (
    "bytes"
    "fmt"
    "net/http"
    "io/ioutil"
)

/**
 * Update Invoice - Go Example
 * This program demonstrates how to update an existing invoice in the VAT Compliance API
 */
func main() {
    // API endpoint
    url := "https://invoice.vatcompliance.co/api/1/app/l_invoice/invoices/your-access-token/1234"
    
    // Update data as JSON
    payload := []byte(`{
        "invoice_date": "2024-01-20",
        "due_date": "2024-02-20",
        "status": "sent",
        "line_items": [
            {
                "description": "Updated Web Development Services",
                "quantity": 45,
                "unit_price": 80.00,
                "tax": true
            },
            {
                "description": "Additional Consulting",
                "quantity": 5,
                "unit_price": 100.00,
                "tax": true
            }
        ],
        "subtotal": 4100.00,
        "total_tax": 902.00,
        "total": 5002.00,
        "total_discount_amount": 0.00
    }`)
    
    // Create PUT request
    req, _ := http.NewRequest("PUT", url, bytes.NewBuffer(payload))
    req.Header.Set("Content-Type", "application/json")
    
    // Create HTTP client and make request
    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        panic(err)
    }
    defer resp.Body.Close()
    
    // Read and print response
    responseData, _ := ioutil.ReadAll(resp.Body)
    fmt.Println(string(responseData))
}
