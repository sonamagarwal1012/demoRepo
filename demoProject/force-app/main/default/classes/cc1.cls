public class cc1 {
    public account acc{get;set;}
    
    public cc1(){
        acc=[select id,name,type from account where id=:apexpages.currentPage().getparameters().get('id')];
        
    }
    
    public pagereference save(){
      update acc;
        return null;
    }
}