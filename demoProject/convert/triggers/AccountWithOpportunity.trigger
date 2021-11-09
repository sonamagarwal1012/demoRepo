trigger AccountWithOpportunity on Account (before delete) {
    for(account a1:trigger.old){
        list<account> a2=[select name,(select accountid ,name from opportunities) from account];
        system.debug('accounts'+a2);
        for(account a3:a2){
            list<opportunity> O2=a3.opportunities;
            system.debug('opprtunities within account'+O2);
            a3.adderror('cant delete');
        }
    }

}