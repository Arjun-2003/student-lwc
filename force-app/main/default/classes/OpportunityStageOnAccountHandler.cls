public class OpportunityStageOnAccountHandler {
     public static void afterInsertHandler(List<Opportunity> listOfNewOpportunity){
        OpportunityStageOnAccountHelper.afterInsertHelper(listOfNewOpportunity);       
    }
    
    public static void afterUpdateHandler(List<Opportunity> listOfUpdateOpportunity){
        OpportunityStageOnAccountHelper.afterUpdateHelper(listOfUpdateOpportunity);       
    }
}