trigger LeadTrigger2 on Lead (after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        LeadTrigger2Handler.afterUpdateHandler(Trigger.new);
    }

}