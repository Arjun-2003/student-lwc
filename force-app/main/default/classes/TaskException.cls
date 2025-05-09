public class TaskException extends Exception {
    public static void handle(String Names){
        List<Account> ac=new List<Account>();
        try{
        Account accs = new Account();
        accs.Name = Names;
        ac.add(accs);
        Insert ac;
        }catch(Exception err){
            system.debug(err);
        }
}
}