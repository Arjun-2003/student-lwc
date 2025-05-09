public class Product2fieldChangeHandler {
    public static void afterUpdateHandler(List<Product2__c> listOfNewProduct2, List<Product2__c> listOfOldProduct2){
        Product2fieldChangeHelper.afterUpdateHelper(listOfNewProduct2, listOfOldProduct2);
        
    }

}