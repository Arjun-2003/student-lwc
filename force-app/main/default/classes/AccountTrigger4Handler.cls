public class AccountTrigger4Handler {
    public static void accountAfterInsertHandler(List<Account> accountId){
        AccountTrigger4Helper.accountAfterInsertHelper(accountId);
    }
        
    }