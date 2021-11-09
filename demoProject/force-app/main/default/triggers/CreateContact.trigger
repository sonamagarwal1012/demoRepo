trigger CreateContact on Account (After insert) {
for(account a1:trigger.new)
{
    list<account> a2=[select No_Of_Locations__c from account where name=:a1.name];
    for(account a3:a2)
    {
   
        integer b=1;
        for(integer i=0;i<a3.No_Of_Locations__c;i++){
       contact c1=new contact(lastname='Contact' +b);
            c1.accountid=a3.id;
            insert(c1);
            system.debug('Contacts' +c1);
        b++;
        
        }
        
        
        
    }
    
}
}