public class LeadTrigger2Handler {
    public static void afterUpdateHandler(List<Lead> listOfLead){
        LeadTrigger2Helper.afterUpdateHelper(listOfLead);        
    }
}