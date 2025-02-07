@IsTest
private class OpportunitySelectorTest {
    @TestSetup
    static void setup() {
      TestDataFactory.createTestgetOpportunityByIds();
    }


    @IsTest
    static void testgetOpportunityByIds() {
        List<Opportunity> opp = [SELECT Id FROM Opportunity ];
        Set<Id> oppIds = new Set<Id>();

        for (Opportunity o : [SELECT Id FROM Opportunity]) {
            oppIds.add(o.Id);
        }
        Test.startTest();
        List<Opportunity> result=  OpportunitySelector.getOpportunityByIds(oppIds);
        Test.stopTest();

         // Vérification que la liste retournée contient bien des résultats
         System.assert(result.size() > 0, 'La liste result doit contenir des opportunités.');
    }
}
