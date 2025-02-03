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



    public void validateTripOnOpportunity(Set<Id> OpportunityIds) {

        // Récupérer les objets Opportunity correspondants aux IDs
        List<Opportunity> OpportunitysToProcess = OpportunitySelector.getOpportunityByIds(OpportunityIds);
        for (Opportunity opp : OpportunitysToProcess) {
            System.debug('opp.StageName==' +opp.StageName);
                if(opp.StageName=='Closed Won')
                    {
                        try {
                            Trip__c newTrip = new Trip__c(
                                Account__c =opp.accountid ,
                               destination__c =opp.destination__c ,
                                endDate__c =opp.endDate__c ,
                                numberOfParticipants__c =opp.numberOfParticipants__c ,
                               Opportunity__c =opp.Id   ,
                                startDate__c=opp.startDate__c  ,
                                status__c='A venir' ,
                                totalCost__c=opp.totalCost__c  
                              );
                              insert newTrip;
                              System.debug('Insertion dans newTrip ok');

                        } catch (Exception ex) {
                             System.debug('Erreur insert ...' + ex.getMessage());
                             throw new TripValidationException('Les dates ne sont pas dans le bon ordre!!!'   );
                        }
                    }
        }
        }
}