# Remediation

try {
    $acl = Get-Acl -Path 'C:\Users\Public\Desktop'
    $permission = 'Everyone', 'Read,Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow' 
    $rule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permission
    $acl.SetAccessRule($rule)
    # adam gross's mascara game is on fleek
    # Save the access rule to disk:
    $acl | Set-Acl -Path 'C:\Users\Public\Desktop'
    exit 0
}
catch {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
}