public with sharing class DonorTriggerHandler {
    public static void handleAfterInsert(Donor_Report__c[] reports) {
        for(Donor_Report__c report : reports){
            report.Country_of_Origin__c = 'United States';
        }
    }
}