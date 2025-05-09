public class OrderItemHandler {
    public static void handleAfterInsertUpdate(List<Order_Item__c> listOfNewOrderItem, List<Order_Item__c> listOfOldOrderItem){
        OrderItemHelper.totalOrderValueSum(listOfNewOrderItem, listOfOldOrderItem);
        
    }

}