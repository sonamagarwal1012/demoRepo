public with sharing class AccountController {
    //changes check
    public AccountController() {

    }
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts(){
        try {
            return [select id, name,phone from account limit 5];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static list<Account> getAccountRecords(){
        try {
            return [select id, name,phone from account limit 5];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}