public class LeadSearch {

    string leadEmail;
    public string getLeadEmail(){
        return leadEmail;
    }
    public void setLeadEmail(string email){
        leadEmail=email;
    }
    public list<list<lead>> listLead{get;set;}
    public pageReference Go(){
        listLead=[find :leadEmail in ALL FIELDS returning lead(id,name) ];
        return null;
    }
}