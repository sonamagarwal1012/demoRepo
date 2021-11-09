trigger UpdateOwner on Contact_Relationship__c (before update) {

        for(Contact_Relationship__c R2:trigger.new){
        user U1=[select id,name from user where id=:R2.ownerId];
            R2.Contact_relation_Name__c =U1.name;
           
}
}