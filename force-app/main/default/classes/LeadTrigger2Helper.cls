public class LeadTrigger2Helper {
     public static void afterUpdateHelper(List<Lead> listOfLead){
         List<Task> newTaskRecord = new  List<Task>();
         for(Lead leadOf : listOfLead){
             if(leadOf.Status == 'Closed - Converted'){
              Task newTask = new Task(); 
              newTask.WhoId = leadOf.Id;                
              newTask.Subject = 'Lead is Converted';
         }        
    }
         if (!newTaskRecord.isEmpty()) {
            insert newTaskRecord; 
        }
           
}
}