public class Cs {
    public string searchString{get;set;}
    list<lead> results;
    public list<lead> getResults(){
     return results;   
    }
    public pagereference save(){
        results=(list<lead>)[Find :searchString returning Lead(name,email,phone)][0];
        return null;
    }
}