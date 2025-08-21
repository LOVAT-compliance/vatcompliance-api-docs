using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace VatComplianceApi.Examples
{
    /// <summary>
    /// Update Invoice - .NET Example
    /// This class demonstrates how to update an existing invoice in the VAT Compliance API
    /// </summary>
    class Program
    {
        static async Task Main()
        {
            // Create HTTP client
            var client = new HttpClient();
            
            // API endpoint
            var url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/invoices/your-access-token/1234";
            
            // Update data
            var update_data = new
            {
                invoice_date = "2024-01-20",
                due_date = "2024-02-20",
                status = "sent",
                line_items = new[]
                {
                    new
                    {
                        description = "Updated Web Development Services",
                        quantity = 45,
                        unit_price = 80.00,
                        tax = true
                    },
                    new
                    {
                        description = "Additional Consulting",
                        quantity = 5,
                        unit_price = 100.00,
                        tax = true
                    }
                },
                subtotal = 4100.00,
                total_tax = 902.00,
                total = 5002.00,
                total_discount_amount = 0.00
            };
            
            // Serialize to JSON and create content
            var json = Newtonsoft.Json.JsonConvert.SerializeObject(update_data);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            
            // Make the request
            var response = await client.PutAsync(url, content);
            string responseBody = await response.Content.ReadAsStringAsync();
            
            // Print the response
            Console.WriteLine(responseBody);
        }
    }
}
