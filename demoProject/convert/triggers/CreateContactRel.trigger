trigger CreateContactRel on Contact (after insert) {
for(contact c1:trigger.new)
{
    if(trigger.isinsert){
    if(c1.Contact_Relation__c==true){
    Contact_Relationship__c C2=new Contact_Relationship__c();
   system.debug(C2);
    C2.Contact_Relation__c=c1.id;
    insert(C2);
    }
    }
    
}
}