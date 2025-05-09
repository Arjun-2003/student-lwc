public class OpportunityListId {
    public static Map<Id, Opportunity> getListOfOpportunityIds(List<Id> opportunityIds) {
        
        return new Map<Id,Opportunity>([SELECT Id, Name, Amount FROM Opportunity WHERE Id IN :opportunityIds]);
      
       /* Map<Id, Opportunity> mapOfOpportunity = new Map<Id, Opportunity>();
        
        if (!opportunityIds.isEmpty()) {
            List<Opportunity> oppoRecords = [SELECT Id, Name, Amount FROM Opportunity WHERE Id IN :opportunityIds];
                for (Opportunity oppor : oppoRecords) {
                mapOfOpportunity.put(oppor.Id, oppor);
            }
        }
        return mapOfOpportunity;*/
    }
}





/*Map<ID, Contact> m = new Map<ID, Contact>([SELECT Id, LastName FROM Contact]);*/

//List<Opportunity> oppoRecords = [SELECT Id, Name, Amount FROM Opportunity WHERE Id IN :opportunityIds];
















/*List<Id> oppoIds = new List<Id>{'006dL000007wMcOQAU'};
Map<Id, Opportunity> opportunities = OpportunityListId.getListOfOpportunityIds(oppoIds);

for (Id oppId : opportunities.keySet()) {
    Opportunity opp = opportunities.get(oppId);
    System.debug('Opportunity Name: ' + opp.Name);
    System.debug('Opportunity Amount: ' + opp.Amount);
}*/