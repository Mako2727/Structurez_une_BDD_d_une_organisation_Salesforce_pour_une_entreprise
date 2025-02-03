trigger OpportunityTrigger on Opportunity(after update) {
    try {
        new OpportunityService().validateOpportunity(Trigger.newMap.keySet());
    } 
    catch (OpportunityService.OpportunityValidationException e) {
        // Ajout de l'erreur à l'objet Opportunity
        for (Opportunity opp : Trigger.new) {
            opp.addError(e.getMessage());  // Appel de addError sur chaque instance d'Opportunity
        }
    }
  
  }