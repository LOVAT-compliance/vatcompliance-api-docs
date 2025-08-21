import java.net.http.*;
import java.net.URI;
import java.nio.charset.StandardCharsets;

/**
 * Update Credit Note - Java Example
 * This class demonstrates how to update an existing credit note in the VAT Compliance API
 */
public class UpdateCreditNote {
    public static void main(String[] args) throws Exception {
        // Create HTTP client
        HttpClient client = HttpClient.newHttpClient();
        
        // API endpoint
        String url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/credit_notes/your-access-token/1234";
        
        // Update data as JSON string
        String json = "{\"credit_note_date\":\"2024-01-20\",\"due_date\":\"2024-02-20\",\"status\":\"sent\",\"line_items\":[{\"description\":\"Updated Web Development Services Refund\",\"quantity\":15,\"unit_price\":75.00,\"tax\":true},{\"description\":\"Additional Consulting Refund\",\"quantity\":5,\"unit_price\":100.00,\"tax\":true}],\"subtotal\":1625.00,\"total_tax\":357.50,\"total\":1982.50,\"total_discount_amount\":0.00}";
        
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
