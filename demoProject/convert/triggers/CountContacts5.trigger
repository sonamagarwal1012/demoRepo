trigger CountContacts5 on Contact (after insert,after delete) {
  
if(trigger.isafter){
if (trigger.isInsert){
list<account> a2=new list<account>();
for(contact c:trigger.new){
list<account> a=[select id,countOfContacts__c from account where id =:c.accountid];
    for(account a3:a){
list<contact> c1=[select id from contact where accountid =:a3.id];
    a3.countOfContacts__c=0;
for(contact c2:c1){
a3.countOfContacts__c++;
update a3;
}
    }
  
}

}
}
}