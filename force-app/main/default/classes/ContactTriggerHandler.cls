public class ContactTriggerHandler {
    public static void handleAfterInsertUpdate(List<Contact> con){
        ContactTriggerHelper.contactCount(con);
    }

}