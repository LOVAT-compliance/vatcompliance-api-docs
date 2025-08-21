import java.net.http.*;
import java.net.URI;
import java.nio.charset.StandardCharsets;

/**
 * Bulk Customer Upload - Java Example
 * This class demonstrates how to upload multiple customers to the VAT Compliance API
 */
public class BulkCustomerUpload {
    public static void main(String[] args) throws Exception {
        // API endpoint
        String url = "https://invoice.vatcompliance.co/api/1/app/l_invoice/customers/your-access-token";
        
        // Customer data as JSON string
        String json = "[{\"name\":\"Acme Corporation\",\"email\":\"contact@acme.com\",\"country\":\"USA\",\"tax_number\":\"123456789\",\"peppol_id\":\"0192:123456789\",\"contact_person\":\"John Smith\",\"language\":\"EN\",\"city\":\"New York\",\"state\":\"NY\",\"address_line_1\":\"123 Business Ave\",\"postal_code\":\"10001\",\"sending_method\":\"Peppol\"}]";
        
        // Create HTTP client
        HttpClient client = HttpClient.newHttpClient();
        
        // Build request
        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(url))
            .header("Content-Type", "application/json")
            .POST(HttpRequest.BodyPublishers.ofString(json, StandardCharsets.UTF_8))
            .build();
        
        // Send request and get response
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        
        // Print the response
        System.out.println(response.body());
    }
}
