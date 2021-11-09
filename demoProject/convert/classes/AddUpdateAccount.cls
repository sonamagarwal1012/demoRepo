public class AddUpdateAccount {
private account account;
    
    public AddUpdateAccount(){
        Id i=apexpages.currentPage().getparameters().get('id');
        account = (i==null) ? new account() : [select name,phone from account where id=:i];
    }
    public account getAccount(){
        return account;
    }
    public void setAccount(account a){
        this.account=a;
}
    public pageReference save(){
        upsert account;
        return null;
        // After successful Save, navigate to the default view page
PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
return (redirectSuccess);
}
}