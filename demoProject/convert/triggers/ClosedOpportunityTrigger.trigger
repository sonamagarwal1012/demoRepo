trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    list<task> T2=new list<task>();
    for(opportunity O1:trigger.new){
        if(O1.StageName=='Closed Won'){
            Task T1=new Task(Subject='Follow Up Test Task',whatid =O1.id);
        T2.add(T1);
    }
    }
    insert T2;
}