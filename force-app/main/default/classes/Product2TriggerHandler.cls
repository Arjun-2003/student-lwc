public class Product2TriggerHandler {
    public static void handleBeforeInsert(List<Product2__c> prod){
        Product2TriggerHelper.createSKU_Code(prod);
    }
}