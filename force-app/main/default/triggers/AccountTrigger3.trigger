trigger AccountTrigger3 on Account (before insert) {
    if((Trigger.isBefore) && (Trigger.isInsert)){
      AccountTrigger3Handler.handleBeforeInsert(Trigger.new);
}
}