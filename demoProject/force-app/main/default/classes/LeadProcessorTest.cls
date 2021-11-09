@isTest
private class LeadProcessorTest{
    @testSetup 
    static void setup() {
        List<Lead> leadLst= new List<Lead>();
        for (Integer i=0;i<200;i++) {
            leadLst.add(new Lead(lastName='test'+i,company='test1'+i));
        }
        insert leadLst;
    }
    public static testmethod void test() {
          test.startTest();
          LeadProcessor lp=new LeadProcessor ();
          database.executeBatch(lp);
          test.stopTest();
    }
}