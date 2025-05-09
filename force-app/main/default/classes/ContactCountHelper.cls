public class ContactCountHelper {
    //Question 1 :)
    public static void afterinsertHelper(List<Contact> listOfContact) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact newContact : listOfContact) {
            if (newContact.AccountId != null) {
                accountIds.add(newContact.AccountId);
            }
        }
        if (!accountIds.isEmpty()) {
            List<AggregateResult> results = [SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId];
            Map<Id, Integer> mapOfContactCount = new Map<Id, Integer>();
            for (AggregateResult ar : results) {
                Id accountId = (Id) ar.get('AccountId');
                Integer count = (Integer) ar.get('contactCount');
                mapOfContactCount.put(accountId, count);
            }

            List<Account> accountsToUpdate = new List<Account>();
            for (Id accountId : accountIds) {
                Integer contactCount = mapOfContactCount.get(accountId);
                Account accountToUpdate = new Account(
                    Id = accountId,
                    Total_Contacts__c = (contactCount != null) ? contactCount : 0
                );
                accountsToUpdate.add(accountToUpdate);
            }
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*// Question 10 :)
    public static void afterUpdateHelper(List<Contact> listofContact){
            List<Contact_Address_Changed_e__e> events = new List<Contact_Address_Changed_e__e>();
            for(Contact contactRecord : listofContact){
                Contact oldContactRecord = (Contact)Trigger.oldMap.get(contactRecord.Id);
                  if (contactRecord.Email != oldContactRecord.Email) {
                      events.add(new Contact_Address_Changed_e__e(    
                      contactId__c = contactRecord.Id,
                      oldMailAdress__c = oldContactRecord.Email,
                      newMailAddress__c = contactRecord.Email
                      ));
                  }
            }    
    if (!events.isEmpty()) {
        Database.SaveResult[] results = EventBus.publish(events);
    }
    } */           
}