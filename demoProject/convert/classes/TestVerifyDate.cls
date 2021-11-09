@isTest
private class TestVerifyDate{
    @isTest static void testCheckDates() {
        date dt1= date.valueOf('2020-08-08');
        date dt2 = date.valueOf('2020-08-01');
        Date dt= VerifyDate.CheckDates(dt1,dt2);
        System.assertEquals(date.valueOf('2020-08-31'), dt);
    }
    @isTest static void testCheckDates1() {
        date dt1= date.valueOf('2020-08-08');
        date dt2 = date.valueOf('2020-08-01');
        Date dt= VerifyDate.CheckDates(dt2,dt1);
        System.assertEquals(date.valueOf('2020-08-08'), dt);
    }
    }