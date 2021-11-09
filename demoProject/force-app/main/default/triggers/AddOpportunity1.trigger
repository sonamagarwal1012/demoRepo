trigger AddOpportunity1 on Account (after insert) {
    for(account a1:trigger.new){
        list<opportunity> O1=[select name,accountid from opportunity where accountid=:a1.id];
        
            IF(O1.size()==0){
                 opportunity O3=new opportunity(name='xyz' ,StageName='prospecting' ,Closedate=date.today()+30);
                O3.accountid=a1.id;
            insert O3;
            
        }
    
    }
}