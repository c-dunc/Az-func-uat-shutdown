Connect-AzAccount -Identity

$ResourceGroupName = "example-uat-rg"
$EnvironmentTag = "UAT"
$ShutdownTag = "True"

$vmList = Get-AzVM -ResourceGroupName $ResourceGroupName -Status

$filteredVMs = $vmList | Where-Object {
    ($_.Tags["Environment"] -eq $EnvironmentTag) -and
    ($_.Tags["Shutdown"] -eq $ShutdownTag)
}

foreach ($vm in $filteredVMs) {
    Write-Output "Deallocating VM: $($vm.Name) in Resource Group: $($vm.ResourceGroupName)"
    Stop-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Force -NoWait
}
