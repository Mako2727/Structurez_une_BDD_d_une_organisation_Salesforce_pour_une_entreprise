public with sharing class TripService {

    public class TripValidationException extends Exception {
    }

    public void validateTrip(List<Trip__c> TripIds) {

        for (Trip__c trip : TripIds) {
            System.debug( 'Dans la boucle For....' );
            // Vérification pour l'événement Insert
            if (Trigger.isInsert) {
                System.debug( 'isInsert trip.startDate__c==' +trip.startDate__c );                    
                System.debug( 'isInsert trip.endDate__c==' +trip.endDate__c );    
                     // Vérifier que la date de fin est après la date de début
                            if ((trip.endDate__c != null && trip.startDate__c != null) && trip.endDate__c < trip.startDate__c ) {
                                trip.addError('Cas  insert....La date de fin doit être après la date de début.');
                                //throw new TripValidationException('Chronologie incorrect!!!!'  );
                            }
            }
            if (Trigger.isUpdate) {
                System.debug( 'isUpdate trip.startDate__c==' +trip.startDate__c );                    
                System.debug( 'isUpdate trip.endDate__c==' +trip.endDate__c );  
    
                // Vérifier que la date de fin est après la date de début
                if ((trip.endDate__c != null && trip.startDate__c != null) && trip.endDate__c < trip.startDate__c ) {
                   trip.addError('Cas  insert....La date de fin doit être après la date de début.');
                     //throw new TripValidationException('Chronologie incorrect!!!!'  );
                }
               
            }
        }
    }
}