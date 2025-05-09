trigger OpportunityStageOnAccount on Opportunity (after insert, after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        OpportunityStageOnAccountHandler.afterInsertHandler(Trigger.new);
    }  
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityStageOnAccountHandler.afterUpdateHandler(Trigger.new);
    }   
}