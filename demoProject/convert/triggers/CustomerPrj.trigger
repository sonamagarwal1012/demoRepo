trigger CustomerPrj on Customer_Project__c (after insert,after update) {
    set<id> S1=new set<id>();
    set<id> S2=new set<id>();
    list<opportunity> O3=new list<opportunity>();
    for(Customer_Project__c c1:trigger.new){
      s1.add(C1.id);  
        s2.add(C1.Related_Opportunity__c);
    }
list<opportunity> O1=[select id,Active_Customer_projet__c from opportunity where id in :S2];
    list<Customer_Project__c> C2=[select id,Status__c from Customer_Project__c where id in:S1];
    for(opportunity O2:O1){
        for(Customer_Project__c C3:C2){
            if(C3.status__c=='Active'){
                O2.Active_Customer_projet__c=true;
                O3.add(O2);
            }
        }
    }
    update O3;
}