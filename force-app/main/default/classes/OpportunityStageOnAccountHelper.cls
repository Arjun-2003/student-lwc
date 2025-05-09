public class OpportunityStageOnAccountHelper {
    // New Opportunity Create :)
    public static void afterInsertHelper(List<Opportunity> listOfNewOpportunity) {
        List<Account> listOfNewAccount = new List<Account>();
        for (Opportunity opportunityRecord : listOfNewOpportunity) {
            if (opportunityRecord != null && opportunityRecord.AccountId != null) {
                Account newAccount = new Account(Id = opportunityRecord.AccountId);    // hum seedha usi account ki field me insert karenge
                newAccount.Latest_Opportunity_Stage__c = opportunityRecord.StageName;
                listOfNewAccount.add(newAccount);
            }
        }
        if (!listOfNewAccount.isEmpty()) {
            update listOfNewAccount;
        }
    }

     // Updated Opportunity :)
    public static void afterUpdateHelper(List<Opportunity> listOfUpdateOpportunity) {
        List<Account> listOfUpdatedAccount = new List<Account>();

        for (Opportunity opportunityRecord : listOfUpdateOpportunity) {
            Account accountRecord = new Account(Id = opportunityRecord.AccountId);
            Opportunity oldOpportunity = (Opportunity)Trigger.oldMap.get(opportunityRecord.Id);    //  illegal assignment tha, sobject ko opportunity me sidha
           
            if (opportunityRecord.StageName != oldOpportunity.StageName) {
                accountRecord.Latest_Opportunity_Stage__c = opportunityRecord.StageName;
                listOfUpdatedAccount.add(accountRecord);
            }
        }
        if (!listOfUpdatedAccount.isEmpty()) {
            update listOfUpdatedAccount;
        }
    }
}