public class priceBookClone {
public Product2 p1{get;set;}
    
    public priceBookClone(ApexPages.StandardController std) {
        p1 = (product2)std.getRecord();
        	
        } 
    public void save(){
    product2 p2 = new product2();
        p2 = p1.clone();
        insert p2;
        
        pricebook2 pb=[select id from pricebook2 where isStandard=true];
        
        pricebookentry pbobj = new pricebookentry();
        pbobj.Product2Id = p2.id;
        pbobj.Pricebook2Id = pb.id;
        pbobj.UnitPrice = 0;
        pbobj.UseStandardPrice=false;
        insert pbobj;
       }
}