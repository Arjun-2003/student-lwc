trigger Product2fieldChange on Product2__c (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        Product2fieldChangeHandler.afterUpdateHandler(Trigger.new, Trigger.old);
    }
}