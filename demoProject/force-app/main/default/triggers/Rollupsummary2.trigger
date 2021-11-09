trigger Rollupsummary2 on Contact (after insert,before delete) {
    
     if(trigger.isinsert){
for(contact c1:trigger.new)
{
    list<account> c2=[select name,countOfContacts__c from account where id=:c1.accountid ];
    system.debug('my contacts'+c2);
    for(account c3:c2){
        if(c3.CountOfContacts__c==null){
            c3.CountOfContacts__c=0;
        }
        c3.CountOfContacts__c++;
        system.debug('countof2'+c3.CountOfContacts__c);
    
         system.debug('countof4'+c3);
        update c3;
    }
    }
    }
     if(trigger.isdelete){
    for(contact c7:trigger.old)
{
    list<account> c8=[select name,countOfContacts__c from account where id=:c7.accountid ];
    system.debug('my contacts'+c8);
    for(account c5:c8){
   
        c5.CountOfContacts__c--;
        system.debug('countof3'+c5.CountOfContacts__c);
    
      system.debug('countof4'+c5);
        update c5;
    }
   }
     }
}