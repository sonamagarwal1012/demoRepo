public class Soql1 {
    public list<contact> con{get;set;}
    public pagereference show(){
        con=[select id,name,account.name,account.industry from contact limit 5];
        return null;
    }
}