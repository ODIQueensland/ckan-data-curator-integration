@draft @v0.5.0

Feature: Create new Tabular Data Package ZIP using CKAN
  As a Data Publisher  
  I want to create a tabular datapackage.zip file from the dataset, resources and metadata I've added to CKAN for the first time
  So that data consumers can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data  

  RULES
  =====
  
  - The datapackage.json file should be the same regardless of how that the data is added to CKAN (i.e. via user interface or API)
  - The datapackage.json is a [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/)
  - The datapackage.zip contains
    - a datapackage.json representing a [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/) including:
      - in-line [table schemas](https://frictionlessdata.io/specs/table-schema/) 
      - in-line [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/)
    - one or more [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) in a `/data` directory
    - optionally, a README.md or README.txt file
    
  NOTES
  =====
  
  - In docs, see [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time) and [Download the data package as datapackage.ZIP](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#9-download-the-data-package-as-datapackagezip)
