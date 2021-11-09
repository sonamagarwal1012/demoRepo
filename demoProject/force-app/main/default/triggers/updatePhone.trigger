trigger updatePhone on contact(after insert){
list<account> a1=new list<account>();
    list<account> a=[select id,phone from account];


for(contact c1:trigger.new){
    for(account a2:a){
        if(a2.id==c1.accountid){
            a2.phone=c1.phone;
            
        }
        a1.add(a2);
    }
        

}
update a1;
}