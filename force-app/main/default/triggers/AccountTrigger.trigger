trigger AccountTrigger on Account (before insert, before update) {
    if (Trigger.isBefore && Trigger.isInsert){
        System.debug('Record is Created, Before Insert');
    }
     else if (Trigger.isBefore && Trigger.isUpdate){
         for (Account acc : Trigger.new){
             System.debug('New Name : '+ acc.Name);
             System.debug('Old Name :'+ Trigger.oldMap.get(acc.Id).Name);
         }
    }
}       
   /*  else if (Trigger.isAfter && Trigger.isInsert){
        System.debug('Record is Created, After Insert');
    }
     else if (Trigger.isAfter && Trigger.isUpdate){
        System.debug('Record is Updated, After Update');
    }
} */