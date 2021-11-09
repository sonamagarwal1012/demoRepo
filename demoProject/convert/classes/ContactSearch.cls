public class ContactSearch {
    public static list<contact> searchForContacts(){
        string s1='agarwal';
        string s2='201301';
        list<contact> c1=[select id,name from contact where lastName=:s1];
            return c1;
            }
    
}