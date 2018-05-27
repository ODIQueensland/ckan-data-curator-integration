@draft @v0.2.0

Feature: Import a Data Package JSON to CKAN
  As a Data Publisher  
  I want to upload a datapackage.json to CKAN  
  So that I can quickly share my data with data consumers  
  
  RULES
  =====
  
  - The datapackage.json file can be imported to CKAN via user interface or API
  - The [Data Package](https://frictionlessdata.io/specs/data-package/) follows v1.0 of the specification
  - The datapackage.json contains:
    - [data package](https://frictionlessdata.io/specs/data-package/) metadata properties to be converted, derived, or defaulted to the CKAN dataset metadata using the [Data Package to CKAN Dataset mapping](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/metadata-mapping.md#data-package-to-ckan-dataset-mapping)
    - [data resource](https://frictionlessdata.io/specs/data-resource/) metadata properties to be converted, derived, or defaulted to the CKAN resource metadata using the [Data Resource to CKAN Resource mapping](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/metadata-mapping.md#data-resource-to-ckan-resource-mapping)
  - The datapackage.json does not contain:
    - [table schemas](https://frictionlessdata.io/specs/table-schema/)
    - [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
    - non-data resources such as README.md or README.txt files

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
