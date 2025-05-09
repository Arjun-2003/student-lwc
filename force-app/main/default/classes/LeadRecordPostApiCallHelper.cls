public class LeadRecordPostApiCallHelper {
    public static void afterInsertHelper(List<Lead> newLeads) {
        List<LeadData> leadDataList = new List<LeadData>();

        for (Lead lead : newLeads) {
            if (lead.Name != null && lead.Email != null) {
                leadDataList.add(new LeadData(lead.Name.trim(), lead.Email.trim()));
            }
        }
        if (!leadDataList.isEmpty()) {
            try {
                String jsonString = JSON.serialize(leadDataList);
                PostApiCall.postRequestCall(jsonString);
            } catch (Exception ex) {
                System.debug('Error While API Call ' + ex.getMessage());
            }
        }
    }
    public class LeadData {
        public String name;
        public String email;

        public LeadData(String name, String email) {
            this.name = name;
            this.email = email;
        }
    }
}

    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*//Question 7 :)
   public static void afterUpdateHelper(List<Lead> listOfUpdateLead) {
    List<LeadData> leadDataList = new List<LeadData>();

    for (Lead leadRecord : listOfUpdateLead) {
        Lead oldLead = (Lead)Trigger.oldMap.get(leadRecord.Id);

        if (leadRecord.Status == 'Converted' && oldLead.Status != 'Converted') {
            if (leadRecord.Email != null) {
                LeadData data = new LeadData();
                data.id = leadRecord.Id;
                data.email = leadRecord.Email;
                leadDataList.add(data);
            }
        }
    }

    if (!leadDataList.isEmpty()) {
        String jsonString = JSON.serialize(leadDataList);
        PostApiCall.testPostReq(jsonString);
    }
   }
*/