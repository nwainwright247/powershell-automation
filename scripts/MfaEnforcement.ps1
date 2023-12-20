# Enable MFA for a specific user
Set-MsolUser -UserPrincipalName user@example.com -StrongAuthenticationRequirements @{'State'='Enabled';'Methods'='PhoneAppOTP'}

# Enforce MFA for all users
Get-MsolUser | ForEach-Object {
    Set-MsolUser -UserPrincipalName $_.UserPrincipalName -StrongAuthenticationRequirements @{'State'='Enabled';'Methods'='Any'}
}
