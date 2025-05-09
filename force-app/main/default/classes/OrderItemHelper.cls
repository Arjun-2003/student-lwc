public class OrderItemHelper {
      public static void totalOrderValueSum(List<Order_Item__c> listOfNewOrderItem, List<Order_Item__c> listOfOldOrderItem){
        Set<Id> orderIds = new Set<Id>();
            for (Order_Item__c itemOf : listOfNewOrderItem) {
                if (itemOf.Orders__c != null) {
                    orderIds.add(itemOf.Orders__c);
                }
            }
        List<Order__c> ordersToUpdate = new List<Order__c>();
        for (AggregateResult ar : [SELECT Orders__c Id, SUM(	Price__c) totalValue FROM Order_Item__c WHERE Orders__c IN :orderIds GROUP BY Orders__c]) {
            ordersToUpdate.add(new Order__c(Id = (Id) ar.get('Id'), Total_Order_Value__c = (Decimal) ar.get('totalValue')));
        }
        if (!ordersToUpdate.isEmpty()) {
            update ordersToUpdate;
        }
    }
        }