public class CaseTriggerHelper {
    public static void caseOwnerId(List<Case> cas){
          Group supportQueue = [SELECT Id FROM Group WHERE Name = 'Support Team' AND Type = 'Queue' LIMIT 1];

    List<Case> casesToUpdate = new List<Case>();
  for (Case c : cas) {
        if (c.OwnerId == null) { 
            c.OwnerId = supportQueue.Id;
            casesToUpdate.add(c);
        }
    }
    if (!casesToUpdate.isEmpty()) {
        update casesToUpdate;
    }        
    }
}