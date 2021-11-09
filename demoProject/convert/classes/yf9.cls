public class yf9 {
    public list<selectoption> supportedObject{get;set;}
    public string selectedObject{get;set;}
    public list<selectoption> supportedFields{get;set;}
    public list<string> selectedFields{get;set;}
    public list<sobject> objectList{get;set;}
    map<string,schema.SObjectType> m1=schema.getGlobalDescribe();
    set<string> s1= m1.keyset();
    public yf9(){
        supportedObject=new list<selectoption>();
        selectedObject =' ';
        supportedFields=new list<selectOption>();
        selectedFields=new list<string>();
        objectList=new list<sobject>();
        for(schema.SObjectType Item:processInstance.targetObjectId.getDescribe().getreferenceTo()){
            supportedObject.add(new selectOption(item.getDescribe().getLocalName().toLowerCase(),
                                                 item.getDescribe().getlabel()));
        }
    }
    public void objectFields(){
        if(selectedObject !='--none--'){
            schema.SObjectType m2=m1.get(selectedObject);
            schema.DescribeSObjectResult r=m2.getDescribe();
            map<string,schema.SObjectField> m3= r.fields.getMap();
            for(schema.SObjectField f1:m3.values()){
                supportedfields.add(new selectoption(f1.getDescribe().getName(),f1.getDescribe().getlabel()));
            }
        }
    }
    public void showTable(){
        
        string myquery='select Id from' +selectedObject;
        objectList=database.query(myquery);
    }
}