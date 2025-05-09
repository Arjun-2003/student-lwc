trigger EmailOnOwner on Owner__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        EmailOnOwnerHandler.afterInsertHandler(Trigger.new);
    }

}