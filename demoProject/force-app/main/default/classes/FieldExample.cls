public class FieldExample {
    public FieldExample(){
        schema.DescribeSObjectResult res=schema.SObjectType.account;
        result=' '+res;
    }
    public string result{get;set;}
}