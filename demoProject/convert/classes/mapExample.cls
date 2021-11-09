public class mapExample {
    public map<string,list<string>> mycity{get;set;}
    public list<selectoption> city{get;set;}
    public list<selectoption> state{get;set;}
    public string statename{get;set;}
    public mapExample(){
        list<string> UPcity=new list<string>();
        UPcity.add('bareilly');
        UPcity.add('meerut');
        UPcity.add('lucknow');
        mycity=new map<string,list<string>>();
        mycity.put('UP',UPcity);
        list<string> biharCity=new list<string>();
        biharCity.add('patna');
        biharcity.add('dehri');
        biharcity.add('aurangabad');
        mycity.put('bihar',biharCity);
        set<string> states=myCity.keyset();
        city=new list<selectoption>();
        selectoption S1=new selectoption('null','none');
        city.add(S1);
        state=new list<selectoption>();
        state.add(S1);
        for(string s:states){
            selectoption s3=new selectoption(s,s);
            state.add(s3);
            }
        list<list<string>> cities=myCity.values();
        for(list<string> c:cities){
            for(string c1:c){
            selectoption s4=new selectoption(c1,c1);
            city.add(s4);
            }
        }
    }
    public pagereference show(){
        list<string> s=mycity.get(statename);
        city.clear();
        for(string x:s){
            selectoption op5=new selectoption(x,x);
            city.add(op5);
        }
        return null;
        
}
}