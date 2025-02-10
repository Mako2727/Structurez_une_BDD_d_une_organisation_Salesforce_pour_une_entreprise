trigger OpportunityTrigger on Opportunity(after update) {
    try {
        new TripService().validateTripOnOpportunity(Trigger.newMap.keySet());
    } 
    catch (TripService.TripValidationException e) {
        // Ajout de l'erreur à l'objet Opportunity
        for (Opportunity opp : Trigger.new) {
            opp.addError(e.getMessage()); 
        }
    }
  
  }