# Metadata mapping

## CKAN to Frictionless Data

### CKAN Dataset to Data Package mapping

  | CKAN Dataset metadata property | Data Package metadata property | notes                        |
  | ------------------------------ | ------------------------------ | ---------------------------- |
  | name                           | name                           |                              |
  |                                | id                             |                              |
  | extras->licenses               | licenses                       |                              |
  | extras->sources                | sources                        |                              |
  | extras->contributors           | contributors                   |                              |
  | license_id                     | licenses array                 |                              |
  | extras->profile                | profile                        |                              |
  |                                | title                          |                              |
  | notes                          | description                    |                              |
  | ckan_url                       | homepage                       |                              |
  | not available                  | sources                        |                              |
  | author                         | contributors title             |                              |
  |                                | contributors role              | default value `author`       |
  | maintainer                     | contributors title             |                              |
  |                                | contributors role              | default value `maintainer`   |
  | tag names                      | keywords                       |                              |
  |                                | image                          |                              |
  |                                | created                        |                              |
  | other metadata                 | not available                  | store without visibility in DC |
  
### CKAN Resource to Data Resource mapping

  All resources added to data package (tbc?)

  | CKAN Resource metadata property | Data Resource metadata property | notes                                  |
  | ------------------------------- | ------------------------------- | -------------------------------------- |
  |                                 | path                            | the url the ckan resource is stored at |
  |                                 | name                            |                                        |
  | profile extra                   | profile                         | default value `data-resource`          |
  |                                 | title                           |                                        |
  | description                     | description                     |                                        |
  | format                          | format                          |                                        |
  | mimetype                        | mediatype                       |                                        |
  |                                 | encoding                        |                                        |
  |                                 | bytes                           |                                        |
  | hash                            | hash                            |                                        |
  | not available                   | sources                         |                                        |
  | not available                   | licenses name                   | license not stored at resource level   |
  | not available                   | licenses path                   |                                        |
  | not available                   | licenses title                  |                                        |

### CKAN Dataset to Tabular Data Package mapping

  Same as [CKAN Dataset to Data Package mapping](#ckan-dataset-to-data-package-mapping), except:
  
  | CKAN Dataset metadata property | Tabular Data Package metadata property | notes                                |
  | ------------------------------ | -------------------------------------- | ------------------------------------ |
  |                                | profile                                | default value `tabular-data-package` |

### CKAN Resource to Tabular Data Resource mapping

  Same as [CKAN Resource to Data Resource mapping](#ckan-resource-to-data-resource-mapping), except:

  Only tabular data resources (i.e. .csv or .tsv with a schema) added to data package.

  | CKAN Resource metadata property | Tabular Data Resource metadata property | notes                                  |
  | ------------------------------- | --------------------------------------- | -------------------------------------- |
  |                                 | profile                                 | default value `tabular-data-resource`  |
  |                                 | format                                  | `csv` or `tsv`                         |
  | mimetype                        | mediatype                               | `text/csv`                             |
  |                                 | encoding                                | default `UTF-8` ?                      |
  | schema extra                    | schema                                  |                                        |
  | dialect extra                   | dialect                                 |                                        |

## Frictionless Data to CKAN 

### Data Package to CKAN Dataset mapping

  | Data Package metadata property | CKAN Dataset metadata property | notes                                        |
  | ------------------------------ | ------------------------------ | -------------------------------------------- |
  | name                           |                                |                                              |
  | id                             |                                |                                              |
  | licenses                       | extras->licenses               | see https://github.com/frictionlessdata/ckanext-datapackager/issues/62 |
  | licenses name                  | license_id                     |                                              |
  | licenses path                  | license_url                    |                                              |
  | licenses title                 | license_title                  |                                              |
  | profile                        | extra                          |  default value `data-package`                |
  | title                          |                                |                                              |
  | description                    |                                |                                              |
  | homepage                       |                                |                                              |
  | sources                        | extras -> sources              |  TBD: how is ckan's source url mapped?       |
  | contributors                   | extras -> contributors         | Store the whole contributors object as extra |
  | contributors title             | author                         |                                              |
  | contributors role `author`     |                                | First contributor with role author           |
  | contributors title             | maintainer                     |                                              |
  | contributors role `maintainer` |                                | First contributor with role maintainer       |
  | keywords                       |                                |                                              |
  | image                          |                                |                                              |
  | created                        |                                |                                              |
                            
### Data Resource to CKAN Resource mapping

  | Data Resource metadata property | CKAN Resource metadata property | notes                                            |
  | ------------------------------- | ------------------------------- | ------------------------------------------------ |
  | path                            |                                 |             |
  | data                            |                                 | uploading of in-line data not supported          |
  | name                            |                                 |                                                  |
  | profile                         | profile extra                   | default value `data-resource`                    |
  | title                           |                                 |                                                  |
  | description                     |                                 |                                                  |
  | format                          |                                 |                                                  |
  | mediatype                       | mimetype                        |                                                  |
  | encoding                        |                                 |                                                  |
  | bytes                           |                                 |                                                  |
  | hash                            |                                 |                                                  |
  | sources array                   | sources extra                   |                                                  |
  | sources title                   |                                 |                                                  |
  | sources path                    |                                 |                                                  |
  | sources email                   |                                 |                                                  |
  | licenses array                  | licenses extra                  | license at resource level not supported          |
  | licenses name                   | not available                   |                                                  |
  | licenses path                   | not available                   |                                                  |
  | licenses title                  | not available                   |                                                  |
  | schema                          |                                 | uploading of schema at url or path not supported |

### Tabular Data Package to CKAN Dataset  mapping

  Same as [Data Package to CKAN Dataset mapping](#data-package-to-ckan-dataset-mapping), except:
  
  | Tabular Data Package metadata property | CKAN Dataset metadata property | notes                                |
  | -------------------------------------- | ------------------------------ | ------------------------------------ |
  | profile                                | profile extra                  | default value `tabular-data-package` |

### Tabular Data Resource mapping to CKAN Resource 

  [Same as Data Resource to CKAN Resource mapping](#data-resource-to-ckan-resource-mapping), except:

  | Tabular Data Resource metadata property | CKAN Resource metadata property | notes                                  |
  | --------------------------------------- | ------------------------------- | -------------------------------------- |
  | profile                                 | profile extra                   | default value `tabular-data-resource`  |
  | format                                  |                                 | `csv` or `tsv`                         |
  | mediatype                               | mimetype                        | `text/csv`                             |
  | encoding                                |                                 | default `UTF-8` ?                      |
  | schema                                  |                                 |                                        |
  | dialect                                 |                                 |                                        |
