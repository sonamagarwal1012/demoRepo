@isTest
private class TestRestrictContactByName{
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        contact conObj= new contact(lastName='INVALIDNAME');
        Database.saveResult result = Database.insert(conObj, false);
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }
}