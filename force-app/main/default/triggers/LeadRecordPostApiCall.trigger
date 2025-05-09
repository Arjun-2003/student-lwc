trigger LeadRecordPostApiCall on Lead (after insert) {  // after update
    //Question 2 :)
    if(Trigger.isAfter && Trigger.isInsert){
        LeadRecordPostApiCallHandler.afterInsertHandler(Trigger.new);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*//Question 7 :)
     if(Trigger.isAfter && Trigger.isInsert){
        LeadRecordPostApiCallHandler.afterUpdateHandler(Trigger.new);
    }*/

}