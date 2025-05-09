public class CaseTriggerHendler {
    public static void handleAfterInsert(List<Case> cas){
        CaseTriggerHelper.caseOwnerId(cas);
    }
}