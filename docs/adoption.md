# Adopting an integrated Data Curator - CKAN solution

This describes what is required to create an environment where Data Curator and CKAN can work together to describe, validate and share usable open data.

This document will be updated throughout the project as new requirements emerge. 

## Data Curator

- [Data Curator](https://github.com/ODIQueensland/data-curator) v1.2.0 or higher must be installed ([download](https://github.com/ODIQueensland/data-curator/releases))

## CKAN 

To support uploading and downloading data packages: 
- [CKAN](https://ckan.org) v2.4 or higher must be installed ([download](https://github.com/ckan/ckan/releases))
- [CKANext-datapackager](https://github.com/frictionlessdata/ckanext-datapackager) extension (version to be determined) must be installed ([download](https://github.com/frictionlessdata/ckanext-datapackager/releases))

### Research

You may need to support moving data into the data store: 
- [DataPusher](http://docs.ckan.org/projects/datapusher/en/latest/) or Express Loader](https://github.com/davidread/ckanext-xloader)
- see https://github.com/frictionlessdata/ckanext-datapackager/issues/44#issuecomment-364410206

Add a field for table schema to CKAN 
- define a schema-field as a json-object using https://github.com/ckan/ckanext-scheming
- see [ckanext-datapackager #61](https://github.com/frictionlessdata/ckanext-datapackager/issues/61)
