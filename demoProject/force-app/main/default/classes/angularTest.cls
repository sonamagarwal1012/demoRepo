public class angularTest {
    @remoteaction
    public static list<contact> getAllContactsByFilter(string searchText){
        string searchstring='%'+searchText+'%';
        list<contact> contactlist=[select firstName,lastName,phone,email,account.name from contact where firstname=:searchstring];
        return contactList;
    }
}