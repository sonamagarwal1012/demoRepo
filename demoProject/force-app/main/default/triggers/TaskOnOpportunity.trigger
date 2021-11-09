trigger TaskOnOpportunity on Opportunity (after insert,after Update) {
list<opportunity> O1=[select name,StageName from opportunity where id=:trigger.new];
    for(opportunity O2:O1){
        if(O2.StageName=='Closed Won'){
            task T1=new task();
            T1.whatid=O2.Id;
            Insert T1;
        }
    }
}