public class LeadTriggerHelper {
    public static void statusQualifiedCreateNewOppo(List<Lead> listOfNewLead){
        
        List<Opportunity> oppNewList = new List<Opportunity>();
        for(Lead leadOf : listOfNewLead){
            if(leadOf.Status == 'Closed - Converted'){
            Opportunity opp = new Opportunity();
            opp.Name = leadOf.Company; 
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today().addMonths(1);
            opp.LeadSource = leadOf.LeadSource;
            opp.LeadRecordId__c = leadOf.Id;
                
            oppNewList.add(opp);
            }   
        } 
         insert oppNewList;
    }  
     public static void statusQualifiedCreateOldOppo(List<Lead> listOfOldLead){
        List<Opportunity> oppOldList = new List<Opportunity>();
        for(Lead leadOf : listOfOldLead){
            if(leadOf.Status == 'Closed - Converted'){
            Opportunity opp = new Opportunity();
            opp.Name = leadOf.Company; 
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today().addMonths(1);
            opp.LeadSource = leadOf.LeadSource;
            opp.AccountId = leadOf.ConvertedAccountId;
                opp.LeadRecordId__c = leadOf.Id;
                
            oppOldList.add(opp);
                
            }   
        } 
      insert oppOldList;
     }
}