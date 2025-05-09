trigger CaseTrigger on Case (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        CaseTriggerHendler.handleAfterInsert(Trigger.new);   
    }
}