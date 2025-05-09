trigger AccountTrigger4 on Account (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        AccountTrigger4Handler.accountAfterInsertHandler(Trigger.new);
    }
}