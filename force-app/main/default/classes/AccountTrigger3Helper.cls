public class AccountTrigger3Helper {
     public static void assignUniqueNumber(List<Account> accList) { 
         try{
               AggregateResult result = [SELECT MAX(Account_Number__c) maxNumm FROM Account WHERE Account_Number__c != NULL];
               Long uniqueNumber = (result.get('maxNumm') != null) ? (Long) result.get('maxNumm') : 957165722;
               for (Account acc : accList) {
               if (acc.Account_Number__c == null) {
               uniqueNumber++; 
               acc.Account_Number__c = uniqueNumber; 
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