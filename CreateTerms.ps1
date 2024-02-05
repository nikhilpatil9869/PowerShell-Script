$AdminURL = "https://contoso-admin.sharepoint.com/"
$TermGroupName = "Countries"
$TermSetName = "State"
$TermName = "Maharashtra"
 
#Connect to PnP Online
Connect-PnPOnline -Url $AdminURL -Interactive
 
$term = Get-PnPTerm -Identity $TermName -TermSet $TermSetName -TermGroup $TermGroupName -ErrorAction SilentlyContinue
 
if (!$term) {
    #Create new Term
    New-PnPTerm -Name $TermName -TermSet $TermSetName -TermGroup $TermGroupName
    Write-Host -f Green "Term '$TermName' created successfully!"
}
else {
    Write-Host -f Red "Term '$TermName' already exists!"
}