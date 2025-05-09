trigger OpportunityClosedwonTrigger on Opportunity (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityClosedwonHandler.afterUpdateHandler(Trigger.new, Trigger.oldMap);
    }

}