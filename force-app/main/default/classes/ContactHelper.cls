public class ContactHelper {
    public static Map<Id,Integer> ContactHelperr(List<Account> accountIds)
    {
        Map<Id,Integer> contactCount=new Map<Id,Integer>();
        
        for(AggregateResult ar : [select AccountId, Count(Id) contactcount from Contact where AccountId IN : accountIds GROUP BY AccountId])
        {
            contactcount.put((Id)ar.get('AccountId'), (Integer)ar.get('contactcount'));
        }
        return contactcount;
    }
}







    
    
    
    /*public static  Map<Id,integer> contactCountMap(List<Account> acc){
        Map<Id,integer> countMap = new Map<Id,integer>();
        for(AggregateResult agResult: [select AccountId,count(Id) contactCount from Contact where AccountId IN :acc group by AccountId]){
            countMap.put((String) agResult.get('AccountId'),(Integer) agResult.get('contactCount'));
        }
        return countMap;
    }*/