public class abc {
    public list<selectoption> city{get;set;}
    public list<selectoption> branch{get;set;}
    public selectoption s3;
    public selectoption s5;
    map<string,list<string>> m1=new map<string,list<string>>();
    list<string> l1=new list<string>{'branch1','branch12'};
        list<string> l2=new list<string>{'branch2','branch21'};
            public abc(){
            m1.put('city1',l1);
    m1.put('city22',l2);
    
            }
    public pagereference show(){
      set<string> s1=m1.keySet();
                for(string s2:s1){
                    city=new list<selectoption>();
                     s3=new selectoption(s2,s2);
                }
                    city.add(s3);
                
                    branch=new list<selectoption>();
                    list<list<string>> s4=m1.values();
                    
                for(list<string>a1:s4){
                    for(string a2:a1){
                         s5=new selectoption(a2,a2);
                        
                    }
                } 
        branch.add(s5);
        return null;
    }
}