trigger Test56 on TOP_X_DESIGNATION__c (after insert,after update) {
list<opportunity> opp= new list<opportunity>();
map<id,id> M1=new map<id,id>();
    set<id> S1=new set<id>();
    list<id> S2=new list<id>();
    for(TOP_X_DESIGNATION__c T4:trigger.new){
        m1.put(T4.id,T4.Opportunity__c);
        S1.add(T4.id);
        S2.add(T4.Opportunity__c);
        
    }
    
    list<opportunity> O1=[select id,handoff_attched__c from opportunity  where id In :S2];
    

list<Top_X_Designation__c> t1=[select id,opportunity__c,type__c,Document_attached__c from Top_X_Designation__c where id in :S1];
    for(opportunity O3:O1){
        for(Top_X_Designation__c T3:T1){
            if(T3.type__c=='Contract Flow Down/Handoff' && T3.Document_attached__c==true){
O3.handoff_attched__c='yes';
                opp.add(O3);
        }
    }}
update opp;
}