public class cc2 {
    public account acc{get;set;}
    public cc2(){
        id id=apexpages.currentpage().getparameters().get('id');
        acc=(id==null)?new account(name='sona89'):[select name,phone,industry from account where id=:id];
    }
    public pagereference save(){
        upsert acc;
        PageReference redirectSuccess = new ApexPages.StandardController(Acc).view();
return (redirectSuccess);

    }

}