Login-AzureRmAccount
$ResourceGroupName = "sandboxao"
$templateURI = "https://raw.githubusercontent.com/berryst/Templates/master/sql-server-2014-alwayson-existing-vnet-and-ad/azuredeploy.json"
$templateParameterURI = "https://raw.githubusercontent.com/berryst/Templates/master/sql-server-2014-alwayson-existing-vnet-and-ad/azuredeploy.parameters.json"
$RGLocation = "Australia Southeast"
#$ResourceGroup = Get-AzureRmResourceGroup -Name $ResourceGroupName
$ResourceGroup = New-AzureRmResourceGroup -Name $ResourceGroupName -Location $RGLocation
New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -Name "AODeployment" -TemplateUri $templateURI  -TemplateParameterUri $templateParameterURI

