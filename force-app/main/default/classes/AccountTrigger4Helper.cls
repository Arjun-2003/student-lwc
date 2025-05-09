public class AccountTrigger4Helper {
   public static void accountAfterInsertHelper(List<Account> acc) {
        List<Contact> con = new List<Contact>();  // contact lenge naya
        for (Account accs : acc) {     // yaha naya account aayega, jo cretae hoga
            Contact c = new Contact();     // contact me add krenge 
            c.AccountId = accs.Id;      // contact ki id me naye account ki id daal denge
            c.LastName = accs.Name;    // same contact ki required field last name me account ka name aa jayega 
            con.add(c);                // yah hum add kr rhe hai naya contact
        }
        if (!con.isEmpty()) {
            insert con; 
        }
    }
}