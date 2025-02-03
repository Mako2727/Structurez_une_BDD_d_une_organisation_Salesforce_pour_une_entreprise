global class TripUpdateBatchJob implements Database.Batchable<SObject>, Schedulable {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Appel à la méthode selector pour obtenir tous les trips
        return TripSelector.getAllTrips();
    }


    global void execute(Database.BatchableContext BC, List<Trip__c> trips) {
        List<Trip__c> tripsToUpdate = new List<Trip__c>();
        Date today = Date.today();
        System.debug('Trip size' + trips.size());
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

    global void finish(Database.BatchableContext BC) {
        System.debug('Batch Job terminé.');
    }
    

    //replanifie le batch pour la prochaine execution
    global void execute(SchedulableContext sc) {
        TripUpdateBatchJob batch = new TripUpdateBatchJob();
        Database.executeBatch(batch);
    }
    


}