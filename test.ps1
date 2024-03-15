$adminUrl = "https://yourtenant-admin.sharepoint.com"
$oldUrl = "https://yourtenant.sharepoint.com/sites/oldurl"
$newUrl = "https://yourtenant.sharepoint.com/sites/newurl"

Connect-PnPOnline -Url $adminUrl -Interactive
Rename-PnPTenantSite -Identity $oldUrl -NewSiteUrl $newUrl
