$ResourceGroups = @(
    @{
        Name = "MyResourceGroup"
        Location = "North Europe"
        Tag = @{Environment = "Development"; Department = "IT"}
    }
    @{
        Name = "MyResourceGroup2"
        Location = "West Europe"
        Tag = @{Environment = "Production"; Department = "Finance"}
    }
)

foreach ($ResourceGroup in $ResourceGroups) {
    New-AzResourceGroup `
        -Name $ResourceGroup.Name `
        -Location $ResourceGroup.Location `
        -Tag $ResourceGroup.Tag | Out-Null

    Write-Host "[Script]: deployed: '$($ResourceGroup.Name)' " -ForegroundColor Green
}