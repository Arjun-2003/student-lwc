public class TaskTriggerHandler {
    public static void handleAfterUpdate(Map<Id,Task> mapOfTask){
        TaskTriggerHelper.createAfterUpdate(mapOfTask);
        
    }

}