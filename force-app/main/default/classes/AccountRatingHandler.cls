public class AccountRatingHandler {
    public static void beforeInsertHandler(List<Account> listOfAcoount){
        AccountRatingHelper.beforeInsertHelper(listOfAcoount);        
    }
}