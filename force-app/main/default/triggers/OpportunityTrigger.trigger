trigger OpportunityTrigger on Opportunity (before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        OpportunityTriggerHandler.handleBeforeInsert(Trigger.new, Trigger.oldMap);
    }
}




/*trigger OpportunityTrigger on Opportunity (before insert) {
    if(Trigger.isBefore && Trigger.isInsert) {
        OpportunityTriggerHandler.handleBeforeInsert(Trigger.new);
    }
}*/


















/*trigger OpportunityTrigger on Opportunity (before insert) {
 Set<Id> accountIds = new Set<Id>();
    
    for(Opportunity Opp : Trigger.new){
        accountIds.add(Opp.AccountId);
    }
    Map<Id, Integer> OppCount = new Map<Id, Integer>{};
    List<AggregateResult> listOfOpp = [SELECT AccountId ,COUNT(Id) FROM Opportunity WHERE AccountId IN :accountIds GROUP BY AccountId];
    for(AggregateResult arg : listOfOpp){
        OppCount.put((Id)arg.get('AccountId'), (Integer)arg.get('expr0'));
    }
    for(Opportunity opp : Trigger.new){
        if(OppCount.containsKey(opp.AccountId)) {
            if(OppCount.get(opp.AccountId) >= 2){
                opp.addError('Unable to create the opportunity');
       }
      }
    }
  }*/


    


    

/*trigger OpportunityTrigger on Opportunity (before insert) {
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity opp : trigger.new) {
        accountIds.add(opp.AccountId);
    }

    Map<Id, Integer> OppCount = new Map<Id, Integer>(
        [SELECT AccountId, COUNT(Id) count FROM Opportunity WHERE AccountId IN :accountIds GROUP BY AccountId ]);

    for (Opportunity opp : trigger.new) {
        if (OppCount.get(opp.AccountId) >= 2) {
            opp.addError('Cannot Create');
        }
    }
}*/















/*trigger OpportunityTrigger on Opportunity (before insert, before update) {
Map<Id, Account> MapOfAccount = new Map<Id, Account>();
    
    for(Opportunity Opp = Trigger.new){
        MapOfAccount.put(Opp.AccountId, Opp);
    }
    
    List<Opportunity> ListOfOpp = [SELECT AccountId, COUNT(Id) OppCount FROM Opportunity WHERE AccountId IN :MapOfAccount.keyset()];
    
       if (OppCount >= 2) {
            for (Opportunity Opp : opportunities) {
                opp.addError('Cannot Create');
            }
}
}*/








/*trigger OpportunityTrigger on Opportunity (before insert, before update) {
    Set<Id> accountIds = new Set<Id>();
    
    for (Opportunity opp : Trigger.new) {
        if (opp.AccountId != null) {
            accountIds.add(opp.AccountId);
        }
    }
    if (!accountIds.isEmpty()) {
        Map<Id, Integer> oppCountMap = new Map<Id, Integer>();
        for (AggregateResult result : [SELECT AccountId, COUNT(Id) oppCount FROM Opportunity WHERE AccountId IN :accountIds GROUP BY AccountId]) {
            oppCountMap.put((Id)result.get('AccountId'), (Integer)result.get('oppCount'));
        }
        for (Opportunity opp : Trigger.new) {
            if (opp.AccountId != null && oppCountMap.containsKey(opp.AccountId)) {
                Integer oppCount = oppCountMap.get(opp.AccountId);  // Renamed the variable to oppCount
                if (oppCount >= 2) {
                    opp.addError('Cannot create more than 2 Opportunities for this Account.');
                }
            }
        }
    }
}
*/