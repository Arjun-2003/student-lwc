public class TaskTriggerHelper {
    public static void createAfterUpdate(Map<Id,Task> mapOfTask)
    {
          Set<Id> taskWhatId = new Set<Id>();
        for(Task task: mapOfTask.values()){
            if(task.Status == 'Completed' && String.valueOf(task.WhatId).startsWith('006')){
                taskWhatId.add(task.WhatId);
            }
        }
        Map<Id,Opportunity> opp = new Map<Id,Opportunity>();
        for(Opportunity opportunitys: [select Id,Last_Active_Date__c from Opportunity where Id IN : taskWhatId]){
            opp.put(opportunitys.Id,opportunitys);
        }
        List<Opportunity> opportunitys = new List<Opportunity>();
        for(Task tsk:mapOfTask.values()){
            if(tsk.Status == 'Completed'){
                if(opp.containsKey(tsk.WhatId)){
                    Opportunity opps = new Opportunity();
                    opps.Id = tsk.WhatId;
                    opps.Last_Active_Date__c = Date.today();
                    
                    opportunitys.add(opps);
                }
            }
        }
        if (!opportunitys.isEmpty()) {
            update opportunitys;
        }
    }

    }