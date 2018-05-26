@draft

Feature: Update Data Package JSON using CKAN
  As a Data Publisher  
  I want to update a datapackage.json file from resources and metadata I've changed in CKAN 
  So that data consumers can download all the latest information in one step

  RULES
  =====

  - Results should be the same regardless of how that the data is added to CKAN (i.e. via user interface or API)
  - The datapackage.zip contains
    - a datapackage.json representing a [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/) including in-line [table schemas](https://frictionlessdata.io/specs/table-schema/) and [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/)
    - one or more [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) in a `/data` directory
    - a README.md or README.txt file
  
  NOTES
  =====
  
  - In docs, see [Change data in a published data package](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#3-change-data-in-a-published-data-package) and [Download the data package as datapackage.json](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#8-download-the-data-package-as-datapackagejson)
