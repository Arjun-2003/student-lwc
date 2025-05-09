trigger AccountTrigger2 on Account (before insert, before update, before delete) {
    if(Trigger.isBefore && Trigger.isInsert){
     for (Account acc : Trigger.new) {
        if (acc.Name.startsWith('M')) {
            acc.Name.addError('did not Save');  
        } 
     }
    }
    if(Trigger.isBefore && Trigger.isUpdate){
     for (Account acc : Trigger.new) {
        if (acc.Name.startsWith('D')) {
            acc.Name.addError('did not Save');  
        } 
     }
    }
    if(Trigger.isBefore && Trigger.isDelete){
     for (Account acc : Trigger.old) {
        if (acc.Name.startsWith('N')) {
            acc.Name.addError('did not Save');  
        } 
     }
    }
    
}