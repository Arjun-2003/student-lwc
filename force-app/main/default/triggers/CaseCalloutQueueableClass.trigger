trigger CaseCalloutQueueableClass on Case (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        CaseCalloutQueueableClassHandler.afterInsertHelper(Trigger.new);
    }
}