public class cs41 {
    public account acc{get;set;}
    public cs41(apexpages.StandardController std){
        acc=(account)std.getRecord();
        
    }
    public list<opportunity> childopps;
    public list<opportunity> getchildopps(){
         childopps=[select name,amount,stagename,closedate from opportunity where accountid=:acc.id and (iswon=true or isclosed=false)];
        return childopps;
    }

    public void createTask(){
        list<task> T1=new list<task>();
        for(opportunity opp:childopps){
            if(!opp.isclosed){
             task T2=new task();
                T2.whoid=opp.id;
                T2.OwnerId=opp.ownerid;
                T2.Status='Not Started';
                T2.Subject='Send follow-up email to primary contact.';
                T1.add(T2);
            }
        }
        insert T1;
    }
    public pagereference save(){
        if(acc.rating=='hot'){
            createtask();
            
        }
        update acc;
        pagereference pf=new apexpages.StandardController(acc).view();
        return(pf);

    }
}