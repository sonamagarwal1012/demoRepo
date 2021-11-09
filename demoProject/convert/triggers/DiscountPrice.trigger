trigger DiscountPrice on book__c (after insert,after update) {
list<book__c> B1=[select id,price__c from book__c where id=:trigger.new];
    system.debug('books'+B1);
    for(book__c B2:B1){
        decimal d=B2.price__c;
        system.debug('discount'+d);
        d=d-((d*10)/100);
        B2.price__c=d;
        system.debug('Final Discount'+B2.price__c);
        update B2;
    }
}