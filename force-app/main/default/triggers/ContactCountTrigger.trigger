trigger ContactCountTrigger on Contact (after insert, after delete, after update) {
    if (Trigger.isInsert) {                                        // Question 1 :)
        ContactCountHandler.afterInsertHandler(Trigger.new);
    } else if (Trigger.isDelete) {
        ContactCountHandler.afterDeleteHandler(Trigger.old);
    }/* else if (Trigger.isUpdate) {                                 // Question 10 :)
        ContactCountHandler.afterUpdateHandler(Trigger.new);
        //  Trigger.old = Contact oldContact = Trigger.oldMap.get(newContact.Id);
    }*/
}