@IsTest
public class TestDataFactory {
    @IsTest
    public static void createTestgetOpportunityByIds() {

         // Création d'un compte
         Account testAccount = new Account(
            Name = 'Test Account'
        );
        insert testAccount;       

        // Création d'une liste d'opportunités
        List<Opportunity> opportunities = new List<Opportunity>();

        for (Integer i = 1; i <= 2; i++) { // Boucle pour créer au moins 2 opportunités
            Opportunity opp = new Opportunity(
                Name = 'Test Opportunity ' + i,
                AccountId = testAccount.Id,
                CloseDate = Date.today().addDays(30),
                StageName = 'Prospecting' // Remplace par un stade valide dans ton org
            );
            opportunities.add(opp);
        }

        // Insertion des opportunités en une seule fois (meilleure performance)
        insert opportunities;

    }



    @IsTest
    public static void createTestTripCanceledBatchJob()
    {
        try {
              List<Trip__c> trips = new List<Trip__c>();

        // Création de trips avec moins de 10 participants
     
        Trip__c   trip=  new Trip__c( Name = 'Trip Test' ,
             startDate__c = Date.today().addDays(5),  // Trip à venir
             endDate__c=Date.today().addDays(10),
                numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
                Status__c = 'A venir'
            );      
        insert trip;
        } catch (Exception e) {
            System.debug('Erreur createTestTripCanceledBatchJob : ' + e.getMessage());
        }
    }


    @IsTest
    public static void createTestTripSelector()
    {
        try {
             List<Trip__c> trips = new List<Trip__c>();
        // Création de trips avec moins de 10 participants     
        Trip__c   trip=  new Trip__c( Name = 'Trip Test' ,
             startDate__c = Date.today().addDays(5),  // Trip à venir
             endDate__c=Date.today().addDays(10),
                numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
                Status__c = 'A venir'
            );  
        insert trip;      
        } catch (Exception e) {
            System.debug('Erreur createTestTripSelector : ' + e.getMessage());
        }
    }

    @IsTest
    public static void createTestexecuteTripCancel()
    {
        try {
            List<Trip__c> trips = new List<Trip__c>();  
    
            for (Integer i = 1; i <= 3; i++) {
                Trip__c trip = new Trip__c(                    
                    startDate__c = Date.today().addDays(5 ),  // Espacement des dates
                    endDate__c = Date.today().addDays(10 ),
                    numberOfParticipants__c = 7 , 
                    Status__c = 'A venir'
                );
                trips.add(trip);
            }
    
            insert trips;
        } catch (Exception e) {
            System.debug('Erreur createTestexecuteTripCancel : ' + e.getMessage());
        }
    }

    @IsTest
    public static void createTestTripServiceUpdate()
    {
        try {
             List<Trip__c> trips = new List<Trip__c>();  
        Trip__c   trip=  new Trip__c(
             startDate__c = Date.today().addDays(5),  // Trip à venir
             endDate__c=Date.today().addDays(10),
                numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
                Status__c = 'A venir'
            );  
        insert trip;
        } catch (Exception e) {
            System.debug('Erreur createTestTripSelector : ' + e.getMessage());
        }
    }


    @IsTest
    public static void createTestvalidateTripOnOpportunity() {
         // Création d'un compte
         Account testAccount = new Account(
            Name = 'Test Account'
        );
        insert testAccount;     
        // Création d'une liste d'opportunités
        List<Opportunity> opportunities = new List<Opportunity>();       
            Opportunity opp = new Opportunity(
                Name = 'testvalidateTripOnOpportunity ',
                AccountId = testAccount.Id,
                CloseDate = Date.today().addDays(30),
                StageName = 'Prospecting' // Remplace par un stade valide dans ton org
            );
            opportunities.add(opp);   
        // Insertion des opportunités en une seule fois (meilleure performance)
        insert opportunities;
    }
    @IsTest
    public static void createTripUpdateBatchJobTestCase1()
    {
        try {
             List<Trip__c> trips = new List<Trip__c>();  
        Trip__c   trip=  new Trip__c( //Name = 'tripTestCase1' ,
             startDate__c = Date.today().addDays(5),  // Trip à venir
             endDate__c=Date.today().addDays(10),
                numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
                Status__c = 'Annulé'
            );  
        insert trip;
        } catch (Exception e) {
            System.debug('Erreur createTestTripSelector : ' + e.getMessage());
        }
    }
    @IsTest
    public static void createTripUpdateBatchJobTestCase2()
    {
        try {
             List<Trip__c> trips = new List<Trip__c>();  
        Trip__c   trip=  new Trip__c( //Name = 'tripTestCase2' ,
             startDate__c = Date.today().addDays(-1),  // Trip à venir
             endDate__c=Date.today().addDays(10),
                numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
                Status__c = 'Annulé'
            );  
        insert trip;
        } catch (Exception e) {
            System.debug('Erreur createTestTripSelector : ' + e.getMessage());
        }
    }

    @IsTest
    public static void createTripUpdateBatchJobTestCase3()
    {
        try {
             List<Trip__c> trips = new List<Trip__c>();  
        Trip__c   trip=  new Trip__c( //Name = 'tripTestCase3' ,
             startDate__c = Date.today().addDays(-10),  // Trip à venir
             endDate__c=Date.today().addDays(-1),
                numberOfParticipants__c =7, // Un trip à annuler (moins de 10 participants)
                Status__c = 'Annulé'
            );  
        insert trip;
        } catch (Exception e) {
            System.debug('Erreur createTestTripSelector : ' + e.getMessage());
        }
    }

    @IsTest
    public static void createTestexecuteTripUpdateCase1()
    {
        try {
                Trip__c trip = new Trip__c(                    
                    startDate__c = Date.today().addDays(5 ),  // Espacement des dates
                    endDate__c = Date.today().addDays(10 ),
                    numberOfParticipants__c = 7 , 
                    Status__c = 'Terminé',
                    destination__c='testupdate'
                );            
            insert trip;

            
        } catch (Exception e) {
            System.debug('Erreur createTestTripServiceUpdate : ' + e.getMessage());
        }
    }
    @IsTest
    public static void createTestexecuteTripUpdateCase2()
    {
        try {
                Trip__c trip = new Trip__c(                    
                    startDate__c = Date.today().addDays(-1 ),  // Espacement des dates
                    endDate__c = Date.today().addDays(10 ),
                    numberOfParticipants__c = 7 , 
                    Status__c = 'Terminé',
                    destination__c='testupdate'
                );            
            insert trip;

            
        } catch (Exception e) {
            System.debug('Erreur createTestTripServiceUpdate : ' + e.getMessage());
        }
    }
    @IsTest
    public static void createTestexecuteTripUpdateCase3()
    {
        try {
                Trip__c trip = new Trip__c(                    
                    startDate__c = Date.today().addDays(-10 ),  // Espacement des dates
                    endDate__c = Date.today().addDays(-1),
                    numberOfParticipants__c = 7 , 
                    Status__c = 'Terminé',
                    destination__c='testupdate'
                );            
            insert trip;
            
        } catch (Exception e) {
            System.debug('Erreur createTestTripServiceUpdate : ' + e.getMessage());
        }
    }


    
}