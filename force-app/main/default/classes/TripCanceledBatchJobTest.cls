@IsTest
private class TripCanceledBatchJobTest {
    @TestSetup
    static void setup() {
        TestDataFactory.createTestTripCanceledBatchJob();
    }


    @IsTest
    static void TripCanceledBatchJob() {
       
        Test.startTest();
        TripCanceledBatchJob batch = new TripCanceledBatchJob();
        Database.executeBatch(batch);
        Test.stopTest();

        Trip__c  trip = [SELECT Id,Status__c FROM Trip__c where Name = 'Trip Test' ];
        System.assertEquals('Annulé', trip.Status__c, 'Le trip doit être annulé.');
    }


}