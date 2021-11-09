trigger DeleteContactRelation1 on Contact (before delete) {
    list<Contact_Relationship__c> CR=new list<Contact_Relationship__c>();
    for(Contact C1:trigger.old){
        list<Contact_Relationship__c> CR1=[select id from Contact_Relationship__c where Contact_Relation__c=:C1.id];
        for(Contact_Relationship__c CR2:CR1){
            CR.add(CR2);
        }
       
    }
 delete CR;
}