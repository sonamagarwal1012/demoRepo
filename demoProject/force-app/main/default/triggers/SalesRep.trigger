trigger SalesRep on Account (before insert,before update) {
    list<account> a1=new list<account>();
    for(account a:trigger.new){
        user U1=[select name from user where id=:a.ownerid];
        
        a.Sales_Rep__c=U1.name;
     
    }
    
}