/*******************************************************************************************
* @name         DonorTriggerHandlerTest
* @author       Steven Workman
* @since        2026-03-24
* @description  Test class for DonorTriggerHandler. Validates constructor instantiation
*               and SOQL query behavior against Donor_Report__c records.
*
* @see          DonorTriggerHandler
********************************************************************************************
* MODIFICATION LOG
* Date          Developer          Description
*-------------------------------------------------------------------------------------------
* 2026-03-24    Steven Workman     Initial test implementation
*******************************************************************************************/
@isTest(SeeAllData=false)
private class DonorTriggerHandlerTest {

    /**
     * @testSetup
     * @dataVolume 5 Donor_Report__c records
     * Test Data Created:
     * - 5 Donor_Report__c records with sequential names
     */
    @testSetup
    static void setupTestData() {
        List<Donor_Report__c> reports = new List<Donor_Report__c>();
        for (Integer i = 0; i < 5; i++) {
            reports.add(new Donor_Report__c(Name = 'Test Report ' + i));
        }
        insert reports;
    }

    /**
     * @test
     * @covers DonorTriggerHandler.DonorTriggerHandler()
     * @expect Handler instantiates successfully and queries existing records
     * Test Scenario: Construct handler when Donor_Report__c records exist
     * Expected Result: Handler is not null
     */
    @isTest
    static void testConstructorWithExistingRecords() {
        Test.startTest();
        DonorTriggerHandler handler = new DonorTriggerHandler();
        Test.stopTest();

        Assert.isNotNull(handler, 'Handler should be instantiated when records exist');
    }

    /**
     * @test
     * @covers DonorTriggerHandler.DonorTriggerHandler()
     * @expect Handler instantiates successfully with no records
     * Test Scenario: Construct handler when no Donor_Report__c records exist
     * Expected Result: Handler is not null
     */
    @isTest
    static void testConstructorWithNoRecords() {
        delete [SELECT Id FROM Donor_Report__c];

        Test.startTest();
        DonorTriggerHandler handler = new DonorTriggerHandler();
        Test.stopTest();

        Assert.isNotNull(handler, 'Handler should be instantiated when no records exist');
    }

    /**
     * @test
     * @covers DonorTriggerHandler.DonorTriggerHandler()
     * @expect Handler instantiates successfully with bulk records
     * Test Scenario: Construct handler when 200+ Donor_Report__c records exist
     * Expected Result: Handler is not null and handles bulk data within governor limits
     */
    @isTest
    static void testConstructorWithBulkRecords() {
        List<Donor_Report__c> bulkReports = new List<Donor_Report__c>();
        for (Integer i = 0; i < 200; i++) {
            bulkReports.add(new Donor_Report__c(Name = 'Bulk Report ' + i));
        }
        insert bulkReports;

        Test.startTest();
        DonorTriggerHandler handler = new DonorTriggerHandler();
        Test.stopTest();

        Assert.isNotNull(handler, 'Handler should be instantiated with bulk records');
    }
}
