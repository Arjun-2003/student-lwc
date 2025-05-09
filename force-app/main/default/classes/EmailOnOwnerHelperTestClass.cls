@isTest
public class EmailOnOwnerHelperTestClass {
    @isTest
    static void testAfterInsertHelper() {
        Test.startTest();
        Owner__c owner = new Owner__c();
        owner.Name = 'Test Owner';
        owner.Email__c = 'test@example.com';
        owner.Contact_Number__c = '676786876';
        insert owner;
       // EmailOnOwnerHelper.afterInsertHelper(new List<Owner__c>{owner});
        Test.stopTest();

        Owner__c updatedOwner = [SELECT Id, Email_Share__c FROM Owner__c WHERE Id = :owner.Id LIMIT 1];
        Assert.isTrue(updatedOwner.Email_Share__c, 'Email_Share__c should be true');
    }
}