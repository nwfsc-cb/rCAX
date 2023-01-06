# Using CAX HLI data
IMPORTANT! BE SURE TO CAREFULLY READ AND UNDERSTAND THE TERMS AND CONDITIONS SET FORTH IN THIS END-USER LICENSE AGREEMENT. YOU WILL BE ASKED TO REVIEW AND EITHER ACCEPT OR NOT ACCEPT THE TERMS OF THE EULA. YOU ARE NOT AUTHORIZED TO ACCESS OR USE THE DATA IN THIS DATABASE UNLESS AND UNTIL YOU ACCEPT THE TERMS OF THIS EULA.

In order to access, share, or use these datasets you agree that:

1. You acknowledge that data in the StreamNet database are dynamic and may be updated at any time. Notification of data updates will be posted on the StreamNet website.

2. Data contributors, StreamNet, PSMFC, and Bonneville Power Administration accept no responsibility or liability for the accuracy of these data or for the uses and/or interpretations to which these data may be put.

3. Data contributors have uploaded links to the metadata and associated publications that may discuss the limitations and proper use of the data. It is your responsibility to understand and comply with these restrictions if you use the data.

4. We may take measures to restrict access to these data if violations occur, to ensure violations are not repeated.

5. You will be careful to properly credit individuals and agencies when using data, and will follow reputable standards for the use and interpretation of scientific information.

6. You assume responsibility to determine the usability of the data for your purposes.

7. Before publication, you will contact the appropriate data contributors and to maintain a record of contact prior to significant use of data in any publication in order to:

    a. obtain verification, data use limitations and context for data through metadata records.

    b. secure appropriate permissions prior to submission for publication by sending requests to data owners and cc’ing the data publishers or peer review team.

    c. arrange appropriate acknowledgements, citations and/or authorships.

8. Failure to comply with the requirements may result in denial of access to data files in future requests. (Data owners have 90 days to respond to data publication reviews). You will be notified of any accusations of failure to comply and have opportunities to defend your action to ensure continued access.

9. StreamNet will endeavor to design and maintain access to CA data for only those that agree to comply with this EULA. However, PSMFC – StreamNet does not accept any liability for this DSA, or for any compliance failure, or any responsibility for enforcement of this agreement or for the use or misuse of any data accessed through this database.

## About the data

This data is provided to the CAX by agencies and tribes in order to increase collaboration opportunities and consistency in analyses. StreamNet and CAP host and help develop the Data Exchange Standards, which includes some metadata requirements for successful submission, but responsibility and rights are retained by the data providers. Data accessibility or versioning access requests should be directed to project@streamnet.org and questions about the datasets or appropriate use should be directed to the data provider using the information provided in columns ContactAgency, ContactPersonFirst, contactpersonlast, contactphone, and contactemail for each data row - these will generally be consistent per dataset. 

## How data quality is indicated

The CAP has endeavored to provide sufficient metadata for basic usability, protocol and methods links to MonitoringRsources.org or reports, and contact information specific to the dataset. Data submissions are not available to the public through CAX until the submitter has completed their QA/QC and set the record column 'publish' to 'yes'. Additionally, there is a 'DataStatus' column with options "Draft", "Reviewed", or "Final". These should be considered the best available data at the time of submission for the Contact Agency. CAX was developed to be dynamic with versioning, so data should not be expected to be kept static. If a previous version of the dataset is needed, contact project@streamnet.org with the information in 'DataSetVersion'.
Data submitters associate their data with established populations or develop populations or superpopulations to best describe their data. The 'PopFit' column has three options, "portion", "same", and "multiple". The submitter may provide multiple indicator calculations based on different expansion factors or methods, such as portion of a population, the whole population, or superpopulations that cannot be parsed through the data available, or different data streams such as PIT tag, Genetic Stock Identification, or spawning ground surveys. They indicate the dataset they consider to be the best estimate of the available data for the HLI in the column 'BestValue'. 
Null records are included to provide information and peripheral information when HLI estimates cannot be calculated. See column 'NullRecord' and 'Comments'.
For data within the Natural Origin Spawner Abundance (NOSA) there is a column for 'EstimateType' that was developed when it became clear that some data was not available at the spawner abundance level, but instead at the escapement level. One of the two should be indicated and any details about prespawn mortality should be included in the methods/protocol documentation available. 
Many of the fields have Alpha, Upper, and Lower limits included when the data is available.
ESA listed populations are used for the datasets developed for NOAA Fisheries analysis. CAX data is initially filtered for ESA listed population data by NMFS_POPID. Superpopulations of listed populations do not have an associated NMFS_POPID and will have to be filtered separately. WAIT DID WE DO THIS???

## Datasets and comparability across time, populations, and ESU/DPSs
Method numbers
Data sets


## Where and how to find the citation information

The metadata columns from the downloaded HLI data provide the necessary information to produce a citation. The columns that you need are described below.

**Recommended dataset citation format:**

Dataset Name (date range). Type of data. Data provider and contributor/s. Protocol and methods available at website. Data accessed by consumer name version or date accessed from website. 

**Example:**

Salmon, Chinook (Snake River spring/summer-run ESU) East Fork South Fork Salmon River - summer (1987-2018). Natural Origin Spawner Abundance. Nez Perce Tribe and Idaho Department of Fish and Game. Protocols and methods available at https://www.monitoringresources.org/Document/Protocol/Details/2246. Accessed from www.cax.streamnet.org vers May 26 2020 10:00PM by Mari Williams, NOAAF NWFSC/PSMFC.

### Columns with the metadata

* Dataset name:   `esapopname` column.
* Date range: For NOSA tables, the year is in the `spawningyear` column. min and max of this column gives the data range.
* Type of data: The HLI name is generally what the data type is. However, for NOSA (Natural origin spawner abundance) tables, you will need to look at the notes for each data row as data are escapement (natural and non-natural origin).
* Data provider: the `contactagency` and `otherdatasources` columns.
* Protocol and methods: `protmethurl` column.
* Data accessed by: Your name.
* Data version: `datasetversion` column name.
