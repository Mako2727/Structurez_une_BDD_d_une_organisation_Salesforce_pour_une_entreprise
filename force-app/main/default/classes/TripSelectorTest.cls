@IsTest
private class TripSelectorTest {
    @TestSetup
    static void setup() {
        TestDataFactory.createTestTripSelector();       
    }

    @IsTest
    static void testgetUpcomingTrips() {
        Integer tripCount = 0;
        try {
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
             System.debug('tripCount...: ' + tripCount);
             System.debug('trips.size()...: ' + trips.size());
            Test.stopTest();

          // Vérification que la liste retournée contient bien des résultats
          System.assert(trips.size() > 0, 'La liste result doit contenir au moins un trip.');
        } catch (Exception e) {
            // Affichage du message d'erreur dans les logs de débogage
            System.debug('Une erreur est survenue dans le test : ' + e.getMessage());
            System.debug('Trace de l\'exception : ' + e.getStackTraceString());
            // Rethrow l'exception pour ne pas masquer l'échec du test
            throw e;
        }
    }


    @IsTest
    static void testgetAllTrips() {
        Integer tripCount = 0;
        try {
             Test.startTest();
             Database.QueryLocator result= TripSelector.getAllTrips();
             List<Trip__c> trips = new List<Trip__c>();

             // Utiliser un QueryLocatorIterator pour récupérer les résultats dans la liste
             Database.QueryLocatorIterator iterator = result.iterator();
             while (iterator.hasNext()) {
                 Trip__c trip = (Trip__c)iterator.next();
                 trips.add(trip);
                 tripCount++;
             }     
       System.debug('tripCount...: ' + tripCount);
       System.debug('trips.size()...: ' + trips.size());
        Test.stopTest();
          // Vérification que la liste retournée contient bien des résultats
          System.assert(trips.size() > 0, 'La liste result doit contenir au moins un trip.');

      
     } catch (Exception e) {
             // Affichage du message d'erreur dans les logs de débogage
             System.debug('Une erreur est survenue dans le test : ' + e.getMessage());
             System.debug('Trace de l\'exception : ' + e.getStackTraceString());
             // Rethrow l'exception pour ne pas masquer l'échec du test
             throw e;
        }
    }
}