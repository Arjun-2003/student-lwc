public class PropertyEmailTriggerHandler {
    public static void beforeInsertHandler(List<Property__c> listOfProperty){
        for(Property__c newPropertyRecord : listOfProperty){
            if(newPropertyRecord.Email__c.endsWith('@gmail.com')){
                newPropertyRecord.Description__c = 'Internal Employee';
            }
        }        
    }
}