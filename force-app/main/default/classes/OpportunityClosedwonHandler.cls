public class OpportunityClosedwonHandler {
    public static void afterUpdateHandler(List<Opportunity> newList, Map<Id, Opportunity> oldOppMap){
        OpportunityClosedwonHelper.primaryContact(newList,oldOppMap);
        
    }

}