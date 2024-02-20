# Define the resource group names as an array
$resourceGroups = @(
    "Epimoni-EastUS-Dev",
    "Epimoni-EastUS-Prod",
    "Epimoni-WestUS2-Dev",
    "Epimoni-WestUS2-Prod"
)

# Define the locations for each resource group in a hashtable
$locations = @{
    "Epimoni-EastUS-Dev" = "eastus";
    "Epimoni-EastUS-Prod" = "eastus";
    "Epimoni-WestUS2-Dev" = "westus2";
    "Epimoni-WestUS2-Prod" = "westus2"
}

# Loop through each resource group and create it
foreach ($rg in $resourceGroups) {
    $location = $locations[$rg]
    Write-Host "Creating resource group '$rg' in location '$location'..."
    New-AzResourceGroup -Name $rg -Location $location
    Write-Host "Resource group '$rg' created."
}

Write-Host "Verifying created resource groups..."

# Fetch and display the details of the created resource groups
	$createdRgs = Get-AzResourceGroup | Where-Object { $resourceGroups -contains $_.ResourceGroupName }
	$createdRgs | Format-Table ResourceGroupName, Location

Write-Host "All resource groups created successfully."

