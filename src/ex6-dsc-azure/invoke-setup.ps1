param (
  [string] $storageAccountName = "robinprognet2015",
  [string] $subscriptionName = "Visual Studio Premium with MSDN",
  [string] $location = "North Europe"
  )

$ErrorActionPreference = "stop"

if (-not (Get-AzureStorageAccount | Where {$_.StorageAccountName -eq $storageAccountName})) {
  Write-Output "Creating storage account $storageAccountName"
  $null = New-AzureStorageAccount -StorageAccountName $storageAccountName -Location $location
}

if (-not ((Get-AzureSubscription -SubscriptionName $subscriptionName).CurrentStorageAccountName -eq $storageAccountName)) {
  Write-Output "Configuring subscription $subscriptionName to use storage account $storageAccountName"
  Set-AzureSubscription -SubscriptionName $subscriptionName -CurrentStorageAccountName $storageAccountName -PassThru
}

Get-AzureStorageAccount
Get-AzureSubscription
