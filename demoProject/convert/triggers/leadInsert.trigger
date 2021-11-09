trigger leadInsert on Lead (before insert) {
list<contact> c1=new list<contact>();
    for(lead L1:trigger.new)
    {
        if(L1.email!=null){
        list<contact> L2=[select id,lastname,email from contact where email=:L1.email];
        if(L2.size()>0){
            L1.ADDERROR('lead cant be inserted');
        }
        }
    }
}