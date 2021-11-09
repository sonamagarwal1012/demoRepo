public class CE1 {
    public apexpages.StandardSetController setcon{
        get{
            if(setcon==null){
                setcon=new apexpages.standardsetcontroller(database.getQueryLocator([select id,name from opportunity]));
            }
            return setcon;
        }
        set;
    }
    
    public list<opportunity> getopp(){
        return (list<opportunity>)setcon.getrecords();
    } 
}