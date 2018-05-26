@draft @v0.4.0

Feature: Create new Tabular Data Package JSON using CKAN
  As a Data Publisher  
  I want to create a tabular datapackage.json file from resources and metadata I've added to CKAN for the first time
  So that data consumers can download all the information in one step

  RULES
  =====
  
  - Results should be the same regardless of how that the data is added to CKAN (i.e. via user interface or API)
  - The datapackage.json is a [Data Package](https://frictionlessdata.io/specs/data-package/) 
  - The datapackage.json:
    - references [data resources](https://frictionlessdata.io/specs/data-resource/) via a url
    - doesn't include:
      - [table schemas](https://frictionlessdata.io/specs/table-schema/)
      - [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
      - non-data resources such as README.md or README.txt files


  NOTES
  =====
  
  - In docs, see [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time) and [Download the data package as datapackage.json](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#8-download-the-data-package-as-datapackagejson)
  
  
  LATER
  =====

  Initially we'll fix the creation of a Data Package. Then we'll support a [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/)
  
  - The datapackage.json is a Tabular Data Package
  - The datapackage.json:
    - references [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) via a url
    - includes [table schemas](https://frictionlessdata.io/specs/table-schema/) and [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
    - doesn't include other resources or README.md or README.txt files


  Scenario: Create new data package JSON using CKAN
    Given a dataset has been published in CKAN
    And one or more resources have been published with the dataset
    When I invoke "Download Data Package" 
    Then a prompt for the filename and location of the datapackage.zip file, portal type, url and API key should be displayed
    And any preference settings should be defaulted into the input values
    And the selected file should be to published to the open data portal via an API
