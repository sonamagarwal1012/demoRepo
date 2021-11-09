public class SoqlImplement {

    public static void sqlQuery(){
        list<Account> listAcc=[select name,(select firstName,lastName from contacts)from account where name='SFDC Computing'];
    for(Account a1:listAcc)
        {
            list<contact> cts=a1.contacts;
            integer i=1;
            for(contact c1:cts)
                
                system.debug('For Account' + a1.name +  'associated contacts' + (i++) +':' + c1.firstName+ ','  +c1.Lastname);
        }
    }
}