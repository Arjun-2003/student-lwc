public class ContactTriggerHelper {
    public static void contactCount(List<Contact> con){
        try{
    set<Id> accountId = new set<Id>();
    for (Contact cont : con){
        if(cont.AccountId != null){
            accountId.add(cont.AccountId);
        }     
    }
      List<AggregateResult> result = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE AccountId IN :accountId GROUP BY AccountId];
      list <Account> listOfAccountUpdate = new list<Account>();
        for(AggregateResult ag: result){
            ID accountIdd = (ID)ag.get('AccountId');
            integer contactCounnt = (integer)ag.get('totalContacts');
            Account acc = new Account();
            acc.Id = accountIdd;
            acc.No_Of_Contact__c = contactCounnt;
            listOfAccountUpdate.add(acc);
        }
        update listOfAccountUpdate;
    }
         catch (Exception ex){
            System.debug('catch statement is executed');
         }
         finally{
            System.debug('finally statement is executed');
         }
}
}