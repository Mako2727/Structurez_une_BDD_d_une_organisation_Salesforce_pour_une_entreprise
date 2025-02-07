global class TripCanceledBatchJob implements Database.Batchable<SObject>, Schedulable {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Appel à la méthode selector pour obtenir les trips à venir
        return TripSelector.getUpcomingTrips();
    }
    
    global void execute(Database.BatchableContext BC, List<Trip__c> trips) {
            TripService.executeTripCanceled(trips);       
    }
    
    global void finish(Database.BatchableContext BC) {
        System.debug('Batch Job terminé.');
    }    

    //replanifie le batch pour la prochaine execution
    global void execute(SchedulableContext sc) {
        TripCanceledBatchJob batch = new TripCanceledBatchJob();
        Database.executeBatch(batch);
    }
}
