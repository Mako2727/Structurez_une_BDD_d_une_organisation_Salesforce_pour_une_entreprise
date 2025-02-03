public with sharing class OpportunityService {

    public class OpportunityValidationException extends Exception {
    }

    public void validateOpportunity(Set<Id> OpportunityIds) {

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
                             throw new OpportunityValidationException('Les dates ne sont pas dans le bon ordre!!!'   );
                        }

                    }


        }


        }

}