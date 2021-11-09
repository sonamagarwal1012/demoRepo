trigger CustomerProject on Customer_Project__c (after insert) {
    list<customer_project__c> C1=[select Related_Opportunity__c,status__c from customer_project__c where id=:trigger.new];
    system.debug('Customer project'+C1);
    for(customer_project__c C2:C1){
        if (C2.Status__c=='Active'){
           opportunity O1=[select id ,Active_Customer_projet__c from opportunity where id=:C2.Related_Opportunity__c] ;
            system.debug('opportunities in customer project' +O1);
            O1.Active_Customer_projet__c=true;
            update O1;
        }
    
    }

}