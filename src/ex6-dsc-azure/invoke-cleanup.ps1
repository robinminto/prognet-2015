param (
  [string] $storageAccountName = "robinprognet2015",
  [string] $subscriptionName = "Visual Studio Premium with MSDN"
  )

$ErrorActionPreference = "stop"

if ((Get-AzureStorageAccount | Where {$_.StorageAccountName -eq $storageAccountName})) {
  Write-Output "Removing storage account $storageAccountName"
  $null = Remove-AzureStorageAccount -StorageAccountName $storageAccountName
}

# if (((Get-AzureSubscription -SubscriptionName $subscriptionName).CurrentStorageAccountName -eq $storageAccountName)) {
#   Write-Output "Configuring subscription $subscriptionName to *not* use storage account $storageAccountName"
#   Set-AzureSubscription -SubscriptionName $subscriptionName -CurrentStorageAccountName '' -PassThru
# }

Get-AzureStorageAccount
Get-AzureSubscription
