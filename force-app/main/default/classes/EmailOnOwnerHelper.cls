public class EmailOnOwnerHelper {
    public static void afterInsertHelper(List<Owner__c> listOfOwner) {
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
        List<Owner__c> ownersToUpdate = new List<Owner__c>();

        for (Owner__c ownerRecord : listOfOwner) {
            if (String.isNotBlank(ownerRecord.Email__c)) {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] { ownerRecord.Email__c });
                mail.setSubject('Welcome Sir');
                mail.setPlainTextBody('Hello, ' + ownerRecord.Name);
                emailsToSend.add(mail);
            }
        }
        if (!emailsToSend.isEmpty()) {
            try {
                Messaging.SendEmailResult[] results = Messaging.sendEmail(emailsToSend);
                
                for (Integer i = 0; i < results.size(); i++) {
                    Messaging.SendEmailResult result = results[i];
                    Owner__c ownerRecord = listOfOwner[i];
                    
                    if (result.isSuccess()) {
                        ownerRecord.Email_Share__c = true;
                    } else {
                        for (Messaging.SendEmailError error : result.getErrors()) {
                            System.debug('Error sending email to ' + ownerRecord.Email__c + ': ' + error.getMessage());
                        }
                    }
                }
              update ownersToUpdate;
            } catch (Exception e) {
                System.debug('Error sending emails: ' + e.getMessage());
            }
        }
    }
}