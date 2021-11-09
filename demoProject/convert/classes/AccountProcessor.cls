public class AccountProcessor{
 @future
    public static void countContacts(list<Id> accountIds){
    list<account> acclstToUpdate = new list<Account>();
    list<Account> accLst = [select id, Number_of_Contacts__c,(select id from contacts) from account where id in :accountIds];
    for(account acc:accLst){
        acc.Number_of_Contacts__c= acc.contacts.size();
        acclstToUpdate.add(acc);
    }
    update acclstToUpdate;
    }
}