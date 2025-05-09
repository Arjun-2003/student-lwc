public class MapDemo {
    public static void mapDemoFunction(){
        Map<Id, Account> mapOf = new Map<Id, Account>([SELECT Id, Name FROM Account LIMIT 5]);
        for(Id keyIds : mapOf.keyset()){
            Account a = mapOf.get(keyIds);
            System.debug(a);
        }
      System.debug(mapOf);
    }
}