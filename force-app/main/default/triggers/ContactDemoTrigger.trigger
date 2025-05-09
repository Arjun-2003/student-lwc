trigger ContactDemoTrigger on Contact (after insert, after update) {
    Set<Id> accountIds = new Set<Id>();
    for (Contact con : Trigger.new) {
        if (con.AccountId != null) {
            accountIds.add(con.AccountId);
        }
    }
    Map<Id, Integer> contactCountMap = new Map<Id, Integer>();
    for (AggregateResult result : [SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId]) 
    {
        contactCountMap.put((Id) result.get('AccountId'), (Integer) result.get('contactCount'));
    }
    List<Account> accountsToUpdate = new List<Account>();
    for (Id accId : contactCountMap.keySet()) {
        accountsToUpdate.add(new Account(Id = accId,howManyContacts__c = contactCountMap.get(accId)));
    }
    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}