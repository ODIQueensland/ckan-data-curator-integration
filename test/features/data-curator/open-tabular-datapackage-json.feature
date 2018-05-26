@draft @v0.8.0

Feature: Open a Tabular Data Package JSON in Data Curator using a CKAN URL
  As a User  
  I want to open a Tabular Data Package from a CKAN URL  
  So that I can view or edit it using Data Curator  

  RULES
  =====

  - The [Tabular Data Package](https://frictionlessdata.io/specs/tabular-data-package/) follows v1.0 of the specification
  - The datapackage.json file contains:
    - describes the tabular data package 
    - references the [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) via a url 
    - contains the `schema` and `dialect` for each tabular data resource, either inline or referenced via a url
    - doesn't include or reference a README.md or README.txt  
  
  LATER
  =====

  - Open a data package that references a Table Schema at a URL 
  - Open a data package that references a CSV Dialect at a URL
  
  QUESTIONS
  =========
  
  - What properties could be lost on opening a valid tabular data package?
    - data package:
      - homepage
      - image
      - keywords
      - created
    - data resource:
      - hash
      - bytes 
    - [pattern properties](https://frictionlessdata.io/specs/patterns) except `package` in the [Table Schema: Foreign Keys to Data Packages pattern](https://frictionlessdata.io/specs/patterns/#table-schema:-foreign-keys-to-data-packages)
  
  NOTES
  =====
  
  - This is a specialisation of the Data Curator [open-datapackage.feature](https://github.com/ODIQueensland/data-curator/blob/develop/test/features/file/open-datapackage.feature)
  - when this draft is approved, it should be moved/copied to the Data Curator repository

  Scenario: Open a valid datapackage.json from a URL
    Given Data Curator is open
    When "Open Data Package" is invoked
    And a valid datapackage.json file at a URL is selected
    Then the properties from datapackage.json should be displayed in the property panels
    And the data at the `path` of each data resource should open in a new data tab to the right of any other open data tabs
    And each Data tab should be named using the data resource `name`
    And each data resource header row should be set using the `dialect`  
  
  Scenario: Open a datapackage.json with properties unsupported by Data Curator from a URL
    Given Data Curator is open
    When "Open Data Package" is invoked
    And the datapackage.json file at the URL is selected
    Then the properties from datapackage.json should be displayed in the property panels
    And the data at the `path` of each data resource should open in a new data tab to the right of any other open data tabs
    And each Data tab should be named using the data resource `name`
    And each data resource header row should be set using the `dialect`
    And a warning should be displayed stating that some unsupported properties were not imported  
    
  Scenario: Open an invalid datapackage.json from a URL
    Given Data Curator is open
    When "Open Data Package" is invoked
    And an invalid tabular datapackage.json file at a URL is selected
    Then an error message should be displayed 
    
  Scenario: datapackage.json URL is invalid
    Given Data Curator is open
    When "Open Data Package" is invoked
    And an invalid URL is provided
    Then an error message should be displayed 
