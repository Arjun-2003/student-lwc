trigger LoanApplicationTrigger on Loan_Application__c (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        LoanApplicationHandler.handleBeforeInsert(Trigger.new);
    }
     if(Trigger.isBefore && Trigger.isUpdate){
        LoanApplicationHandler.handleBeforeUpdate(Trigger.old);
    }

}