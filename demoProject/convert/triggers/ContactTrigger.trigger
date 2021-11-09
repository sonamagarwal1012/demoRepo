trigger ContactTrigger on contact(before insert){
    set<Id> setOfAccId =new set<Id>();
    map<Id,account> mapOfAccIdToAcc;
    for(contact conObj:trigger.new){
        if(conObj.phone==null || conObj.phone==''){
            setOfAccId.add(conObj.accountId);
        }
    }
    if(setOfAccId.size()>0){
        mapOfAccIdToAcc = new map<id,account>([select id,phone from account where id in : setOfAccId]);
    }
    if(mapOfAccIdToAcc!=null && !mapOfAccIdToAcc.isEmpty()){
        for(contact conObj: trigger.new){
            if(mapOfAccIdToAcc.containsKey(conObj.accountId)){
                conObj.phone= mapOfAccIdToAcc.get(conObj.accountId).phone;
            }
        }
    }
    
}