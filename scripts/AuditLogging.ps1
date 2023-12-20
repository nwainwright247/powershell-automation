# Enable Azure AD Audit Logging
Set-AzureADMSecurityPolicy -TenantId <YourTenantId> -SecurityGroupAuditingEnabled $true

# Configure Azure Security Center alerts
Set-AzSecurityPolicyAssignment -PolicyDefinitionName "Audit storage account firewall policy" -Scope "/subscriptions/<SubscriptionId>"
