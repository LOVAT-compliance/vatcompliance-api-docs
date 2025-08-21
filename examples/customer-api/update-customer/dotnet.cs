using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace VatComplianceApi.Examples
{
    /// <summary>
    /// Update Customer - .NET Example
    /// This class demonstrates how to update an existing customer in the VAT Compliance API
    /// </summary>
    class Program
    {
        static async Task Main(string[] args)
        {
            // Create HTTP client
            var client = new HttpClient();
            
            // API endpoint
            var url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}";
            
            // Update data
            var payload = new
            {
                name = "Updated Corp Ltd",
                email = "updated@corp.com",
                city = "Berlin",
                country = "DEU",
                tax_number = "DE123456789"
            };
            
            // Serialize to JSON and create content
            var content = new StringContent(
                System.Text.Json.JsonSerializer.Serialize(payload), 
                Encoding.UTF8, 
                "application/json"
            );
            
            // Make the request
            var response = await client.PutAsync(url, content);
            var result = await response.Content.ReadAsStringAsync();
            
            // Print the response
            Console.WriteLine(result);
        }
    }
}
