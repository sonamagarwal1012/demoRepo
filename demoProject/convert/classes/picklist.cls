public class picklist {
    public string myVal{get;set;}
    public list<selectoption> options{get;set;}
    public picklist(){
        options=new list<selectoption>();
        selectoption s1=new selectoption('one','jan');
        selectoption s2=new selectoption('two','feb');
        selectoption s3=new selectoption('three','march');
        options.add(s1);
        options.add(s2);
        options.add(s3);
        
    }
}