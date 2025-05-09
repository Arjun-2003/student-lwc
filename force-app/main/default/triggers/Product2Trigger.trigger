trigger Product2Trigger on Product2__c (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        Product2TriggerHandler.handleBeforeInsert(Trigger.new);
              }
}