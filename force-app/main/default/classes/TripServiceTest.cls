@IsTest
private class TripServiceTest {
    @TestSetup
    static void setup() {
        TestDataFactory.createTestTripServiceUpdate();
        TestDataFactory.createTestvalidateTripOnOpportunity();
    }


    @IsTest
  static void testvalidateTripInsert() {
    Test.startTest();
    List<Trip__c> trips = new List<Trip__c>();  
    Trip__c   trip=  new Trip__c( Name = 'TestTripService' ,
         startDate__c = Date.today().addDays(5),  // Trip à venir
         endDate__c=Date.today().addDays(10),
            numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
            Status__c = 'A venir'
        );  
    insert trip;
    Test.stopTest();

    Trip__c results=[select id, name from trip__c where name='TestTripService'];
    System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );

  }


  @IsTest
  static void testvalidateTripUpdate() {
        Test.startTest();
        Trip__c trip=[select id, name from trip__c where name='tripTestUpdate'];
        trip.Status__c='Annulé';
        update trip;
    Test.stopTest();

    Trip__c results=[select id, name from trip__c where name='tripTestUpdate' and Status__c='Annulé'];
    System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );

  }

  @IsTest
  static void testvalidateTripServiceOpportunity() {
    Opportunity opp=[select id, name from Opportunity where name='testvalidateTripOnOpportunity'];
    Test.startTest();
    opp.StageName='Closed Won';
    update opp;
    Test.stopTest();

    Opportunity results=[select id, name from Opportunity where name='testvalidateTripOnOpportunity' and StageName='Closed Won'];
    System.assertNotEquals(null, results,'La liste des résultats ne doit pas être nulle' );
  }



}