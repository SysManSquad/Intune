# Discovery
$acl = Get-Acl -Path 'C:\Users\Public\Desktop'
$aclEveryone = $acl.Access | where { $_.IdentityReference -like "everyone" } 

try {

    if ( $aclEveryone.FileSystemRights -match "Modify") {

        Write-Host "success, everyone has modify access"
        exit 0
    }
    else {
        Write-Host "ACL missing, or set incorrectly"
        exit 1
    }

}
catch {
    $errmeg = $_.exception.message
    Write-Error $errmeg
    exit 1
}