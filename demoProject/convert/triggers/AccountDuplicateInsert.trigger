trigger AccountDuplicateInsert on Account (before insert) {
    for(account a:trigger.new){
        list<account> a1=[select id,name from account where name=:a.name];
        if(a1.size()>0)
        {
            a.name.adderror('account with name is existing');
        }
        }

}