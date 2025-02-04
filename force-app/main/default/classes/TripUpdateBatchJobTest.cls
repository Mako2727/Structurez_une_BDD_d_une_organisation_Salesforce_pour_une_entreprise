@IsTest
private class TripUpdateBatchJobTest {

    @TestSetup
    static void setup() {

        TestDataFactory.createTripUpdateBatchJobTestCase1();
        TestDataFactory.createTripUpdateBatchJobTestCase2();
        TestDataFactory.createTripUpdateBatchJobTestCase3();

        //lancement du batch
        TripUpdateBatchJob batch = new TripUpdateBatchJob();
        Database.executeBatch(batch);
    
    }


    @IsTest
    static void testCase1() {
        Test.startTest();
        Trip__c results=[select id, name,Status__c from trip__c where name='tripTestCase1' and Status__c='A venir'];        
        Test.stopTest();
        System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );
    }

    @IsTest
    static void testCase2() {
        Test.startTest();
        Trip__c results=[select id, name,Status__c from trip__c where name='tripTestCase2' and Status__c='En cours'];        
        Test.stopTest();
        System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );
    }

    @IsTest
    static void testCase3() {
        Test.startTest();
        Trip__c results=[select id, name,Status__c from trip__c where name='tripTestCase3' and Status__c='Terminé'];        
        Test.stopTest();
        System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );
    }

}