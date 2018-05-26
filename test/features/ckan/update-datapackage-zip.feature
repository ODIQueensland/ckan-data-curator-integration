@draft @v0.3.0

Feature: Update Data Package ZIP using CKAN
  As a Data Publisher  
  I want to update a datapackage.zip file from the dataset, resources and metadata I've changed in CKAN  
  So that data consumers can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data  

  RULES
  =====
  
  - The datapackage.zip file should be the same regardless of how that the data is changed in CKAN (i.e. via user interface or API)
  - The [Data Package](https://frictionlessdata.io/specs/data-package/) follows v1.0 of the specification
  - The datapackage.zip contains:
    - [data package](https://frictionlessdata.io/specs/data-package/) metadata properties converted, derived, or defaulted  from the CKAN dataset metadata
    - [data resource](https://frictionlessdata.io/specs/data-resource/) metadata properties converted, derived, or defaulted from the CKAN resource metadata
    - optionally, a README.md or README.txt file
  - The datapackage.zip does not contain:
    - [table schemas](https://frictionlessdata.io/specs/table-schema/)
    - [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
    - non-data resources such as README.md or README.txt files
    - CKAN metadata properties is mapped to Frictionless Data Data Package and Data Resouce properties as described in the [Create new Data Package ZIP using CKAN](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/ckan/create-datapackage-ZIP.feature)  
    
  QUESTIONS
  =========

  - How do you determine if a resource is/isn't a data resource?
  - How are additional CKAN metadata properties handled - drop or include?
  
  NOTES
  =====

  - In docs, see [Change data in a published data package](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#3-change-data-in-a-published-data-package)
  
  Scenario: Update data package ZIP after CKAN dataset metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Update data package ZIP after CKAN resource metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Update data package ZIP after CKAN resource data change
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip    

  Scenario: Update data package ZIP after CKAN resource addition
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Update data package ZIP after CKAN resource deletion
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip
  
  Scenario: Update data package ZIP after removing README file 
    Given a dataset has been published in CKAN
    And the README file has been deleted 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And the README file should not be included in the datapackage.zip
    And other CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip
    
  Scenario: Update data package ZIP after adding a README file
    Given a dataset has been published in CKAN
    And the README file has been added 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And the README file should be included in the datapackage.zip
    And other CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip
