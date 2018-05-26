@draft @v0.4.0 @todo

Feature: Import a Tabular Data Package JSON to CKAN
  As a Data Publisher  
  I want to upload a tabular datapackage.json to CKAN  
  So that I can quickly share my data with data consumers  

  Scenario: Import a valid Tabular Data Package JSON to CKAN
    Given a valid tabular datapackage.json 
    When I invoke "Import Data Package" 
    Then the datapackage.json file should be uploaded to CKAN
    And the Tabular Data Package metadata properties in the datapackage.json should be mapped to the CKAN Dataset metadata properties 
    And the Tabular Data Resource metadata properties in the datapackage.json should be mapped to the CKAN Resource metadata properties 
    And the Tabular Data Resource data in the datapackage.json should be mapped to the CKAN Resource files

  Scenario: Import an invalid Tabular Data Package JSON to CKAN
    Given a invalid datapackage.json 
    When I invoke "Import Data Package" 
    Then an error should be presented
