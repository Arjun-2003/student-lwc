public class AccountRatingHelper {
    public static void beforeInsertHelper(List<Account> listOfAcoount){
        for(Account accountRecord :  listOfAcoount){
             if (accountRecord.Industry == 'Healthcare' || accountRecord.Industry == 'Banking') 
             {
                    accountRecord.Account_Rating__c = 'HOT';
             }
            else{
                 accountRecord.Account_Rating__c = 'COLD';
                }                
        }        
    }
}