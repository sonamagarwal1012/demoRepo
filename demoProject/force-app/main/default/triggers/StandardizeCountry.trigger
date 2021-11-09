trigger StandardizeCountry on Account (before insert,before update) 
{
   list<account> acc=new list<account>();
        for(account a1:trigger.new){
        if(a1.BillingCountry=='UK'|| a1.BillingCountry=='Great Britain'|| a1.BillingCountry=='England'){
         a1.billingCountry='UnitedKingdom' ;
                SYSTEM.debug('country value'+ a1.billingCountry);
            }
            else if (a1.billingCountry=='US' || a1.BillingCountry=='USA' || a1.BillingCountry=='U.S.A.'){
              a1.billingCountry='United States';  
           SYSTEM.debug('country value2'+ a1.billingCountry);
            }
            else if (a1.BillingCountry=='Russia'){
                a1.billingCountry='Russian Federation';
                SYSTEM.debug('country value3'+ a1.billingCountry);
        }
           SYSTEM.debug('country value4'+ a1.billingCountry);
            
         }
    }