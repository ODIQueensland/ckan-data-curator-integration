@draft

Feature: Publish Data Package to CKAN using Data Curator
  As a Data Packager  
  I want to publish a data package to CKAN using Data Curator 
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
  
  - specialisation of Data Curator [publish-data-package.feature](https://github.com/ODIQueensland/data-curator/blob/develop/test/features/tools/publish-data-package.feature)

  Scenario: Publish Data Package to CKAN using Data Curator
    Given Data Curator is open
    And a datapackage.zip file is ready to publish
    When I invoke "Publish Data Package" 
    Then a prompt for the filename and location of the datapackage.zip file, portal type, url and API key should be displayed
    And any preference settings should be defaulted into the input values
    And the selected file should be to published to the open data portal via an API
