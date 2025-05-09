trigger ContactTrigger on Contact (after insert, after update) {
     if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            ContactTriggerHandler.handleAfterInsertUpdate(Trigger.new);
        } else if (Trigger.isUpdate) {
            ContactTriggerHandler.handleAfterInsertUpdate(Trigger.old);
        }
    }
    }



























/*trigger ContactTrigger on Contact (after insert) {
    
set<Id> accountId = new set<Id>();
    for (Contact con : Trigger.new){
        if(con.AccountId != null){
            accountId.add(con.AccountId);
        }   
    }
     Map<Id, Integer> contCount = new Map<Id, Integer>();
     for (Contact con : Trigger.new){
         List<AggregateResult> listOfCont = [SELECT AccountId , COUNT(Id) contCounts FROM Contact WHERE AccountId IN :accountId GROUP BY AccountId];
               contCount.put((String)con.get('AccountId'), (Integer)con.get('contCounts'));
             }
    list<Account> acc = new list<Account>();
    
    for(Contact conn : Trigger.new){
        if(contCount.containsKey(conn.AccountId)){
            Account accs = new Account();
            accs.Id = conn.AccountId;
            accs.No_Of_Contact__c = contCount.get(conn.AccountId);
            acc.add(accs); 
        }
    }
    update acc;
    }*/










/*trigger ContactTrigger on Contact (before insert) {
    Set<Id> accountIds = new Set<Id>();

    for (Contact con : Trigger.new) {
        if (con.AccountId != null) {
            accountIds.add(con.AccountId);
        }
    }
    if (!accountIds.isEmpty()) {
        for (Id accountId : accountIds) {
            Integer ContCount = [SELECT COUNT() FROM Contact WHERE AccountId = :accountId];
            for (Contact con : Trigger.new) {
                if (con.AccountId == accountId && ContCount >= 2) {
                    con.addError('Cannot create more');
                }
            }
        }
    }
}*/
/*
SELECT AccountId, COUNT(Id) 
FROM Opportunity
GROUP BY AccountId
*/