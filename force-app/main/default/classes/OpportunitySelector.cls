public with sharing class OpportunitySelector {
    public static List<Opportunity> getOpportunityByIds(Set<Id> OpportunityIds) {
        List<Opportunity> OpportunityToProcess = [SELECT Id FROM Opportunity WHERE Id IN :OpportunityIds  WITH SECURITY_ENFORCED]; //conversion en list Opportunity
        List<Opportunity> Opportunitys = [   SELECT Id, StageName, AccountId ,destination__c,endDate__c,startDate__c,numberOfParticipants__c,totalCost__c FROM Opportunity   WHERE Id IN :OpportunityToProcess   WITH SECURITY_ENFORCED   ];
        return Opportunitys;
      }
}