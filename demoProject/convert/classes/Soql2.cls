public class Soql2 {
    public list<account> acc{set;get;}
    public pagereference show(){
        acc=[select name,industry,(select id,phone,LastName from contacts) from account ];
        return null;
    }
}