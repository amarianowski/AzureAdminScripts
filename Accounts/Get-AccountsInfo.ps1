function Get-AllSubscriptionsForCurrentTenant {
    $Tenant = (Get-AzContext).Tenant
    
    # List all subscriptions
    Get-AzSubscription -TenantId $Tenant
}

function Get-AllSubscriptionsForAllTenants {
    $tenants = Get-AzTenant

    foreach ($tenant in $tenants) {
        Set-AzContext -TenantId $tenant.TenantId -Force
        Get-AzSubscription
    }
}
