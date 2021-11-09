public class try1 {
    
    public account a1{get;set;}
    public contact c1{get;set;}
    public contact c2{get;set;}
    public list<contact> cons{get;set;}
    
    public try1(){
       a1=new account();
        c1=new contact();
        c2=new contact();
           
    }
    public pagereference saveObjects(){
        insert a1;
        c1.accountid=a1.id;
        c2.accountid=a1.id;
     cons.add(c1);
        cons.add(c2);
        if(cons.size()>0){
        
        insert cons;
        }
        return null;
    }
}