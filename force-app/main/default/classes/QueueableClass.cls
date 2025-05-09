public class QueueableClass implements Queueable, Database.AllowsCallouts {
    private List<Id> caseIds;

    public QueueableClass(List<Id> caseIds) {
        this.caseIds = caseIds;
    }

    public void execute(QueueableContext context) {
        List<Case> casesToProcess = [SELECT Id, CaseNumber, Subject, Status FROM Case WHERE Id IN :caseIds];

        List<Map<String, String>> caseDataList = new List<Map<String, String>>();

        for (Case c : casesToProcess) {
            Map<String, String> caseData = new Map<String, String>();
            caseData.put('caseNumber', c.CaseNumber);
            caseData.put('subject', c.Subject);
            caseData.put('status', c.Status);
            caseDataList.add(caseData);
        }

        String jsonBody = JSON.serialize(caseDataList);

        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://webhook.site/03b372dd-675c-4475-bbf9-a9fcc0e7dfc2');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(jsonBody);

        try {
            HttpResponse res = h.send(req);
            System.debug('Response from external system: ' + res.getBody());
        } catch (Exception e) {
            System.debug('Error during the API call: ' + e.getMessage());
        }
    }
}