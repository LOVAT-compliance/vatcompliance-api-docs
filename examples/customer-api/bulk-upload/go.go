package main

import (
    "bytes"
    "encoding/json"
    "fmt"
    "net/http"
    "io/ioutil"
)

/**
 * Bulk Customer Upload - Go Example
 * This program demonstrates how to upload multiple customers to the VAT Compliance API
 */
func main() {
    // API endpoint
    url := "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token"
    
    // Customer data
    customers := []map[string]interface{}{
        {
            "name":            "Acme Corporation",
            "email":          "contact@acme.com",
            "country":        "USA",
            "tax_number":     "123456789",
            "peppol_id":      "0192:123456789",
            "contact_person": "John Smith",
            "language":       "EN",
            "city":           "New York",
            "state":          "NY",
            "address_line_1": "123 Business Ave",
            "postal_code":    "10001",
            "sending_method": "Peppol",
        },
    }
    
    // Marshal to JSON
    body, _ := json.Marshal(customers)
    
    // Make POST request
    resp, err := http.Post(url, "application/json", bytes.NewBuffer(body))
    if err != nil {
        panic(err)
    }
    defer resp.Body.Close()
    
    // Read and print response
    responseData, _ := ioutil.ReadAll(resp.Body)
    fmt.Println(string(responseData))
}
