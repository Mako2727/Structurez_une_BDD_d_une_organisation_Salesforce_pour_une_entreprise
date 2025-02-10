@IsTest
private class TripServiceTest {
    @TestSetup
    static void setup() {
      TestDataFactory.createTestexecuteTripCancel();
        TestDataFactory.createTestTripServiceUpdate();
        TestDataFactory.createTestvalidateTripOnOpportunity();
        TestDataFactory.createTestexecuteTripUpdateCase1();
        TestDataFactory.createTestexecuteTripUpdateCase2();
        TestDataFactory.createTestexecuteTripUpdateCase3();
    }


    @IsTest
    static void testexecuteTripUpdate(){
      Test.startTest();
      List<Trip__c> trips=[select id, name,numberOfParticipants__c,Status__c,startDate__c,endDate__c from trip__c where status__c='Terminé'  and destination__c='testupdate' ];
      TripService.executeTripUpdate(trips);
      List<Trip__c> results=[select id, name,Status__c from trip__c ];        
     
      
      List<Trip__c> results1=[select id, name,Status__c,destination__c from trip__c where Status__c='A venir'  and destination__c='testupdate' ];     
      System.assertEquals(1, results1.size(), 'La liste result doit contenir 1 ligne.');

      List<Trip__c>  results2=[select id, name,Status__c,destination__c from trip__c where Status__c='En cours'  and destination__c='testupdate' ];     
      System.assertEquals(1, results2.size(), 'La liste result doit contenir 1 ligne.');

      List<Trip__c>  results3=[select id, name,Status__c,destination__c from trip__c where Status__c='Terminé'  and destination__c='testupdate' ];     
      System.assertEquals(1, results3.size(), 'La liste result doit contenir 1 ligne.');
      Test.stopTest();

    }

    @IsTest
    static void testexecuteTripCanceled() {

      Test.startTest();
      List<Trip__c> trips=[select id, name,numberOfParticipants__c from trip__c where status__c='A venir'  ];
      TripService.executeTripCanceled(trips);

      List<Trip__c> results=[select id, name from trip__c where status__c='Annulé'  ];
      Test.stopTest();
      System.assertNotEquals(3, results.size(),'La liste doit avoir 3 elements' );

    }


    @IsTest
  static void testvalidateTripInsert() {
    Test.startTest();
    List<Trip__c> trips = new List<Trip__c>();  
    Trip__c   trip=  new Trip__c(
         startDate__c = Date.today().addDays(5),  // Trip à venir
         endDate__c=Date.today().addDays(10),
            numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
            Status__c = 'A venir'
        );  
    insert trip;
    Test.stopTest();

    Trip__c results=[select id, name from trip__c where id=:trip.id  ];
    System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );

  }


  @IsTest
  static void testvalidateTripUpdate() {
        Test.startTest();
        List<Trip__c> trips = [SELECT Id, Name, Status__c FROM Trip__c];
        for (Trip__c trip : trips) {
            trip.Status__c = 'Annulé';
        }    
        update trips;
    Test.stopTest();

    List<Trip__c> results=[select id, name from trip__c where Status__c='Annulé'];
    System.assert(results.size() > 0, 'La liste des résultats doit contenir au moins un élément.');
  }

  @IsTest
  static void testvalidateTripServiceOpportunity() {
    Opportunity opp=[select id, name from Opportunity where destination__c = 'testOppCloseWon'];
    Test.startTest();
    opp.StageName='Closed Won';
    update opp;
    Test.stopTest();

    List<Trip__c> results=[select id from trip__c where  Opportunity__c=:opp.id ];
    System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );
  }
}