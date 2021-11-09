public with sharing class QuickContactController {
@auraenabled
    public static account getAccount(id accountId){
       return[select name,billingState,billingCity from account where id=:accountId];
        
    }
@auraenabled
    public static contact getcontact(contact contact,Id accountid){
        contact.accountId=accountId;
        upsert contact;
        return contact;
    }
}