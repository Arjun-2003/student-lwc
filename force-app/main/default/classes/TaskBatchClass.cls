public class TaskBatchClass implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext context) {
        Date oneYearAgo = System.today().addYears(-1);
        String query = 'SELECT Id FROM Task WHERE Status = \'Completed\' AND ActivityDate <= :oneYearAgo';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext context, List<Task> scope) {
        if (!scope.isEmpty()) {
            delete scope;
        }
    }

    public void finish(Database.BatchableContext context) {
        System.debug('Batch Process Completed');
    }
}