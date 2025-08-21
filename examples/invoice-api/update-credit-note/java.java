import java.net.http.*;
import java.net.URI;
import java.nio.charset.StandardCharsets;

/**
 * Update Invoice - Java Example
 * This class demonstrates how to update an existing invoice in the VAT Compliance API
 */
public class UpdateInvoice {
    public static void main(String[] args) throws Exception {
        // Create HTTP client
        HttpClient client = HttpClient.newHttpClient();
        
        // API endpoint
        String url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/invoices/your-access-token/1234";
        
        // Update data as JSON string
        String json = "{\"invoice_date\":\"2024-01-20\",\"due_date\":\"2024-02-20\",\"status\":\"sent\",\"line_items\":[{\"description\":\"Updated Web Development Services\",\"quantity\":45,\"unit_price\":80.00,\"tax\":true},{\"description\":\"Additional Consulting\",\"quantity\":5,\"unit_price\":100.00,\"tax\":true}],\"subtotal\":4100.00,\"total_tax\":902.00,\"total\":5002.00,\"total_discount_amount\":0.00}";
        
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
