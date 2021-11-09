public class sosl1 {
    public list<account> acclist{get;set;}
    public list<contact> conlist{get;set;}
    public list<opportunity> opplist{get;set;}
    public list<lead>leadlist{get;set;}
    public pagereference show(){
        acclist=new list<account>();
        conlist=new list<contact>();
        opplist=new list<opportunity>();
        leadlist=new list<lead>();
        list<list<sobject>> s1=[find 'sonam' IN ALL FIELDS returning account(id,name,type),contact(name,email),
                               opportunity(name,stagename),lead(company,name,status)];
        acclist=((list<account>)s1[0]);
        conlist=((list<contact>)s1[1]);
        opplist=((list<opportunity>)s1[2]);
        leadlist=((list<lead>)s1[3]);
        return null;
}
}