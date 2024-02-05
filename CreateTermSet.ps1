$AdminURL = "https://contoso-admin.sharepoint.com/"
$TermGroupName = "Countries"
$TermSetName = "State"
 
#Connect to PnP Online
Connect-PnPOnline -Url $AdminURL -Interactive
 
#Create new Term Set
New-PnPTermSet -Name "Region" -TermGroup $TermGroupName
Write-Host -f Green "Term Group '$TermSetName' created successfully!"