public class LeadTriggerHandler {
    public static void handleAfterInsert(List<Lead> listOfNewLead){
        LeadTriggerHelper.statusQualifiedCreateNewOppo(listOfNewLead);
        
    }
      public static void handleAfterUpdate(List<Lead> listOfOldLead){
        LeadTriggerHelper.statusQualifiedCreateOldOppo(listOfOldLead);
        
    }

}