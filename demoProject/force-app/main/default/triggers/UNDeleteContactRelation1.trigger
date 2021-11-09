trigger UNDeleteContactRelation1 on Contact (after undelete) {
 list<Contact_Relationship__c> CR=new list<Contact_Relationship__c>();
    for(Contact C1:trigger.new){
        list<Contact_Relationship__c> CR1=[select id from Contact_Relationship__c where isdeleted=true and Contact_Relation__c=:C1.id];
        for(Contact_Relationship__c CR2:CR1){
            CR.add(CR2);
        }
       
    }
 undelete CR;

}