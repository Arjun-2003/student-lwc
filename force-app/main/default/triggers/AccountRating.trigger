trigger AccountRating on Account (before insert) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        AccountRatingHandler.beforeInsertHandler(Trigger.new);        
    }
}





/*trigger AccountRating on Account (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        AccountRatingHandler.beforeInsertHandler(Trigger.new);        
    }
}*/