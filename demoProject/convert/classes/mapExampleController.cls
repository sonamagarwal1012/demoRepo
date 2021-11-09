public class mapExampleController {
    public map<string,string> m1{get;set;}
    public mapExampleController(){
        m1=new map<string,string>();
        m1.put('firstname','sonam');
        m1.put('lastname','agarwal');
        m1.put('age','42');
    }
    public pagereference doCalculate(){
        doMoreWithAge();
        return null;
    }
    public void doMoreWithAge(){
        m1.put('age',(integer.valueOf(m1.get('age'))+10).format());
        
    }
}