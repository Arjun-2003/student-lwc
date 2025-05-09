@isTest
public class Product2TestClass {
    @isTest
    static void testCreateSKU_Code() {
        Test.startTest();     
        Product2__c product = new Product2__c();
        product.Name = 'Product A';
        insert product;
        
        Test.stopTest();
        
        Product2__c getproductRecord = [SELECT Id, SKU__c FROM Product2__c WHERE Id = :product.Id LIMIT 1];
        
        Assert.isTrue(getproductRecord.SKU__c.startsWith('PROD-'), 'Start with PROD');
    }
}