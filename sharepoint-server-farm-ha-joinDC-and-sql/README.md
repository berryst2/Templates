# Create a High Availabilty SharePoint Farm with 4 SharePoint VMs to connect to existing AD and SQL Server using the Powershell DSC Extension

This template will connect to an existing SQL Server 2014 Always On Availability Group as well as to join an existing Active Directory Domain.

+	A Virtual Network
+	One Storage Account for one for SP VMs
+	Two external and one internal load balancers
+	A NAT Rule to allow RDP to one VM which can be used as a jumpbox, a load balancer rule for ILB for a SQL Listener, a load balancer rule for HTTP traffic on port 80 for SharePoint and a NAT rule for Sharepoint Central Admin access
+ 	Three public IP addresses, one for RDP access, one for the SharePoint site and one for SharePoint Central Admin.
+	Two SharePoint App Servers
+	Two SharePoint Web Servers
+	Two Availability Sets one for the SharePoint App Servers and one for the SharePoint Web Servers the SQL\Witness Availability Set is configured with three Update Domains and three Fault Domains to ensure that quorum can always be attained.

## Notes



+	Public Endpoints are created for the SharePoint site that this template creates and for the Central Admin site, however no permissions are given to any user for the new SharePoint site created, these will need to be added from the Central Admin site.

+ 	The images used to create this deployment are
	+	SharePoint - Latest SharePoint server 2013 trial image on Windows Server 2012 R2

+ 	The image configuration is defined in variables - details below - but the scripts that configure this deployment have only been tested with these versions and may not work on other images.

+ 	Once deployed access can be gained at the following addresses:

	+	**SharePoint Website** - http://parameter(dnsPrefix).parameter(location).cloudapp.azure.com
	+	**Central Admin Website** - http://parameter(spCentralAdminDNSPrefix).parameter(location).cloudapp.azure.com
	+	**RDP Jump Box** - mstsc -v parameter(rdpDNSPrefix).parameter(location).cloudapp.azure.com

## Known Issues

+ **This template has a lot of serial behaviour due to some issues between the platform agent and the DSC extension which cause problems when multiple VM and\or extension resources are deployed concurrently, this will be fixed in the future, as a result of this it can take a while to run (around 2 hours) it will take  longer if premium storage is not used**


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fberryst%2FTemplates%2Fmaster%2Fsharepoint-server-farm-ha-joinDC-and-sql%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

## Notable Variables

|Name|Description|
|:---|:---------------------|
|virtualNetworkName|Name of the Virtual Network|
|spwebVMName|The Prefix of the SharePoint Web Server VMs|
|spappVMName|The Prefix of the SharePoint App Server VMs|
|windowsImagePublisher|The name of the pulisher of the AD and Witness Image|
|windowsImageOffer|The Offer Name for the Image used by AD and Witness VMs|
|windowsImageSKU|The Image SKU for the AD and Witness Image|
|spImagePublisher|The name of the pulisher of the SharePoint Image|
|spImageOffer|The Offer Name for the Image used by SharePoint|
|spImageSKU|The Image SKU for the SharePoint Image|
|windowsDiskSize|The size of the VHD allocated for AD and Witness VMs Data Disk|
|spDiskSize|The size of the VHD allocated for the SP VMs Data Disk|
