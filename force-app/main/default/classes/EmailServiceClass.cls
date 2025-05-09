global class EmailServiceClass implements Messaging.InboundEmailHandler {
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        if (email.subject != null && email.subject.startsWith('Issue -')) {
            try {
                Case newCase = new Case();
                newCase.Subject = email.subject;
                newCase.Description = email.plainTextBody;
                insert newCase;
            } catch (Exception e) {
                System.debug('Error' + e.getMessage());
                result.success = false;
                return result;
            }
        }
        result.success = true ;
        return  result ;
      }
  }