$GlobalTags = @{
    Environment = "Development"
    Department  = "IT"
}

$ResourceGroups = @(
    @{
        Name     = "MyResourceGroup"
        Location = "North Europe"
        Tag      = $GlobalTags
    }
    @{
        Name     = "MyResourceGroup2"
        Location = "West Europe"
        Tag      = $GlobalTags
    }
)

foreach ($ResourceGroup in $ResourceGroups) {

    try {
        New-AzResourceGroup `
            -Name $ResourceGroup.Name `
            -Location $ResourceGroup.Location `
            -Tag $ResourceGroup.Tag `
            -ErrorAction Stop | Out-Null
    
        Write-Host "[Script]: deployed: '$($ResourceGroup.Name)' " -ForegroundColor Green
    }
    catch {
        Write-Host "[Script]: deployment for '$($ResourceGroup.Name)' failed" -ForegroundColor Red
        Write-Host "[Script]: $($_.Exception.Message)" -ForegroundColor Red
    }
}
