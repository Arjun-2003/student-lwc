public class LoanApplicationHandler {
    public static void handleBeforeInsert(List<Loan_Application__c> listOfNew){
        LoanApplicationHelper.InsertloanAmountSmaller(listOfNew);
    }
    public static void handleBeforeUpdate(List<Loan_Application__c> listOfOld){
        LoanApplicationHelper.updateLoanAmountSmaller(listOfOld);
    }


}