# Adopting an integrated Data Curator - CKAN solution

This describes what is required to create an environment where Data Curator and CKAN can work together to describe, validate and share usable open data.

This document will be updated throughout the project as new requirements emerge. 

## Data Curator

- [Data Curator](https://github.com/ODIQueensland/data-curator) v1.2.0 or higher must be installed ([download](https://github.com/ODIQueensland/data-curator/releases))

## CKAN 

To support uploading and downloading data packages: 
- [CKAN](https://ckan.org) v2.4 or higher must be installed ([download](https://github.com/ckan/ckan/releases))
- [CKANext-datapackager](https://github.com/frictionlessdata/ckanext-datapackager) extension (latest) must be installed ([download](https://github.com/frictionlessdata/ckanext-datapackager/releases))
- [CKANext-datapackage-tools](https://github.com/frictionlessdata/ckan-datapackage-tools) extension (latest), is a dependency of CKANext-datapackager. These 2 libraries are the main libraries will be working with, and thus must be the latest versions available.

### Research

You may need to support moving data into the data store: 
- [DataPusher](http://docs.ckan.org/projects/datapusher/en/latest/) or Express Loader](https://github.com/davidread/ckanext-xloader)
- see https://github.com/frictionlessdata/ckanext-datapackager/issues/44#issuecomment-364410206
- Update: 2.7 versions of docker ckan don't use the datapusher container (will monitor if/when this requirement comes up)

Add a field for table schema to CKAN 
- define a schema-field as a json-object using https://github.com/ckan/ckanext-scheming
- see [ckanext-datapackager #61](https://github.com/frictionlessdata/ckanext-datapackager/issues/61)
