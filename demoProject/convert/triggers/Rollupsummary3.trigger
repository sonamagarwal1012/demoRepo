trigger Rollupsummary3 on Contact (before delete) {
     for(contact c7:trigger.old)
{
    list<account> c8=[select name,countOfContacts__c from account where id=:c7.accountid limit 1];
    system.debug('my contacts'+c8);
    for(account c5:c8){
    if(trigger.isdelete){
        c5.CountOfContacts__c--;
        system.debug('countof3'+c5.CountOfContacts__c);
    }
      system.debug('countof4'+c5);
        update c5;
       
    
}
}


}