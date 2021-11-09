@istest
public class TestStandardizeCountry {
    public static testmethod void standardizeCountry(){
        account a=new account(name='Test1012',billingCountry='US');
        account a1=new account(name='test3112',billingCountry='UK');
        insert a;
        insert a1;
        a.billingcountry='United States';
        a1.BillingCountry='United Kingdom';
            update a;
        update a1;
        system.assertequals('United States', a.billingcountry);
        system.assertequals('United Kingdom', a1.billingcountry);
    }

}