public class Product2TriggerHelper {
    public static void createSKU_Code(List<Product2__c> prod){
        try{
        Integer randomNumber = (Integer)(Math.random() * 10000);
        Date todayDate = Date.today();
        String Date2 = String.valueOf(todayDate).replace('-', '');
        for(Product2__c product : prod){
            if(product.SKU__c == null){
                 product.SKU__c = ('PROD-'+  Date2 + '-' + randomNumber);                      //'PROD-YYYYMMDD-XXXX' 
            }
        }        
    }
          catch (Exception ex){
            System.debug('catch statement is executed');
         }
         finally{
            System.debug('finally statement is executed');
         }
}
}






































/*public class Product2TriggerHelper {
    public static String randomNum(){
        String  num = '';
        for(integer i = 0;i <4; i++){
          num += String.valueOf(Math.mod(Math.abs(Crypto.getRandomInteger()), 10));
        }
        return  num ;
    }
    public static void beforeInsertHelper(List<Product2__c> productList){
        Date todayDate = Date.today(); 
        String formattedDate = String.valueOf(todayDate).replace('-', '');
        for(Product2__c product: productList){
            product.SKU__c = 'PROD-' + formattedDate + '-' + randomNum();
        }
    }
}*/