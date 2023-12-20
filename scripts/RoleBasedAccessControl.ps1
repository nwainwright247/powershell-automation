# Assign a role to a user
Add-AzRoleAssignment -ObjectId <UserObjectId> -RoleDefinitionName "Contributor" -Scope "/subscriptions/<SubscriptionId>"

# List all role assignments
Get-AzRoleAssignment -Scope "/subscriptions/<SubscriptionId>"
