$administratorAccount = "Administrator"  # Specify the target administrator account
$logFilePath = "C:\Users\nicholas\Documents\Scripts\powershell-automation\ServiceAccountAudit.log"

# Function to log messages
function Log-Message {
    param(
        [string]$message
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - $message"
    $logEntry | Out-File -Append -FilePath $logFilePath
}

# Function to get service accounts used by a specified user
function Get-ServiceAccountsForUser {
    param(
        [string]$username
    )

    # Get user's SID
    $userSid = (New-Object System.Security.Principal.NTAccount($username)).Translate([System.Security.Principal.SecurityIdentifier]).Value

    # Query service accounts used by the user
    $serviceAccounts = Get-WinEvent -FilterHashtable @{
        LogName = 'Security'
        Id = 4624  # Event ID for successful logon
        Keywords = 0x8020000000000000  # Logon events
        Data = @{
            'TargetUserName' = $username
        }
    } | Where-Object { $_.Properties[8].Value -eq $userSid } | ForEach-Object {
        $_.Properties[5].Value  # Service account name
    }

    return $serviceAccounts
}

# Main script
$adminUsername = "YourAdminAccount"  # Replace with your administrator account username
$serviceAccounts = Get-ServiceAccountsForUser -username $adminUsername

if ($serviceAccounts.Count -gt 0) {
    Log-Message "Service accounts used by $adminUsername :"
    foreach ($account in $serviceAccounts) {
        Log-Message "  - $account"
    }
} else {
    Log-Message "No service accounts found for $adminUsername."
}

# Additional features
# Send an email alert if service accounts are detected
# Add actions based on specific service accounts found