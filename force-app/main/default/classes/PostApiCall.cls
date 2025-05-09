public class PostApiCall {
    @future(callout=true)
    public static void postRequestCall(String jsonString) {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://webhook.site/03b372dd-675c-4475-bbf9-a9fcc0e7dfc2');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(jsonString);
        
        try {
            HttpResponse res = h.send(req);
        } catch (Exception e) {
            System.debug('Error' + e.getMessage());
        }
    }
}