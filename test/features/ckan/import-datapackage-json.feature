@draft @v0.2.0 @todo

Feature: Import a Data Package JSON to CKAN
  As a Data Publisher  
  I want to upload a datapackage.json to CKAN  
  So that I can quickly share my data with data consumers  

  Scenario: Import a valid Data Package JSON to CKAN
    Given a valid datapackage.json 
    When I invoke "Import Data Package" 
    Then the datapackage.json file should be uploaded to CKAN
    And the Data Package metadata properties in the datapackage.json should be mapped to the CKAN Dataset metadata properties 
    And the Data Resource metadata properties in the datapackage.json should be mapped to the CKAN Resource metadata properties 
    And the Data Resource data in the datapackage.json should be mapped to the CKAN Resource files

  Scenario: Import an invalid Data Package JSON to CKAN
    Given a invalid datapackage.json 
    When I invoke "Import Data Package" 
    Then an error should be presented
