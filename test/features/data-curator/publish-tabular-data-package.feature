@draft @v0.6.0

Feature: Publish Tabular Data Package ZIP from Data Curator to CKAN 
  As a Data Packager  
  I want to publish a Tabular Data Package to CKAN using Data Curator  
  So that I don't have to upload it manually using CKAN's user interface  

  RULES
  =====

  - The ability to publish to an open data portal is secured through an API key
  - The API key must not be stored and must be kept secret
  - The preferred Open Data Portal and API URL may be stored in Preferences
  - Publish to CKAN using the [CKAN extension](https://github.com/ckan/ckanext-datapackager) that supports uploading data packages through an API
  - The "Publish Data Package" command can be invoked using a menu item or toolbar button
  
  NOTES
  =====
  
  - This is a specialisation of the Data Curator [publish-data-package.feature](https://github.com/ODIQueensland/data-curator/blob/develop/test/features/tools/publish-data-package.feature)
  - when this draft is approved, it should be moved/copied to the Data Curator repository

  Scenario: Publish Data Package to CKAN using Data Curator
    Given Data Curator is open
    And a datapackage.zip file is ready to publish
    When I invoke "Publish Data Package" 
    Then a prompt for the filename and location of the datapackage.zip file, portal type, url and API key should be displayed
    And any preference settings should be defaulted into the input values
    And the selected file should be to published to the open data portal 
    And the Data Package metadata properties in the datapackage.zip should be mapped to the CKAN Dataset metadata properties
    And the Data Resource metadata properties in the datapackage.zip should be mapped to the CKAN Resource metadata properties 
    And the Data Resources in the datapackage.zip CKAN should be published as CKAN Data Resources
    And the Table Schemas for each resource in the datapackage.zip should be stored in CKAN
    And the CSV Dialects for each resource in the datapackage.zip should be stored in CKAN
    And the README.md in the datapackage.zip should be published as CKAN Resource

  Scenario: Publish Data Package using invalid CKAN API URL 
    Given Data Curator is open
    And a datapackage.zip file is ready to publish
    When I invoke "Publish Data Package" 
    And an invalid CKAN URL is provided
    Then an error message should be displayed
    
  Scenario: Publish Data Package using invalid CKAN API KEY
    Given Data Curator is open
    And a datapackage.zip file is ready to publish
    When I invoke "Publish Data Package" 
    And an invalid CKAN API KEY is provided
    Then an error message should be displayed 
