@isTest
public class AccountProcessorTest{
  @IsTest
  private static void countContactsTest() {
      list<Id> accIds = new list<Id>();
      account accObj= new account(name='Test');
      insert accobj;
      accIds.add(accobj.Id);
      test.startTest();
          AccountProcessor.countContacts(accIds);
          test.stopTest();
      
  }
}