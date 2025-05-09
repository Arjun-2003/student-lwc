public class OpportunityTriggerHandler {
    public static void handleBeforeInsert(List<Opportunity> Opp, Map<Id, Opportunity> oldMap) {
       OpportunityTriggerHelper.opportunityAmount(Opp, oldMap);
        }
    }

























/*public class OpportunityTriggerHandler {
    
    public static void handleBeforeInsert(List<Opportunity> newOpportunities) {
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : newOpportunities) {
            accountIds.add(opp.AccountId);
        }
        Map<Id, Integer> oppCount = OpportunityTriggerHelper.getOpportunityCount(accountIds);
        for(Opportunity opp : newOpportunities) {
            if(oppCount.containsKey(opp.AccountId)) {
                if(oppCount.get(opp.AccountId) >= 2) {
                    
                    opp.addError('Unable to create');
                }
            }
        }
    }
}*/