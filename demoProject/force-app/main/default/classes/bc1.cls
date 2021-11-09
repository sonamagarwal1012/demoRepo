global class bc1 implements database.Batchable<sobject>{
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select id,name from account]);
    }
    global void execute(database.BatchableContext bc,list<sobject> scope){
        list<account> a=new list<account>();
        list<account> acc=(list<account>)scope;
        for(account a1:acc){
            a1.name='mr'+a1.name;
            a.add(a1);
        }
        update a;
        
    }
    global void finish(database.BatchableContext bc){
       messaging.SingleEmailMessage m1=new messaging.SingleEmailMessage();
        list<string> toaddress=new list<string>();
        toaddress.add('sonamagarwal9194@gmail.com');
        m1.setToAddresses(toaddress);
        m1.setsubject('Test');
        m1.setHtmlBody('Test 2');
        messaging.sendemail(new messaging.SingleEmailMessage[]{m1});
    }
}