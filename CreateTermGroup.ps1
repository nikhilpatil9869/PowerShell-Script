$AdminURL = "https://contoso-admin.sharepoint.com/"
$TermGroupName = "Countries"
$TermGroupDescription = "global countries"
 
#Connect to PnP Online
Connect-PnPOnline -Url $AdminURL -Interactive
 
#Create new group in Termstore
New-PnPTermGroup -Name $TermGroupName -Description $TermGroupDescription
Write-Host -f Green "Term Group '$TermGroupName' created successfully!"