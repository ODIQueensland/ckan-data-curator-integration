@draft @v0.2.0

Feature: Download Data Package JSON file from CKAN
  As a Data Consumer  
  I want to download a datapackage.json file representing the dataset, its resources and metadata from CKAN  
  So that I can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data  

  RULES
  =====
  
  - The datapackage.json file should be the same regardless of how that the data is added or changed in CKAN (i.e. via user interface or API)
  - The [Data Package](https://frictionlessdata.io/specs/data-package/) follows v1.0 of the specification
  - The datapackage.json contains:
    - [data package](https://frictionlessdata.io/specs/data-package/) metadata properties converted, derived, or defaulted  from the CKAN dataset metadata using the [data package mapping](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/metadata-mapping.md#ckan-dataset-to-data-package-mapping)
    - [data resource](https://frictionlessdata.io/specs/data-resource/) metadata properties converted, derived, or defaulted from the CKAN resource metadatausing the [data resource mapping](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/metadata-mapping.md#ckan-resource-to-data-resource-mapping)
  - The datapackage.json does not contain:
    - [table schemas](https://frictionlessdata.io/specs/table-schema/)
    - [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
    - non-data resources such as README.md or README.txt files
  
  QUESTIONS
  =========
  
  - How do you determine if a resource is/isn't a data resource? Only include resources of certain formats (e.g. drop .pdf?)
  - How are additional CKAN metadata properties handled - drop or include? (Scenarios currently written as dropping metadata)
  
  NOTES
  =====
  
  - See [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time)

  Scenario: Download data package JSON after CKAN dataset created 
    Given a dataset has been published in CKAN
    And one or more resources have been published with the dataset
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are data should be referenced using a URL
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json
  
  Scenario: Download data package JSON after CKAN dataset metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the new CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are data should be referenced using a URL
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json

  Scenario: Download data package JSON after CKAN resource metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the new CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are data should be referenced using a URL
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json

  Scenario: Download data package JSON after CKAN resource data change
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And the current and updated CKAN Resources that are data should be referenced using a URL
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json    

  Scenario: Download data package JSON after CKAN resource addition
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And the current and new CKAN Resources that are data should be referenced using a URL
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json

  Scenario: Download data package JSON after CKAN resource deletion
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And the deleted CKAN Resource metadata properties should not be in the data package be in the datapackage.json
    And the current CKAN Resources that are data should be referenced using a URL
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json
