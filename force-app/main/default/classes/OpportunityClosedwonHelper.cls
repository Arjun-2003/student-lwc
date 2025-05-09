public class OpportunityClosedwonHelper {
     public static void primaryContact(List<Opportunity> newList, Map<Id, Opportunity> oldOppMap) {
        set<Id> opportunityIds = new Set<Id>();
        for (Opportunity opp : newList) {
            Opportunity oldOpp = oldOppMap.get(opp.Id);
            if (opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won') {
                opportunityIds.add(opp.Id);
            }
}
        if(!opportunityIds.isEmpty()){
            OpportunityPDFEmailSender.sendPDFEmail(opportunityIds);
        }
    }
}