global class batchProcess1 implements database.Batchable<sobject>{
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getquerylocator('select id,name from account');
    }
global void execute(database.BatchableContext bc,list<sobject> scope){
     list<account> acc=new list<account>();
    for(sobject x:scope){
        account a=(account)x;
        a.name='ms'+a.name;
        acc.add(a);
    }
    update acc;
  }
    global void finish(database.BatchableContext bc){
        
    }
}