global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID,LeadSource  FROM lead') ;
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        list<lead> leadLst = new list<Lead>();
        for (lead leadObj : scope) {
                leadObj.LeadSource ='Dreamforce';
                leadLst.add(leadObj);
        }
        update leadLst;
    }
    global void finish(Database.BatchableContext bc){
    }
}