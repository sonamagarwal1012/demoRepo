@istest
public class TestTransferContacts {
    static testmethod void TransferCon(){
        Profile p = [select id from profile where name='Standard User'];
        User user1 = new User(alias = 'test123', email='test123@noemail.com',
                              emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
                              localesidkey='en_US', profileid = p.Id, country='United States',
                              timezonesidkey='America/Los_Angeles', username='test1012@ntt.com');
        insert user1;
        User user2 = new User(alias = 'test456', email='test456@noemail.com',
                              emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
                              localesidkey='en_US', profileid = p.Id, country='United States',
                              timezonesidkey='America/Los_Angeles', username='test3112@ntt.com');
        insert user2;
        account a1=new account(name='acc1012',ownerid=user1.id);
        insert a1;
        contact con=new contact(lastname='test',accountid=a1.id);
        insert con;
        a1.ownerid=user2.id;
        update a1;
        if(a1.ownerid !=user1.id){
            account a2=[select id,ownerid from account where id=:a1.id];
            contact con1=[select id,ownerid from contact where accountid=:a1.id];
            con1.ownerid=a2.ownerid;
            update con1;
            system.assertequals(con1.OwnerId,user2.id);
           
        }
        
    }

}