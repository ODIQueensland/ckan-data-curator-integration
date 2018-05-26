@draft @v0.3.0

Feature: Download new Data Package ZIP using CKAN
  As a Data Publisher  
  I want to create a datapackage.zip file from a dataset, its resources and metadata in CKAN  
  So that data consumers can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data  

  RULES
  =====
  
  - The datapackage.zip file should be the same regardless of how that the data is added or changed in CKAN (i.e. via user interface or API)
  - The [Data Package](https://frictionlessdata.io/specs/data-package/) follows v1.0 of the specification
  - The datapackage.zip contains:
    - a datapackage.json file as produced by [Download new Data Package JSON using CKAN](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/ckan/download-datapackage-json.feature) with the exception that [data resources](https://frictionlessdata.io/specs/data-resource/) reference files in a `/data` directory rather than being referencing to CKAN URLs
    - a `/data` directory containing one or more data resources 
    - optionally, a README.md or README.txt file
  - The datapackage.json does not contain:
    - [table schemas](https://frictionlessdata.io/specs/table-schema/)
    - [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
    - non-data resources apart from the README.md or README.txt files

  QUESTIONS
  =========
  
  - How do you determine if a resource is/isn't a data resource?
  - How are additional CKAN metadata properties handled - drop or include?
  
  NOTES
  =====
  
  - In docs, see [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time)

  Scenario: Download data package ZIP with README after CKAN dataset created
    Given a dataset has been published in CKAN
    And one or more resources have been published with the dataset
    And a README.md or README.txt is published with the dataset
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And the README.md or README.txt should be in the datapackage.zip
    And other CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Download new data package ZIP without README after CKAN dataset created
    Given a dataset has been published in CKAN
    And one or more resources have been published with the dataset
    But no README.md or README.txt is published with the dataset
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And the README.md or README.txt should not be in the datapackage.zip
    And other CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Download data package ZIP after CKAN dataset metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Download data package ZIP after CKAN resource metadata property change 
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Download data package ZIP after CKAN resource data change
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip    

  Scenario: Download data package ZIP after CKAN resource addition
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Download data package ZIP after CKAN resource deletion
    Given a dataset has been published in CKAN
    And one or more dataset metadata properties have been changed 
    When I invoke "Download Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Download data package ZIP after removing README file 
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
    
  Scenario: Download data package ZIP after adding a README file
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
