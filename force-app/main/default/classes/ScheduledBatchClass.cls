global class ScheduledBatchClass implements Schedulable {
    global void execute (SchedulableContext SC){
        MyBatchClass obj = new MyBatchClass();
        Database.executeBatch(obj, 5);
    }

}