# Metadata mapping

Data Package mapping
--------------------

  | CKAN Dataset metadata property | Data Package metadata property | notes                        |
  | ------------------------------ | ------------------------------ | ---------------------------- |
  |                                | name                           |                              |
  |                                | id                             |                              |
  |                                | licenses name                  |                              |
  |                                | licenses path                  |                              |
  |                                | licenses title                 |                              |
  |                                | profile                        |                              |
  |                                | title                          | default value `data-package` |
  |                                | description                    |                              |
  |                                | homepage                       |                              |
  | not available                  | sources                        |                              |
  | author                         | contributors title             |                              |
  | author                         | contributors role              | default value `author`       |
  | maintainer                     | contributors title             |                              |
  | maintainer                     | contributors role              | default value `maintainer`   |
  |                                | keywords                       |                              |
  |                                | image                          |                              |
  |                                | created                        |                              |

Data Resource mapping
---------------------

  | CKAN Resource metadata property | Data Resource metadata property | notes                                  |
  | ------------------------------- | ------------------------------- | -------------------------------------- |
  |                                 | path                            | the url the ckan resource is stored at |
  |                                 | name                            |                                        |
  |                                 | profile                         | default value `data-resource`          |
  |                                 | title                           |                                        |
  |                                 | description                     |                                        |
  |                                 | format                          |                                        |
  |                                 | mediatype                       |                                        |
  |                                 | encoding                        |                                        |
  |                                 | bytes                           |                                        |
  |                                 | hash                            |                                        |
  | not available                   | sources                         |                                        |
  | not available                   | licenses name                   |                                        |
  | not available                   | licenses path                   |                                        |
  | not available                   | licenses title                  |                                        |


Tabular Data Package mapping
----------------------------

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


Tabular Data Resource mapping
-----------------------------
  
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
