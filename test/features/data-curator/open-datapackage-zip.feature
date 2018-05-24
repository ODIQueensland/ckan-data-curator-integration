@draft

Feature: Open a Data Package Zip
  As a User  
  I want to open a tabular data package  
  So that I can view or edit it edit using Data Curator  

  RULES
  =====

  - A [Tabular data packages](https://frictionlessdata.io/specs/tabular-data-package/) stored in a `datapackage.zip` contains:
    - [tabular data resources](https://frictionlessdata.io/specs/tabular-data-resource/) (e.g. one or more `.csv` files located via a local path or url reference)
      - JSON Tabular Data is not supported
    - a datapackage.json file (that describes the data package and contains a [table schema](http://frictionlessdata.io/specs/table-schema/) and may contain a [CSV dialect](http://frictionlessdata.io/specs/csv-dialect/) for each resource)
      - the `schema` and `dialect` for each resource may be in-line or referenced via a url 
    - a `README.md` file or a `README.txt` file (containing the provenance information)

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
      - data
      - hash
      - bytes 
    - table schema:
      - bareNumber
      - groupChar
      - decimalChar
      - trueValues
      - falseValues
    - [pattern properties](https://frictionlessdata.io/specs/patterns) except `package` in the [Table Schema: Foreign Keys to Data Packages pattern](https://frictionlessdata.io/specs/patterns/#table-schema:-foreign-keys-to-data-packages)
  
  Scenario: Open a valid datapackage.zip from a URL
    Given Data Curator is open
    When "Open Data Package" is invoked
    And the datapackage.zip file at a URL is selected
    Then the properties from datapackage.json file should be displayed in the property panels
    And the data at the `path` of each data resource should open in a new data tab to the right of any other open data tabs
    And each Data tab should be named using the data resource `name`
    And each data resource header row should be set using the `dialect`
    And the README.md should be displayed in the provenance information panel  

  Scenario: Open a datapackage.zip with properties unsupported by Data Curator from a URL
    Given Data Curator is open
    When "Open Data Package" is invoked
    And the datapackage.zip file at a URL is specified
    Then the properties from datapackage.json should be displayed in the property panels
    And the data at the `path` of each data resource should open in a new data tab to the right of any other open data tabs
    And each Data tab should be named using the data resource `name`
    And each data resource header row should be set using the `dialect`
    And the README.md should be displayed in the provenance information panel  
    And a warning should be displayed stating that some unsupported properties were not imported  

  Scenario: Open a invalid datapackage.zip from a URL  
    Given Data Curator is open
    When "Open Data Package" is invoked
    And an invalid datapackage.zip file at a URL is selected
    Then an error message should be displayed 
