public class FutureMethodCall {
    @future (callout=true)
    public static void getWeatherData(String cityName) {
        String apiKey = 'c2019d6eb7894bcfa58115343231508';         
        String endpointUrl = 'http://api.weatherapi.com/v1/current.json?key=' + apiKey + '&q=' + cityName + '&aqi=no';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpointUrl);  
        
        
        req.setMethod('GET');         
        req.setHeader('Content-Type', 'application/json'); 
        
        Http http = new Http();
        HttpResponse res = http.send(req); 

        if (res.getStatusCode() == 200) {
                Map<String, Object> weatherData = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                
                Map<String, Object> current = (Map<String, Object>) weatherData.get('current');
                if (current != null && current.containsKey('temp_c')) {
                    Double temperature = (Double) current.get('temp_c');
                    
                    System.debug('Temperature in ' + cityName + ': ' + temperature + '°C');
                }
            }
        }
    }