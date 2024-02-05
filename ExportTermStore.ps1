# Config Variables
$SourceSiteURL = "https://sourceSite.sharepoint.com"
$TermGroupName = "Regions"
$ExportFilePath = "C:\Users\Admin\ExportedTerms.xml"

# Connect to PnP Online
Connect-PnPOnline -Url $SourceSiteURL -Interactive

# Export Term Store Group to XML
Export-PnPTermGroupToXml -Identity $TermGroupName -Out $ExportFilePath
