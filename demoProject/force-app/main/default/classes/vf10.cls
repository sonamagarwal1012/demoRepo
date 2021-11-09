public class vf10 {
    public string objectName{get;set;}
    public string recordName{get;set;}
    public vf10(){
        objectname='';
        recordName='';
    }
    public pagereference save(){
        map<string,schema.SObjectType> m1=schema.getGlobalDescribe();
        set<string> s1=m1.keyset();
        if(s1.contains(objectName.toLowerCase())){
            sobject sobj=schema.getGlobalDescribe().get(objectName).newSObject();
            sobj.put('name',recordName);
            insert sobj;
            pagereference pg=new pageReference('/'+sobj.id);
                return pg;
            
        }
        else{
            apexpages.addMessage(new apexpages.message(apexpages.Severity.ERROR,'object name is invalis'));
        }
        return null;
    }
}