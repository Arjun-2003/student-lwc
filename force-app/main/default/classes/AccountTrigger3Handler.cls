public class AccountTrigger3Handler {
     public static void handleBeforeInsert(List<Account> accList) {
        AccountTrigger3Helper.assignUniqueNumber(accList);
    }
}