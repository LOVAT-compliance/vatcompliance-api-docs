using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace VatComplianceApi.Examples
{
    /// <summary>
    /// Bulk Customer Upload - .NET Example
    /// This class demonstrates how to upload multiple customers to the VAT Compliance API
    /// </summary>
    class Program
    {
        static async Task Main()
        {
            // API endpoint
            var url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token";
            
            // Create HTTP client
            var client = new HttpClient();
            
            // Customer data
            var customers = new[]
            {
                new
                {
                    name = "Acme Corporation",
                    email = "contact@acme.com",
                    country = "USA",
                    tax_number = "123456789",
                    peppol_id = "0192:123456789",
                    contact_person = "John Smith",
                    language = "EN",
                    city = "New York",
                    state = "NY",
                    address_line_1 = "123 Business Ave",
                    postal_code = "10001",
                    sending_method = "Peppol"
                }
            };
            
            // Serialize to JSON and create content
            var json = Newtonsoft.Json.JsonConvert.SerializeObject(customers);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            
            // Make the request
            var response = await client.PostAsync(url, content);
            string responseBody = await response.Content.ReadAsStringAsync();
            
            // Print the response
            Console.WriteLine(responseBody);
        }
    }
}
