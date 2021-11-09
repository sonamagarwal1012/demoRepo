public class RandomContactFactory{
    public static List<Contact> generateRandomContacts(Integer numContacts, String lstName) {
        List<Contact> conLst= new List<Contact>();
        
        for(Integer i=0;i<numContacts;i++) {
            Contact conObj = new Contact(lastName=lstName,firstname= 'test'+i);
            conLst.add(conObj);
        }
        
        return conLst;
    }
}