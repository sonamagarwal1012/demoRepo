trigger MatchAddresses on Account (before insert) {
    for(account a1:trigger.new){
       if(a1.Match_billing_address__c==true) 
           a1.ShippingPostalCode=a1.BillingPostalCode;
            }
}