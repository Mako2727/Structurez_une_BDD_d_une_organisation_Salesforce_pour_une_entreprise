trigger TripTrigger on Trip__c(before insert,before update) {
    try {
        new TripService().validateTrip(Trigger.new);
    } 
    catch (TripService.TripValidationException e) {
        // Ajout de l'erreur à l'objet Trip
        for (Trip__c trip : Trigger.new) {
            trip.addError(e.getMessage());  // Appel de addError sur chaque instance Trip
        }
    }

}