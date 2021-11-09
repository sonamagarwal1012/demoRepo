public class CampingListController {
    @AuraEnabled

    public static list<Camping_Item__c> getItems(){
        return [select name,quantity__c,price__c,packed__c from Camping_Item__c];
    }
    @AuraEnabled

    public static Camping_Item__c saveItem(Camping_Item__c Item){
        update Item;
        return item;
    }
    
}