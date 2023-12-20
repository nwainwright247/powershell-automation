# Create an inbound rule for HTTP (allow traffic on port 80)
Add-AzNetworkSecurityRuleConfig -Name AllowHTTP -Priority 100 -Direction Inbound -Access Allow `
    -Protocol Tcp -SourceAddressPrefix "*" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange 80
Set-AzNetworkSecurityGroup -ResourceGroupName <ResourceGroupName> -Name <NSGName> -SecurityRules $rule
