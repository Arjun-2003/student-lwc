public class Product2fieldChangeHelper {
    public static void afterUpdateHelper(List<Product2__c> listOfNewProduct2, List<Product2__c> listOfOldProduct2) {
        List<Opportunity__c> listOfNewOpportunity = new List<Opportunity__c>();

        Map<Id, Product2__c> oldMap = new Map<Id, Product2__c>();
        for (Product2__c oldRecord : listOfOldProduct2) {
            oldMap.put(oldRecord.Id, oldRecord);
        }
        for (Product2__c newRecord : listOfNewProduct2) {
            Product2__c oldRecord = oldMap.get(newRecord.Id);

            if (oldRecord != null && oldRecord.Done__c != newRecord.Done__c) {
                Opportunity__c opportunityRecord = new Opportunity__c();
                opportunityRecord.Don__c = newRecord.Done__c;
                listOfNewOpportunity.add(opportunityRecord);
                /*List<Opportunity__c> relatedOpps = [SELECT Id, Product2__c, Don__c FROM Opportunity__c WHERE Product2__c = :newRecord.Id];

                for (Opportunity__c opp : relatedOpps) {
                    opp.Don__c = newRecord.Done__c;
                    listOfNewOpportunity.add(opp);
                }
            }*/
        }
        if (!listOfNewOpportunity.isEmpty()) {
            update listOfNewOpportunity;
        }
    }
}
}
/*public class Product2fieldChangeHelper {
    public static void afterUpdateHelper(List<Product2__c> listOfNewProduct2, List<Product2__c> listOfOldProduct2){
        List<Opportunity__c> listOfNewOpportunity = new List<Opportunity__c>();
        for(Product2__c oldRecord : listOfOldProduct2){
            for(Product2__c newRecord : listOfNewProduct2){
                if(oldRecord.Done__c != newRecord.Done__c){
                     Opportunity__c opportunityRecord = new Opportunity__c();
                    if(opportunityRecord.Product2__c == newRecord.Id){
                         opportunityRecord.Don__c = newRecord.Done__c;
                         listOfNewOpportunity.add(opportunityRecord);
                    }                     
                }
            }
        }
         update listOfNewOpportunity;       
    }
}*/