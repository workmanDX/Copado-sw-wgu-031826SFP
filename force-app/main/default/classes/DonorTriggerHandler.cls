public with sharing class DonorTriggerHandler {
    public DonorTriggerHandler() {
        Donor_Report__c[] reports = [SELECT Id, Name FROM Donor_Report__c];
    }
}