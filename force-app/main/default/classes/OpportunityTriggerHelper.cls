public class OpportunityTriggerHelper {
    public static void opportunityAmount(List<Opportunity> Opp, Map<Id, Opportunity> oldMap) {
        try{
        String userAdminProfile = [SELECT Id, Name FROM Profile  WHERE Id = :UserInfo.getProfileId()].Name;
        for (Opportunity opps : Opp) {
             Opportunity oldOpp = oldMap.get(opps.Id);
             if (userAdminProfile != 'System Administrator') {
                 if(opps.Amount < oldOpp.Amount){       
                opps.addError('You Cannot Decrease The Amount');
            }
             }
        }
    }
         catch (Exception ex){
            System.debug('catch statement is executed');
         }
         finally{
            System.debug('finally statement is executed');
         }
  }
    
}








/*public class OpportunityTriggerHelper {
    public static Map<Id, Integer> getOpportunityCount(Set<Id> accountIds) {
        Map<Id, Integer> oppCountMap = new Map<Id, Integer>();
        
        List<AggregateResult> listOfOpp = [SELECT AccountId, COUNT(Id) FROM Opportunity WHERE AccountId IN :accountIds GROUP BY AccountId];
        
        for(AggregateResult arg : listOfOpp) {
            oppCountMap.put((Id)arg.get('AccountId'), (Integer)arg.get('expr0'));
        } 
        return oppCountMap;
    }
}*/