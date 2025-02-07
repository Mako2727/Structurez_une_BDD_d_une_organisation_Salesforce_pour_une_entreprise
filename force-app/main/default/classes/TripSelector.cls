public class TripSelector {
    
    // Méthode pour récupérer les voyages à venir dans les 7 prochains jours
    public static Database.QueryLocator getUpcomingTrips() {
        return Database.getQueryLocator('SELECT Id, Status__c, startDate__c, numberOfParticipants__c FROM Trip__c WHERE startDate__c >= TODAY AND startDate__c <= NEXT_N_DAYS:7');
    }


       // Méthode pour récupérer tous les voyages
       public static Database.QueryLocator getAllTrips() {
        return Database.getQueryLocator('SELECT Id, Status__c, startDate__c, numberOfParticipants__c,endDate__c FROM Trip__c');
    }
}