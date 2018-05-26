@draft @v0.6.0 @todo

Feature: Download Tabular Data Package JSON using CKAN
  As a Data Publisher  
  I want to create a tabular datapackage.json file from the dataset, its resources and metadata in CKAN  
  So that data consumers can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data  

  RULES
  =====
  
  - The datapackage.json file should be the same regardless of how that the data is added or changed in CKAN (i.e. via user interface or API)
  - The datapackage.json is a [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/)
  - The datapackage.json contains:
    - [tabular data package](https://frictionlessdata.io/specs/data-package/) metadata properties converted, derived, or defaulted  from the CKAN dataset metadata using the [tabular data package mapping](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/metadata-mapping.md#ckan-dataset-to-tabular-data-package-mapping)
    [tabular data resource](https://frictionlessdata.io/specs/tabular-data-resource/) metadata properties converted, derived, or defaulted from the CKAN resource metadata using the [tabular data resource mapping](https://app.cucumber.pro/projects/ckan-data-curator-integration/documents/branch/master/test/features/metadata-mapping.md#ckan-resource-to-tabular-data-resource-mapping)
    - references [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) via a url
    - includes [table schemas](https://frictionlessdata.io/specs/table-schema/) in-line 
    - includes [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
  - The datapackage.json does not contain:
    - non-data resources such as README.md or README.txt files
    - non-tabular data resources or associated metadata
  
  QUESTIONS
  =========
  
  - How do you determine if a CKAN dataset is a tabular data package? Is it only if it has been uploaded as one?
  - How are Table Schemas stored in CKAN? Is a mapping needed?
  - How are CSV Dialects stored in CKAN? Is a mapping needed?
  - How do you determine if a resource is/isn't a data resource? Based on the resources in the datapackage.json?
  - How are additional CKAN metadata properties handled - drop or include?
  - What if someone changes the data or metadata?

  NOTES
  =====
  
  - In docs, see [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time) 

  Scenario: Download tabular data package JSON after tabular data package uploaded 
  Given a tabular data package has been published in CKAN
    When I invoke "Download Tabular Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Tabular Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Tabular Data Resource metadata properties in the datapackage.json
    And the CKAN Resource Table Schema properties should be mapped to the Tabular Data Resource metadata properties in the datapackage.json
    And the CKAN Resource CSV Dialect properties should be mapped to the Tabular Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are not tabular data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json
 
