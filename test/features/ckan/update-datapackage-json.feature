@draft @v0.2.0

Feature: Update Data Package JSON using CKAN
  As a Data Publisher  
  I want to update a datapackage.json file from dataset, resources and metadata I've changed in CKAN 
  So that data consumers can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data

  RULES
  =====
  
  - The datapackage.json file should be the same regardless of how that the data is changed in CKAN (i.e. via user interface or API)
  - The [Data Package](https://frictionlessdata.io/specs/data-package/) follows v1.0 of the specification
  - The datapackage.json contains:
    - [data package](https://frictionlessdata.io/specs/data-package/) metadata properties converted, derived, or defaulted  from the CKAN dataset metadata
    - [data resource](https://frictionlessdata.io/specs/data-resource/) metadata properties converted, derived, or defaulted from the CKAN resource metadata
  - The datapackage.json does not contain:
    - [table schemas](https://frictionlessdata.io/specs/table-schema/)
    - [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
    - non-data resources such as README.md or README.txt files
    - CKAN metadata properties is mapped to Frictionless Data Data Package and Data Resouce properties as described in the [Create new Data Package JSON using CKAN](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/ckan/create-datapackage-json.feature)  

  QUESTIONS
  =========
  
  - How do you determine if a resource is/isn't a data resource?
  - How are additional CKAN metadata properties handled - drop or include?
  
  NOTES
  =====
  
  - In docs, see [Change data in a published data package](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#3-change-data-in-a-published-data-package) and [Download the data package as datapackage.json](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#8-download-the-data-package-as-datapackagejson)
  
  Scenario: Update data package JSON after CKAN dataset metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json
  
  Scenario: Update data package JSON after CKAN resource metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json

  Scenario: Update data package JSON after CKAN resource data change
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json    

  Scenario: Update data package JSON after CKAN resource addition
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json

  Scenario: Update data package JSON after CKAN resource deletion
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are not data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json
