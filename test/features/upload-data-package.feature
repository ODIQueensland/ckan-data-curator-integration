@draft

Feature: Upload Data Package to CKAN
  As a Data Packager  
  I want to upload a data package to an open data portal  
  So that it can be used by others  

  RULES
  =====

  - The data package must be a tabular data package

  Scenario: Upload a valid Data Package to CKAN
    Given a datapackage.zip file is ready to publish
    When I
    Then something should happen
