trigger owner1 on Account (before insert,before update) {
    map<id,id> m1=new map<id,id>();
    set<id> s1=new set<id>();
    for(account a1:trigger.new){
        m1.put(a1.id,a1.OwnerId);
        S1.add(a1.ownerid);
    }
   map<id,user> U1=new map<id,user>([select id,name from user where id in :S1]);
    for(account a1:trigger.new){
        user U2=U1.get(a1.ownerid);
       a1.Sales_Rep__c=U2.name;
    }
    
}