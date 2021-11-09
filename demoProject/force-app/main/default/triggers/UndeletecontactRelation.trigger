trigger UndeletecontactRelation on Contact (after undelete) {
for(contact c1:trigger.old){
     
         list<Contact_Relationship__c> R2=[select id from Contact_Relationship__c where Contact_Relation__c=:c1.id];
            undelete R2;

}
}