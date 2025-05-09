public class EmailOnOwnerHandler {
    public static void afterInsertHandler(List<Owner__c> listOfOwner){
        EmailOnOwnerHelper.afterInsertHelper(listOfOwner);
        
    }

}