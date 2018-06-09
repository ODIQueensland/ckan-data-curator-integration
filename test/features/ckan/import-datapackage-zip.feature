@draft @v0.3.0 @todo

Feature: Import a Data Package ZIP file to CKAN
  As a Data Publisher  
  I want to upload a datapackage.zip to CKAN  
  So that I can quickly share my data with data consumers  

  Scenario: Import a valid Data Package ZIP to CKAN
    Given a valid datapackage.zip 
    When I invoke "Import Data Package" 
    Then the datapackage.zip file should be uploaded to CKAN
    And the Data Package metadata properties in the datapackage.zip should be mapped to the CKAN Dataset metadata properties 
    And the Data Resource metadata properties in the datapackage.zip should be mapped to the CKAN Resource metadata properties 
    And the Data Resource data in the datapackage.zip should be mapped to the CKAN Resource files
    And the README.md or README.txt file in the datapackage.zip should be add as a CKAN non-data resource file

  Scenario: Import an invalid Data Package ZIP to CKAN
    Given a invalid datapackage.zip 
    When I invoke "Import Data Package" 
    Then an error should be presented
