import java.net.http.*;
import java.net.URI;
import java.nio.charset.StandardCharsets;

/**
 * Update Customer - Java Example
 * This class demonstrates how to update an existing customer in the VAT Compliance API
 */
public class UpdateCustomer {
    public static void main(String[] args) throws Exception {
        // Create HTTP client
        HttpClient client = HttpClient.newHttpClient();
        
        // API endpoint
        String url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/{customer_id}/{access_token}";
        
        // Update data as JSON string
        String json = """
            {
                "name": "Updated Corp Ltd",
                "email": "updated@corp.com",
                "city": "Berlin",
                "country": "DEU",
                "tax_number": "DE123456789"
            }
            """;
        
        // Build request
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(url))
            .header("Content-Type", "application/json")
            .PUT(HttpRequest.BodyPublishers.ofString(json, StandardCharsets.UTF_8))
            .build();
        
        // Send request and get response
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        
        // Print the response
        System.out.println(response.body());
    }
}
