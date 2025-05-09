trigger LeadTrigger on Lead (after insert, after update) {
    if(Trigger.isafter && Trigger.isInsert){
        LeadTriggerHandler.handleAfterInsert(Trigger.new);
    }
    if(Trigger.isafter && Trigger.isUpdate){
        LeadTriggerHandler.handleAfterUpdate(Trigger.old);
    }
}