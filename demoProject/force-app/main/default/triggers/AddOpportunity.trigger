trigger AddOpportunity on Account (after insert,after update) {
    list<account> A1=[select id,name,(select accountid from opportunities) from account where id=:trigger.new];
    for(account A2:A1){
        list<opportunity> O1=A2.opportunities;
        system.debug('related opportunity'+O1);
        if(O1.size()==0){
            opportunity O2=new opportunity(name='xyz',StageName='Prospecting',CloseDate=date.today()+30);
            O2.accountid=A2.Id;
            insert O2;
        }
            
    }
            
        }