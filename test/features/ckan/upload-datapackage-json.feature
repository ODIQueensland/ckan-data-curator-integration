@draft @v0.2.0 @todo

Feature: Upload a Data Package JSON to CKAN
  As a Data Publisher  
  I want to upload a datapackage.json to CKAN  
  So that I can quickly share my data with data consumers  

  Scenario: Upload a valid Data Package JSON to CKAN
    Given a valid datapackage.json 
    When I invoke "Upload Data Package" 
    Then the datapackage.json file should be uploaded to CKAN
    And the Data Package metadata properties in the datapackage.json should be mapped to the CKAN Dataset metadata properties 
    And the Data Resource metadata properties in the datapackage.json should be mapped to the CKAN Resource metadata properties 
    And the Data Resource data in the datapackage.json should be mapped to the CKAN Resource files

  Scenario: Upload an invalid Data Package JSON to CKAN
    Given a invalid datapackage.json 
    When I invoke "Upload Data Package" 
    Then an error should be presented
