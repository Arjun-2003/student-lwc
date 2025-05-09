public class CaseCalloutQueueableClassHandler {
    public static void afterInsertHelper(List<Case> listOfCase){
        List<Id> caseId = new List<Id>();
        for(Case caseRecord : listOfCase){
            caseId.add(caseRecord.Id);
        }
            
        if (!caseId.isEmpty()) {
           System.enqueueJob(new QueueableClass(caseId));
        }
    }
}