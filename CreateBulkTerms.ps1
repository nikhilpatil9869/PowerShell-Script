$AdminCenterURL = "https://contoso-admin.sharepoint.com"
$CSVFile = "C:\Users\TermStoreData.csv"
 
Connect-PnPOnline -Url $AdminCenterURL -Interactive
 
#Get the Data from CSV
$CSVFile = Import-Csv $CSVFile
 
#Iterate through each row in the CSV file
ForEach ($Row in $CSVFile) {
    # Get the term group
    $TermGroup = Get-PnPTermGroup -Identity $Row.TermGroup -ErrorAction SilentlyContinue
    if (!$TermGroup) {
        # Create the term group if it doesn't exist
        $TermGroup = New-PnPTermGroup -GroupName $Row.TermGroup
        Write-host "Term Group $($TermGroup.Name) Created Successfully!" -ForegroundColor Green
    }
    else {
        Write-host "Term Group $($TermGroup.Name) Exists Already!" -ForegroundColor Yellow
    }
 
    # Get the term set
    $TermSet = Get-PnPTermSet -Identity $Row.TermSet -TermGroup $TermGroup -ErrorAction SilentlyContinue
    if (!$TermSet) {
        # Create the term set if it doesn't exist
        $TermSet = New-PnPTermSet -Name $Row.TermSet -TermGroup $TermGroup -Lcid 1033
        Write-host "Term Set $($TermSet.Name) Created Successfully!" -ForegroundColor Green
    }
    else {
        Write-host "Term Set $($TermSet.Name) Exists Already!" -ForegroundColor Yellow
    }
 
    # Get the term
    $Term = Get-PnPTerm -Identity $Row.Term -TermSet $Termset -TermGroup $TermGroup -ErrorAction SilentlyContinue
    if (!$Term) {
        # Create the term if it doesn't exist
        $Term = New-PnPTerm -Name $Row.Term -TermSet $TermSet -TermGroup $TermGroup
        Write-host "Term $($Term.Name) Created Successfully!" -ForegroundColor Green
    }
    else {
        Write-host "Term $($Term.Name) Exists Already!" -ForegroundColor Yellow
    }
}