@istest
public class accountInsert {
    public static testmethod void accInsert(){
        string addError;
        string myName='sonam';
        account a1=new account(name=myName);
        list<account> a2=[select id,name from account where name=:myName];
        if(a2.size()<1){
            system.assertEquals(0,a2.size());
            insert a2;
        }
        else {
         addError='existing';
            system.assertEquals('existing', addError);
        }
        
    }
}