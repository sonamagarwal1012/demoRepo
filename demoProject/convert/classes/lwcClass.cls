public with sharing class lwcClass {
    @AuraEnabled(cacheable=true)
 public static List<Account> getAccountList() {
 return [SELECT Id, Name FROM Account];
 }
 @AuraEnabled(cacheable=true)
 public static List<Contact> getContacts(String accountId){
     system.debug('===accountId=='+accountId);
 return [Select Id,FirstName,LastName,Email,Phone from Contact where accountId=:accountId];
 
 }
}