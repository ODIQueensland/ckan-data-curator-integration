@draft

Feature: Create new data package JSON using CKAN
  As a Data Publisher  
  I want to create a datapackage.json file from resources and metadata I've added to CKAN for the first time
  So that data consumers can download all the information in one step

  RULES
  =====
  
  - Results should be the same regardless of how that the data is added to CKAN (i.e. via user interface or API)
  - The datapackage.json is a [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/)
  - The datapackage.json:
    - references [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) via a url
    - includes [table schemas](https://frictionlessdata.io/specs/table-schema/) and [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
    - doesn't include other resources or README.md or README.txt files

    NOTES
    =====
    
    - In docs, see [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time) and [Download the data package as datapackage.json](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#8-download-the-data-package-as-datapackagejson)
