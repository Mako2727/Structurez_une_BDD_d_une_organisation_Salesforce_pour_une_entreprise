public with sharing class TripService {

    public class TripValidationException extends Exception {
    }

    public static void executeTripCanceled(List<Trip__c> trips) {
        List<Trip__c> tripsToCancel = new List<Trip__c>();  
        
        if (Schema.sObjectType.Trip__c.fields.Status__c.isUpdateable()) {
            for (Trip__c trip : trips) {
                if (trip.numberOfParticipants__c != null) {
                    trip.Status__c = 'Annulé';
                    tripsToCancel.add(trip);
                }
            }
             if (!tripsToCancel.isEmpty()) {
                update tripsToCancel;           
            }
      }
    }

    public void validateTrip(List<Trip__c> TripIds) {
        for (Trip__c trip : TripIds) {
            // Vérification pour l'événement Insert
            if (Trigger.isInsert) {      
                            // Vérifier que la date de fin est après la date de début
                            if ((trip.endDate__c != null && trip.startDate__c != null) && trip.endDate__c < trip.startDate__c ) {                              
                                trip.addError('Cas  isInsert....La date de fin doit être après la date de début.');
                            }
            }
            // Vérification pour l'événement update
            if (Trigger.isUpdate) {
                            // Vérifier que la date de fin est après la date de début
                            if ((trip.endDate__c != null && trip.startDate__c != null) && trip.endDate__c < trip.startDate__c ) {
                            
                            trip.addError('Cas  isUpdate....La date de fin doit être après la date de début.');
                            }
            }
        }
    }
    
    public void validateTripOnOpportunity(Set<Id> OpportunityIds) {
        // Récupérer les objets Opportunity correspondants aux IDs
        List<Opportunity> OpportunitysToProcess = OpportunitySelector.getOpportunityByIds(OpportunityIds);
       if (Trip__c.getSObjectType().getDescribe().isUpdateable()) {  
         for (Opportunity opp : OpportunitysToProcess) {
                if(opp.StageName=='Closed Won'){
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
                             
                            } 
                            catch (Exception ex) {                           
                            throw new TripValidationException('La date de fin doit être supérieur a la date de debut'   );                             
                            }
                }
           }
        }       
    }

public static void executeTripUpdate(List<Trip__c> trips){
    List<Trip__c> tripsToUpdate = new List<Trip__c>();
    Date today = Date.today();
    if (Schema.sObjectType.Trip__c.fields.Status__c.isUpdateable()) {
        for (Trip__c trip : trips) {       

            // Vérifie si la date actuelle est inférieure à la date de début (A venir)
            if (today < trip.startDate__c) {
                trip.status__c = 'A venir';
                tripsToUpdate.add(trip);
            }
            // Vérifie si la date actuelle est entre la date de début et la date de fin (En cours)
            else if (today >= trip.startDate__c && today <= trip.endDate__c) {
                trip.status__c = 'En cours';
                tripsToUpdate.add(trip);
            }
            // Vérifie si la date actuelle est supérieure à la date de fin (Terminé)
            else if (today > trip.endDate__c) {
                trip.status__c = 'Terminé';
                tripsToUpdate.add(trip);
            }
        }
            if (!tripsToUpdate.isEmpty()) {
                update tripsToUpdate;
            }
    }   
}

}