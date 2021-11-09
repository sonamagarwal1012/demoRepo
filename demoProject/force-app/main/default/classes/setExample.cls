public class setExample{
    public set<string> sets{get;set;}
    public boolean test{get;set;}
    public setExample(){
        list<string> names=new list<string>();
        names.add('hari');
        names.add('sonam');
        names.add('sonia');
        names.add('hari');
        sets=new set<string>();
        sets.add('one');
        sets.add('two');
        sets.add('one');
        sets.addall(names);
       
        
    }
}