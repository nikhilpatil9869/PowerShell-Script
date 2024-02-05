# Config Variables
$TargetSiteURL = "https://targetSite.sharepoint.com/"
$ImportFilePath = "C:\Users\Admin\ExportedTerms.xml"

# Connect to PnP Online
Connect-PnPOnline -Url $TargetSiteURL -Interactive

# Import Term Store Group from XML
Import-PnPTermGroupFromXml -Path $ImportFilePath
