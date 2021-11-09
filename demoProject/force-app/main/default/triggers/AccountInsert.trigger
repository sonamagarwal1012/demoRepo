trigger AccountInsert on Account (before insert) {
    for(account a:trigger.new){
        list<account> a2=[select id,name from account where name=:a.name];
        if(a2.size()>0)
        {
          a.name.adderror('duplicate records are found'); 
        }
    }
}