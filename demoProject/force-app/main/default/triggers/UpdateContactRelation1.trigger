trigger UpdateContactRelation1 on Contact_Relationship__c (before update) {
    for(contact_Relationship__c CR:trigger.new){
       
        user U1=[select name from user where id=:CR.ownerid];
        CR.Contact_relation_Name__c =U1.name;
    
    }
}