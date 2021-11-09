trigger contactrel on Contact (after insert) {
    list<Contact_Relationship__c> CR1=new list<Contact_Relationship__c>();
    list<contact> Con=[select id,Contact_Relation__c from contact where id in :trigger.new];
    for(contact C1:con){
        if(C1.Contact_Relation__c==true){
            Contact_Relationship__c CR=new Contact_Relationship__c();
            CR1.add(CR);
        }
    }
insert CR1;
}