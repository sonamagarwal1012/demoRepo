trigger duplicateAcc on Account (before insert) {
list<string> m1=new list<string>();

    for(account a:trigger.new){
m1.add(a.name);
   
}
list<account> a2=[select id,name from account where name in :m1];
   
if(a2.size()>0){
    for(account a3:a2){
        a3.name.adderror('duplicate account name found');
    }
}
}