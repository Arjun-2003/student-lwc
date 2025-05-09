trigger ProjectTrigger on Project__c (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){ 
         ProjectTriggerHandler.handleBeforeDelete(Trigger.old);  
    }
}