public class ProjectTriggerHelper {
     public static void projectRelatedTaskUndelete(List<Project__c> pro){
         try{
         set<Id> projectId = new set<Id>();
         for(Project__c proj : pro){
             projectId.add(proj.Id);
         }
          List<Tasks__c> relatedTasks = [SELECT Id, Project__c FROM Tasks__c WHERE Project__c IN :projectId];
    Set<Id> projectsWithTasks = new Set<Id>();
    for (Tasks__c task : relatedTasks) {
        projectsWithTasks.add(task.Project__c);
    }
    for (Project__c project : pro) {
        if (projectsWithTasks.contains(project.Id)) {
            project.addError('Cannot delete');
        }
    }
         }
          catch (Exception ex){
            System.debug('catch statement is executed');
         }
         finally{
            System.debug('finally statement is executed');
         }
}
}