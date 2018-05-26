@draft @v0.6.0 @todo

Feature: Download new Tabular Data Package ZIP using CKAN
  As a Data Publisher  
  I want to create a tabular datapackage.zip file from the dataset, its resources and metadata in CKAN  
  So that data consumers can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data  

  RULES
  =====
  
  - The datapackage.zip file should be the same regardless of how that the data is added or changed in CKAN (i.e. via user interface or API)
  - The [Data Package](https://frictionlessdata.io/specs/data-package/) follows v1.0 of the specification
  - The datapackage.zip contains:
    - a datapackage.json file as produced by [Create new Tabular Data Package JSON using CKAN](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/ckan/create-tabular-datapackage-json.feature) 
      - in-line [table schemas](https://frictionlessdata.io/specs/table-schema/) 
      - in-line [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/)
    - optionally, a README.md or README.txt file    

  LATER
  =====
  
  - Given [concerns](https://github.com/frictionlessdata/ckanext-datapackager/issues/52), adding data to the zip as files in a `/data` directory is very difficult

  NOTES
  =====
  
  - In docs, see [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time) 

  Scenario: Download tabular data package ZIP with README using CKAN
    Given a tabular data package has been published in CKAN
    And a README.md or README.txt is published with the dataset
    When I invoke "Download Tabular Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And the README.md or README.txt should be in the datapackage.zip
    And other CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip

  Scenario: Download tabular data package ZIP without README using CKAN
  Given a tabular data package has been published in CKAN
    But no README.md or README.txt is published with the dataset
    When I invoke "Download Tabular Data Package ZIP" 
    Then a datapackage.zip file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Data Package metadata properties in the datapackage.zip
    And the CKAN Resource metadata properties should be mapped to the Data Resource metadata properties in the datapackage.zip
    And the CKAN Data Resources should be in a `/data` directory in the datapackage.zip
    And the README.md or README.txt should not be in the datapackage.zip
    And other CKAN Resources that are not data should not be included in the datapackage.zip
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.zip
