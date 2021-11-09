trigger CountofContact1 on Contact (after insert,before delete) {
    if(trigger.isafter && trigger.isinsert){
        list<account> a1=new list<account>();
    for(contact c:trigger.new){
        account a =[select id,name ,countOfContacts__c from  account where id=:c.accountid];
        if(a.countOfContacts__c==null){
            a.countOfContacts__c=0;
        }
        a.countOfContacts__c++;
        a1.add(a);
    }
        update a1;
    }
    if( trigger.isdelete){
        list<account> a2=new list<account>();
        for(contact c1:trigger.old){
        account a3 =[select id,name ,countOfContacts__c from  account where id=:c1.accountid];
           
               a3.countOfContacts__c--;
            a2.add(a3);
            
    
    }
        update a2;
        
    }
}