@draft @v0.4.0 @todo

Feature: Import a Tabular Data Package JSON file to CKAN
  As a Data Publisher  
  I want to upload a tabular datapackage.json to CKAN  
  So that I can quickly share my data with data consumers 
  
  RULES
  =====
  
  - The [data resources must be stored at a url](https://frictionlessdata.io/specs/data-resource/#path-data-in-files)
  - A datapackage.json will not be imported if the data is:
    - at a [local path](https://frictionlessdata.io/specs/data-resource/#path-data-in-files)
    - [in-line data](https://frictionlessdata.io/specs/data-resource/#data-inline-data) 
    
  NOTES
  =====
  
  - This is not a requirement for Data Curator integration to CKAN but is needed for supporting current import options [see ckanext-datapackager #40](https://github.com/frictionlessdata/ckanext-datapackager/issues/40)  

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
