public class ProjectTriggerHandler {
    public static void handleBeforeDelete(List<Project__c> pro){
        ProjectTriggerHelper.projectRelatedTaskUndelete(pro);
        
    }

}