trigger AccountAddressTrigger on Account (before insert,before update) {
    for(account a:trigger.new){
        if(a.Match_billing_address__c==true){
            a.shippingPostalCode=a.BillingPostalCode;
        }
    }
}