@IsTest
private class TripSelectorTest {
    @TestSetup
    static void setup() {
        TestDataFactory.createTestTripSelector();       
    }

    @IsTest
    static void testgetUpcomingTrips() {
        Integer tripCount = 0;
      
            Test.startTest();
             Database.QueryLocator result= TripSelector.getUpcomingTrips();
             List<Trip__c> trips = new List<Trip__c>();
             // Utiliser un QueryLocatorIterator pour récupérer les résultats dans la liste
             Database.QueryLocatorIterator iterator = result.iterator();
             while (iterator.hasNext()) {
                 Trip__c trip = (Trip__c)iterator.next();
                 trips.add(trip);
                 tripCount++;
             }  
            Test.stopTest();
          // Vérification que la liste retournée contient bien des résultats
          System.assert(trips.size() > 0, 'La liste result doit contenir au moins un trip.');
       
    }


    @IsTest
    static void testgetAllTrips() {
        Integer tripCount = 0;
       
             Test.startTest();
             Database.QueryLocator result= TripSelector.getAllTrips();
             List<Trip__c> trips = new List<Trip__c>();             
             Database.QueryLocatorIterator iterator = result.iterator();
             while (iterator.hasNext()) {
                 Trip__c trip = (Trip__c)iterator.next();
                 trips.add(trip);
                 tripCount++;
             }  
        Test.stopTest();
          // Vérification que la liste retournée contient bien des résultats
          System.assert(trips.size() > 0, 'La liste result doit contenir au moins un trip.');
      
    
    }
}