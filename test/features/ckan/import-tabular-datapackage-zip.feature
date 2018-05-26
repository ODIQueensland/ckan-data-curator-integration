@draft  @todo

Feature: Import a Tabular Data Package ZIP to CKAN
  As a Data Publisher  
  I want to upload a tabular datapackage.zip to CKAN  
  So that I can quickly share my data with data consumers  

  Scenario: Import a valid Tabular Data Package ZIP to CKAN
    Given a valid tabular datapackage.zip 
    When I invoke "Import Data Package" 
    Then the datapackage.zip file should be uploaded to CKAN
    And the Tabular Data Package metadata properties in the datapackage.zip should be mapped to the CKAN Dataset metadata properties 
    And the Tabular Data Resource metadata properties in the datapackage.zip should be mapped to the CKAN Resource metadata properties 
    And the Tabular Data Resource data in the datapackage.zip should be mapped to the CKAN Resource files
    And the README.md or README.txt file in the datapackage.zip should be add as a CKAN non-data resource file

  Scenario: Import an invalid Tabular Data Package ZIP to CKAN
    Given a invalid datapackage.zip 
    When I invoke "Import Data Package" 
    Then an error should be presented
