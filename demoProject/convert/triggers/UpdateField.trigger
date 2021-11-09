trigger UpdateField on Account (before insert,before update) {
for(account a:trigger.new)
{
    a.Hello__c='World';
}
}