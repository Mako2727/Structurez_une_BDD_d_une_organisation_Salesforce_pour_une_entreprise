public with sharing class OpportunitySelector {
    public static List<Opportunity> getOpportunityByIds(Set<Id> OpportunityIds) {
       List<Opportunity> Opportunitys = [   SELECT Id, StageName, AccountId ,destination__c,endDate__c,startDate__c,numberOfParticipants__c,totalCost__c FROM Opportunity   WHERE Id IN :OpportunityIds   WITH SECURITY_ENFORCED   ];
        return Opportunitys;
      }
}