public class OpportunityPDFEmailSender {
     @future(callout=true)
    public static void sendPDFEmail(Set<Id> oppIds) {
        List<Opportunity> oppList = [SELECT Id, Name, Amount, StageName FROM Opportunity WHERE Id IN :oppIds];
        Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>(oppList);

        List<OpportunityContactRole> contactRoles = [
            SELECT OpportunityId, ContactId, Contact.Email
            FROM OpportunityContactRole
            WHERE OpportunityId IN :oppIds AND Contact.Email != null
        ];

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (OpportunityContactRole conRole : contactRoles) {
            Opportunity opp = oppMap.get(conRole.OpportunityId);

            PageReference pdfPage = Page.OpportunityPDF;
            pdfPage.getParameters().put('id', opp.Id);
            Blob pdfBlob = pdfPage.getContent();

            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[]{conRole.Contact.Email});
            email.setSubject('Opportunity Detail PDF');
            email.setPlainTextBody('Dear Contact, Please find attached PDF with Opportunity details.');
            Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
            attachment.setFileName('OpportunityPDF');
            attachment.setBody(pdfBlob);
            attachment.setContentType('application/pdf');
            email.setFileAttachments(new Messaging.EmailFileAttachment[]{attachment});
            emails.add(email);
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }

    }
}