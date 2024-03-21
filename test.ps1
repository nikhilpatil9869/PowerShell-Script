$adminUrl = "https://yourtenant-admin.sharepoint.com"
$oldUrl = "https://softtrine.sharepoint.com/sites/oldurl"
$newUrl = "https://yourtenant.sharepoint.com/sites/newurl"

Connect-PnPOnline -Url $adminUrl -Interactive
Rename-PnPTenantSite -Identity $oldUrl -NewSiteUrl $newUrl

