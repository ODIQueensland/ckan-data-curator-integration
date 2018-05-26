@draft @v0.4.0

Feature: Create new Tabular Data Package JSON using CKAN
  As a Data Publisher  
  I want to create a tabular datapackage.json file from dataset, resources and metadata I have added to CKAN for the first time
  So that data consumers can use [Frictionless Data software](https://frictionlessdata.io/software/) to work with the data  

  RULES
  =====
  
  - The datapackage.json file should be the same regardless of how that the data is added to CKAN (i.e. via user interface or API)
  - The datapackage.json is a [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/)
  - The datapackage.json:
    - references [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) via a url
    - includes [table schemas](https://frictionlessdata.io/specs/table-schema/) in-line 
    - includes [CSV dialects](https://frictionlessdata.io/specs/csv-dialect/) in-line 
  - The datapackage.json does not contain:
    - non-data resources such as README.md or README.txt files
    - non-tabular data resources or associated metadata
  
  Data Package mapping
  --------------------
  
    | CKAN Dataset metadata property | Tabular Data Package metadata property | notes                                |
    | ------------------------------ | -------------------------------------- | ------------------------------------ |
    |                                | name                                   |                                      |
    |                                | id                                     |                                      |
    |                                | licenses name                          |                                      |
    |                                | licenses path                          |                                      |
    |                                | licenses title                         |                                      |
    |                                | profile                                |                                      |
    |                                | title                                  | default value `tabular-data-package` |
    |                                | description                            |                                      |
    |                                | homepage                               |                                      |
    | not available                  | sources                                |                                      |
    | author                         | contributors title                     |                                      |
    | author                         | contributors role                      | default value `author`               |
    | maintainer                     | contributors title                     |                                      |
    | maintainer                     | contributors role                      | default value `maintainer`           |
    |                                | keywords                               |                                      |
    |                                | image                                  |                                      |
    |                                | created                                |                                      |


  Data Resource mapping
  ---------------------
    
    | CKAN Resource metadata property | Tabular Data Resource metadata property | notes                                  |
    | ------------------------------- | --------------------------------------- | -------------------------------------- |
    |                                 | path                                    | the url the ckan resource is stored at |
    |                                 | name                                    |                                        |
    |                                 | profile                                 | default value `tabular-data-resource`  |
    |                                 | title                                   |                                        |
    |                                 | description                             |                                        |
    |                                 | format                                  | `csv` or `tsv`                         |
    |                                 | mediatype                               | `text/csv` or                          |
    |                                 | encoding                                | default `UTF-8` ?                      |
    |                                 | bytes                                   |                                        |
    |                                 | hash                                    |                                        |
    | not available                   | sources                                 |                                        |
    | not available                   | licenses name                           |                                        |
    | not available                   | licenses path                           |                                        |
    | not available                   | licenses title                          |                                        |

  QUESTIONS
  =========
  
  - How do you determine if a CKAN dataset is a tabular data package? Is it only if it has been uploaded as one?
  - How are Table Schemas stored in CKAN?
  - How are CSV Dialects stored in CKAN?
  - How do you determine if a resource is/isn't a data resource?
  - How are additional CKAN metadata properties handled - drop or include?

  NOTES
  =====
  
  - In docs, see [Publish a data package to CKAN for the first time](https://github.com/ODIQueensland/ckan-data-curator-integration/tree/master/docs#2-publish-a-data-package-to-ckan-for-the-first-time) 

  Scenario: Create new tabular data package JSON using CKAN
  Given a tabular data package has been published in CKAN
    When I invoke "Download Tabular Data Package" 
    Then a datapackage.json file should be downloaded
    And the CKAN Dataset metadata properties should be mapped to the Tabular Data Package metadata properties in the datapackage.json
    And the CKAN Resource metadata properties should be mapped to the Tabular Data Resource metadata properties in the datapackage.json
    And the CKAN Resource Table Schema properties should be mapped to the Tabular Data Resource metadata properties in the datapackage.json
    And the CKAN Resource CSV Dialect properties should be mapped to the Tabular Data Resource metadata properties in the datapackage.json
    And CKAN Resources that are not tabular data should not be included in the datapackage.json
    And CKAN metadata that is not specified in the Frictionless Data specification should not be included as metadata properties in the datapackage.json
