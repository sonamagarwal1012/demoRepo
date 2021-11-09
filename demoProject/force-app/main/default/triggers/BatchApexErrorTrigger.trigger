trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
list<BatchLeadConvertErrors__c> lst = new list<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent obj : trigger.new)
    {
        BatchLeadConvertErrors__c obj1 = new BatchLeadConvertErrors__c();
        obj1.AsyncApexJobId__c = obj.AsyncApexJobId;
        obj1.Records__c = obj.JobScope;
        obj1.StackTrace__c = obj.StackTrace;
        lst.add(obj1);
    }
    if(lst.size()>0)
        insert lst;
}