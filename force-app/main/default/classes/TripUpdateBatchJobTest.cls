@IsTest
private class TripUpdateBatchJobTest {

    @TestSetup
    static void setup() {
     
        TestDataFactory.createTripUpdateBatchJobTestCase2();
        TestDataFactory.createTripUpdateBatchJobTestCase3();
        TestDataFactory.createTripUpdateBatchJobTestCase1();        
    
    }


    @IsTest
    static void testCase1() {
  
    Test.startTest();
        //lancement du batch
        TripUpdateBatchJob batch = new TripUpdateBatchJob();
        Database.executeBatch(batch);
    
        List<Trip__c> results=[select id, name,Status__c from trip__c ];        
        Test.stopTest();
        System.assert(results.size() == 3, 'La liste result doit contenir 3 trips.');

        List<Trip__c> results1=[select id, name,Status__c from trip__c where Status__c='A venir'];     
        System.assertEquals(1, results1.size(), 'La liste result doit contenir 1 ligne.');

        List<Trip__c>  results2=[select id, name,Status__c from trip__c where Status__c='En cours'];     
        System.assertEquals(1, results2.size(), 'La liste result doit contenir 1 ligne.');

        List<Trip__c>  results3=[select id, name,Status__c from trip__c where Status__c='Terminé'];     
        System.assertEquals(1, results3.size(), 'La liste result doit contenir 1 ligne.');
    }

}