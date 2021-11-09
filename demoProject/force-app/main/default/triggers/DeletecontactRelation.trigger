trigger DeletecontactRelation on Contact (before delete) {
    for(contact c1:trigger.old){
        if(trigger.isdelete){
        system.debug('deletedContacts'+c1);
        list<Contact_Relationship__c> R1=[select id from Contact_Relationship__c where Contact_Relation__c=:c1.id];
        system.debug('relationship'+R1);
        delete R1;
        }
       
        }
    }