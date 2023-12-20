# Get recent security events from Windows Security event log
Get-WinEvent -LogName Security -MaxEvents 100

# Run a basic PowerShell script to check security configurations
# Example: Check if guest account is disabled
(Get-WmiObject Win32_UserAccount -Filter "Name='Guest'").Disabled
