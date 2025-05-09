public class MyBatchClass implements Database.Batchable<SObject> {
      
   public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([select Id ,Name, ProcessedOrNot__c from Account]);     
    }
    
   public void execute(Database.BatchableContext BC, List<Account> scope) {     
   List<Account> accs = new  List<Account>();
       for(integer i = 0 ; i<scope.size(); i++){
           Account acc = new Account();
           acc.id = scope[i].Id;
           acc.ProcessedOrNot__c = scope[i].Name + ' Hello Sir';
           accs.add(acc);
       }
       update accs; 
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Batch Process Completed!');
    }
}











/*public class MyBatchClass implements Database.Batchable<SObject> {
      
   public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([select Id ,Name, ProcessedOrNot__c from Account]);     
    }
   public void execute(Database.BatchableContext BC, List<Account> scope) { 
       try{
 List<Account> accs = new  List<Account>();
       for(integer i = 0 ; i<scope.size(); i++){
           Account acc = new Account();
           acc.id = scope[i].Id;
           acc.ProcessedOrNot__c = scope[i].Name + ' Hello Sir';
           //acc.scheduledClassStartTime__c = Datetime.now();
           accs.add(acc);
       }
       update accs; 
       }catch(Exception err){
        system.debug(err);
       }
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Batch Process Completed!');
    }
}*/