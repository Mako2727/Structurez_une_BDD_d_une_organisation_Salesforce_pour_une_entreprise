global class TripUpdateBatchJob implements Database.Batchable<SObject>, Schedulable {

    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Appel à la méthode selector pour obtenir tous les trips
        return TripSelector.getAllTrips();
    }


    global void execute(Database.BatchableContext BC, List<Trip__c> trips) {
        TripService.executeTripUpdate(trips);       
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