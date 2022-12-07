#' Get CAX HLI data Terms of Use
#'
#' @export
#' @return Text of the terms of us
#' @examples \dontrun{
#' rcax_termsofuse()
#' }
#' 
rcax_termsofuse <- function() {
str <-  sprintf('IMPORTANT!  BE SURE TO CAREFULLY READ AND UNDERSTAND THE TERMS AND CONDITIONS SET FORTH IN THIS END-USER LICENSE AGREEMENT (EULA).  YOU ARE NOT AUTHORIZED TO ACCESS OR USE THE DATA IN THIS DATABASE UNLESS AND UNTIL YOU ACCEPT THE TERMS OF THIS EULA.

In order to access share or use these datasets you agree that:

1.	You acknowledge that data in the StreamNet database are dynamic and may be updated at any time.

2.	Data contributors StreamNet PSMFC and Bonneville Power Administration accept no responsibility or liability for the accuracy of these data or for the uses and/or interpretations to which these data may be put.

3.	Data contributors sometimes provide links to metadata and associated publications that may discuss the limitations and proper use of the data.  It is your responsibility to understand and comply with these restrictions if you use the data.

4.	We may take measures to restrict access to these data if violations occur to ensure violations are not repeated.

5.	You will be careful to properly credit individuals and agencies when using data and will follow reputable standards for the use and interpretation of scientific information.

6.	You assume responsibility to determine the usability of the data for your purposes.

7.	Before publication you will contact the appropriate data contributors and maintain a record of contact prior to significant use of data in any publication in order to:

a.	obtain verification data use limitations and context for data through metadata.

b.	secure appropriate permissions prior to submission for publication by sending requests to data owners and sending a copy to the data publishers or peer review team.

c.	arrange appropriate acknowledgements citations and/or authorships.

8.	Failure to comply with the requirements may result in denial of access to data files in future requests.  (Data owners have 90 days to respond to data publication reviews).  You will be notified of any accusations of failure to comply and have opportunities to defend your action to ensure continued access.

9.	StreamNet will endeavor to design and maintain access to data for only those who agree to comply with this EULA.  However PSMFC (StreamNet) does not accept any liability for this Data Sharing Agreement or for any compliance failure or any responsibility for enforcement of this agreement or for the use or misuse of any data accessed from this database.
 
')
cat(str)
invisible(str)
}
