trigger ContactRelation on Contact (after insert) {
    list<Contact_Relationship__c> CR1=new list<Contact_Relationship__c>();
    for(contact c:trigger.new){
        if(c.Contact_Relation__c==true){
            Contact_Relationship__c CR2=new Contact_Relationship__c(Contact_Relation__c=c.id);
            
            
                CR1.add(CR2);
        }
            insert CR1;
        }     
            
            
            
    
}