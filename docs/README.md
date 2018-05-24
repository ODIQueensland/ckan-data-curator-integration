# Using Data Curator to publish data packages to CKAN

## Purpose

These instructions are for a data publisher using:
- [Data Curator](http://data-curator.io) to create and update tabular data packages
- [CKAN](https://ckan.org/) and the [CKAN Data Packager extension](https://github.com/frictionlessdata/ckanext-datapackager) to publish and share data packages
- [CKAN Validation extension](https://github.com/frictionlessdata/ckanext-validation), when released, to validate data that has changed in CKAN. If the extension isn't available, then data may need to be validated using Data Curator before uploading to CKAN.

These instructions are being written to inform the development of:

- Data Curator to inter-operate with the CKAN Data Packager extension
- CKAN Data Packager extension as it currently doesn't fully implement the [Frictionless Data specification](https://frictionlessdata.io/specs/) and [doesn't fully support](https://github.com/frictionlessdata/ckanext-datapackager/issues/63) the publishing scenarios identified below
- [CKAN Data Package Tools](https://github.com/frictionlessdata/ckan-datapackage-tools/) which is used by the CKAN Data Packager extension.

## Assumptions and constraints

Assumptions and constraints that influence the instructions for each scenario:

- Avoid the user editing the `datapackage.json` or `tableschema.json` files directly
- Assume the data publisher is using [data package versioning](https://frictionlessdata.io/specs/patterns/#data-package-version)
- Assume the CKAN Data Packager [minimum viable product](https://github.com/frictionlessdata/ckanext-datapackager/issues/63) is implemented, including:
  - a `tableschema.json` file stored or referenced for each data resource
  - everything in a `datapackage.zip` file uploaded to CKAN is stored in some way and can be downloaded from CKAN as either a:
    -  `datapackage.zip` file 
    -  `datapackage.json` (that doesn't include the `README.md`) 
-  The instructions in the scenarios below may change depending on how the CKAN Data Packager and Data Curator are implemented.

## Prior work

See: https://github.com/ckan/ideas-and-roadmap/blob/466418227cf4fca9bcc3b5e65d23b3ef117986b5/specs/datapackages/README.md#resource-schemas

## Scenarios

There are a number of different scenarios for creating or updating data packages and publishing or accessing them on CKAN.

Data publishers can:

1. Create a data package using Data Curator
1. Publish a data package to CKAN for the first time 
1. Change data in a published data package
1. Validate data using Data Curator 
1. Add a data resource to a published data package
1. Package an existing CKAN dataset and resources
1. Publish a major change to a published data package

and after the data package is published, data consumers can:

8. Download the data package as `datapackage.json` 
1. Download the data package as `datapackage.zip` 

## 1. Create a data package using Data Curator

To create a data package:

1. Using Data Curator, open or create data 
2. Add a header row if one doesn't exist
1. Check Header Row in Tools menu
1. Guess column properties to set the `name`, `type` and `format` values
1. Set column properties to describe the data in more detail
1. Validate the data (fix data errors or explain them in the provenance information)
1. Set table properties
1. Set provenance information
1. Set package properties 
1. Export the data package to a .zip file, containing:
   - `datapackage.json` generated from the column, table and package properties
   - `README.md` generated from the provenance information
   - `/ data` directory
     - one or more separated value data files, one for each data tab saved in Data Curator 

## 2. Publish a data package to CKAN for the first time
To publish a data package to CKAN and create a dataset and related resources:

1. Using Data Curator, [create a data package](#1-create-a-data-package-using-data-curator) with [version number](https://frictionlessdata.io/specs/patterns/#data-package-version) 1.0.0 and export it to a .zip file 
1. Login to CKAN 
1. Go to the Data page and select [Import Data Package](https://github.com/frictionlessdata/ckanext-datapackager#importing) and upload the .zip file. The dataset and resources are now published in CKAN as:
   - dataset metadata
   - resource metadata entries
   - resources for:
     - data file(s)
     - associated `tableschema.json` file(s)
     - a `README.md` file
1. Review the new dataset:
   - Add any extra metadata to help users discover or understand the data, e.g.
     * Dataset: Tags
     * Resource: Next Review Date, ~~File size~~ 
   - Make the dataset visible to the public

#### Thoughts

Consider adding support for the following properties in Data Curator:

- [`keyword`](https://frictionlessdata.io/specs/data-package/#keywords) tags ([currently supported](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckandatapackagetools/converter.py#L99) by CKAN Data Package Tools.)
  - This could result in a mess of tags as there is no lookup in Data Curator to suggest reusing existing tags
  - If not implemented, then Data Curator will lose the tag information for data packages downloaded from CKAN. This could be important for scenarios [6](#6-package-an-existing-ckan-dataset-and-resources) and [7](#7-publish-a-major-change-to-a-published-data-package) when the data package is uploaded to CKAN, requiring the tags to be reapplied
- file size [`bytes`](https://github.com/ODIQueensland/data-curator/issues/370) ([planned](https://github.com/ODIQueensland/data-curator/issues/370)) (not currently supported by CKAN Data Package Tools.) 
  - Alternatively, why isn't file size `bytes` calculated by CKAN?


## 3. Change data in a published data package
Many data resources are published as complete snapshots of the data, e.g. at the end of a month, that month's data is appended to the end of the existing data.

To correct or add data to an existing data resource in CKAN:
1. Make the changes to the data and save it to a file. If the CKAN Validation extension isn't installed, [validate the data using Data Curator](#4-validate-data-using-data-curator).
1. Using CKAN, [change the data resource](http://docs.ckan.org/en/latest/user-guide.html#adding-deleting-and-editing-resources) by uploading the file. If the CKAN Validation extension is installed, the data will be validated against the associated `tableschema.json` file
1. Update CKAN metadata, e.g.
   * Dataset: Version (increment the minor version number)
   * Resource: Next Review Date, File size

## 4. Validate data using Data Curator

If the CKAN Validation extension isn't installed, before you add or change data in a published data package you may want to validate the data using Data Curator. This will provide two files to be uploaded to CKAN:

- a validated separated value file 
- if needed, an updated `README.md` explaining any errors

To validate the data using Data Curator:

1. [Download the `datapackage.zip`](#9-download-the-data-package-as-datapackagezip) from CKAN
1. Open the `datapackage.zip` file in Data Curator
1. Change the data as required
1. Validate the data (fix data or explain errors in provenance)
   - If the data is valid, save it to a separated value file to be uploaded to CKAN
   - If the data is invalid and you can correct it, do so and save it to a separated value file to be uploaded to CKAN
   - If the data is invalid and you have decided to publish the data with errors:
     -  save the data to a separated value file to be uploaded to CKAN
     -  update the provenance information explaining the errors.`README.md`
     -  export the data package to a .zip file
     -  unzip the .zip file to access the `README.md` to be uploaded to CKAN

#### Thoughts

If Data Curator could [open a `datapackage.json` file](https://github.com/ODIQueensland/data-curator/issues/284) that references the data and table schemas by URL, then the requirement to provide a `datapackage.zip` download could be deferred. 

The instructions above would still be valid apart from an additional step if you decide to publish the data with errors. As the original `README.md` is not downloaded, it would need to be downloaded and its contents pasted into the provenance information before it could be updated explaining the errors.

## 5. Add a new data resource to a published data package

Sometimes data is added in increments to a dataset e.g. at the end of a year, that year’s data is add as a new data resource to other yearly data resources.

To add a new data resource to a published data package:

1. Acquire the new data and save it to a separated value file. 
1. If the CKAN Validation extension isn't installed, [validate the data using Data Curator](#4-validate-data-using-data-curator)
1. Using CKAN, [add the new data resource](http://docs.ckan.org/en/latest/user-guide.html#adding-deleting-and-editing-resources):
   - upload the data file
   - complete the resource metadata
   - If the CKAN Validation extension is installed, reference the relevant `tableschema.json` resource
1. Update CKAN metadata, e.g.
   * Dataset: Version (increment the minor version number)
   * Resource: Next Review Date, File size

## 6. Package an existing CKAN dataset and resources

1. Using CKAN, download the existing data resource files
2. Using Data Curator, open the data resource files
3. Use the CKAN dataset and resource metadata and other available information to [create a data package](#1-create-a-data-package-using-data-curator) 
4. Explain the changes in the provenance information
4. Increment the data package major version number
3. Export the data package to a .zip file.


There is no way to upload the datapackage .zip file and apply it to the existing CKAN dataset. You can either:

- [Publish the data package to CKAN](#2-publish-a-data-package-to-ckan-for-the-first-time) as a new data set
- Unzip the data package .zip file and manually upload components and update metadata in the existing CKAN entry.

## 7. Publish a major change to a published data package

A major change to a data package is when you make changes that are incompatible with prior versions, e.g.
* Change the table schema
* Change field or data package names or data package identifiers
* Add, remove or re-order fields

An example could be adding a reference table as a new dataset and creating a foreign key relationship between it and the existing data.

To publish a major change to a published data package:

1. Using CKAN, download `datapackage.zip`
1. Using Data Curator, open the `datapackage.zip` and make the changes
1. Validate the data
1. Explain the changes in the provenance information
1. Increment the data package major version number
1. Export the data package to a .zip file.


There is no way to upload the datapackage .zip file and apply it to the existing CKAN dataset. You can either:

- [Publish a data package to CKAN](#2-publish-a-data-package-to-ckan-for-the-first-time) as a new data set with an explanation in the provenance information
- Unzip the data package .zip file and manually upload components to the existing CKAN entry.

## 8. Download the data package as datapackage.json

To download a `datapackage.json` file:

1. Using CKAN, go to the dataset page and select Download Data Package. 
   
## 9. Download the data package as datapackage.zip

To download a `datapackage.zip`:

1. Using CKAN, go to the dataset page
2. *to be determined... (add a new button?)*

---

# Implementation approach

Some new properties need to be included to support tabular data packages.

 ## 1. Create valid data package properties

Create valid data package properties for use in [create.py](https://github.com/frictionlessdata/ckanext-datapackager/blob/master/ckanext/datapackager/logic/action/create.py). In [converter.py](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py#L86) convert the following properties from a data package to a CKAN dataset.

1. `profile` mandatory for tabular data packages (potentially later in 6.)
1. `licenses` ([#62](https://github.com/frictionlessdata/ckanext-datapackager/issues/62))
3. `contributors` - first author ([#59](https://github.com/frictionlessdata/ckanext-datapackager/issues/59)) maps to `author` in CKAN 
4. `contributors` - first maintainer ([#59](https://github.com/frictionlessdata/ckanext-datapackager/issues/59)) maps to `maintainer` in CKAN 

[See notes](#converting-datasets) below for what metadata is currently lost when converting between CKAN and data packages

## 2. Create valid resource properties 
Create valid data resource properties for use in [create.py](https://github.com/frictionlessdata/ckanext-datapackager/blob/master/ckanext/datapackager/logic/action/create.py). In [converter.py](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py#L116), convert the following properties from the data resources to CKAN resources.

1. `schema` mandatory for tabular data resources
2. `profile` mandatory for tabular data resources
3. `dialect` mandatory for tabular data resources, if it differs from specification defaults
4. `encoding` mandatory for tabular data resources, if it differs from specification default

[See notes](#Converting-resources) below for what metadata is currently lost when converting between data resources and CKAN

## 3. Create a dataset and resources in CKAN

In [create.py](https://github.com/frictionlessdata/ckanext-datapackager/blob/master/ckanext/datapackager/logic/action/create.py):

1. Store a `schema` property for each data resource. This would be a `tableschema.json` file for a Tabular Data Resource ([#61](https://github.com/frictionlessdata/ckanext-datapackager/issues/61)) 
2. Associate the schema with a data resource. 
   - Tabular Data Resources *must* have a schema that follows the [Table Schema](https://frictionlessdata.io/specs/table-schema/) specification
   - The association is needed between the data and the table schema to generate the `datapackage.json` and support the CKAN Validation extension
3. If needed, store the `dialect` for each data resource.
4. If needed, store the `encoding` for each data resource.

See: 
- CKAN Validation [Overview](https://github.com/frictionlessdata/ckanext-validation/issues/1) and issue [#9]( https://github.com/frictionlessdata/ckanext-validation/issues/9)

## 4 Convert the CKAN dataset to a data package

Convert the CKAN dataset to a data package using [convertor.py](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py) `dataset_to_datapackage`

## 5. Convert the CKAN resources to data resources

Convert the CKAN resources to data resources using [convertor.py](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py) `_convert_to_datapackage_resource`


## 6. Generate `datapackage.json` for download

Generate a minimal, valid `datapackage.json` for download 
- Add the `profile` to the data package 
- For each resource add the associated:
  - `schema` 
    - use `"schema": "URL"` to point to the schema in CKAN ([#49](https://github.com/frictionlessdata/ckanext-datapackager/issues/49)) ([noting this discussion](https://github.com/frictionlessdata/specs/pull/555#issuecomment-353057449)), or 
    - embed the tableschema.json within the data package as an object.
  - `profile`, `dialect` and `encoding`

`README.md` won't be included

## 7 Store `README.md`

Store `README.md` ([#60](https://github.com/frictionlessdata/ckanext-datapackager/issues/60)) using [create.py](https://github.com/frictionlessdata/ckanext-datapackager/blob/master/ckanext/datapackager/logic/action/create.py) 
## 8. Generate `datapackage.zip` for download

Generate a full `datapackage.zip` for download ([#52](https://github.com/frictionlessdata/ckanext-datapackager/issues/52)). 

This should match the `datapackage.zip` used to upload the data package to CKAN (less any properties not yet implemented e.g. `image`).

## 9. Store data resources in CKAN Data Store 

Store data resources in the CKAN Data Store ([#44](https://github.com/frictionlessdata/ckanext-datapackager/issues/44))

---

# Notes

## Converting datasets
### Converting a data package to a CKAN dataset

The following properties are converted by [CKAN Data Package Tools](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py#L86) and the CKAN Data Packager extension (ignoring the [issues mentioned above](#implementation-priorities))

- `name`
- `title`
- `description`
- `version`
- `licenses` (CKAN has a single value for a license but a data package supports an array of licenses)
- `sources` 
- `contributor` (author role) 
- `keywords`

Other properties in the data package are converted to CKAN "extras" properties

Properties in the specification that are not directly converted:

- **`profile`** (e.g. "tabular-data-package")
- `id`
- `homepage`
- `image`
- `created`

In the [CKAN Data Package extension](https://github.com/frictionlessdata/ckanext-datapackager/blob/master/ckanext/datapackager/logic/action/create.py#L18) `name` is limited to 2-100 characters. Consider adding this validation to Data Curator ([planned](https://github.com/ODIQueensland/data-curator/issues/385)).

### Converting a CKAN dataset to a data package

The following properties are converted by [CKAN Data Package Tools](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py#L44) and the CKAN Data Packager extension (ignoring the [issues mentioned above](#implementation-priorities))

- `name`
- `title`
- `description`
- `homepage`
- `version`
- `licenses` 
- `sources` 
- `contributor` (author role) 
- `keywords`

Other properties in CKAN are parsed into "extras" properties

Properties in the specification that are not directly converted:

- `id`
- `profile`
- `image`
- `created`

## Converting resources

### Converting a data resource in a data package to a CKAN resource

The following properties are converted by [CKAN Data Package Tools](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py#L116) and the CKAN Data Packager extension (ignoring the [issues mentioned above](#implementation-priorities))

- `path` or `data`
- `name`
- `title`
- `description`
- `format` (e.g. "csv")
- `hash`

Properties in the specification that are not directly converted:

- **`profile`** (e.g. "tabular-data-resource")
- **`schema`** ([Table Schema](https://frictionlessdata.io/specs/table-schema/) for a Tabular Data Resource or another schema for other data resource types)
- **`dialect`** ([CSV Dialect](https://frictionlessdata.io/specs/csv-dialect/) for a [Tabular Data Resource](https://frictionlessdata.io/specs/tabular-data-resource/). Defaults `"line terminator": "\r\n"`, `"delimiter": ","` )
- **`encoding`** (e.g. default "UTF-8")
- `mediatype` (e.g. "text/csv")
- `bytes`
- `sources`
- `licenses` (CKAN doesn't store licenses at the resource level, they inherit from the dataset)

*Would it help if a CKAN Schema was defined to support all data package metadata?*

### Converting a CKAN resource to a data resource in a data package

The following properties are converted by [CKAN Data Package Tools](https://github.com/frictionlessdata/ckan-datapackage-tools/blob/master/ckan_datapackage_tools/converter.py#L10) and the CKAN Data Packager extension (ignoring the [issues mentioned above](#implementation-priorities))

- `name`
- `path`
- `title`
- `description`
- `format` (e.g. "csv")
- `hash`
- "schema" assume this the [CKAN schema](http://docs.ckan.org/en/latest/extensions/adding-custom-fields.html?highlight=schema#ckan-schemas-and-validation) containing custom CKAN metadata properties (i.e. not a Table Schema)

Properties in the specification that are not directly converted:

- `profile` (e.g. "tabular-data-resource")
- `mediatype` (e.g. "text/csv")
- `encoding` (e.g. "UTF-8")
- `bytes`
- `sources`
- `licenses` (CKAN doesn't store licenses at the resource level, they inherit from the dataset)
- `schema` ([Table Schema](https://frictionlessdata.io/specs/table-schema/) for a Tabular Data Resource or another schema for other data resource types)
- `dialect` ([CSV Dialect](https://frictionlessdata.io/specs/csv-dialect/) for a [Tabular Data Resource](https://frictionlessdata.io/specs/tabular-data-resource/))
