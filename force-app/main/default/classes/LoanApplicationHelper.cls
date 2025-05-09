public class LoanApplicationHelper {
    public static void InsertloanAmountSmaller(List<Loan_Application__c> listOfNew){
    for (Loan_Application__c loan : listOfNew) {
        if (loan.Amount__c < 5000) {
            loan.addError('Loan Amount must be greater than 5000.');
        }
    }

    }
    public static void updateLoanAmountSmaller(List<Loan_Application__c> listOfOld){
    for (Loan_Application__c loan : listOfOld) {
        if (loan.Amount__c < 5000) {
            loan.addError('Loan Amount must be greater than 5000.');
        }
    }
}
}