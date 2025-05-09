trigger PropertyEmailTrigger on Property__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        PropertyEmailTriggerHandler.beforeInsertHandler(Trigger.new);        
    }
}