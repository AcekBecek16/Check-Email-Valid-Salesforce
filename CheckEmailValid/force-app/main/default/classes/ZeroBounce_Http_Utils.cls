public class ZeroBounce_Http_Utils {
    public static String doRequest(String Body) {

        Http http = new Http();
        HttpRequest req = new HttpRequest();

        String endpoint = system.label.zeroBounce_URL+'api_key='+system.label.zeroBounce_ApiKey+'&email='+body+'&ip_address=';
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        req.setEndpoint(endpoint);

        HttpResponse res = http.send(req);

        system.debug(res.getBody());

        object obj_res = JSON.deserializeUntyped(res.getBody());
        Map<String, Object> DataJSON = (Map<String, Object>) obj_res;

        system.debug(String.valueOf(DataJSON.get('status')));

        return String.valueOf(DataJSON.get('status'));

    }
}
